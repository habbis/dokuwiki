#!/bin/bash


get-etherpad () {
if test -d etherpad-lite
	then echo "etherpad-lite exists"
	else git clone --branch master git://github.com/ether/etherpad-lite.git
fi
}

get-wiki () {
if test -s /dokuwiki-59cc6db24741e7737ac87753874d8194.tgz
	then echo "nodejs exists"
	else https://download.dokuwiki.org/out/dokuwiki-59cc6db24741e7737ac87753874d8194.tgz
fi

}

get-settings () {
if test -e settings.json
	then echo "settings.json exists"
	else wget https://raw.githubusercontent.com/habbis/etherpad-settings/master/settings.json
fi
}

#tar xJvf *.tar.xz

#get-etherpad
get-wiki
#get-settings
