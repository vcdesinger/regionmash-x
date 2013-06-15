<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="catalog.ru.xsl"/>
<xsl:template name="CONTENT">
	<xsl:apply-templates select="$C/card"/>
</xsl:template>
<!-- карточка при ошибке 404 -->
<xsl:template match="/page/content/card[@err404]">
	<h1 style="color:#AB0A11">Извините, такой продукт отсутствует или не поставляется.</h1>
	<p>Попробуйте поискать похожие по категории, производителю или области применения</p>
	<!-- тут выводим подходящие категории, вендора, аналоги приборов -->
</xsl:template>
<!-- карточка продукта -->
<xsl:template match="/page/content/card">
	<h1><xsl:value-of select="@title"/></h1>
	<p><xsl:value-of select="@descr"/></p>
	<xsl:call-template name="callAction"/>
	<div><xsl:value-of select="@content" disable-output-escaping="yes"/></div>
</xsl:template>
<!-- левый блок -->
<xsl:template name="ASIDE">
	<div class="span4" style="padding: 8px 0;">
		<xsl:apply-templates select="$C/card" mode="leftside"/>
	</div>
</xsl:template>
<xsl:template match="/page/content/card" mode="leftside">
	<a href="/tft/products{@photo}" rel="prettyPhoto" title="">
		<img src="/tft/products{@photo_t}"/>
	</a>
	<br/><br/>
	Доп. фотографии<br/><br/>
	Прикрепленные файлы<br/>
</xsl:template>
<!-- callAction - запрос коммерческого предложения -->
<xsl:template name="callAction">
	<a href="#callAction" role="button" class="btn btn-primary" data-toggle="modal">Запросить коммерческое предложение</a><br/><br/>
	<div id="callAction" class="modal hide fade">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>Запрос коммерческого предложения</h3>
			<xsl:value-of select="$C/card/@title"/>
		</div>
		<div class="modal-body">
			<label>Как к Вам обращаться ?</label>
			<input type="text" placeholder="Ваше имя и фамилия"/>
			<label>Ваш e-mail или телефон:</label>
			<input type="text" placeholder=""/>
			<label>Ваша организация:</label>
			<input type="text" placeholder=""/>
			<label>Ваша должность:</label>
			<input type="text" placeholder=""/>
			<label>Примечания:</label>
			<textarea rows="3"></textarea>
		</div>
		<div class="modal-footer">
	    	<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">Отмена</a>
	    	<a href="#" class="btn btn-primary" aria-hidden="true">Отправить запрос</a>
	  	</div>
	</div>
</xsl:template>
<!-- хлебные крошки -->
<xsl:template name="BREADCRUMBS">
	<ul class="breadcrumb">
		<li>
			<a href="/"><i class="icon-home"></i></a>
			<span class="divider">/</span>
		</li>
		<xsl:apply-templates select="$PAGE/ancestor-or-self::page[position() != last()]" mode="breadcrumb"/>
		<xsl:if test="not($C/card[@err404])">
			<li>
				<xsl:variable name="pid" select="$C/card/@pid"/>
				<a href="/catalog/types/{$pid}">
					<xsl:value-of select="$C/tree//item[@id = $pid]/@title"/>
				</a>
				<span class="divider">/</span>
			</li>
			<li>
				<a href="/catalog/vendors/{$C/card/@vid}">
					<xsl:value-of select="$C/card/@vtitle"/>
				</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				<xsl:value-of select="$C/card/@title"/>
			</li>
		</xsl:if>
	</ul>
</xsl:template>
<!-- скрипты -->
<xsl:template name="HEAD_ADD">
	<!-- <link href="/-/jsm/darkbox/darkbox.css" rel="stylesheet"/>
		<script src="/-/jsm/darkbox/darkbox.js" type="text/javascript"></script> -->
	<script src="/-/jsm/prettyPhoto/prettyPhoto.js" type="text/javascript"></script>
	<link rel="stylesheet" href="/-/jsm/prettyPhoto/prettyPhoto.css" type="text/css"/>
	<script type="text/javascript">
		$(document).ready(function(){
			// активирование галерей
			$("a[rel^='prettyPhoto']").prettyPhoto({
				overlay_gallery:false,
				slideshow: false,
				social_tools:null,
			});
		});
	</script>
</xsl:template>
</xsl:stylesheet>