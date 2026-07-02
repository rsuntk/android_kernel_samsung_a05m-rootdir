for i in "$(find . -type f -name "*.ko")"; do
	$(pwd)/prebuilts/clang/host/linux-x86/clang-r510928/bin/llvm-strip --strip-unneeded $i
done
