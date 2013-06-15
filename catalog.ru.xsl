<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- импорт общих шаблонов -->
<xsl:import href="main.ru.xsl"/>

<!-- идентификатор текущей категории -->
<xsl:variable name="cid" select="$C/categor/@current"/>
<!-- элемент текущей категории -->
<xsl:variable name="cat" select="$C/tree//item[@current]"/>
<!-- элемент параметров текущей категории -->
<xsl:variable name="ctg" select="$C/categor"/>

<!-- контент-блок -->
<xsl:template name="CONTENT">
	<xsl:choose>
		<!-- категория с товарами -->
		<xsl:when test="$C/product">
			<xsl:if test="$ctg/@img">
				<a rel="darkbox" href="/rti/categories{$ctg/@img}">
					<img id="categor-ico pull-left" class="img-left" src="/{$SID}/categories{$ctg/@imgt}" alt="{$ctg/@imga}"/>
				</a>
			</xsl:if>
			<h1><xsl:value-of select="$ctg/@title"/></h1>
			<p class="categor-descr"><xsl:value-of select="$ctg/@descr"/></p>
		</xsl:when>
		<!-- группирующая категория (цен нет) -->
		<xsl:otherwise>
			<xsl:if test="$ctg/@img">
				<a rel="darkbox" href="/{$SID}/categories{$ctg/@img}">
					<img class="categor-ico pull-left" src="/{$SID}/categories{$ctg/@imgt}" alt="{$ctg/@imga}"/>
				</a>
			</xsl:if>
			<h1><xsl:value-of select="$ctg/@title"/></h1>
			<p class="categor-descr"><xsl:value-of select="$ctg/@descr"/></p>
			<p class="clearfix"><xsl:apply-templates select="$C/categorAddon"/></p>
			<!-- список подкатегорий с описаниями -->
			<hr/>
			<xsl:apply-templates select="$cat/item" mode="subnafigator"/>
			<hr/>
			<!-- сеотекстуха -->
			<div><xsl:value-of select="$ctg/text()" disable-output-escaping="yes"/></div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<!-- нафигатор подкатегорий -->
<xsl:template match="//item" mode="subnafigator">
	<xsl:variable name="id" select="@id"/>
	<xsl:variable name="ctgd" select="$C/ctgd[@id = $id]"/>
	<div class="media">
		<a class="pull-left" href="/catalog/{@id}">
	    	<img src="/{$SID}/categories{$ctgd/@img}"/>
	  	</a>
		<div class="media-body">
	    	<h4 class="media-heading">
				<a href="/catalog/{@id}"><xsl:value-of select="@title"/></a>
			</h4>
			<p><xsl:value-of select="$ctgd/@descr"/></p>
	  	</div>
	</div>
</xsl:template>
<!-- навигация каталога -->
<xsl:template name="ASIDE">
	<div id="partitions" class="span3" style="padding:5px 5px 0 5px;">
		<xsl:apply-templates select="$C/tree/item"/>
	</div>
</xsl:template>
<xsl:template match="/page/content/tree/item">
	<ul class="nav">
		<li class="nav-header"><xsl:value-of select="@title"/></li>
		<xsl:apply-templates select="item"/>
	</ul>
</xsl:template>
<xsl:template match="/page/content/tree/item/item">
	<li>
		<xsl:if test="descendant-or-self::item/@current">
			<xsl:attribute name="class">active</xsl:attribute>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="@current">
				<span><xsl:value-of select="@title"/></span>
			</xsl:when>
			<xsl:otherwise>
				<a href="/catalog/{@id}"><xsl:value-of select="@title"/></a>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="item">
			<ul class="nav"><xsl:apply-templates select="item"/></ul>
		</xsl:if>
	</li>
</xsl:template>
<xsl:template match="/page/content/tree/item/item/item">
	<li>
		<xsl:choose>
			<xsl:when test="@current">
				<span><xsl:value-of select="@title"/></span>
			</xsl:when>
			<xsl:otherwise>
				<a href="/catalog/{@id}"><xsl:value-of select="@title"/></a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
</xsl:template>
<!-- список в категории или вендоре -->
<xsl:template name="PRODUCTS">
	<ul class="thumbnails">
		<xsl:apply-templates select="$C/product"/>
	</ul>
</xsl:template>
<xsl:template match="/page/content/product">
	<li class="span4">
		<div class="thumbnail">
			<a href="/catalog/{@id}" class="thumbnail">
				<img src="/tft/products{@photo}" alt="{@title}" title="Производство {@vtitle}"/>
			</a>
			<h3><xsl:value-of select="@title"/></h3>
			<p><xsl:value-of select="@descr"/></p>
		</div>
	</li>
</xsl:template>
<!-- хлебные крошки -->
<xsl:template name="BREADCRUMBS">
	<ul class="breadcrumb">
		<li>
			<a href="/"><i class="icon-home"></i></a>
			<span class="divider">/</span>
		</li>
		<xsl:apply-templates select="$PAGE/ancestor::page[position() != last()]" mode="breadcrumb"/>
		<li class="active">
			<xsl:value-of select="$PAGE/@title"/>
			<xsl:if test="not($C/enter)">
				<span class="divider">/</span>
				<xsl:choose>
					<xsl:when test="$C/vendors">
						<xsl:value-of select="$C/vendor[@current]/@title"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$C/tree//item[@current]/@title"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if> 
		</li>
	</ul>
</xsl:template>
<!-- скрипты и стили раздела -->
<xsl:template name="HEAD_ADD">
	<script><![CDATA[
		$(document).ready(function(){
		});
	]]>
	</script>
</xsl:template>
</xsl:stylesheet>