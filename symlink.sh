# create symlinks to selected world's datapack folder and global resourcepack folder
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
    echo "$PWD/$DATA_PACK" >> "$MCPATH/allowed_symlinks.txt"  
    echo "$PWD/$RESOURCE_PACK" >> "$MCPATH/allowed_symlinks.txt"  

    if [ "$#" -eq 1 ]; then
        # datapack
        ln -siv "$PWD/$DATA_PACK" "$MCPATH/saves/$1/datapacks"

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
