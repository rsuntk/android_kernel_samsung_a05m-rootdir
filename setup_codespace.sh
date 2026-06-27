# github codespace prepare
# [[ DO NOT USE THIS IN WORKSPACE ]]

# delete .git
rm -rf .git

# grab deps
sudo apt update -y
sudo apt install aria2 byobu -y

# grab tc
aria2c https://github.com/rsuntk/files/releases/download/a05m-tc/toolchains.tar.gz_00
aria2c https://github.com/rsuntk/files/releases/download/a05m-tc/toolchains.tar.gz_01

# grab kernel-6.6
OPT_FLAGS="-q --depth=1 --single-branch"
BRANCH="android15-6.6-lts"
echo "Cloning branch $BRANCH .."
git clone $OPT_FLAGS https://github.com/rsuntk/android_kernel_samsung_a05m-6.6.git kernel-6.6 -b $BRANCH

# append tc
cat toolchains.tar.gz_00 toolchains.tar.gz_01 > tc.gz
tar -xf tc.gz
rm toolchains.tar* tc*gz
