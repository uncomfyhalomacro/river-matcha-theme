#!/bin/sh

echo -e "This will remove your previous configuration assuming it is a symlink, are you sure? y - confirm; any letter - to abort"

read answer

if [[ $answer == "y" ]] || [[ $answer == "Y" ]]; then

    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

    for i in {river,mako,yambar,foot,waybar}; do
        CONF_DIR="$HOME/.config/$i"
        if [ -d  $CONF_DIR ]; then
            BACKUP_DIR=$HOME/.config/riverconfigbackup
            mkdir -p "$BACKUP_DIR"
            cp $CONF_DIR "$BACKUP_DIR" -frv
            rm -rf $CONF_DIR
            cp $SCRIPT_DIR/$i $CONF_DIR -frv
        else
            # Check if it is a symlink file
            if [ -L $CONF_DIR ]; then
                rm $CONF_DIR
                cp $SCRIPT_DIR/$i $HOME/.config -rfv
            else
                cp $SCRIPT_DIR/$i $HOME/.config -rfv
            fi
        fi
    done
    cp $SCRIPT_DIR/mygrimshot.sh $HOME/.local/bin -fv
    cp $SCRIPT_DIR/wayriver.sh $HOME/wayriver.sh -fv
    echo "Done copying configs"

    echo "Now replacing paths using host username: $USER"
    sleep 2s
	sed -i 's/uncomfy/'"${USER}"'/g' $HOME/.config/yambar/config.yml
    echo "DONE"
else
    echo "Aborted"
    exit
fi


