.PHONY: all
all: install

${HOME}/.aliases: aliases
	ln -s ${PWD}/aliases $@

${HOME}/.bashrc: bashrc
	ln -s ${PWD}/bashrc $@

${HOME}/.gitconfig: gitconfig
	ln -s ${PWD}/gitconfig $@

${HOME}/.hgrc: hgrc
	ln -s ${PWD}/hgrc $@

${HOME}/.kshrc: kshrc
	ln -s ${PWD}/kshrc $@

${HOME}/.profile: profile
	ln -s ${PWD}/profile $@

${HOME}/.tmux.conf: tmux.conf
	ln -s ${PWD}/tmux.conf $@

${HOME}/.vimrc: vimrc
	ln -s ${PWD}/vimrc $@

${HOME}/.vim: vim
	ln -s ${PWD}/vim $@

${HOME}/.xsession:	xsession
	ln -s ${PWD}/xsession $@

${HOME}/.Xresources:	Xresources
	ln -s ${PWD}/Xresources $@

# Only on FreeBSD
${HOME}/.config/user-dirs.dirs:	user-dirs.dirs
	ln -s ${PWD}/user-dirs.dirs $@

install:	\
	${HOME}/.aliases	\
	${HOME}/.bashrc		\
	${HOME}/.gitconfig	\
	${HOME}/.hgrc		\
	${HOME}/.kshrc		\
	${HOME}/.profile	\
	${HOME}/.tmux.conf	\
	${HOME}/.vimrc		\
	${HOME}/.vim		\
	${HOME}/.Xresources
	${MAKE} install-$$(uname)
.PHONY: install

install-FreeBSD: \
	${HOME}/.config/user-dirs.dirs \
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
		${HOME}/.vimrc	\
		${HOME}/.vim	\
		${HOME}/.Xresources
	${MAKE} uninstall-$$(uname)
.PHONY:	uninstall

uninstall-FreeBSD:
	rm -f ${HOME}/.config/user-dirs.dirs \
	    ${HOME}/.xsession
.PHONY:	uninstall-FreeBSD

uninstall-Linux:
.PHONY: uninstall-Linux
