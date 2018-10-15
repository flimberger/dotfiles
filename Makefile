.PHONY: all
all: install

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

${HOME}/.Xresources:	Xresources
	ln -s ${PWD}/Xresources $@

.PHONY: install
install: ${HOME}/.gitconfig	\
	${HOME}/.hgrc		\
	${HOME}/.kshrc		\
	${HOME}/.profile	\
	${HOME}/.tmux.conf	\
	${HOME}/.vimrc		\
	${HOME}/.vim		\
	${HOME}/.Xresources
