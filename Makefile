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
	@cp passwd ${prefix}/etc
	@chmod 0644 ${prefix}/etc/passwd

	@cp group ${prefix}/etc
	@chmod 0644 ${prefix}/etc/group


	@echo "Done"

test:
	@mkdir ./test
	@make prefix=./test install
	@ls ./test
	@echo "Done"

clean:
	@rm -rf ./test
	@echo "Done"

