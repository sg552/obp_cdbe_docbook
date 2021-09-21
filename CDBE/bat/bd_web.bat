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


:: translate

set XML_CATALOG_FILES=%docbook_catalog_ptah%\catalog.xml
%docbook_libxslt_path%\xsltproc.exe  --timing   --xinclude --output %docbook_website_base_path%\%1\autolayout.xml  %docbook_use_autolayout_stylesheet%  %docbook_website_base_path%\%1\layout.xml 

%docbook_libxslt_path%\xsltproc.exe  --timing  --xinclude  --stringparam  output-root  %docbook_outputdir%  %docbook_use_tabular_stylesheet%  %docbook_website_base_path%\%1\autolayout.xml 
