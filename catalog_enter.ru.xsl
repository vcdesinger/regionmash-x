<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- каталог - входная страница -->
<xsl:import href="main.ru.xsl"/> 

<xsl:template name="CONTENT">
	<xsl:value-of select="$C/html/base/text()" disable-output-escaping="yes"/>
	<hr/>
	<xsl:apply-templates select="/page/content/tree/item"/>
	<xsl:value-of select="$C/html/more/text()" disable-output-escaping="yes"/>
</xsl:template> 

<!-- плашки верхнего уровня -->
<xsl:template match="/page/content/tree/item">
	<div class="row-fluid citem">
		<div class="media span5">
			<a class="pull-left" href="/catalog/{@id}">
		    	<img src="/{$SID}/categories{@i}" class="img-rounded" style="width:100px; height:100px"/>
		  	</a>
			<div class="media-body">
		    	<h4 class="media-heading"><a href="/catalog/{@id}"><xsl:value-of select="@title"/></a></h4>
				<xsl:variable name="c" select="@id"/>
				<div><xsl:value-of select="/page/content/ctgd[@id = $c]/@descr"/></div>
		  	</div>
		</div>
		<div class="span6 offset1">
			<ul class="items">
				<xsl:apply-templates select="item"/>
			</ul>
		</div>
	</div>
	<hr/>
</xsl:template>
<xsl:template match="/page/content/tree/item/item">
	<li>
		<a href="/catalog/{@id}"><xsl:value-of select="@title"/></a>
		<em><xsl:value-of select="@gost"/></em>
	</li>
</xsl:template>
<!-- сетка контента по всей ширине страницы -->
<xsl:template name="ASIDE"></xsl:template>
<xsl:template name="CONTENT_">
	<div id="content" class="span12">
		<xsl:call-template name="CONTENT"/>
	</div>
</xsl:template>

</xsl:stylesheet>