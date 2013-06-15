<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- импорт общих шаблонов -->
<xsl:import href="main.ru.xsl"/>

<!-- значения параметров специфичных для этой страницы -->

<!-- основное содержание страницы -->
<xsl:template name="CONTENT">
	<h1>Представьтесь, пожалуйста ...</h1><br/>
	<script language="javascript" src="/-/login/auth.js"></script>
</xsl:template>

<!-- тайтл страницы переопределен -->
<xsl:template name="HEADER_TITLE">Forbidden</xsl:template>

<xsl:template name="BREADCRUMBS"></xsl:template>

<xsl:template name="HEAD_ADD">
	<link rel="stylesheet" href="/-/login/auth.css"/>
</xsl:template>

</xsl:stylesheet>