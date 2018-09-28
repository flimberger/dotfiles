.PHONY: all
all: install

${HOME}/.gitconfig: gitconfig
	ln -s ${PWD}/$< $@

${HOME}/.hgrc: hgrc
	ln -s ${PWD}/$< $@

${HOME}/.kshrc: kshrc
	ln -s ${PWD}/$< $@

${HOME}/.profile: profile
	ln -s ${PWD}/$< $@

${HOME}/.tmux.conf: tmux.conf
	ln -s ${PWD}/$< $@

${HOME}/.vimrc: vimrc
	ln -s ${PWD}/$< $@

${HOME}/.vim: vim
	ln -s ${PWD}/$< $@

${HOME}/.Xresources:	Xresources
	ln -s ${PWD}/$< $@

.PHONY: install
install: ${HOME}/.gitconfig	\
	${HOME}/.hgrc		\
	${HOME}/.kshrc		\
	${HOME}/.profile	\
	${HOME}/.tmux.conf	\
	${HOME}/.vimrc		\
	${HOME}/.vim		\
	${HOME}/.Xresources
