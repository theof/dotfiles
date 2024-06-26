#!/usr/bin/env python3
import os
from inspect import isclass

home_dir = os.environ['HOME']
pwd = os.environ['PWD']
deps = []

def mkdirp(*args, **kwargs):
    try:
        os.makedirs(*args, **kwargs)
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

class ZProfileConfig(Config):
    links = [
        Link("zprofile"),
    ]

class ZshConfig(Config):
    links = [
        Link("zshrc"),
    ]
    sys_deps = ['zsh']
    def post_hook(self):
        os.system('chsh -s /bin/zsh')

class AlacrittyConfig(Config):
    links = [
        Link("alacritty.yml")
    ]
    sys_deps = ['alacritty']

class DunstConfig(Config):
    links = [
        Link("dunstrc", link_name=".config/dunst/dunstrc")
    ]
    sys_deps = ["dunst"]
class ScriptsConfig(Config):

    def __init__(self):
        super()
        srcdir = os.path.join(os.path.dirname(__file__), self.folder)
        for f in os.listdir(srcdir):
            filepath = os.path.join(srcdir, f)
            if os.path.isfile(filepath):
                self.links.append(Link(filepath, link_name=os.path.join(self.folder, f.split('.')[0])))

    folder = "scripts"


classes = [value for value in globals().values() if isclass(value)]
configs = [cls() for cls in classes if issubclass(cls, Config)]
arch_install = False
if arch_install:
    for config in configs:
        config.install()
else:

    for config in [
        VimConfig(),
        TmuxConfig(),
        ZshConfig(),
        #AlacrittyConfig(),
        ScriptsConfig()
    ]:
        config.install()
