<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="main.ru.xsl"/>
<xsl:template name="CONTENT_">
    <div class="span12">
    	<p class="lead" style="font-weight:normal; font-size:16px"><xsl:value-of select="$C/html/base/text()" disable-output-escaping="yes"/></p>
    </div>
	<div class="row-fluid">
		<ul class="thumbnails">
			<li class="span4 ribboned">
				<div class="ribbon-wrapper"><div class="ribbon ribbon-green">новинка</div></div>
				<p>Некая новинка с картинкой и описанием</p>
		  	</li>
			<li class="span4 ribboned">
				<div class="ribbon-wrapper"><div class="ribbon ribbon-red">акция</div></div>
				<p>Супер-пупер акция с картинкой, текстом, описанием и датой действия</p>
		  	</li>
			<li class="span4 ribboned">
				<div class="ribbon-wrapper"><div class="ribbon ribbon-green">новинка</div></div>
				<p>Супер-пупер акция с картинкой, текстом, описанием и датой действия</p>
		  	</li>
		</ul>
	</div>
</xsl:template>
<!-- плашка акции -->
<xsl:template match="/page/content/vendor">
</xsl:template>
<!-- лента новостей с RSS -->
<xsl:template match="//news">
	<li class="span3">
		<div class="thumbnail">
			<img src="/{$SID}/lots/{@ico}" alt="{@title}" title="{@title}"/>
			<div class="caption">
				<p><xsl:value-of select="text()" disable-output-escaping="yes"/></p>
				<a href="/lots/{@id}" class="btn btn-primary">узнать подробности</a>
			</div>
		</div>
	</li>
</xsl:template>
<!-- ссылка с логотипа отключена -->
<xsl:template name="LOGO">
	<img src="/{$SID}/x/i/logo.png" style="margin-top:5px"/>
</xsl:template>
<!-- отключение сайдбара -->
<xsl:template name="ASIDE"></xsl:template>
<!-- хлебные крошки отключены -->
<xsl:template name="BREADCRUMBS"></xsl:template>
<!-- тайтл страницы переопределен -->
<xsl:template name="HEAD_TITLE">
	<title>Запчасти для дорожно-строительной техники, щеточные диски, техпластины, ножи, скребки - Регионмаш</title>
</xsl:template>
<!-- скрипты -->
<xsl:template name="HEAD_ADD">
	<script type="text/javascript" src="/-/jsm/jquery.form.js"></script>
</xsl:template>

</xsl:stylesheet>