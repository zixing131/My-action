#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录
# Add Some Package
./scripts/feeds update -a

rm -rf package/lean/luci-app-jd-dailybonus package/lean/luci-theme-argon
mkdir -p package/custom && cd package/custom
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth=1 https://github.com/mwarning/zerotier-openwrt.git
git clone --depth=1 https://github.com/honwen/luci-app-aliddns.git
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr.git
cd -
./scripts/feeds install -a

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate
