#!/usr/bin/env ruby
require 'pg'

###########################################################################
# Turn comments in the database into static HTML on-disk, for faster serving
###########################################################################


# transform the format of HTML from database to screen
def fmt(html)
	html.gsub(%r{(^|\s)(https?://\S+)}, '\1<a href="\2">\2</a>').gsub("\n", '<br>')
end

# a single comment list entry, used in ol map, below
def li(row)
	'<li id="comment-%d"><cite>%s (%s) <a href="#comment-%d">#</a></cite><p>%s</p></li>' %
		[row['id'], row['name'], row['created_at'], row['id'], fmt(row['html'])]
end

# the top-level map of database rows into HTML list
def ol(rows)
	rows.inject('<ol>') {|html, row| html += li(row) ; html} + '</ol>'
end

# given a db connection & uri, return the HTML comments, ready to write
def qry(db, uri)
	res = db.exec_params("SELECT id, created_at, name, html
		FROM sivers.comments
		WHERE uri = $1
		ORDER BY id", [uri])
	return '' if res.ntuples == 0
	ol(res)
end

# comments saved here, using URI as filename
dirname = '/var/www/htdocs/sivers_comments/'
Dir.mkdir(dirname, 0755) unless Dir.exist?(dirname)

DB = PG::Connection.new(dbname: 'd50b', user: 'd50b')

# first write them all
DB.exec("SELECT DISTINCT(uri) FROM sivers.comments").column_values(0).each do |uri|
	File.open(dirname + uri, 'w') do |f|
		f.puts qry(DB, uri)
	end
end

# now listen for changes, and re-write when changed
DB.exec("LISTEN comments_changed")
while true do
	DB.wait_for_notify do |event, pid, uri|
		File.open(dirname + uri, 'w') do |f|
			f.puts qry(DB, uri)
		end
	end
end

