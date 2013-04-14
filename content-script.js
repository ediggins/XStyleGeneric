function loadXMLtext(url)
{
  xhttp = new XMLHttpRequest();
  xhttp.open("GET", url, false);
  xhttp.send();
  if(xhttp.responseXML == undefined) throw "XHR failed for " + url;
  return xhttp.responseXML;
}

function transformxml()
{
  var xml = loadXMLtext(document.location.href);
  var xsl = loadXMLtext(chrome.extension.getURL("style.xslt"));

  var xsltPrs = new XSLTProcessor();
  xsltPrs.importStylesheet(xsl);

  var result = xsltPrs.transformToFragment(xml, document);

  var xmlsrv = new XMLSerializer();
  var plaintext = xmlsrv.serializeToString(result);

  document.documentElement.innerHTML = plaintext;
}

chrome.extension.onMessage.addListener(
  function(request, sender, sendResponse) {
    	if (request.action == "doXmlTransform"){
    		transformxml();
	}
  });
