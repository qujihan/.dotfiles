import os
import json
import time
import glob
import shutil
import logging
import argparse
import platform

# const
config_file_name = "config.json"
home_dir = os.getenv("HOME")
dotfile_dir = os.path.dirname(os.path.abspath(__file__))


def get_os_json(path):
    with open(path, "r") as config:
        json_data = json.load(config)
        if platform.system() == "Windows":
            return json_data["win"]
        elif platform.system() == "Darwin":
            return json_data["mac"]
    return None


def get_pathinfo_from_json(data):
    source = data["source"]
    linkto = data["linkto"]
    assert source != "" and linkto != ""
    return f"{dotfile_dir}/{source}", f"{home_dir}/{linkto}"


def remove_link(path):
    if os.path.exists(path) and (os.path.islink(path) or os.path.isfile(path)):
        os.remove(path)
    elif os.path.exists(path):
        shutil.rmtree(path)


def touch_symlink(source, linkto):
    remove_link(linkto)
    if os.path.isdir(source):
        os.symlink(source, linkto, target_is_directory=True)
    elif os.path.isfile(source):
        os.symlink(source, linkto, target_is_directory=False)


def install(path):
    json = get_os_json(path)
    for app_name, config_path_vec in json.items():
        for paths in config_path_vec:
            source, linkto = get_pathinfo_from_json(paths)
            touch_symlink(source, linkto)
        print(f"Finish config: {app_name}...\n")

def uninstall(path):
    json = get_os_json(path)
    for app_name, config_path_vec in json.items():
        for path_info in config_path_vec:
            _, linkto = get_pathinfo_from_json(path_info)
            if os.path.islink(linkto):
                os.remove(linkto)
            else:
                print(f"Error: {linkto} is not a link file")
        print(f"Finish unconfig: {app_name}...\n")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--install", action="store_true", help="config the applications."
    )
    parser.add_argument(
        "--uninstall", action="store_true", help="unconfig the applications."
    )

    args = parser.parse_args()
    if args.install:
        install(config_file_name)
    elif args.uninstall:
        uninstall(config_file_name)
    else:
        print("Usage: python config.py -- [install | uninstall]")


if __name__ == "__main__":
    main()
