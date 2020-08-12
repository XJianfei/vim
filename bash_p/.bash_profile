export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
alias .="source"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home"
export CLASS_PATH="$JAVA_HOME/lib"
PATH="$PATH:$JAVE_HOME/bin:/Users/peter/Library/Android/sdk/platform-tools/"

function setProxy() {
    # export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:3128" 也可以设置http代理
    export ALL_PROXY=socks5://127.0.0.1:1080
    export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:1081"
    export {http,https}_proxy="http://127.0.0.1:1081"
}

function unsetProxy() {
    unset {HTTP,HTTPS,FTP}_PROXY
    unset {http,https}_proxy
    unset ALL_PROXY
}

alias l=ls
alias ll="ls -l"

#bind -x '"\C-R": history | tac | cut -c 8- | percol | bash'
#alias git='LANG=en_GB git'

#source ~/.xjfrc

# maven所在的目录
export M2_HOME=/Volumes/files/spring/apache-maven-3.6.3
# maven bin所在的目录
export M2=$M2_HOME/bin
# 将maven bin加到PATH变量中
export PATH=$M2:$PATH
export PATH=${PATH}:/Volumes/files/peter/work/tools/android/android-ndk-r21

