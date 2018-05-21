#!/usr/bin/env python3
import os
from inspect import isclass

home_dir = os.environ['HOME']
pwd = os.environ['PWD']
deps = []

def mkdirp(*args, **kwargs):
    try:
        os.mkdir(*args, **kwargs)
    except FileExistsError:
        pass

class Link:

    def __init__(self, target, link_name=None):
        self.target = os.path.join(pwd, target)
        if link_name is None:
            self.link_name = os.path.join(home_dir, '.' + target)
        else:
            self.link_name = os.path.join(home_dir, link_name)
            mkdirp(os.path.dirname(self.link_name))

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

"""
class Distro:

    def __init__(self):
        pass

    is_candidate = False

    @property
    def package_manager(self):
        raise NotImplementedError
"""
#

"""
class ArchLinux(Distro):

    def __init__(self):    
        pass
#
"""

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


class TmuxConfig(Config):
    links = [
        Link("tmux.conf"),
    ]
    sys_deps = ['tmux']

class I3Config(Config):
    links = [
        Link("i3config", link_name=".config/i3/config"),
    ]
    sys_deps = ['i3']

class XConfig(Config):
    links = [
        Link("Xresources"),
        Link("xinitrc")
    ]

class Base16Shell(Config):
    links = []
    def pre_hook(self):
        os.system("git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell")

class PowerlineConfig(Config):
    links = [
        Link("powerline", ".config/powerline"),
    ]
    sys_deps = ['powerline']

class ZshConfig(Config):
    links = [
        Link("zshrc"),
    ]
    sys_deps = ['zsh']

classes = [value for value in globals().values() if isclass(value)]
configs = [cls() for cls in classes if issubclass(cls, Config)]
#distros = [each() for each in globals if issubclass(each, Distro)]

[config.install() for config in configs]
