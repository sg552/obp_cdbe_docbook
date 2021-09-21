<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns="http://www.w3.org/TR/xhtml1/transitional"
>

<!-- <xsl:param name="variablelist.as.blocks" select="1" />-->

<!-- setup paper size -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- setup margin -->
<xsl:param name="page.margin.inner">2.54cm</xsl:param>
<xsl:param name="page.margin.outer">2.54cm</xsl:param>

<!-- patch for larger page number font size 
<xsl:param name="region.after.extent" select="'20pt'"/>-->

<!-- default font for pdf 
<xsl:param name="body.font.family">Times</xsl:param>-->


<xsl:param name="use.extensions" select="1"/>
<xsl:param name="fop.extensions" select="1"/>
<xsl:param name="saxon.character.representation" select="'native'"/>
<xsl:param name="admon.graphics" select="1"/>
<xsl:param name="chunker.output.encoding" select="'utf-8'"/> 


<xsl:param name="toc.section.depth">2</xsl:param>
<xsl:param name="generate.section.toc.level">2</xsl:param>

<xsl:param name="hyphenate">"1"</xsl:param>

<xsl:param name="preface.autolabel">"0"</xsl:param>
<xsl:param name="chunker.output.indent" select="'yes'"/>
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="html.stylesheet.type">text/css</xsl:param>
<xsl:param name="html.stylesheet" select="'css/style.css'"/>
<xsl:param name="table.borders.with.css" select="1"/>
<xsl:param name="tablecolumns.extension" select="1"/>
<xsl:param name="bibliography.numbered" select="1"/>


<xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,table,example,equation
chapter   toc,title
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
</xsl:param>
</xsl:stylesheet>