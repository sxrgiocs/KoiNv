import os
import sys
from os.path import expanduser

def welcome():
    global OS

    print("""\

        |￣￣￣￣￣￣￣|
        |   WELCOME!   |
        |_＿＿＿＿＿___| 
               ||
        (\__/) || 
        (•ㅅ•) || 
        / 　 づ
                        """)

    print("This script is available for Linux and Windows")

    while True:
        user_os_input = str(input("\nPlease choose your OS (linux/windows) ")).lower()

        if user_os_input not in("linux", "windows"):
            print("\nNot a valid OS")

        else:
            if user_os_input == "linux":
                OS = "linux"
                print("\n    -> Proceding with installation for GNU/Linux...")

            else:
                OS = "windows"
                print("\n    -> Proceding with installation for Windows...")

            break

    return OS


def directories():
    if OS == "linux":
        home = str(expanduser("~"))
        neovim_dir = home + "/.config/nvim"
        backup_dir = home + "/.config/nvim-backup"

    elif OS == "windows":
        print("windows haha")

    return neovim_dir, backup_dir


def backup():
    old, backup = directories()

    while True:
        user_input = str(input("\nDo you wish to backup your current Neovim configuration? (y/n) "))
        user_input = user_input.lower()

        if user_input not in ("y", "n"):
            print("\n    -> Invalid input. Please type \"y\" for yes and \"n\" for no.")

        else:
            break

    if user_input == "y":
        print("\n    -> Creating a Neovim backup in \"nvim-backup\"...")
        os.rename(old, backup)

    else:
        print("\n    -> Current Neovim directory will be replaced with new config.")

def packer_install():
    while True:
        user_input = str(input("\nDo you wish to install packer.nvim? (y/n/help): "))
        user_input = user_input.lower()

        if user_input not in ("y", "n"):
            if user_input == "help":
                print("\n------------------------------------------------------------------------")
                print("Packer (https://github.com/wbthomason/packer.nvim) is the plugin/package manager chosen for the Neovim config. Packer is necessary to install all the plugins and configurations required.") 
                print("\nIf you have Packer installed or wish to use another plugin manager, type \"n\". Keep in mind that you will have to change the config if you are using another plugin manager.")
                print("--------------------------------------------------------------------------")

            else:
                print("\n    -> Invalid input. Please type \"y\" for yes, \"n\" for no and \"help\" for help.")

        else:
            break

    if user_input != "y":
        print("\n    -> Skipping packer.nvim install...")

    else:
        print("\n    -> Intalling packer.nvim...")

        if OS == "linux":
            print("a")
            cmd = "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/a2/packer.nvim"

        elif OS == "windows":
            print("b")
            cmd = "git clone https://github.com/wbthomason/packer.nvim \"$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim\""

        else:
            print("User OS is", OS)

        os.system(cmd)

def main():
    welcome()

    while True:
        choice = str(input("\nDo you wish to (i)nstall or (u)ninstall the config? (i/u) ")).lower()

        if choice not in("i", "u"):
            print("\nPlease choose a valid option.")

        else:
            if choice == "i":
                print("\n-----------------------------------------------------------------------------")
                print("-> Please make sure you have Git and Neovim already installed in your machine")
                print("-----------------------------------------------------------------------------")
                backup()
                packer_install()

            else:
                if OS == "linux":
                    cmd = "rm -rf ~/.local/share/nvim/* ~/.config/nvim/*"

                else:
                    print("Windows command not ready yet")

                os.system(cmd)

            break

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nThe script was interrupted by the user")
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
