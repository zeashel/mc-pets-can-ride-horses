# create symlinks to selected world's datapack folder and
# global resourcepack folder
#
# defaults to macos + default launcher only sorry. if on
# linux/using different launcher, modify the MCPATH constant
#
# usage: ./symlink.sh <YOUR TESTING WORLD>
# eg: ./symlink.sh "Datapack Testing"

readonly MCPATH="$HOME/Library/Application Support/minecraft"
readonly DATA_PACK="pets_can_ride_horses"
readonly RESOURCE_PACK="invisible_acacia_boat"

if [ -d "$MCPATH" ]; then

    # allow minecraft symlinks for only these directories:
    touch "$MCPATH/allowed_symlinks.txt" 

    # only append if path string don't already exist
    if ! grep -q "^$PWD/$DATA_PACK$" "$MCPATH/allowed_symlinks.txt"; then
        echo "$PWD/$DATA_PACK" >> "$MCPATH/allowed_symlinks.txt"
    fi

    if ! grep -q "^$PWD/$RESOURCE_PACK$" "$MCPATH/allowed_symlinks.txt"; then
        echo "$PWD/$RESOURCE_PACK" >> "$MCPATH/allowed_symlinks.txt"
    fi

    # make sure arg1 is given
    if [ "$#" -eq 1 ]; then
        # datapack
        if [ -d "$MCPATH/saves/$1/datapacks" ]; then
            ln -siv "$PWD/$DATA_PACK" "$MCPATH/saves/$1/datapacks"
        else
            echo "$0: the world name \"$1\" doesn't exist"
        fi

        # resourcepack
        ln -siv "$PWD/$RESOURCE_PACK" "$MCPATH/resourcepacks"
    else
        printf "%s\n%s\n%s" \
            "$0: world name not specified." \
            "usage: $0 <WORLD NAME>" \
            "example: $0 \"Datapack Testing\""
    fi

else
    echo "$0: the directory $MCPATH does not exist! please change the MCPATH variable in the script"
fi
