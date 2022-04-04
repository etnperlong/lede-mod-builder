#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Set default Git Identity
git config --global user.name "Evans Mike"
git config --global user.email "etnperlong@gmail.com"

# Patch by My-Patch Branch
git remote -v
git remote add patch https://github.com/etnperlong/lede-mod.git
git remote -v
git fetch patch
git checkout master
git merge patch/my-patch

# Add Support for Asterisk Quectel dongle (My Dev Patch Version)
git clone -b dev https://github.com/etnperlong/openwrt-asterisk-chan-quectel.git package/asterisk-chan-quectel

# Add a feed source
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages.git' feeds.conf.default
sed -i '$a src-git kenzok8small https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
sed -i '$a src-git ethernfq https://github.com/mister-benjamin/etherwake-nfqueue-openwrt.git' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld.git' feeds.conf.default

# Patch Asterisk Quectel dongle
# sed -i 's,https://git.openwrt.org/feed/telephony.git,https://github.com/etnperlong/telephony.git;asterisk-chan-quectel,g' feeds.conf.default
