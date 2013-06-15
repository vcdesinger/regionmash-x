<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- импорт общих шаблонов -->
<xsl:import href="main.ru.xsl"/>

<xsl:template name="CONTENT">
	<h2>Реквизиты ОАО Технофинанстрейд</h2>
	<table id="rekvisit" class="table table-condensed">
   		<tbody>
			<tr>
				<th>Юридический адрес</th>
				<td>123557, г.Москва, Б.Тишинский переулок, д.26, корп. 13-14</td>
			</tr>
			<tr>
				<th>Почтовый адрес</th>
				<td>121248, г.Москва, Кутузовский проспект, д 12</td>
			</tr>
			<tr>
				<th>ИНН</th>
				<td>7703663766</td>
			</tr>
			<tr>
				<th>КПП</th>
				<td>770301001</td>
			</tr>
			<tr>
				<th>ОКПО</th>
				<td>56606269</td>
			</tr>
			<tr>
				<th>р/с</th>
				<td>40702810200000000697 в банке «Кремлевский» ООО в г. Москва</td>
			</tr>
			<tr>
				<th>БИК</th>
				<td>044579196</td>
			</tr>
			<tr>
				<th>к/с</th>
				<td>30101810600000000196</td>
			</tr>
		</tbody>
    </table>
</xsl:template>

<xsl:template name="ASIDE_CONTENT">
	<xsl:variable name="parts" select="$PAGE/page"/>
	<xsl:if test="$parts">
		<ul class="nav nav-list">
			<li class="nav-header">смотрите также</li>
			<xsl:apply-templates select="$parts" mode="partition"/>
		</ul>	
	</xsl:if>
</xsl:template>

</xsl:stylesheet>