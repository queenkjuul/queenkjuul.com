# Milk-V Duo and Duo-S Buildroot System `duo-buildroot-sdk`

It's a litte weird and they don't do everything by the book. My notes:

## Don't build a kernel using the menuconfig in the documentation

Milk-v's `duo-buildroot-sdk` tells you to go to `duo-buildroot-sdk/buildroot-YYYY.MM/output/milkv-*/` and run `make menuconfig` to set up your build.

Do not select to build a kernel in this menu. It will only waste time. The milkv scripts will build a different kernel and install it to the boot partition, so the one you configure won't get used.

Instead, it uses the kernel defined in `duo-buildroot-sdk/linux_5.10` (as of 5/2024). If you go to this directory and `make menuconfig`, though, it will only let you set x86 options, not cross-compile options. Easiest thing for me was to do this:

1. Edit `duo-buildroot-sdk/build.sh`
2. At the bottom of the file, edit it so it looks like this:

```sh
get_toolchain

export MILKV_BOARD="${MILKV_BOARD}"

prepare_env

build_info

menuconfig_kernel     # this line is new

milkv_build
milkv_pack
```

Now when you run `./build.sh`, it will prompt you to set up your kernel first.

## Packages which definitely do not build right

These will cause your build to fail, and with lots of parallel builds happening and limited logging output in `br.log` it is hard to troubleshoot, so avoid these:

- make
- wayland
  - It may get selected as a dependency - search for wayland in the menuconfig and make sure ALL wayland packages are deselected before saving
