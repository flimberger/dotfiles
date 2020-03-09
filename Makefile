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

${HOME}/.Xresources: Xresources
	ln -s ${PWD}/Xresources $@

# This target is specific to Debian/Ubuntu
${HOME}/.xsessionrc: xsessionrc
	ln -s ${PWD}/xsessionrc $@

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

install-FreeBSD:
.PHONY: install-FreeBSD

install-Linux:
	${HOME}/.xsessionrc
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
.PHONY:	uninstall-FreeBSD

uninstall-Linux:
	rm -f ${HOME}/.xsessionrc
.PHONY: uninstall-Linux
