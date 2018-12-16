#!/bin/bash

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

apt update

apt dist-upgrade -y

apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk repo python

git config --global user.name "Michael Di Giacomi"
git config --global user.email digitaladrenalin@gmail.com

repo init -u https://github.com/LineageOS/android.git -b lineage-15.1

mkdir ./.repo/local_manifests

cp ./local_manifest.xml ./.repo/local_manifests/local_manifest.xml

repo sync

source ./build/envsetup.sh

croot

brunch mata
