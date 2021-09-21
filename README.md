# obp_cdbe_docbook
OBP: Open Book Project?  CDBE:

算是对10年前的一个备份。

今天整理硬盘，偶然看到了这个文件夹，想当年中二的时候，整理EX GF的短信都用这个Orz算是git book的早期探索品吧，很有价值。 官方网站已经被黑了。可以来这里查看：https://wiki.woodpecker.org.cn/moin/CDBE

此时此景，本想吟诗一首，不过看到窗外的晚霞和火烧云，内心无限感慨和凄凉。所以。。。算了吧。哎。39岁的人了。

## 使用方式

http://siwei.me/blog/posts/origin_from_javaeye_632

使用Docbook写文档，是一件非常有成就感的事情。它最大的特点就是：让你写的东西看起来非常专业。嘿嘿。

之前一直苦于Docbook对于汉字的不支持。Velocity也有个docbook项目，可惜对汉字支持的也不好。07年底我发现了CDBE这个项目。非常赞！感谢作者，现在提供的链接仍然有效。

CDBE的下载地址

1. CDBE的安装
CDBE的手册中写道：

引用
安装CDBE十分简单，它是一个.zip压缩包。
首先将其解压缩到适当位置，建议解压缩到D:\obp\目录下。
执行 install.bat 文件。


实际上，执行完这一步之后，还需要您修改 CDBE目录下的bat/config.bat文件的
docbook_base_path这个变量，使它指向正确的安装位置：

引用
set docbook_base_path=D:\obp


这样就好了。

2. Docbook中注意的几个问题。

图片放在 src/figure目录下，而不是figures. 否则会找不到。
图片对于pdf格式的输出，统一会压缩成542宽度。对于HTML则是原大小。
所有的xml文件请使用UTF-8编码。GBK的不会成功。
对于程序代码，建议使用literallayout标签，而不是 programlisting。因为后者的输出中，汉字会变成乱码。
如何让图片的title居中（pdf格式） ：   imagedata align="center"
html的字体，跟windows画图中 的12号字体等大。

3. docbook手册：
建议看这里：http://www.docbook.org/tdg/en/html/docbook.html

