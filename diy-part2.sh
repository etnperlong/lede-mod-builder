#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify luci-app-passwall dependancy from v2ray-plugin to xray-plugin
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-passwall/Makefile" | xargs -i sed -i 's/v2ray-plugin/xray-plugin/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-passwall/Makefile" | xargs -i sed -i 's/V2ray_Plugin/Xray_Plugin/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-passwall/Makefile" | xargs -i sed -i 's/V2ray-plugin/Xray-plugin/g' {}

# Modify luci-app-ssr-plus dependancy from v2ray-plugin to xray-plugin
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-ssr-plus/Makefile" | xargs -i sed -i 's/v2ray-plugin/xray-plugin/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-ssr-plus/Makefile" | xargs -i sed -i 's/V2ray_Plugin/Xray_Plugin/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-ssr-plus/Makefile" | xargs -i sed -i 's/V2ray-plugin/Xray-plugin/g' {}

# Replace luci-theme-argon by jerrykuku/luci-theme-argon/tree/18.06
cd lede/package/lean  
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
