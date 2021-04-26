#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/6.1.1.1/g' package/base-files/files/bin/config_generate
# mkdir package/base-files/files/config
# echo 0xDEADBEEF > package/base-files/files/config/google_fu_mode
# rm -rf package/lean/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns
# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
# git clone https://github.com/kenzok8/small.git package/small
# sed -i '$a src-git passwall-plus https://github.com/yiguihai/luci-app-passwall-plus' feeds.conf.default
# sed -i '$a src-git xray https://github.com/felix-fly/xray-openwrt' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
git clone https://github.com/garypang13/luci-app-bypass.git package/luci-app-bypass
git clone https://github.com/garypang13/smartdns-le package/smartdns-le
wget -P package/lua-maxminddb https://raw.githubusercontent.com/garypang13/openwrt-packages/master/lua-maxminddb/Makefile
wget -P package/redsocks2 https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/lean/redsocks2/Makefile
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
