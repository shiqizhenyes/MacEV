# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/profile.pre.bash" ]] && . "$HOME/.fig/shell/profile.pre.bash"
# curl
alias curl="curl -x http://127.0.0.1:1087"

# gem & ruby
export GEM_HOME=$HOME/.gem
export RUBY_VERSION=2.6.0
export RUBY_HOME=$GEM_HOME/ruby/$RUBY_VERSION
export PATH=$GEM_HOME/bin:$RUBY_HOME/bin:$PATH

# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.local/opt/golang
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

# node
export NODE_HOME=/usr/local/bin
export NODE_MODULES=$HOME/.local/lib/node_modules/bin
export PATH=$HOME/.local/lib/node_modules/bin:$PATH

# openssl
# export LDFLAGS="-L/Users/zack/Projects/Repositories/shadowsocks-libev/arm64 -L/usr/local/lib -L/usr/local/opt/expat/lib"
# export CFLAGS="-I/Users/zack/Projects/Repositories/shadowsocks-libev/arm64/include -I/usr/local/include -I/usr/local/opt/expat/include"
# export CPPFLAGS="-I/Users/zack/Projects/Repositories/shadowsocks-libev/arm64/include -I/usr/local/include -I/usr/local/opt/expat/include"


# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# export ORACLE_JDK=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home
# export JDK_1_8=/usr/local/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home
# export INSTALL4J_JAVA_HOME=$JDK_1_8
# export JDK_11=/usr/local/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
# export JDK_13=/usr/local/Cellar/openjdk/13.0.2+8_2/libexec/openjdk.jdk/Contents/Home
# export JDK_14=/usr/local/Cellar/openjdk@14/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
export CPPFLAGS=-I$JAVA_HOME/include
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$HOME/.npm-global/bin:$PATH

# function defaultJdk() {
#     export JAVA_HOME=$JDK_11
#     export CPPFLAGS=-I$JAVA_HOME/include
#     export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
#     export PATH=$PATH:$JAVA_HOME/bin
# }
# alias jdk8="defaultJdk"

# function setJdk11() {
#     export JAVA_HOME=$JDK_11
#     export CLASSPATH=$JDK_11/lib/tools.jar:$JDK_11/lib/dt.jar:.
#     export PATH=$JDK_11/bin:$PATH:.
# }
# alias jdk11="setJdk11"

# function setJdk13() {
#     export JAVA_HOME=$JDK_13
#     export CLASSPATH=$JDK_13/lib/tools.jar:$JDK_13/lib/dt.jar:.
#     export PATH=$JDK_13/bin:$PATH:.
# }
# alias jdk13="setJdk13"

# function setJdk14() {
#     export JAVA_HOME=$JDK_14
#     export CLASSPATH=$JDK_14/lib/tools.jar:$JDK_14/lib/dt.jar:.
#     export PATH=$JDK_14/bin:$PATH:.
# }
# alias jdk14="setJdk14"

# export PROXY_PORT="10887"

function proxyOn() {
    export http_proxy="http://127.0.0.1:1087"
    export https_proxy="https://127.0.0.1:1087"
    set http_proxy=$http_proxy
    set https_proxy=$https_proxy
}
alias proxyOn="proxyOn"

function proxyOff() {
    unset http_proxy
    unset https_proxy
}
alias proxyOff="proxyOff"

function gitProxyOn() {
    git config --global http.proxy http://127.0.0.1:1087
}

alias gitProxyOn="gitProxyOn"

function gitProxyOff() {
    git config --global --unset http.proxy
}
alias gitProxyOff="gitProxyOff"

# kotlin
export KOTLIN_HOME=$HOME/Library/Kotlin
export PATH=$PATH:$KOTLIN_HOME/kotlinc/bin

# android sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export NDK_HOME=$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator

# flutter
export NO_PROXY=localhost,127.0.0.1,::1
export ENABLE_FLUTTER_DESKTOP=true
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
set PUB_HOSTED_URL=$PUB_HOSTED_URL
set FLUTTER_STORAGE_BASE_URL=$FLUTTER_STORAGE_BASE_URL
export PATH_TEMP=$PATH

source $HOME/Projects/Repositories/MacEV/flutter_stable.sh

function flutterStable1_x() {
    source $HOME/Projects/Repositories/MacEV/flutter_stable_1.x.sh
}

alias flutterStable1_x="flutterStable1_x"

function flutterStable() {
    source $HOME/Projects/Repositories/MacEV/flutter_stable.sh
}

alias flutterStable="flutterStable"

function flutterDev() {
    source $HOME/Projects/Repositories/MacEV/flutter_dev.sh
}

