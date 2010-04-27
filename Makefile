all:
	@echo "Done"

install:
	# make all directorys.
	@echo "Install to ${prefix}"
	@mkdir -p ${prefix}/{bin,boot,etc,home,lib,mnt,opt}
	@mkdir -p ${prefix}/{media/{floppy,cdrom},sbin,srv,var}
	@install -d -m 0750 ${prefix}/root
	@install -d -m 1777 ${prefix}/tmp ${prefix}/var/tmp
	@mkdir -p ${prefix}/usr/{,local/}{bin,include,lib,sbin,src}
	@mkdir -p ${prefix}/usr/{,local/}share/{doc,info,locale,man}
	@mkdir -p ${prefix}/usr/{,local/}share/{misc,terminfo,zoneinfo}
	@mkdir -p ${prefix}/usr/{,local/}share/man/man{1..8}

	@ln -sv share/{man,doc,info} ${prefix}/usr 2>/dev/null
	@ln -sv share/{man,doc,info} ${prefix}/usr/local 2>/dev/null
	@mkdir -p ${prefix}/var/{lock,log,mail,run,spool}
	@mkdir -p ${prefix}/var/{opt,cache,lib/{misc,locate},local}

	# password/group
	@install -m 0644 -o 0 -g 0 -p resource/boot/* \
		${prefix}/boot

	#etc
	@install -m 0644 -o 0 -g 0 -p resource/etc/* ${prefix}/etc

	#init.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d/init.d
	@install -m 0655 -o 0 -g 0 -p resource/init.d/* \
		${prefix}/etc/rc.d/init.d
	chmod 0644 ${prefix}/etc/rc.d/init.d/functions

	#rc0.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d/rc0.d
	@cp -a resource/rc0.d/* ${prefix}/etc/rc.d/rc0.d

	#rc1.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d/rc1.d
	@cp -a resource/rc1.d/* ${prefix}/etc/rc.d/rc1.d

	#rc3.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d/rc3.d
	@cp -a resource/rc3.d/* ${prefix}/etc/rc.d/rc3.d
	@echo "Done"

	#rc6.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d/rc6.d
	@cp -a resource/rc6.d/* ${prefix}/etc/rc.d/rc6.d

	#rcsysinit.d
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/rc.d/rcsysinit.d
	@cp -a resource/rcsysinit.d/* ${prefix}/etc/rc.d/rcsysinit.d

	#sysconfig
	@install -d -m 0655 -o 0 -g 0 ${prefix}/etc/sysconfig
	@install -m 0644 -o 0 -g 0 -p resource/sysconfig/* \
		${prefix}/etc/sysconfig



test:
	@mkdir ./test
	@make prefix=./test install
	@ls ./test
	@echo "Done"

clean:
	@rm -rf ./test
	@echo "Done"

