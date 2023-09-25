# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# export DOCKER_HOST=unix:///${HOME}/.colima/docker.sock
alias ls="ls -hG"

# alias curl="curl -x http://127.0.0.1:8888"

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
# export NODE_OPTIONS=--openssl-legacy-provider
# export NODE_MODULES=$HOME/.local/lib/node_modules/bin
# export PATH=$HOME/.local/lib/node_modules/bin:$PATH

export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
export CPPFLAGS=-I$JAVA_HOME/include
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$HOME/.npm-global/bin:$PATH

# kotlin
export KOTLIN_HOME=$HOME/Library/Kotlin
export PATH=$PATH:$KOTLIN_HOME/kotlinc/bin

function kotlinUpgrade() {
    if [ ! -d "$myPath"]; then
    rm -rf ~/Library/Kotlin
    fi
    cp -r /Applications/Android\ Studio.app/Contents/plugins/Kotlin ~/Library/
}

alias kotlinUpgrade="kotlinUpgrade"

function kotlinPermission() {
    for k in kapt kotlin kotlin-dce-js kotlinc kotlinc-js kotlinc-jvm; do
        chmod +x ~/Library/Kotlin/kotlinc/bin/$k
    done
}

alias kotlinPermission="kotlinPermission"

# HarmonyOS sdk
export HDC_SERVER_PORT=7035
export HOS_SDK_HOME=$HOME/Library/Huawei/Sdk
export HOS_SDK_API="3.1.0"
export HDC_HOME=$HOS_SDK_HOME/hmscore/$HOS_SDK_API/toolchains
export PATH=$PATH:$HDC_HOME
export PATH=$PATH:$HDC_HOME/build-tools

# OpenHarmony sdk
export OHOS_SDK_HOME=$HOME/Library/OpenHarmony/Sdk
export OHOS_SDK_API=9
export OHOS_NATIVE_HOME=$OHOS_SDK_HOME/$OHOS_SDK_API/native
export PATH=$PATH:$OHOS_SDK_HOME/$OHOS_SDK_API/toolchains

# android sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_NDK=$ANDROID_SDK/ndk/21.4.7075529
export ANDROID_HOME=$ANDROID_SDK
export PATH=$PATH:$ANDROID_SDK/platform-tools
export PATH=$PATH:$ANDROID_SDK/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK/emulator

# flutter
export NO_PROXY=localhost,127.0.0.1,::1
export ENABLE_FLUTTER_DESKTOP=true
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
set PUB_HOSTED_URL=$PUB_HOSTED_URL
set FLUTTER_STORAGE_BASE_URL=$FLUTTER_STORAGE_BASE_URL

export FLUTTER_SDK=$HOME/Library/Flutter
export DART_SDK=$FLUTTER_SDK/bin/cache/dart-sdk
export DART_HOME=$DART_SDK
export PATH=$PATH:$FLUTTER_SDK/bin:$DART_SDK/bin

# homeBrew
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"
export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_INSTALL_CLEANUP=true
export HOMEBREW_NO_INSTALL_FROM_API=true
export HOMEBREW_NO_ENV_HINTS=true

function brewALiYun() {
    true > $HOME/.homebrew/brew.env
    unset HOMEBREW_BOTTLE_DOMAIN
    unset HOMEBREW_CORE_GIT_REMOTE
    echo "export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles-ori/bottles" >> $HOME/.homebrew/brew.env
    echo "export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.aliyun.com/homebrew/homebrew-core.git" >> $HOME/.homebrew/brew.env
    envBrew
    git -C "$(brew --repo)" remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

    # 以下针对 macOS 系统上的 Homebrew
    BREW_TAPS="$(brew tap)"
    for tap in core cask{-fonts,-versions}; do
        if echo "$BREW_TAPS" | grep -qE "^homebrew/${tap}\$"; then
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-${tap}.git
            git -C "$(brew --repo homebrew/${tap})" config homebrew.forceautoupdate true
        else   # 在 tap 缺失时自动安装（如不需要请删除此行和下面一行）
            brew tap --force-auto-update homebrew/${tap} https://mirrors.aliyun.com/homebrew/homebrew-${tap}.git
        fi
    done
    # 重新设置 git 仓库 HEAD
    brew update-reset
}

alias brewALiYun="brewALiYun"

function brewRecovery() {
    true > $HOME/.homebrew/brew.env
    unset HOMEBREW_BOTTLE_DOMAIN
    unset HOMEBREW_CORE_GIT_REMOTE
    echo "export HOMEBREW_BOTTLE_DOMAIN=https://github.com/Homebrew/homebrew-bottles-ori/bottles" >> $HOME/.homebrew/brew.env
    echo "export HOMEBREW_CORE_GIT_REMOTE=https://github.com/Homebrew/homebrew-core.git" >> $HOME/.homebrew/brew.env
    envBrew
    git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git

    # 以下针对 macOS 系统上的 Homebrew
    BREW_TAPS="$(brew tap)"
    for tap in core cask{-fonts,-versions}; do
        if echo "$BREW_TAPS" | grep -qE "^homebrew/${tap}\$"; then
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin https://github.com/Homebrew/homebrew-${tap}.git
            git -C "$(brew --repo homebrew/${tap})" config homebrew.forceautoupdate true
        else   # 在 tap 缺失时自动安装（如不需要请删除此行和下面一行）
            brew tap --force-auto-update homebrew/${tap} https://github.com/Homebrew/homebrew-${tap}.git
        fi
    done
    # 重新设置 git 仓库 HEAD
    brew update-reset
}

alias brewRecovery="brewRecovery"

function envBrew() {
    if [ -d $HOME"/.homebrew" ]; then
        source $HOME/.homebrew/brew.env
        # echo "homebrew 存在"
    else
        mkdir $HOME/.homebrew
        touch $HOME/.homebrew/brew.env
        chmod u+x $HOME/.homebrew/brew.env
        brewRecovery
        # echo "homebrew 不存在"
    fi
}

envBrew

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
