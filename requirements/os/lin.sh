#!/bin/sh
set -ex

which ansible-playbook
if [ "$?" = "1" ]
then 
    echo "ansible is not installed, installing"

    which python
    if [ "$?" = "1" ]
    then 
        echo "Python is not installed, failed"
        exit 1
    fi

    which pip
    if [ "$?" = "1" ]
    then 
        echo "installing pip..."

        TEMP_PIP=$( mktemp )

        curl https://bootstrap.pypa.io/get-pip.py -o "$TEMP_PIP.py"
        python "$TEMP_PIP.py" --user

        which pip
        if [ "$?" = "1" ]
        then 
            echo "pip not found after installion, check python path or reload your current terminal to apply path"
            exit 1
        else
            echo "installed pip :)"
        fi
    fi

    pip install ansible
    echo "ansible is installed"
 
fi
