# JRDBSwift


# 导入

由于Swift版的JRDB是依赖于 OC版的JRDB，导致每个文件要使用全部功能都要进行导入

```
import JRDB
import JRDBSwfit
```

这样会非常麻烦

# 解决方案

在swift项目中，不管有没有OC代码，都建立一个swift和oc的桥接文件。
新建一个oc文件，xcode会自动帮你创建，如果已经有了，就不用创建了。

在桥接文件中

```
@import JRDB;
@import JRDBSwfit;
```

这样，就可以在所有文件中使用了，并且不需要再次导入