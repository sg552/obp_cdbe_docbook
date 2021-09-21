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
  if not exist %docbook_document_output%\%1\%2 md %docbook_document_output%\%1\%2
  set docbook_outputdir=%docbook_document_output%\%1\%2\plain\
) else (
  set docbook_outputdir=%3
)

rem create document subdirectory if not present
if not exist %docbook_outputdir% md %docbook_outputdir%


rem copy graphics  directory and browser directory
xcopy %docbook_slides_path%\graphics\*.* %docbook_outputdir%\graphics\ /s /e /v /d
xcopy %docbook_slides_path%\browser\*.* %docbook_outputdir%\browser\ /s /e /v /d


rem copy user figures to output dir
xcopy %docbook_books_path%\%1\%2\src\figure\*.*   %docbook_outputdir%\figure\ /s /e /v /d

rem  using document XSL stylesheet
set docbook_use_stylesheet=%docbook_custom_xsl_path%\cdbe_plain_%2.xsl

rem set classpath
set classpath=%docbook_libjar_path%\saxon.jar;%docbook_libjar_path%\saxon653.jar;%docbook_libjar_path%\xercesImpl-2.7.1.jar;%docbook_libjar_path%\resolver.jar;%docbook_libjar_path%

rem using xerces to resolve xinclude
set using_xerces=-Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl -Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration  

rem using catalog
set using_catalog=-x org.apache.xml.resolver.tools.ResolvingXMLReader -y org.apache.xml.resolver.tools.ResolvingXMLReader -r org.apache.xml.resolver.tools.CatalogResolver 

:: translate

java.exe %docbook_java_parameters% -cp "%classpath%"  %using_xerces% com.icl.saxon.StyleSheet %using_catalog%   %docbook_books_path%\%1\%2\src\%1.xml %docbook_use_stylesheet% base.dir=%docbook_outputdir%


