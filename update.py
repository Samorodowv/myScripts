from git import Repo
import logging
from time import sleep
import sys
import os
import shutil

def copyfiles(root_src_dir, root_dst_dir):
    for src_dir, dirs, files in os.walk(root_src_dir):
        dst_dir = src_dir.replace(root_src_dir, root_dst_dir, 1)
        if not os.path.exists(dst_dir):
            os.makedirs(dst_dir)
        for file_ in files:
            src_file = os.path.join(src_dir, file_)
            dst_file = os.path.join(dst_dir, file_)
            if os.path.exists(dst_file):
                if os.path.samefile(src_file, dst_file):
                    continue
                os.remove(dst_file)
            shutil.move(src_file, dst_dir)

class SelfUpdate():
    def __init__(self, rep_address):
        self.rep_address = rep_address
        self.update()
        self.restart()

    def update(self):
        logging.info("program update")
        sep = os.path.sep
        updates_folder = f"{os.getcwd()}{sep}updates"
        shutil.rmtree(updates_folder, ignore_errors=True)
        Repo.clone_from(self.rep_address, updates_folder)
        copyfiles(updates_folder + sep, os.getcwd() + sep)

    def restart(self):
        logging.info("restarting program")
        os.execl(sys.executable, *([sys.executable]+sys.argv))

if __name__ == "__main__":
    logging.basicConfig(filename="selfupdater.log")
    logging.getLogger().setLevel(logging.DEBUG)
    logging.info("creating updater")
    sleep(3)
    SelfUpdate("https://github.com/Samorodowv/gsm_modem_sms")
