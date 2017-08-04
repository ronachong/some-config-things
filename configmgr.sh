#!/bin/bash

push_to_private ()
{
    git checkout master

    echo "($cmd)"
    $cmd # git commit ___ doesn't have output?
    ret=$?
    if [ $ret != 0 ]; then
	echo "return: $ret"
	exit
    fi
    
    echo "(git commit -m '$cmt_t' -m '$cmt_m')"
    git commit -m "$cmt_t" -m "$cmt_m"

    echo "(git push all-configuration-things master:master)"
    git push all-configuration-things master:master
}

push_to_public_and ()
{
    push_to_private
    echo "(git checkout public)"
    git checkout public
    echo "(git cherry-pick master)"
    git cherry-pick master
    echo "(git push some-config-things public:public)"
    git push some-config-things public:public
}

case $1 in
    'push-commit' )
	echo "Command?"
	read cmd

	echo
	echo "Commit title?"
	read cmt_t

	echo
	echo "Commit message?"
	read cmt_m

	echo
	echo "Push to public and private, or just private? (enter 'public and' or 'private')"
	read dest
	echo

	if [[ $dest == 'public and' ]]; then
	    push_to_public_and
	elif [[ $dest == 'private' ]]; then
	    push_to_private
	else
	    echo "invalid destination: $dest"
	fi
	;;

    * )
	echo "$1 not push-commit"
	;;
esac
