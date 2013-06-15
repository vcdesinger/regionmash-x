<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- импорт общих шаблонов -->
<xsl:import href="main.ru.xsl"/>

<xsl:template name="CONTENT">
	<!-- <h1 class="title-divider">Наши координаты</h1> -->
	<div class="span5">
			<p>
				<b>ОФИС:</b> Москва, Новопоселковая улица, дом 6/7<br/>
				местный телефон 54-50, 3 этаж
			</p>
			<a href="https://maps.google.co.uk/maps?ll=55.748939,37.556387&amp;spn=0.004945,0.013937&amp;t=m&amp;z=17">
				<iframe width="424" height="330" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.uk/maps/ms?msa=0&amp;msid=215227653543234689960.0004d4a6d0b24fa32f858&amp;ie=UTF8&amp;t=m&amp;ll=55.748661,37.556934&amp;spn=0.033815,0.072956&amp;z=13&amp;output=embed"></iframe><br /><small><a href="https://maps.google.co.uk/maps/ms?msa=0&amp;msid=215227653543234689960.0004d4a6d0b24fa32f858&amp;ie=UTF8&amp;t=m&amp;ll=55.748661,37.556934&amp;spn=0.033815,0.072956&amp;z=13&amp;source=embed" style="color:#0000FF;text-align:left">Посмотреть увеличенную карту</a></small></a>
       	</div>
 	<div class="span5 offset1">
			<p>
				<b>СКЛАД:</b> Москва, Походный проезд, дом 6<br/>
				<span style="color:red">документы оформляются в офисе !</span>
			</p>
         	<a href="https://maps.google.co.uk/maps?ll=55.748939,37.556387&amp;spn=0.004945,0.013937&amp;t=m&amp;z=17">
					<iframe width="424" height="330" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.uk/maps/ms?msa=0&amp;msid=215227653543234689960.0004d4a6d0b24fa32f858&amp;ie=UTF8&amp;t=m&amp;ll=55.748661,37.556934&amp;spn=0.033815,0.072956&amp;z=13&amp;output=embed"></iframe><br /><small><a href="https://maps.google.co.uk/maps/ms?msa=0&amp;msid=215227653543234689960.0004d4a6d0b24fa32f858&amp;ie=UTF8&amp;t=m&amp;ll=55.748661,37.556934&amp;spn=0.033815,0.072956&amp;z=13&amp;source=embed" style="color:#0000FF;text-align:left">Посмотреть увеличенную карту</a></small>	
			</a>
       	</div>
</xsl:template>
<!-- левый блок -->
<xsl:template name="ASIDE">
	<div class="span3">
		<p><abbr title="Phone"><i class="icon-phone"></i></abbr> +7 (495) 766-03-82</p>
		<p><abbr title="Phone"><i class="icon-phone"></i></abbr> +7 (495) 790-70-27</p>
		<p><abbr title="Phone"><i class="icon-phone"></i></abbr> +7 (495) 790-70-20 факс</p>
	 	<p><abbr title="Email"><i class="icon-envelope"></i></abbr> 7907027@gmail.com</p>
		<br/>
		<xsl:call-template name="contactForm"/>
		<br/><br/>
		<xsl:value-of select="$C/html/more/text()" disable-output-escaping="yes"/>
	</div>
</xsl:template>
<xsl:template name="contactForm">
	<a href="#callAction" role="button" class="btn btn-primary" data-toggle="modal">Задайте нам вопрос ...</a>
	<div id="callAction" class="modal hide fade">
	 	<form id="contact-form" action="/ajax/sitefactor/Action/Contact/Simple">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3>Вопрос к ООО Регионмаш</h3>
				<xsl:value-of select="$C/card/@title"/>
			</div>
			<div class="modal-body">
				<div class="fields">
					<input type="hidden" name="contact" value="1"/>
		       		<input type="text" name="fio" class="span11" placeholder="Ваше имя"/>
		       		<input type="text" name="emailtel" class="span11" placeholder="e-mail или телефон"/>
		       		<textarea rows="12" name="comments" class="span11" placeholder="Сообщение"></textarea>
				</div>
				<div class="hide alert alert-block alert-success">
					<h4 class="alert-heading">Ваше сообщение отправлено</h4>
				  	Мы постараемся связаться с Вами в ближайшее время. Спасибо !
				</div>
				<div class="hide alert alert-block alert-error">
					<h4 class="alert-heading">Ошибка при отправке сообщения</h4>
				  	Приносим извинения, но просим связаться с нами другим способом ...
				</div>
			</div>
			<div class="modal-footer">
		    	<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">Отмена</a>
				<button type="submit" class="btn btn-primary" data-loading-text="отправляем ...">
					Отправить сообщение !
				</button>
		  	</div>
	 	</form>
	</div>
	<script type="text/javascript">
		new ajaxModalForm('contact-form');
	</script>
</xsl:template>
<!-- скрипты -->
<xsl:template name="HEAD_ADD">
	<script type="text/javascript" src="/-/jsm/jquery.form.js"></script>
</xsl:template>

</xsl:stylesheet>