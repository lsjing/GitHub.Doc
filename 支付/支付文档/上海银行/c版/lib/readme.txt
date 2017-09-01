kii_shb_sign.dll是针对上海银行开发的签名验证的需求，使用vc6.0开发的动态库。
文件介绍：
kii_shb_sign.h  是头文件，定义了kii_shb_sign.dll里的所有对外提供的接口,包含参数定义和错误码说明。
kii_shb_sign.lib 是静态链接库；
kii_shb_sign.dll 是动态链接库；

libeay32.dll和iconv.dll是kii_shb_sign.dll 依赖的dll，需要跟kii_shb_sign.dll 放在同一目录下。

shb_test.rar 包含对kii_shb_sign动态库的测试工程。

注意：

	调用kii_shb_sign.dll 的工程的run time libary应为Multithreaded DLL,否则出错。