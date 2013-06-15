<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
<xsl:output method="html" indent="no"/>
<!-- идентификатор сервиса -->
<xsl:param name="SID" select="'default'"/>
<!-- текущий язык сервиса -->
<xsl:param name="LANG" select="'ru'"/>
<!-- uri запрошенной страницы (без запросной части) -->
<xsl:param name="PAGEURI" select="'/'"/>
<!-- элемент базовой страницы -->
<xsl:variable name="PAGE" select="//page[@current]"/>
<!-- текущая секция -->
<xsl:variable name="SECTION" select="$PAGE/ancestor-or-self::page[position() = last() - 1]"/>
<!-- элемент с контентом страницы -->
<xsl:variable name="C" select="/page/content[position() = 1]"/>

<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
	<html lang="{$LANG}">
		<head>
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<xsl:call-template name="HEAD_TITLE"/>
			<xsl:comment><![CDATA[[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]]]></xsl:comment>
			<script src="/-/jsm/kanri.js" type="text/javascript"></script>
			<link rel="shortcut icon" href="/{$SID}/x/i/favicon.ico"/>
			<link rel="apple-touch-icon" href="/{$SID}/x/i/apple-touch-icon.png"/>
			<link rel="stylesheet" href="/{$SID}/x/main.css"/>
			<!-- TODO понять нахрена подерживать IE 7/8 ??? -->
			<xsl:call-template name="HEAD_ADD"/>
		</head>
		<body>
			<div class="container">
				<header class="row" style="margin-bottom:20px">
					<div class="span3">
						<xsl:call-template name="LOGO"/>
					</div>
					<div class="span3 offset6" style="text-align:right">
						<small>тел. </small> +7 (495) 766-03-82<br/>
						<a href="mailto:7907027@gmail.com" style="font-size:12px">
							<i class="icon-envelope"></i> 7907027@gmail.com
						</a>
					</div>
				</header>
				<xsl:call-template name="SECTIONS"/>
				<div class="row-fluid">
					<xsl:call-template name="ASIDE"/>
					<xsl:call-template name="CONTENT_"/>
				</div>
				<hr/>
				<footer>
					<p>
						&#169; ООО Регионмаш, 2006-2013<br/>
						<a href="http://sitefactor.ru/" title="создание и аутсорсинг сайтов">
							аутсорсинг сайта: sitefactor.ru
						</a>
					</p>
				</footer>
		    </div>
		</body>
	</html>
</xsl:template>
<!-- блок логотипа, для главстраницы ссылка отключается ! -->
<xsl:template name="LOGO">
	<a href="/"><img src="/{$SID}/x/i/logo.png" style="margin-top:5px"/></a>
</xsl:template>
<!-- навигации -->
<xsl:template name="SECTIONS">
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav">
				<xsl:apply-templates select="/page" mode="section">
					<xsl:with-param name="uri" select="'/'"/>
				</xsl:apply-templates>
				<xsl:apply-templates select="/page/page[not(@hide)]" mode="section"/>
			</ul>
		</div>
	</div>
	<xsl:call-template name="BREADCRUMBS"/>
</xsl:template>
<xsl:template match="//page" mode="section">
	<xsl:param name="uri" select="@uri"/>
	<li>
		<xsl:if test="@id = $SECTION/@id or @current">
			<xsl:attribute name="class">active</xsl:attribute>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="@id = $PAGE/@id">
				<a href="#"><xsl:value-of select="@title"/></a>
			</xsl:when>
			<xsl:otherwise>
				<a href="{$uri}"><xsl:value-of select="@title"/></a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
</xsl:template>
<!-- хлебные крошки, могут отключаться нафиг -->
<xsl:template name="BREADCRUMBS">
	<ul class="breadcrumb">
		<li>
			<a href="/"><i class="icon-home"></i></a>
			<span class="divider">/</span>
		</li>
		<xsl:apply-templates select="$PAGE/ancestor::page[position() != last()]" mode="breadcrumb"/>
		<li class="active"><xsl:value-of select="$PAGE/@title"/></li>
	</ul>
</xsl:template>
<xsl:template match="//page" mode="breadcrumb">
	<li>
		<a href="{@uri}"><xsl:value-of select="@title"/></a>
		<span class="divider">/</span>
	</li>
</xsl:template>
<!-- левая колонка (навигация раздела и доп. информация), умеет отключатся нафиг -->
<xsl:template name="ASIDE">
	<div class="well span3" style="padding: 8px 0;">
		<xsl:call-template name="ASIDE_CONTENT"/>
	</div>
</xsl:template>
<xsl:template name="ASIDE_CONTENT">
	<xsl:variable name="parts" select="$PAGE/page"/>
	<xsl:if test="$parts">
		<ul class="nav nav-list">
			<!-- <li class="nav-header"><xsl:value-of select="$pt"/></li> -->
			<xsl:apply-templates select="$parts" mode="partition"/>
		</ul>	
	</xsl:if>
</xsl:template>
<xsl:template match="//page" mode="partition">
	<li><a href="{@uri}"><xsl:value-of select="@title"/></a></li>
</xsl:template>
<!-- основной контент страницы -->
<xsl:template name="CONTENT_">
	<div class="span9">
		<xsl:call-template name="CONTENT"/>
	</div>
</xsl:template>
<xsl:template name="CONTENT">
	<h1><xsl:value-of select="$PAGE/@title"/></h1>
	<div><xsl:value-of select="$C/html/text()" disable-output-escaping="yes"/></div>	
</xsl:template>
<!-- тайтл страницы по умолчанию -->
<xsl:template name="HEAD_TITLE">
	<title><xsl:value-of select="//page[@current]/@title"/></title>
	<meta name="description" content="???"/>
</xsl:template>
<!-- довеска скриптов и стилей в хедер -->
<xsl:template name="HEAD_ADD"></xsl:template>
</xsl:stylesheet>