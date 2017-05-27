#!/usr/bin/env python

import os, sys, subprocess
from argparse import ArgumentParser, RawDescriptionHelpFormatter

# CONSTANTS
home = os.getenv('HOME')
notifier = os.path.join(home,'.bin/dunstify')
notification_id = "/tmp/irssi-notify_dunstify_id"

def main():
    try:
        fileob = open(notification_id, 'r+')
    except IOError:
        fileob = open(notification_id, 'w+')
    with fileob as id_f:
        id_num = id_f.read(1)
        if id_num:
            subprocess.call([notifier,'-C',id_num])
            id_out = str(subprocess.check_output([notifier,'-a','irssi','-p','-r',id_num,arguments.message]))
        else:
            id_out = str(subprocess.check_output([notifier,'-a','irssi','-p',arguments.message]))
        id_f.write(str(id_out))
        id_f.close()

def arg_parse():
    parser = ArgumentParser(description=__doc__,
                            formatter_class=RawDescriptionHelpFormatter)

    parser.add_argument('message',
                        type=str)

    return parser.parse_args()

if __name__ == '__main__':
    arguments = arg_parse()
    main()
