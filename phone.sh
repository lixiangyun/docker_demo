#!/bin/bash

export USERNAME=root

function show_help()
{
    echo ""
    echo "${0} [OPTS] ..."
    echo "      -u   <username>    #user ssh key copy"
    echo ""
}

function parse()
{
    while getopts hu: OPTION
    do
    case $OPTION in
        u) USERNAME=$OPTARG
        ;;
        h)show_help
            exit 1
        ;;
        \?)show_help
            exit 1
        ;;
        esac
    done
}

parse $@

export USERDIR=/home/$USERNAME

if [ $USERNAME == root ] ; then
	USERDIR=/$USERNAME
fi

echo "user name :"$USERNAME

if [ ! -e $USERDIR ];then
    echo "user dir  :"$USERDIR" is not exist!"
	exit 1
fi

USERDIR=$USERDIR/.ssh
echo "user ssh  :"$USERDIR

if [ ! -e $USERDIR ];then
    mkdir $USERDIR > /dev/null 2>&1
	echo mkdir $USERDIR
fi

cp phone $USERDIR/id_rsa
cp phone.pub $USERDIR/id_rsa.pub

chmod 600 $USERDIR/id_rsa*

exit 0
