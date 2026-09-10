# create symlinks to selected world's datapack folder and global resourcepack folder
#
# macos only sorry
# usage: ./symlink.sh <YOUR TESTING WORLD>
# eg: ./symlink.sh "Datapack Testing"

MCPATH="$HOME/Library/Application Support/minecraft"
DATA="pets_can_ride_horses"
RESOURCE="invisible_acacia_boat"

if [ "$(uname -s)" = "Darwin" ]; then

    # allow minecraft symlinks for only these directories:
    touch "$MCPATH/allowed_symlinks.txt" 
    echo "$PWD/$DATA" >> "$MCPATH/allowed_symlinks.txt"  
    echo "$PWD/$RESOURCE" >> "$MCPATH/allowed_symlinks.txt"  

    if [ "$#" -eq 1 ]; then
        # datapack
        ln -siv "$PWD/$DATA" "$MCPATH/saves/$1/datapacks"

        # resourcepack
        ln -siv "$PWD/$RESOURCE" "$MCPATH/resourcepacks"
    fi

else
    echo "not on MacOS! this script only targets the MacOS minecraft directory (for now)"
fi
