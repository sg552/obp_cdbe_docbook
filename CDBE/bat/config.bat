@echo off 
set docbook_base_path=D:\obp
set docbook_website_base_path=%docbook_base_path%\website
set docbook_books_path=%docbook_base_path%\books
set docbook_cdbe_path=%docbook_base_path%\CDBE
set docbook_libjar_path=%docbook_cdbe_path%\libjar
set docbook_libxslt_path=%docbook_cdbe_path%\libxslt
set docbook_dtd_path=%docbook_cdbe_path%\dtd\docbook-xml-4.4
set docbook_catalog_ptah=%docbook_cdbe_path%\dtd
set docbook_xsl_path=%docbook_cdbe_path%\xsl\docbook-xsl-1.68.1
set docbook_slides_path=%docbook_cdbe_path%\dtd\docbook-slides-3.4.0
set docbook_website_path=%docbook_cdbe_path%\dtd\docbook-website-2.6.0
set docbook_custom_path=%docbook_base_path%\CDBE\custom
set docbook_custom_css_path=%docbook_custom_path%\css
set docbook_custom_xsl_path=%docbook_custom_path%\xsl
set docbook_document_output=%docbook_base_path%\output
set docbook_java_parameters=-Xms100m -Xmx200m
