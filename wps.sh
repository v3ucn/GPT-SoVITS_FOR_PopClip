#!/bin/zsh
# #popclip
# name: WPS excel
# icon: "WPS"

# 获取选中的文本
escaped_text=$(echo "$POPCLIP_TEXT" | tr '\n' ' ')

# 调用python 脚本
/Users/liuyue/anaconda3/bin/python /Users/liuyue/Downloads/popclip-extend/test_xlsx.py $escaped_text™


