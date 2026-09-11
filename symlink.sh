# create symlinks to selected world's datapack folder and global resourcepack folder
#
# defaults to macos + default launcher only sorry. if on
# linux/using different launcher, modify the MCPATH constant
#
# usage: ./symlink.sh <YOUR TESTING WORLD>
# eg: ./symlink.sh "Datapack Testing"

readonly MCPATH="$HOME/Library/Application Support/minecraft"
readonly DATA="pets_can_ride_horses"
readonly RESOURCE="invisible_acacia_boat"

if [ -d "$MCPATH" ]; then

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
    echo "$0: the directory $MCPATH does not exist! please change the MCPATH variable in the script"
fi
