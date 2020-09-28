# mac 常用环境变量适用方式
    每次重装系统都需要重新配置环境变量比较浪费时间，为了节约时间，方便大家，开源出来，希望能帮到一些人，本脚本经自定义修改应该可以适用于Linux系统，但不适用于windows 系统。
# 引入到系统环境
    直接把.profile文件复制到/Users/用户名下，或者软连接到/Users/用户名下也可以，编辑.zshrc文件，添加一行source ~/.profile，重启电脑

## java 环境
    1、下载mac 的jdk，把jdk 拷贝到/Library/Java/JavaVirtualMachines/目录
    2、编辑.profile文件，把ORACLE_JDK 后面的路径换成自己的jdk路径，或者替换JAVA_HOME 后面的路径也可以

## kotlin 环境
    1、直接把kotlin runtime 目录重命名为Kotlin，拷贝到~/Library/目录即可

## Android sdk ndk 环境
    1、一般情况下这个不用改，如果你的sdk不在~/Library/Android/sdk 目录，直接用你的sdk路径替换ANDROID_HOME 后面的路径即可

## Flutter 环境
    1、从github 克隆flutter 的仓库到~/Library/flutterStable目录
    2、复制flutterStable目录到~/Library，重命名为FlutterDev
    3、如果之前执行过-引入到系统环境的步骤，可以直接打开终端执行flutterStable，切换到flutter 稳定分支，再执行一次flutter doctor即可
    4、只有第一次切换和检测升级时需要执行flutter doctor，其他时候不需要执行

## git 代理
    这个直接替换自己的代理端口就可以

