#!/usr/bin/env python3

from multiprocessing.dummy import Pool as ThreadPool 
from shutil import copyfile
import subprocess
import os

def transcode_collection(src="/data/music", dst="/data/music_ogg", force=False,
        nthreads=8):
    """
      src: collection's original path
      dst: transcoded music destination
      force: causes all the files to be transcoded again (in case it was
    previously a bad file).
    """

    def transcode_file(elem):
        (folder, f) = elem
        dst_folder = os.path.join(dst, folder)
        src_folder = os.path.join(src, folder)

        (root, ext) = os.path.splitext(f)
        target_ext = ext if (ext != ".flac") else '.ogg'

        target = os.path.join(dst_folder, root + target_ext)
        source = os.path.join(src_folder, f)

        if not os.path.exists(target):
            if ext != ".flac":
                copyfile(source, target)
            else:
                subprocess.run(["/usr/bin/env", "ffmpeg", "-i", source, "-vn",
                        "-ab", "256k", target])

    if not os.path.exists(dst):
        os.mkdir(dst)

    pool = ThreadPool(nthreads)
    for (dirpath, dirs, files) in os.walk(src):
        folder = dirpath[len(src) + 1:]
        if not os.path.exists(os.path.join(dst, folder)):
            os.mkdir(os.path.join(dst, folder))
        print(f'Converting {folder}...')
        pool.map(transcode_file, [(folder, f) for f in files])
    
    print('Done :)')

if __name__ == '__main__':
    transcode_collection()
