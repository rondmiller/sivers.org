sivers.org
==========

My [sivers.org](https://sivers.org/) site.

© 2018 Derek Sivers +
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) license.

Questions or comments?
Feel free to email me at [sivers.org/contact](https://sivers.org/contact)


## How it works:


### Writing:

I write my stuff in plain text files in one of the content/{blog,books,pages,presentations,tweets}/ directories.

* The date is in the filename.
* The URI for final publishing is in the filename.
* The title is in the first line of the file.
* Any other metadata needed is at the top.
* The rest is the content body, often written in HTML.



### Templates:

Plain erb Ruby templates are in templates/

Shared header and footer for the whole site.

Much of it is just hard-coded HTML.  (After all these years, I think it's easier to write HTML than in meta-languages that hide the HTML.)



### Merging:

A Ruby script (**make.rb**) goes through all the content directories and reads the files.

* It starts an array for the collection of content in each subdirectory.
* It knows how to get the metadata needed for the different types and templates.
* It parses each file, gets the metadata, merges it into the template, and writes it to disk.
* Afterwards, it uses the collection array to merge with the index template, and writes that to disk.
* Finally, it uses all the collections to write the home page, which shows the newest additions of various types.



### Styling:

To save an HTTP call, I copy the compressed CSS directly into the template header.



### Serving:

Nginx serves the final static site from the site/ directory.

Nginx passes certain paths by proxy to the dynamic Sinatra server, for dynamic pages, in [50web](https://code.sivers.org/50web/)



### Comments:

**comments.rb** goes through all comments for all posts and writes them to static HTML on disk, for easy including by JavaScript.

Then the script stays running on the server, listening to the PostgreSQL database for new comments added.
When a new one is added, it re-generates an updated comments HTML file for that URI.



### Downloads:

Some files need to be in sivers.org/file/ for download.  A whitelist of these filenames is in a file called **files**.



### Book chapters:

Many blog posts later become book chapters.  A Ruby array of URIs in **toc.rb** keeps track of these, to link articles back to their book.


