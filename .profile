# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true
export PATH=/usr/local/sbin:$PATH
# nexus
export PATH=/opt/nexus/nexus/bin:$PATH

# cmake
export CMAKE=/Applications/CMake.app/Contents
export PATH=$CMAKE/bin:$PATH

# export ORACLE_JDK=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home
export JDK_8=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home
# export JDK_11=/usr/local/Cellar/openjdk@11/11.0.6+10/libexec/openjdk.jdk/Contents/Home
# export JDK_13=/usr/local/Cellar/openjdk/13.0.2+8_2/libexec/openjdk.jdk/Contents/Home
# export JDK_14=/usr/local/Cellar/openjdk@14/Contents/Home
export JAVA_HOME=$JDK_8
export CPPFLAGS=-I$JAVA_HOME/include
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export PATH=$JAVA_HOME/bin:$PATH:.
# export PATH=~/.npm-global/bin:$PATH

function defaultJdk() {
    export JAVA_HOME=$JDK_8
    export CPPFLAGS=-I$JAVA_HOME/include
    export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
    export PATH=$JAVA_HOME/bin:$PATH:.
}
alias jdk8="defaultJdk"

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

export KOTLIN_HOME=~/Library/Kotlin
export PATH=$PATH:$KOTLIN_HOME/kotlinc/bin
export ANDROID_HOME=~/Library/Android/sdk
export NDK_HOME=$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export ENABLE_FLUTTER_DESKTOP=true
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
set PUB_HOSTED_URL=$PUB_HOSTED_URL
set FLUTTER_STORAGE_BASE_URL=$FLUTTER_STORAGE_BASE_URL
export FLUTTER_HOME=~/Library/flutter
export DART_HOME=$FLUTTER_HOME/bin/cache/dart-sdk
export PATH=$PATH:$FLUTTER_HOME/bin:$DART_HOME/bin

function flutterStable() {
    fromPath=$PWD
    cd $HOME/Library
    if [ -L flutter ]
    then
        rm flutter
    fi
    ln -s FlutterStable flutter
    cd $fromPath
}

alias flutterStable="flutterStable"

unction flutterDev() {
    fromPath=$PWD
    cd $HOME/Library
    if [ -L flutter ]
    then
        rm flutter
    fi
    ln -s FlutterDev flutter
    cd $fromPath
}

alias flutterDev="flutterDev"

# export PATH=$PATH:/usr/bin/python3
# alias python=/usr/bin/python3
# export PATH=$PATH:~/Go/bin
# export PATH=/usr/local/opt/icu4c/bin:$PATH
# export PATH=/usr/local/opt/icu4c/sbin:$PATH
# export PATH=/usr/local/opt/sqlite/bin:$PATH
# export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
# export CARGO_HOME=$HOME/.cargo
# export RUS_HOME=$HOME/.rustup
# export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
# export PATH=$CARGO_HOME/bin:$RUS_HOME:$PATH
# export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
# export PATH=/usr/local/opt/tomcat@8/bin:$PATH
# ulimit -S -n 20480

# export FUCHSIA_SOURCE=/Volumes/M1/fuchsia
# export LDFLAGS=-L/usr/local/opt/icu4c/lib
# export CPPFLAGS=-I/usr/local/opt/icu4c/include
# export LDFLAGS=-L/usr/local/opt/sqlite/lib
# export CPPFLAGS=-I/usr/local/opt/sqlite/include
# export PKG_CONFIG_PATH=/usr/local/opt/sqlite/lib/pkgconfig
# export LDFLAGS=-L/usr/local/opt/openssl@1.1/lib
# export CPPFLAGS=-I/usr/local/opt/openssl@1.1/include
# export LDFLAGS=-L/usr/local/opt/libffi/lib
# export LDFLAGS=-L/usr/local/opt/readline/lib
# export CPPFLAGS=-I/usr/local/opt/readline/include
# export PKG_CONFIG_PATH=/usr/local/opt/readline/lib/pkgconfig