alias flutterDev="flutterDev"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
export HOMEBREW_NO_AUTO_UPDATE=true

# Homebrew 清华源
function brewTsingHua() {
    export HOMEBREW_BOTTLE_DOMAIN=http://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    git -C "$(brew --repo)" remote set-url origin http://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
    BREW_TAPS="$(brew tap)"
    for tap in core cask{,-fonts,-drivers,-versions}; do
        if echo "$BREW_TAPS" | grep -qE "^homebrew/${tap}\$"; then
            # 将已有 tap 的上游设置为本镜像并设置 auto update
            # 注：原 auto update 只针对托管在 GitHub 上的上游有效
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin http://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git
            git -C "$(brew --repo homebrew/${tap})" config homebrew.forceautoupdate true
        else   # 在 tap 缺失时自动安装（如不需要请删除此行和下面一行）
            brew tap --force-auto-update homebrew/${tap} http://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git
        fi
    done
    brew update-reset
}

alias brewTsingHua="brewTsingHua"

# Homebrew 中科大源
function brewUstc() {
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
    git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
    BREW_TAPS="$(brew tap)"
    for tap in core cask{,-fonts,-drivers,-versions}; do
        if echo "$BREW_TAPS" | grep -qE "^homebrew/${tap}\$"; then
            # 将已有 tap 的上游设置为本镜像并设置 auto update
            # 注：原 auto update 只针对托管在 GitHub 上的上游有效
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-${tap}.git
            git -C "$(brew --repo homebrew/${tap})" config homebrew.forceautoupdate true
        else   # 在 tap 缺失时自动安装（如不需要请删除此行和下面一行）
            brew tap --force-auto-update homebrew/${tap} http://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git
        fi
    done
    brew update-reset
}

alias brewUstc="brewUstc"


function brewRecovery() {
    unset HOMEBREW_BOTTLE_DOMAIN
    git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git

    # 以下针对 macOS 系统上的 Homebrew
    BREW_TAPS="$(brew tap)"
    for tap in core cask{,-fonts,-drivers,-versions}; do
        if echo "$BREW_TAPS" | grep -qE "^homebrew/${tap}\$"; then
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin https://github.com/Homebrew/homebrew-${tap}.git
        fi
    done

    # 重新设置 git 仓库 HEAD
    brew update-reset
}

alias brewRecovery="brewRecovery"


function brewFastGit() {
    unset HOMEBREW_BOTTLE_DOMAIN
    git -C "$(brew --repo)" remote set-url origin https://hub.fastgit.xyz/Homebrew/brew.git

    # 以下针对 macOS 系统上的 Homebrew
    BREW_TAPS="$(brew tap)"
    for tap in core cask{,-fonts,-drivers,-versions}; do
        if echo "$BREW_TAPS" | grep -qE "^homebrew/${tap}\$"; then
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin https://hub.fastgit.xyz/Homebrew/homebrew-${tap}.git
        fi
    done

    # 重新设置 git 仓库 HEAD
    brew update-reset
}

alias brewFastGit="brewFastGit"

export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
# export PATH=$PATH:/usr/bin/python3
# alias python=/usr/bin/python3
# export PATH=$PATH:~/Go/bin
# export PATH=/usr/local/opt/icu4c/bin:$PATH
# export PATH=/usr/local/opt/icu4c/sbin:$PATH
# export PATH=/usr/local/opt/sqlite/bin:$PATH
# export CARGO_HOME=$HOME/.cargo
# export RUS_HOME=$HOME/.rustup
# export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
# export PATH=$CARGO_HOME/bin:$RUS_HOME:$PATH

# export PATH=/usr/local/opt/tomcat@8/bin:$PATH
# ulimit -S -n 20480

# export FUCHSIA_SOURCE=/Volumes/M1/fuchsia
# export LDFLAGS=-L/usr/local/opt/icu4c/lib
# export CPPFLAGS=-I/usr/local/opt/icu4c/include
# export LDFLAGS=-L/usr/local/opt/sqlite/lib
# export CPPFLAGS=-I/usr/local/opt/sqlite/include
# export PKG_CONFIG_PATH=/usr/local/opt/sqlite/lib/pkgconfig

# export LDFLAGS=-L/usr/local/opt/libffi/lib
# export LDFLAGS=-L/usr/local/opt/readline/lib
# export CPPFLAGS=-I/usr/local/opt/readline/include
# export PKG_CONFIG_PATH=/usr/local/opt/readline/lib/pkgconfig

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/profile.post.bash" ]] && . "$HOME/.fig/shell/profile.post.bash"
