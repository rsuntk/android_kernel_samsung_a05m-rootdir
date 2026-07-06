files=$(find . -type f -name "*.ko")
for i in $files; do
    $(pwd)/prebuilts/clang/host/linux-x86/clang-r510928/bin/llvm-strip --strip-unneeded "$i"
    echo "Stripping $i .."
done
