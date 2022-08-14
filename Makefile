.PHONY: all
all: install

${HOME}/.aliases: aliases
	ln -s ${PWD}/aliases $@

${HOME}/.bashrc: bashrc
	ln -s ${PWD}/bashrc $@
$(HOME)/.config/alacritty:
	ln -s $(PWD)/alacritty $@
$(HOME)/.config/fontconfig/fonts.conf: fonts.conf
	mkdir -p $(HOME)/.config/fontconfig
	ln -s $(PWD)/fonts.conf $@
$(HOME)/.config/nvim:
	ln -s $(PWD)/nvim $@
$(HOME)/.config/user-dirs.dirs:	user-dirs.dirs
	ln -s $(PWD)/user-dirs.dirs $@
${HOME}/.gitconfig: gitconfig
	ln -s ${PWD}/gitconfig $@

${HOME}/.hgrc: hgrc
	ln -s ${PWD}/hgrc $@

${HOME}/.kshrc: kshrc
	ln -s ${PWD}/kshrc $@
$(HOME)/.login:	login
	ln -s $(PWD)/login $@
${HOME}/.profile: profile
	ln -s ${PWD}/profile $@
$(HOME)/.tcshrc:	tcshrc
	ln -s $(PWD)/tcshrc $@
${HOME}/.tmux.conf: tmux.conf
	ln -s ${PWD}/tmux.conf $@

${HOME}/.xsession:	xsession
	ln -s ${PWD}/xsession $@

${HOME}/.Xresources:	Xresources
	ln -s ${PWD}/Xresources $@

install:	\
	${HOME}/.aliases	\
	${HOME}/.bashrc		\
	${HOME}/.config/alacritty	\
	$(HOME)/.config/fontconfig/fonts.conf	\
	$(HOME)/.config/nvim	\
	$(HOME)/.config/user-dirs.dirs \
	${HOME}/.gitconfig	\
	${HOME}/.hgrc		\
	${HOME}/.kshrc		\
	$(HOME)/.login		\
	${HOME}/.profile	\
	$(HOME)/.tcshrc		\
	${HOME}/.tmux.conf	\
	${HOME}/.Xresources
	${MAKE} install-$$(uname)
.PHONY: install

install-FreeBSD: \
	${HOME}/.xsession
.PHONY: install-FreeBSD

install-Linux:
.PHONY: install-Linux

uninstall:
	rm -f ${HOME}/.aliases	\
		${HOME}/.bashrc	\
		${HOME}/.gitconfig	\
		${HOME}/.hgrc	\
		${HOME}/.kshrc	\
		${HOME}/.profile	\
		${HOME}/.tmux.conf	\
		$(HOME)/.config/user-dirs.dirs \
		${HOME}/.vimrc	\
		${HOME}/.vim	\
		${HOME}/.Xresources
	${MAKE} uninstall-$$(uname)
.PHONY:	uninstall

uninstall-FreeBSD:
	rm -f $(HOME)/.xsession
.PHONY:	uninstall-FreeBSD

uninstall-Linux:
.PHONY: uninstall-Linux
