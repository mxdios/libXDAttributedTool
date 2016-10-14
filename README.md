# libXDAttributedTool
打包.a静态库，使用.a静态库给字符串设置富文本模式

# iOS库

iOS库一般有开源库，静态库和动态库。

开源库是指源代码开放的功能代码，比如AFNetworking。

静态库是指内部代码逻辑看不到，依靠相应的.h头文件调用内部方法的功能模块。有`.a静态库`和`.framework`两种形式。比如：百度导航的`libbaiduNaviSDK.a`，百度地图`BaiduMapAPI_Map.framework`。使用时要完全拷贝到工程中，调用。

动态库同样看不到内部代码逻辑，有`.dylib`(现在为`.tbd`)和`.framework`两种形式。比如常见的`libz.tbd`和`Foundation.framework`。由系统动态加载到内存中调用。

系统的`.framework`是动态库，自己创建的`.framework`是静态库。

**注意：**

**苹果禁止开发者在项目中使用自己创建的动态库。**

**swift无法制作.a静态库，只能创建.framework静态库。因为.a静态库需要.h头文件配合使用。**

# 制作.a静态库

.a静态库是iOS开发中常用的一种库文件，通常为一些第三方提供的功能模块。

以我写的一个工具方法[给字符串设置富文本模式](https://github.com/mxdios/XDAttributedTool)为例创建.a静态库

## 1.创建工程

创建项目，选择iOS -> Framework & Library -> Cocoa Touch Static Library

![创建工程](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160908-0.png?raw=true)

将要打包.a静态库的功能代码拖到新建的项目中。

![创建工程](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160908-1.png?raw=true)

## 配置工程

添加要打包.a静态库的代码文件，和添加相对应的.h头文件

![添加文件](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-1.png?raw=true)

设置release模式

![设置release模式](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-2.png?raw=true)

![设置release模式](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-3.png?raw=true)

## 编译文件

真机设备编译，生成真机使用的.a静态库：选择`iOS Device`设备，`command + b`编译。编译成功后，`.liblibAttributedTool.a`由红色变为黑色。

![编译文件](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-4.png?raw=true)

模拟器编译，生成模拟器使用的.a静态库：选择一个模拟器，`.liblibAttributedTool.a`会又变为红色，`command + b`编译。编译成功后，`.liblibAttributedTool.a`由红色变为黑色。

![编译文件](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-4.png?raw=true)

这时便生成了两个.a文件，分别用于真机和模拟器

## 合并.a文件

选中编译后变黑的`liblibAttributedTool.a`右键 Show in Finder。`Release-iphoneos`和`Release-iphonesimulator`分别为真机和模拟器下生成的静态库文件。

![合并](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-6.png?raw=true)

打开终端，输入`lipo -create` `空格` 拖入模拟器下的静态库.a `空格` 拖入真机下的静态库.a `空格` 输入`-output` `空格` 输入合并后的.a存放路径/静态库名字 `回车`。这里演示合并后的名字为`libXDAttributedTool.a`存放在桌面了，`ls`显示当前路径下的文件。
 
![合并](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-7.png?raw=true)

验证合并后的.a静态库支持的有效架构

![验证](https://github.com/mxdios/notebook/blob/master/notebooks/images/QQ20160909-8.png?raw=true)

## 使用.a静态库

将合并后的.a静态库和.h头文件(随便在真机或模拟器生成的库文件夹里选一个即可，或者用原项目中的.h头文件)放到一个文件夹内，拖入工程，导入.h文件即可使用。

项目中的`libAttributedTool`是打包.a静态库的源文件工程

项目中的`XDAttributedTool`是打包完成，使用.a静态库的测试工程

开源代码使用请见[XDAttributedTool](https://github.com/mxdios/XDAttributedTool)

# 制作.framework静态库

.framework静态库也经常使用，比如百度地图的一系列`BaiduMapAPI`都是.framework静态库。

## 1.创建工程

创建项目，选择iOS -> Framework & Library -> Cocoa Touch Framework。这一步跟打包.a静态库类似，跟打包.a时的截图不一样，是因为Xcode升级了。打包.a时用的Xcode7.3，打包.framework用的Xcode8.0，这就是拖坑不填的结果。

![img](https://raw.githubusercontent.com/mxdios/libXDAttributedTool/master/image/QQ20161014-0.png)

