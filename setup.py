#!/usr/bin/python
import os
import datetime
import shutil
import subprocess

# This script automatically creates symbolic links in your home directory to
# files and directories within the repo.

def get_date_string():
    now = datetime.datetime.now()
    now_string = "%d-%d-%d_%d-%d-%d" % (now.year, now.month, now.day, now.hour, now.minute, now.second)
    return now_string

def real_name_from_dot_name(dot_name):
    return dot_name.replace('dot', '', 1)

class Setup:
    def __init__(self):
        self.home_dir = os.environ['HOME']
        self.dotfile_dir = os.path.dirname(os.path.realpath(__file__))
        self.now_string = get_date_string()

        file_list = os.listdir(self.dotfile_dir)
        self.dot_files = filter(lambda name: name.startswith('dot.'), file_list)
        print 'Dot files:', self.dot_files


    def run_setup(self):
        if not os.path.exists(self.home_dir):
            raise Exception('Home directory {} does not exist.'.format(self.home_dir))

        for name in self.dot_files:
            dest = os.path.join(self.home_dir, real_name_from_dot_name(name))
            source = os.path.join(self.dotfile_dir, name)

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

        print "Populating submodules..."
        subprocess.call(['bash', os.path.join(self.dotfile_dir, 'populate_submodules.sh')])

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

