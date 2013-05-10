#!/usr/bin/python
import os
import datetime
import shutil

# This script automatically creates symbolic links in your home directory to
# files and directories within the dotfiles repo.

def get_date_string():
    now = datetime.datetime.now()
    now_string = "%d-%d-%d_%d-%d-%d" % (now.year, now.month, now.day, now.hour, now.minute, now.second)
    return now_string

class Setup:
    def __init__(self):
        self.home_dir = os.environ['HOME']

        self.dot_files = [ '.vim',
                           '.vimrc',
                           '.fluxbox',
                           '.Xresources',
                         ]

        self.now_string = get_date_string()
        self.dotfile_dir = os.path.realpath(__file__)

    def run_setup(self):
        if not os.path.exists(self.home_dir):
            raise Exception('Home directory {} does not exist.'.format(self.home_dir))

        for file in self.dot_files:
            dest = os.path.join(self.home_dir, file)
            source = os.path.join(os.path.dirname(self.dotfile_dir), file)

            if not os.path.lexists(source):
                print "Source dot file", source, "does not exist, skipping."
                continue

            if os.path.lexists(dest):
                # check if we already have a link for this guy and it's correct
                if os.path.islink(dest) and os.path.realpath(dest) == source:
                    print "Correct link already exists for", source + ", skipping."
                    continue

                if os.path.islink(dest) or os.path.isdir(dest) or os.path.isfile(dest):
                    target = dest + "." + self.now_string
                    print "Backing up existing", dest, "to", target
                    shutil.move(dest, target)
                else:
                    print "Failed to create symlink for", dest, "because there is already something there and we don't know what it is."
                    continue

            print dest, "->", source
            os.symlink(source, dest)

def main():
    setup = Setup()
    try:
        setup.run_setup()
    except Exception as e:
        print "Failed to run: {}".format(e)
        return -1


if __name__ == '__main__':
    status = main()
    exit(status)

