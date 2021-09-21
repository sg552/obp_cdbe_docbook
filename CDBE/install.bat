@echo off
cd %0\..\..
rem Author: chen bin (chenbin.sh@gmail.com)
rem http://groups.google.com/group/alt.msdos.batch/browse_thread/thread/3e1f93b1644ce05f/2761b36b1074f5a6?lnk=gst&q=current+working+directory+variable&rnum=2#2761b36b1074f5a6
if not [%OS%]==[Windows_NT] goto _otheros
goto _winnt

:_otheros
echo @prompt set padir=$p$_> ~tmpA.bat
%comspec% /e:2048 /c ~tmpA.bat > ~tmpB.bat
for %%v in (~tmpB.bat del) call %%v ~tmp?.bat

:_winnt
if "%os%"=="Windows_NT" for /f %%a in ('cd') do set padir=%%a

echo %padir%

set configbat=config.bat
echo @echo off > %padir%\CDBE\bat\%configbat%
echo set docbook_base_path=%padir%>> %padir%\CDBE\bat\%configbat%
echo set docbook_website_base_path=%%docbook_base_path%%\website>> %padir%\CDBE\bat\%configbat%
echo set docbook_books_path=%%docbook_base_path%%\books>> %padir%\CDBE\bat\%configbat%
echo set docbook_cdbe_path=%%docbook_base_path%%\CDBE>> %padir%\CDBE\bat\%configbat%
echo set docbook_libjar_path=%%docbook_cdbe_path%%\libjar>> %padir%\CDBE\bat\%configbat%
echo set docbook_libxslt_path=%%docbook_cdbe_path%%\libxslt>> %padir%\CDBE\bat\%configbat%
echo set docbook_dtd_path=%%docbook_cdbe_path%%\dtd\docbook-xml-4.4>> %padir%\CDBE\bat\%configbat%
echo set docbook_catalog_ptah=%%docbook_cdbe_path%%\dtd>> %padir%\CDBE\bat\%configbat%
echo set docbook_xsl_path=%%docbook_cdbe_path%%\xsl\docbook-xsl-1.68.1>> %padir%\CDBE\bat\%configbat%
echo set docbook_slides_path=%%docbook_cdbe_path%%\dtd\docbook-slides-3.4.0>> %padir%\CDBE\bat\%configbat%
echo set docbook_website_path=%%docbook_cdbe_path%%\dtd\docbook-website-2.6.0>> %padir%\CDBE\bat\%configbat%
echo set docbook_custom_path=%%docbook_base_path%%\CDBE\custom>> %padir%\CDBE\bat\%configbat%
echo set docbook_custom_css_path=%%docbook_custom_path%%\css>> %padir%\CDBE\bat\%configbat%
echo set docbook_custom_xsl_path=%%docbook_custom_path%%\xsl>> %padir%\CDBE\bat\%configbat%
echo set docbook_document_output=%%docbook_base_path%%\output>> %padir%\CDBE\bat\%configbat%
echo set docbook_java_parameters=-Xms100m -Xmx200m>> %padir%\CDBE\bat\%configbat%
copy %windir%\fonts\simsun.ttc %padir%\CDBE\fonts\
copy %windir%\fonts\simhei.ttf %padir%\CDBE\fonts\
copy %windir%\fonts\simfang.ttf %padir%\CDBE\fonts\

