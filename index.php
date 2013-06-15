<?php
/* USAGE:

Запрос http://localhost/mysite/x?t=catalog&x=catalog_bigcategory
вызовет рендер шаблона /mysite/x/catalog.ru.xsl 
с использованием xml-файла /mysite/x/xml/catalog_bigcategory.xml

GET-параметр lang выбирает язык (&lang=en заменит шаблон на /mysite/x/catalog.en.xsl)
Дополнительно возможна передача произвольных GET параметров, 
которые передадутся в шаблон как глобальные переменные с префиксом '_' к их именам

*/

/**
* Рендер xslt-шаблонов
* @param string имя xslt-шаблона (без указания суффикса языка и расширения файла)
* @param string имя xml-файла (если отличается от стандартного)
*/
function render($xsltName, $xmlName=null){
	unset($_GET['t'], $_GET['x']);
	$lang = isset($_GET['lang']) ? $_GET['lang']?:'ru' : 'ru';
	unset($_GET['lang']);
	$xslfile = __DIR__.'/'.$xsltName.'.'.$lang.'.xsl';
	if(!file_exists($xslfile)) die("No find template on $xslfile");
	$xsl = new \DOMDocument;
	$xsl->load($xslfile);
	$xslt = new \XSLTProcessor();
	$xslt->registerPHPFunctions();
	$xslt->importStyleSheet($xsl);
	$xslt->setParameter('', 'LANG', $lang);
	// SID - имя каталога, родительского для текущего
	$xslt->setParameter('', 'SID', basename(realpath(__DIR__.'/../')));
	// PAGEURI ?
	$xslt->setParameter('', 'PAGEURI', isset($_GET['uri'])?$_GET['uri']?:'':'');
	unset($_GET['uri']);
	// все параметры запроса передаются в шаблон !
	foreach($_GET as $k=>$v) if($v) $xslt->setParameter('', '_'.$k, (string)$v);
	// грузим требуемый xml
	if($xmlName === null) $xmlfile = $xslfile.'.xml';
	else $xmlfile = __DIR__.'/xml/'.$xmlName.'.xml';
	if(!file_exists($xmlfile)) die("No find xml data on $xmlfile");
	$xml = new \DOMDocument;
	$xml->load($xslfile.'.xml');
	header('Content-type: text/html; charset=utf8');
	print $xslt->transformToXML($xml);
	exit;
}

if(isset($_GET['t'])) render($_GET['t']?:'main', isset($_GET['x'])?$_GET['x']:null);