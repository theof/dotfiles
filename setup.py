#!/usr/bin/env python3
import os

home_dir = os.environ['HOME']
pwd = os.environ['PWD']
deps = []

class Link:

    def __init__(self, target, link_name=None):
        self.target = os.path.join(pwd, target)
        if link_name is None:
            self.link_name = os.path.join(home_dir, '.' + target)
        else:
            self.link_name = link_name

    def create(self):
        os.system("ln -sf {} {}".format(self.target, self.link_name))


class Config:

    def __init__(self):
        deps.append(self.sys_deps)

    def install(self):
        if self.pre_hook is not None:
            self.pre_hook()
        for link in self.links:
            link.create()
        if self.post_hook is not None:
            self.post_hook()

    sys_deps = []
    links = []
    pre_hook = None
    post_hook = None


class VimConfig(Config):
    links = [
        Link("vimrc"),
    ]
    sys_deps = ['git', 'vim']
    def pre_hook(self):
        os.system('mkdir -p "{}/.vim/bundle" '.format(home_dir))
        os.system('git clone https://github.com/VundleVim/Vundle.vim.git '
                '"{}/.vim/bundle/Vundle.vim"'.format(home_dir))
    def post_hook(self):
        os.system('vim +PluginInstall +qall')

VimConfig().install()
