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
    
    if os.path.isdir(old) is True:
        while True:
            user_input = str(input("\nDo you wish to backup your current Neovim configuration? (y/n) "))
            user_input = user_input.lower()

            if user_input not in ("y", "n"):
                print("\n    -> Invalid input. Please type \"y\" for yes and \"n\" for no.")

            else:
                break

        if user_input == "y":
            print("\n    -> Creating a Neovim backup in \"nvim-backup\"...")

            if os.path.isdir(backup) is True:
                print("\n    -> There is an existing nvim-backup directory already. Please delete it. move it or rename it and then run the script again.")
                exit()

            else:
                os.rename(old, backup)

        else:
            print("\n    -> Current Neovim directory will be replaced with new config.")
            os.system("rm -rf {}".format(old))

    else:
        pass

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

        if OS == "linux":
            if os.path.isdir('./.local/share/nvim/site/pack/packer/start/packer.nvim') is True:
                print("\n  -> Packer is already installed. Skipping this step...")
                cmd = ""

            else:
                print("\n    -> Intalling packer.nvim...\n")
                cmd = "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"

        elif OS == "windows":
            print("\n    -> Intalling packer.nvim...\n")
            cmd = "git clone https://github.com/wbthomason/packer.nvim \"$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim\""

        os.system(cmd)

def install():
    if OS == "linux":
        print("\n   -> Installing new Neovim configuration...\n")
        cmd = "git clone git@github.com:sxrgiocs/KoiNv.git ~/.config/nvim --depth 10"

    elif OS == "windows":
        print("\n   -> Installing new Neovim configuration...\n")

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
                install()

                print("\n-----------------------------------------------------------------------------")
                print("Neovim configuration installed. To install all plugins type \"nvim +PackerSync\"")
                print("\n   -> To install TreeSitter parsers (highly recommended), open Neovim in command mode and type \":TSInstall <languages>\". Visit https://github.com/nvim-treesitter/nvim-treesitter#supported-languages to find the supported languages.")
                print("\n   -> To install LSP servers, open Neovim in command mode and type \":LspInstall <language>\". Visit https://github.com/kabouzeid/nvim-lspinstall to find the supported languages.")
                print("-----------------------------------------------------------------------------")

            else:
                if OS == "linux":
                    cmd = "rm -rf ~/.local/share/nvim/* ~/.config/nvim/*"
                    print("\n-----------------------------------------------------------------------------")
                    print("Neovim configuration uninstalled")
                    print("-----------------------------------------------------------------------------")

                else:
                    print("\n-----------------------------------------------------------------------------")
                    print("Neovim configuration uninstalled")
                    print("-----------------------------------------------------------------------------")

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
