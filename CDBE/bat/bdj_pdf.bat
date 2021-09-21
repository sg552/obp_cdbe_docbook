@echo off
:: -------------------------------------
rem %1: document name
rem %2: lang <zh-cn|zh-tw|en>
rem %3: output directory (optional)
:: -------------------------------------

rem load configuration
call config.bat

rem set output directory
if %3()==() ( 
  set docbook_outputdir=%docbook_document_output%\%1\%2\pdf\
) else (
  set docbook_outputdir=%3
)

rem set classpath
set classpath=%docbook_libjar_path%\fop.jar;%docbook_libjar_path%\batik.jar;%docbook_libjar_path%\xalan-2.4.1.jar;%docbook_libjar_path%\xercesImpl-2.2.1.jar;%docbook_libjar_path%\xml-apis.jar;%docbook_libjar_path%\avalon-framework-cvs-20020806.jar;%docbook_libjar_path%\jai_core.jar;%docbook_libjar_path%\jai_codec.jar


:translate

java.exe %docbook_java_parameters% -cp "%classpath%" org.apache.fop.apps.Fop -c %docbook_custom_path%\fop_userconfig.xml -fo %docbook_outputdir%\%1.fo -pdf %docbook_outputdir%\%1.pdf

rem Delete figure&css
rmdir /q/s %docbook_outputdir%\figure
rmdir /q/s %docbook_outputdir%\images
rmdir /q/s %docbook_outputdir%\css
