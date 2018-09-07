# toc.rb = Table of Contents for books
# The values are URIs from sivers.org
# For example, itunes = sivers.org/itunes

AYW = %w(ayw1 ayw2 ayw3 ayw4 ayw5 ayw6 hitswitch hellyeah changeplan nofund startnow multiply formalities blc exclude2 noads more-than-one noplan the-mob grade caremore dontneed punish real unclear cdbe cdbf casual nq double being itunes mistake delegate ayw7 trustbut abdicate done trust ayw8)

HellYeah = %w(
	unlearning
	no2
	relax
	switch
	advice
	mw
	hsu
	counter
	futures
	dc
	unmo
	expire
	slow
	why
	tilt
	soso
	quit
	useless
	bronze
	arv
	odds
	unun
	mfg
	ws
	here
	mirror
	full
	hate
	lw
	bad
	io
	thx
	wrong
	publicu
	scares
	fela
	action-reaction
	actid
	villain
	pastit
	horses
	goals
	character
	enough
	you-not-them
	hatenot
	ladders
	steps
	freedom
	metaphor
	passion
	contrib
	walkways
	futuretense
	1idea
	kimo
	options
	15-years
	below-average
	loss
	blank
	obvious
	donkey
	fish
	meaning
	compensate
	andor
	ss
	comfort
	local
	my-fault
	time
	game
	pa
)

YMAP = [
	{"INTRO" => %w(
		mym1
		mym2
	)}, # CREATIVE:
	{"CREATIVE" => %w(
		ext
		bizriff
		tvtest
		restr
		mystery
		reach
		capt
	)}, # CONSIDERATE:
	{"CONSIDERATE" => %w(
		cons
		stage
		wdtrw
		ncorp
		ccom
		senses
		hs
		barking
	)}, # PEOPLE:
	{"PEOPLE" => %w(
		gpers
		hych
		favors
		smgf
		persistence
		3in
		pedestal
	)}, # INDUSTRY:
	{"INDUSTRY" => %w(
		people1
		solicited
		insidr
		success-first
		testm
		gofilt
		novicex
		noboss
	)}, # RESOURCEFUL
	{"RESOURCEFUL" => %w(
		res
		sustainable
		get-specific
		destdir
		neverwait
		up2you
		no9to5
		gbp
		1090
		extremex
		diy
		flipstick
		makenew
	)}, # WORDS:
	{"DESCRIBE" => %w(
		wordsm
		wysl
		shrtd
		whycare
		dym
		nomu
		wwoy
		notalk
		hillbf
	)}, # FOCUSED:
	{"TARGET" => %w(
		no-bullseye
		trshr
		exclude
		rounded
		evers
		actors
		vodka
		contrarian
		candles
		prgrk
	)}, # QUANTITY:
	{"QUANTITY" => %w(
		dbt
		hundreds
		ppweek
		kit
		syk
		fanwork
		inclev
		conferences
		mosquito
	)}, # MONEY
	{"MONEY" => %w(
		mn1
		starv
		pp
		livecd
		ppay
		morepay
		purplecow
		buyable
		nolimit
	)}, # TECH
	{"TECH" => %w(
		netskill
		phoaud
		promobox
		intrweb
	)}, # MINDSET
	{"MINDSET" => %w(
		city
		details
		lines
		no-oracle
		drain
		compass
	)}
]
YourMusic = YMAP.map {|x| x.values}.flatten
