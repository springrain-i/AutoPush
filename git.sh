#!/bin/bash

echo "<<>温馨提示：请将该脚本放在与项目路径同级的文件中>"

# 如果当前工作区没有更改则无需继续进行
git status

# 确定是否要提交
read -r -p "是否继续提交?【Y/n】" input

case $input in
    [yY][eE][sS]|[yY])
        echo "继续提交"

        git add .
        git status

        # 输入提交说明
        read -p "请输入本次提交的备注说明" commit
        echo "<<将暂存区内容提交到本地仓库：开始>>"
        git commit -m ${commit}

        echo "<<提交到远程仓库：开始>>"
        git push

        echo "<<恭喜您，本次推送完毕！(╹ڡ╹ )>>"
        ;;
    [nN][oO]|[nN])
        echo “中断提交”
        exit 1
        ;;
esac