#! /usr/bin/env bash
cp evanescia.config kernel/kernel_device_modules-6.6/kernel/configs

# KernelSU
cd kernel-6.6; curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -s main

EXT_DEFCONFIG="evanescia.config"
