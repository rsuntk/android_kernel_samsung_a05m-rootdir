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

clone_quiet() {
    local url="$1"
    local branch="$2"
    local dest="$3"

    echo "[$dest] Cloning branch $branch .."
    git clone -q --depth=1 --single-branch -b $branch $url $dest
}

# grab kernel
clone_quiet https://github.com/rsuntk/android_kernel_samsung_a05m-6.6.git android15-6.6-lts kernel-6.6
clone_quiet https://github.com/rsuntk/android_kernel_device_modules-6.6.git master kernel/kernel_device_modules-6.6
clone_quiet https://github.com/rsuntk/android_vendor_mediatek_kernel_modules.git master kernel/vendor/mediatek/kernel_modules

# append tc
cat toolchains.tar.gz_00 toolchains.tar.gz_01 > tc.gz
tar -xf tc.gz
rm toolchains.tar* tc*gz
