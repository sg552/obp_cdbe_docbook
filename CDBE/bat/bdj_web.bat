@echo off

:: -------------------------------------
rem %1: website name
rem %2: output directory (optional)
:: -------------------------------------

rem load configuration
call config.bat

rem set output directory
if %2()==() ( 
  set docbook_outputdir=%docbook_website_base_path%\%1
) else (
  set docbook_outputdir=%2
)

rem create document subdirectory if not present
if not exist %docbook_outputdir% md %docbook_outputdir%

rem  using document XSL stylesheet
if exist %docbook_website_base_path%\%1\stylesheets\autolayout.xsl (
  set docbook_use_autolayout_stylesheet=%docbook_website_base_path%\%1\stylesheets\autolayout.xsl
) else (
  set docbook_use_autolayout_stylesheet=%docbook_website_path%\xsl\autolayout.xsl
)

if exist %docbook_website_base_path%\%1\stylesheets\chunk-tabular.xsl (
  set docbook_use_tabular_stylesheet=%docbook_website_base_path%\%1\stylesheets\chunk-tabular.xsl
) else (
  set docbook_use_tabular_stylesheet=%docbook_website_path%\xsl\chunk-tabular.xsl
)

rem set classpath
set classpath=%docbook_libjar_path%\saxon.jar;%docbook_libjar_path%\saxon653.jar;%docbook_libjar_path%\xercesImpl-2.7.1.jar;%docbook_libjar_path%\resolver.jar;%docbook_libjar_path%

rem using xerces to resolve xinclude
set using_xerces=-Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl -Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration  

rem using catalog
set using_catalog=-x org.apache.xml.resolver.tools.ResolvingXMLReader -y org.apache.xml.resolver.tools.ResolvingXMLReader -r org.apache.xml.resolver.tools.CatalogResolver 

:: translate

java.exe %docbook_java_parameters% -cp "%classpath%"  %using_xerces% com.icl.saxon.StyleSheet %using_catalog%  -o  %docbook_website_base_path%\%1\autolayout.xml %docbook_website_base_path%\%1\layout.xml %docbook_use_autolayout_stylesheet%

java.exe %docbook_java_parameters% -cp "%classpath%"  %using_xerces% com.icl.saxon.StyleSheet %using_catalog%    %docbook_website_base_path%\%1\autolayout.xml  %docbook_use_tabular_stylesheet% output-root=%docbook_outputdir%

