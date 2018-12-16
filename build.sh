#!/bin/bash

# Setup NVME Drive from AWS
mkdir /android
mkfs.ext4 /dev/nvmen01
mount /dev/nvme0n1 /android
cd /android

#Configure JACK
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

#Update System
apt update

apt dist-upgrade -y

#Install Vuild dependencies
apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev openjdk-8-jdk repo python

#Configure Git
git config --global user.name "Michael Di Giacomi"
git config --global user.email digitaladrenalin@gmail.com

#Clone Android
repo init -u https://github.com/LineageOS/android.git -b lineage-15.1

# Copy Mata Configs
mkdir ./.repo/local_manifests

cp ./local_manifest.xml ./.repo/local_manifests/local_manifest.xml

#pull repos
repo sync

#Setup Environment
source ./build/envsetup.sh

croot

#BUILD
brunch mata
