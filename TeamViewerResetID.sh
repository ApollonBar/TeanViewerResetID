#!/bin/bash

#fonts color
COLOR="\033[35m"
FONT="\033[0m"

check_root(){
	[[ $EUID != 0 ]] && echo -e "${COLOR}当前账号没有ROOT权限，无法继续操作.${FONT}" && exit 1
}

get_script(){
	wget -N -P /tmp/ --no-check-certificate https://raw.githubusercontent.com/smarterq/TeanViewerResetID/master/TeamViewer-id-changer.py

}

execute_script(){
	cd /tmp && python TeamViewer-id-changer.py
}

main(){
	check_root
	get_script
	execute_script
    rm -f TeamViewer-id-changer.py TeamViewerResetID.sh 
}

main

echo -e "
#   ====================================================
#   ${COLOR}ID更换成功${FONT}
#   ${COLOR}系统:Mac OS${FONT}
#   ${COLOR}作者:Eleven${FONT}
#   ====================================================
"

exit 0