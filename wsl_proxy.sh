# add proxy for wsls

# begin proxy

export hostip=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')
export socks_hostport=1000
export http_hostport=1001

alias proxy='
    export https_proxy="http://${hostip}:${http_hostport}"
    export http_proxy="http://${hostip}:${http_hostport}"
    export ALL_PROXY="socks5://${hostip}:${socks_hostport}"
    export all_proxy="socks5://${hostip}:${socks_hostport}"
'

alias unproxy='
    unset ALL_PROXY
    unset https_proxy
    unset http_proxy
    unset all_proxy
'

alias echoproxy='
    echo $ALL_PROXY
    echo $all_proxy
    echo $https_proxy
    echo $http_proxy
'
# end proxy

# add this line in ~/.bashrc
# source ~/.user_script/wsl_proxy.sh
