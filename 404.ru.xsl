<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- импорт общих шаблонов -->
<xsl:import href="main.ru.xsl"/>

<!-- значения параметров специфичных для этой страницы -->

<!-- основное содержание страницы -->
<xsl:template name="CONTENT">
	<h1 style="color:#E23111; font-size:32px">404 Page Not Found</h1>
	<xsl:value-of select="//content/message" disable-output-escaping="yes"/>
</xsl:template>

<!-- тайтл страницы переопределен -->
<xsl:template name="HEADER_TITLE">Страница не найдена</xsl:template>

<xsl:template name="BREADCRUMBS"></xsl:template>

</xsl:stylesheet>