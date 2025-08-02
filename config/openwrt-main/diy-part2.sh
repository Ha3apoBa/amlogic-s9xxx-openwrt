#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: main
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='official'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
rm -rf package/luci-app-amlogic
#git clone https://github.com/Thaolga/luci-app-amlogic.git package/luci-app-amlogic
#git clone https://github.com/Auroraxpm/argon package/argon
#git clone https://github.com/kenzok8/small-package package/small-package
#git clone https://github.com/douglarek/luci-app-homeproxy package/luci-app-homeproxy
#git clone https://github.com/muink/luci-app-homeproxy  package/luci-app-homeproxy
#git clone https://github.com/Thaolga/small-package  package/small-package
#git clone https://github.com/v2rayA/v2raya-openwrt  package/v2raya-openwrt
#git clone https://github.com/Thaolga/openwrt-passwall2  package/openwrt-passwall2
git clone https://github.com/xiaorouji/openwrt-passwall  package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall2  package/openwrt-passwall2
git clone https://github.com/xiaorouji/openwrt-passwall-packages  package/packages
git clone https://github.com/vernesong/OpenClash  package/OpenClash
#git clone https://github.com/Thaolga/openwrt-spectra package/openwrt-spectra
git clone https://github.com/linkease/istore    package/istore 
#git clone https://github.com/Ha3apoBa/openwrt-fchomo    package/openwrt-fchomo
git clone https://github.com/nikkinikki-org/OpenWrt-nikki    package/OpenWrt-nikki
#git clone https://github.com/SURFBOARD-ONE/luci-app-daed   package/dae
#git clone https://github.com/fw876/helloworld   package/helloworld 
#git clone https://github.com/sirpdboy/luci-app-autotimeset.git   package/luci-app-autotimeset
#git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git   package/luci-app-poweroffdevice
#git clone https://github.com/sirpdboy/luci-app-ddns-go   package/luci-app-ddns-go 
#git clone https://github.com/sirpdboy/luci-app-advancedplus  package/luci-app-advancedplus 
#git clone https://github.com/sirpdboy/luci-app-partexp   package/luci-app-partexp
#git clone https://github.com/muink/luci-app-tinyfilemanager package/luci-app-tinyfilemanager
#git clone https://github.com/Thaolga/diy package/diy
#git clone  https://github.com/Thaolga/openwrt-nekobox  package/openwrt-nekobox
mkdir -p package/libcron && wget -O package/libcron/Makefile https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/libs/libcron/Makefile
git clone https://github.com/Thaolga/openwrt-nekobox  package/openwrt-nekobox


# git clone https://github.com/yichya/luci-app-xray   package/luci-app-xray 
#
# Apply patch
# git apply ../config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------
