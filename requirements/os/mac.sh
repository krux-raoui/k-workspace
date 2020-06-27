#!/bin/sh
set -ex

which brew
if [ "$?" = "1" ]
then 
    echo "homebrew is not installed, installing"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    which brew
    if [ "$?" = "1" ]
    then 
        echo "brew not found after installion, check brew path or reload your current terminal to apply path"
        exit 1
    fi
fi


which ansible-playbook
if [ "$?" = "1" ]
then 
    echo "ansible is not installed, installing"

    brew install ansible

    which ansible-playbook
    if [ "$?" = "1" ]
    then 
        echo "ansible not found after installion, check brew path or reload your current terminal to apply path"
        exit 1
    fi    
    
    echo "ansible is installed" 
fi
