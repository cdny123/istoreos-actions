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
if sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default; then
    echo "Uncommented helloworld feed source."
else
    echo "Failed to uncomment helloworld feed source." >&2
    exit 1
fi

# Add feed sources
{
    echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall'
    echo 'src-git openclash https://github.com/vernesong/OpenClash'
    echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome'
    echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages'
    echo 'src-git small https://github.com/kenzok8/small'
    echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns'
} >> feeds.conf.default && echo "Added feed sources." || {
    echo "Failed to add feed sources." >&2
    exit 1
}
