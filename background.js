function notifyXmlTransformer(info, tab){
	chrome.tabs.sendMessage(tab.id, {action: "doXmlTransform"});
}

chrome.contextMenus.create(
	{
		title: chrome.i18n.getMessage("contextMenuOption"), 
		contexts:["page"], 
		onclick: notifyXmlTransformer, 
		documentUrlPatterns:[
			"http://*/*.xml", 
			"https://*/*.xml", 
			"file:///*.xml"
			]
	}
);
