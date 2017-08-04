#!/bin/bash

#TODO: replace hard-coded vals for repos and branches with vars
#TODO: add check for PRIVATE marker

# this script is written according to the following configuration:
#origin  git@github.com:ronachong/all-configuration-things.git (fetch)
#origin  git@github.com:ronachong/all-configuration-things.git (push)
#some-config-things      git@github.com:ronachong/some-config-things.git (fetch)
#some-config-things      git@github.com:ronachong/some-config-things.git (push)


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

    echo "(git push origin [all-configuration-things] master:master)"
    git push origin master:master
}

push_to_public_and ()
{
    push_to_private

    echo
    echo "(git checkout public)"
    git checkout public
    echo "(git cherry-pick master)"
    git cherry-pick master
    echo "(git push some-config-things public:public)"
    git push some-config-things public:public

    echo
    git checkout master
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
