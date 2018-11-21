(function($, window){
	
	var swfobject = function() {
	
		var UNDEF = "undefined",
			OBJECT = "object",
			SHOCKWAVE_FLASH = "Shockwave Flash",
			SHOCKWAVE_FLASH_AX = "ShockwaveFlash.ShockwaveFlash",
			FLASH_MIME_TYPE = "application/x-shockwave-flash",
			EXPRESS_INSTALL_ID = "SWFObjectExprInst",
			ON_READY_STATE_CHANGE = "onreadystatechange",
			
			win = window,
			doc = document,
			nav = navigator,
			
			plugin = false,
			domLoadFnArr = [main],
			regObjArr = [],
			objIdArr = [],
			listenersArr = [],
			storedAltContent,
			storedAltContentId,
			storedCallbackFn,
			storedCallbackObj,
			isDomLoaded = false,
			isExpressInstallActive = false,
			dynamicStylesheet,
			dynamicStylesheetMedia,
			autoHideShow = true,
		
		/* Centralized function for browser feature detection
			- User agent string detection is only used when no good alternative is possible
			- Is executed directly for optimal performance
		*/	
		ua = function() {
			var w3cdom = typeof doc.getElementById != UNDEF && typeof doc.getElementsByTagName != UNDEF && typeof doc.createElement != UNDEF,
				u = nav.userAgent.toLowerCase(),
				p = nav.platform.toLowerCase(),
				windows = p ? /win/.test(p) : /win/.test(u),
				mac = p ? /mac/.test(p) : /mac/.test(u),
				webkit = /webkit/.test(u) ? parseFloat(u.replace(/^.*webkit\/(\d+(\.\d+)?).*$/, "$1")) : false, // returns either the webkit version or false if not webkit
				ie = !+"\v1", // feature detection based on Andrea Giammarchi's solution: http://webreflection.blogspot.com/2009/01/32-bytes-to-know-if-your-browser-is-ie.html
				playerVersion = [0,0,0],
				d = null;
			if (typeof nav.plugins != UNDEF && typeof nav.plugins[SHOCKWAVE_FLASH] == OBJECT) {
				d = nav.plugins[SHOCKWAVE_FLASH].description;
				if (d && !(typeof nav.mimeTypes != UNDEF && nav.mimeTypes[FLASH_MIME_TYPE] && !nav.mimeTypes[FLASH_MIME_TYPE].enabledPlugin)) { // navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin indicates whether plug-ins are enabled or disabled in Safari 3+
					plugin = true;
					ie = false; // cascaded feature detection for Internet Explorer
					d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
					playerVersion[0] = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
					playerVersion[1] = parseInt(d.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
					playerVersion[2] = /[a-zA-Z]/.test(d) ? parseInt(d.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0;
				}
			}
			else if (typeof win.ActiveXObject != UNDEF) {
				try {
					var a = new ActiveXObject(SHOCKWAVE_FLASH_AX);
					if (a) { // a will return null when ActiveX is disabled
						d = a.GetVariable("$version");
						if (d) {
							ie = true; // cascaded feature detection for Internet Explorer
							d = d.split(" ")[1].split(",");
							playerVersion = [parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10)];
						}
					}
				}
				catch(e) {}
			}
			return { w3:w3cdom, pv:playerVersion, wk:webkit, ie:ie, win:windows, mac:mac };
		}(),
		
		/* Cross-browser onDomLoad
			- Will fire an event as soon as the DOM of a web page is loaded
			- Internet Explorer workaround based on Diego Perini's solution: http://javascript.nwbox.com/IEContentLoaded/
			- Regular onload serves as fallback
		*/ 
		onDomLoad = function() {
			if (!ua.w3) { return; }
			if ((typeof doc.readyState != UNDEF && doc.readyState == "complete") || (typeof doc.readyState == UNDEF && (doc.getElementsByTagName("body")[0] || doc.body))) { // function is fired after onload, e.g. when script is inserted dynamically 
				callDomLoadFunctions();
			}
			if (!isDomLoaded) {
				if (typeof doc.addEventListener != UNDEF) {
					doc.addEventListener("DOMContentLoaded", callDomLoadFunctions, false);
				}		
				if (ua.ie && ua.win) {
					doc.attachEvent(ON_READY_STATE_CHANGE, function() {
						if (doc.readyState == "complete") {
							doc.detachEvent(ON_READY_STATE_CHANGE, arguments.callee);
							callDomLoadFunctions();
						}
					});
					if (win == top) { // if not inside an iframe
						(function(){
							if (isDomLoaded) { return; }
							try {
								doc.documentElement.doScroll("left");
							}
							catch(e) {
								setTimeout(arguments.callee, 0);
								return;
							}
							callDomLoadFunctions();
						})();
					}
				}
				if (ua.wk) {
					(function(){
						if (isDomLoaded) { return; }
						if (!/loaded|complete/.test(doc.readyState)) {
							setTimeout(arguments.callee, 0);
							return;
						}
						callDomLoadFunctions();
					})();
				}
				addLoadEvent(callDomLoadFunctions);
			}
		}();
		
		function callDomLoadFunctions() {
			if (isDomLoaded) { return; }
			try { // test if we can really add/remove elements to/from the DOM; we don't want to fire it too early
				var t = doc.getElementsByTagName("body")[0].appendChild(createElement("span"));
				t.parentNode.removeChild(t);
			}
			catch (e) { return; }
			isDomLoaded = true;
			var dl = domLoadFnArr.length;
			for (var i = 0; i < dl; i++) {
				domLoadFnArr[i]();
			}
		}
		
		function addDomLoadEvent(fn) {
			if (isDomLoaded) {
				fn();
			}
			else { 
				domLoadFnArr[domLoadFnArr.length] = fn; // Array.push() is only available in IE5.5+
			}
		}
		
		/* Cross-browser onload
			- Based on James Edwards' solution: http://brothercake.com/site/resources/scripts/onload/
			- Will fire an event as soon as a web page including all of its assets are loaded 
		 */
		function addLoadEvent(fn) {
			if (typeof win.addEventListener != UNDEF) {
				win.addEventListener("load", fn, false);
			}
			else if (typeof doc.addEventListener != UNDEF) {
				doc.addEventListener("load", fn, false);
			}
			else if (typeof win.attachEvent != UNDEF) {
				addListener(win, "onload", fn);
			}
			else if (typeof win.onload == "function") {
				var fnOld = win.onload;
				win.onload = function() {
					fnOld();
					fn();
				};
			}
			else {
				win.onload = fn;
			}
		}
		
		/* Main function
			- Will preferably execute onDomLoad, otherwise onload (as a fallback)
		*/
		function main() { 
			if (plugin) {
				testPlayerVersion();
			}
			else {
				matchVersions();
			}
		}
		
		/* Detect the Flash Player version for non-Internet Explorer browsers
			- Detecting the plug-in version via the object element is more precise than using the plugins collection item's description:
			  a. Both release and build numbers can be detected
			  b. Avoid wrong descriptions by corrupt installers provided by Adobe
			  c. Avoid wrong descriptions by multiple Flash Player entries in the plugin Array, caused by incorrect browser imports
			- Disadvantage of this method is that it depends on the availability of the DOM, while the plugins collection is immediately available
		*/
		function testPlayerVersion() {
			var b = doc.getElementsByTagName("body")[0];
			var o = createElement(OBJECT);
			o.setAttribute("type", FLASH_MIME_TYPE);
			var t = b.appendChild(o);
			if (t) {
				var counter = 0;
				(function(){
					if (typeof t.GetVariable != UNDEF) {
						var d = t.GetVariable("$version");
						if (d) {
							d = d.split(" ")[1].split(",");
							ua.pv = [parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10)];
						}
					}
					else if (counter < 10) {
						counter++;
						setTimeout(arguments.callee, 10);
						return;
					}
					b.removeChild(o);
					t = null;
					matchVersions();
				})();
			}
			else {
				matchVersions();
			}
		}
		
		/* Perform Flash Player and SWF version matching; static publishing only
		*/
		function matchVersions() {
			var rl = regObjArr.length;
			if (rl > 0) {
				for (var i = 0; i < rl; i++) { // for each registered object element
					var id = regObjArr[i].id;
					var cb = regObjArr[i].callbackFn;
					var cbObj = {success:false, id:id};
					if (ua.pv[0] > 0) {
						var obj = getElementById(id);
						if (obj) {
							if (hasPlayerVersion(regObjArr[i].swfVersion) && !(ua.wk && ua.wk < 312)) { // Flash Player version >= published SWF version: Houston, we have a match!
								setVisibility(id, true);
								if (cb) {
									cbObj.success = true;
									cbObj.ref = getObjectById(id);
									cb(cbObj);
								}
							}
							else if (regObjArr[i].expressInstall && canExpressInstall()) { // show the Adobe Express Install dialog if set by the web page author and if supported
								var att = {};
								att.data = regObjArr[i].expressInstall;
								att.width = obj.getAttribute("width") || "0";
								att.height = obj.getAttribute("height") || "0";
								if (obj.getAttribute("class")) { att.styleclass = obj.getAttribute("class"); }
								if (obj.getAttribute("align")) { att.align = obj.getAttribute("align"); }
								// parse HTML object param element's name-value pairs
								var par = {};
								var p = obj.getElementsByTagName("param");
								var pl = p.length;
								for (var j = 0; j < pl; j++) {
									if (p[j].getAttribute("name").toLowerCase() != "movie") {
										par[p[j].getAttribute("name")] = p[j].getAttribute("value");
									}
								}
								showExpressInstall(att, par, id, cb);
							}
							else { // Flash Player and SWF version mismatch or an older Webkit engine that ignores the HTML object element's nested param elements: display alternative content instead of SWF
								displayAltContent(obj);
								if (cb) { cb(cbObj); }
							}
						}
					}
					else {	// if no Flash Player is installed or the fp version cannot be detected we let the HTML object element do its job (either show a SWF or alternative content)
						setVisibility(id, true);
						if (cb) {
							var o = getObjectById(id); // test whether there is an HTML object element or not
							if (o && typeof o.SetVariable != UNDEF) { 
								cbObj.success = true;
								cbObj.ref = o;
							}
							cb(cbObj);
						}
					}
				}
			}
		}
		
		function getObjectById(objectIdStr) {
			var r = null;
			var o = getElementById(objectIdStr);
			if (o && o.nodeName == "OBJECT") {
				if (typeof o.SetVariable != UNDEF) {
					r = o;
				}
				else {
					var n = o.getElementsByTagName(OBJECT)[0];
					if (n) {
						r = n;
					}
				}
			}
			return r;
		}
		
		/* Requirements for Adobe Express Install
			- only one instance can be active at a time
			- fp 6.0.65 or higher
			- Win/Mac OS only
			- no Webkit engines older than version 312
		*/
		function canExpressInstall() {
			return !isExpressInstallActive && hasPlayerVersion("6.0.65") && (ua.win || ua.mac) && !(ua.wk && ua.wk < 312);
		}
		
		/* Show the Adobe Express Install dialog
			- Reference: http://www.adobe.com/cfusion/knowledgebase/index.cfm?id=6a253b75
		*/
		function showExpressInstall(att, par, replaceElemIdStr, callbackFn) {
			isExpressInstallActive = true;
			storedCallbackFn = callbackFn || null;
			storedCallbackObj = {success:false, id:replaceElemIdStr};
			var obj = getElementById(replaceElemIdStr);
			if (obj) {
				if (obj.nodeName == "OBJECT") { // static publishing
					storedAltContent = abstractAltContent(obj);
					storedAltContentId = null;
				}
				else { // dynamic publishing
					storedAltContent = obj;
					storedAltContentId = replaceElemIdStr;
				}
				att.id = EXPRESS_INSTALL_ID;
				if (typeof att.width == UNDEF || (!/%$/.test(att.width) && parseInt(att.width, 10) < 310)) { att.width = "310"; }
				if (typeof att.height == UNDEF || (!/%$/.test(att.height) && parseInt(att.height, 10) < 137)) { att.height = "137"; }
				doc.title = doc.title.slice(0, 47) + " - Flash Player Installation";
				var pt = ua.ie && ua.win ? "ActiveX" : "PlugIn",
					fv = "MMredirectURL=" + encodeURI(window.location).toString().replace(/&/g,"%26") + "&MMplayerType=" + pt + "&MMdoctitle=" + doc.title;
				if (typeof par.flashvars != UNDEF) {
					par.flashvars += "&" + fv;
				}
				else {
					par.flashvars = fv;
				}
				// IE only: when a SWF is loading (AND: not available in cache) wait for the readyState of the object element to become 4 before removing it,
				// because you cannot properly cancel a loading SWF file without breaking browser load references, also obj.onreadystatechange doesn't work
				if (ua.ie && ua.win && obj.readyState != 4) {
					var newObj = createElement("div");
					replaceElemIdStr += "SWFObjectNew";
					newObj.setAttribute("id", replaceElemIdStr);
					obj.parentNode.insertBefore(newObj, obj); // insert placeholder div that will be replaced by the object element that loads expressinstall.swf
					obj.style.display = "none";
					(function(){
						if (obj.readyState == 4) {
							obj.parentNode.removeChild(obj);
						}
						else {
							setTimeout(arguments.callee, 10);
						}
					})();
				}
				createSWF(att, par, replaceElemIdStr);
			}
		}
		
		/* Functions to abstract and display alternative content
		*/
		function displayAltContent(obj) {
			if (ua.ie && ua.win && obj.readyState != 4) {
				// IE only: when a SWF is loading (AND: not available in cache) wait for the readyState of the object element to become 4 before removing it,
				// because you cannot properly cancel a loading SWF file without breaking browser load references, also obj.onreadystatechange doesn't work
				var el = createElement("div");
				obj.parentNode.insertBefore(el, obj); // insert placeholder div that will be replaced by the alternative content
				el.parentNode.replaceChild(abstractAltContent(obj), el);
				obj.style.display = "none";
				(function(){
					if (obj.readyState == 4) {
						obj.parentNode.removeChild(obj);
					}
					else {
						setTimeout(arguments.callee, 10);
					}
				})();
			}
			else {
				obj.parentNode.replaceChild(abstractAltContent(obj), obj);
			}
		} 
	
		function abstractAltContent(obj) {
			var ac = createElement("div");
			if (ua.win && ua.ie) {
				ac.innerHTML = obj.innerHTML;
			}
			else {
				var nestedObj = obj.getElementsByTagName(OBJECT)[0];
				if (nestedObj) {
					var c = nestedObj.childNodes;
					if (c) {
						var cl = c.length;
						for (var i = 0; i < cl; i++) {
							if (!(c[i].nodeType == 1 && c[i].nodeName == "PARAM") && !(c[i].nodeType == 8)) {
								ac.appendChild(c[i].cloneNode(true));
							}
						}
					}
				}
			}
			return ac;
		}
		
		/* Cross-browser dynamic SWF creation
		*/
		function createSWF(attObj, parObj, id) {
			var r, el = getElementById(id);
			if (ua.wk && ua.wk < 312) { return r; }
			if (el) {
				if (typeof attObj.id == UNDEF) { // if no 'id' is defined for the object element, it will inherit the 'id' from the alternative content
					attObj.id = id;
				}
				if (ua.ie && ua.win) { // Internet Explorer + the HTML object element + W3C DOM methods do not combine: fall back to outerHTML
					var att = "";
					for (var i in attObj) {
						if (attObj[i] != Object.prototype[i]) { // filter out prototype additions from other potential libraries
							if (i.toLowerCase() == "data") {
								parObj.movie = attObj[i];
							}
							else if (i.toLowerCase() == "styleclass") { // 'class' is an ECMA4 reserved keyword
								att += ' class="' + attObj[i] + '"';
							}
							else if (i.toLowerCase() != "classid") {
								att += ' ' + i + '="' + attObj[i] + '"';
							}
						}
					}
					var par = "";
					for (var j in parObj) {
						if (parObj[j] != Object.prototype[j]) { // filter out prototype additions from other potential libraries
							par += '<param name="' + j + '" value="' + parObj[j] + '" />';
						}
					}
					el.outerHTML = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"' + att + '>' + par + '</object>';
					objIdArr[objIdArr.length] = attObj.id; // stored to fix object 'leaks' on unload (dynamic publishing only)
					r = getElementById(attObj.id);	
				}
				else { // well-behaving browsers
					var o = createElement(OBJECT);
					o.setAttribute("type", FLASH_MIME_TYPE);
					for (var m in attObj) {
						if (attObj[m] != Object.prototype[m]) { // filter out prototype additions from other potential libraries
							if (m.toLowerCase() == "styleclass") { // 'class' is an ECMA4 reserved keyword
								o.setAttribute("class", attObj[m]);
							}
							else if (m.toLowerCase() != "classid") { // filter out IE specific attribute
								o.setAttribute(m, attObj[m]);
							}
						}
					}
					for (var n in parObj) {
						if (parObj[n] != Object.prototype[n] && n.toLowerCase() != "movie") { // filter out prototype additions from other potential libraries and IE specific param element
							createObjParam(o, n, parObj[n]);
						}
					}
					el.parentNode.replaceChild(o, el);
					r = o;
				}
			}
			return r;
		}
		
		function createObjParam(el, pName, pValue) {
			var p = createElement("param");
			p.setAttribute("name", pName);	
			p.setAttribute("value", pValue);
			el.appendChild(p);
		}
		
		/* Cross-browser SWF removal
			- Especially needed to safely and completely remove a SWF in Internet Explorer
		*/
		function removeSWF(id) {
			var obj = getElementById(id);
			if (obj && obj.nodeName == "OBJECT") {
				if (ua.ie && ua.win) {
					obj.style.display = "none";
					(function(){
						if (obj.readyState == 4) {
							removeObjectInIE(id);
						}
						else {
							setTimeout(arguments.callee, 10);
						}
					})();
				}
				else {
					obj.parentNode.removeChild(obj);
				}
			}
		}
		
		function removeObjectInIE(id) {
			var obj = getElementById(id);
			if (obj) {
				for (var i in obj) {
					if (typeof obj[i] == "function") {
						obj[i] = null;
					}
				}
				obj.parentNode.removeChild(obj);
			}
		}
		
		/* Functions to optimize JavaScript compression
		*/
		function getElementById(id) {
			var el = null;
			try {
				el = doc.getElementById(id);
			}
			catch (e) {}
			return el;
		}
		
		function createElement(el) {
			return doc.createElement(el);
		}
		
		/* Updated attachEvent function for Internet Explorer
			- Stores attachEvent information in an Array, so on unload the detachEvent functions can be called to avoid memory leaks
		*/	
		function addListener(target, eventType, fn) {
			target.attachEvent(eventType, fn);
			listenersArr[listenersArr.length] = [target, eventType, fn];
		}
		
		/* Flash Player and SWF content version matching
		*/
		function hasPlayerVersion(rv) {
			var pv = ua.pv, v = rv.split(".");
			v[0] = parseInt(v[0], 10);
			v[1] = parseInt(v[1], 10) || 0; // supports short notation, e.g. "9" instead of "9.0.0"
			v[2] = parseInt(v[2], 10) || 0;
			return (pv[0] > v[0] || (pv[0] == v[0] && pv[1] > v[1]) || (pv[0] == v[0] && pv[1] == v[1] && pv[2] >= v[2])) ? true : false;
		}
		
		/* Cross-browser dynamic CSS creation
			- Based on Bobby van der Sluis' solution: http://www.bobbyvandersluis.com/articles/dynamicCSS.php
		*/	
		function createCSS(sel, decl, media, newStyle) {
			if (ua.ie && ua.mac) { return; }
			var h = doc.getElementsByTagName("head")[0];
			if (!h) { return; } // to also support badly authored HTML pages that lack a head element
			var m = (media && typeof media == "string") ? media : "screen";
			if (newStyle) {
				dynamicStylesheet = null;
				dynamicStylesheetMedia = null;
			}
			if (!dynamicStylesheet || dynamicStylesheetMedia != m) { 
				// create dynamic stylesheet + get a global reference to it
				var s = createElement("style");
				s.setAttribute("type", "text/css");
				s.setAttribute("media", m);
				dynamicStylesheet = h.appendChild(s);
				if (ua.ie && ua.win && typeof doc.styleSheets != UNDEF && doc.styleSheets.length > 0) {
					dynamicStylesheet = doc.styleSheets[doc.styleSheets.length - 1];
				}
				dynamicStylesheetMedia = m;
			}
			// add style rule
			if (ua.ie && ua.win) {
				if (dynamicStylesheet && typeof dynamicStylesheet.addRule == OBJECT) {
					dynamicStylesheet.addRule(sel, decl);
				}
			}
			else {
				if (dynamicStylesheet && typeof doc.createTextNode != UNDEF) {
					dynamicStylesheet.appendChild(doc.createTextNode(sel + " {" + decl + "}"));
				}
			}
		}
		
		function setVisibility(id, isVisible) {
			if (!autoHideShow) { return; }
			var v = isVisible ? "visible" : "hidden";
			if (isDomLoaded && getElementById(id)) {
				getElementById(id).style.visibility = v;
			}
			else {
				createCSS("#" + id, "visibility:" + v);
			}
		}
	
		/* Filter to avoid XSS attacks
		*/
		function urlEncodeIfNecessary(s) {
			var regex = /[\\\"<>\.;]/;
			var hasBadChars = regex.exec(s) != null;
			return hasBadChars && typeof encodeURIComponent != UNDEF ? encodeURIComponent(s) : s;
		}
		
		/* Release memory to avoid memory leaks caused by closures, fix hanging audio/video threads and force open sockets/NetConnections to disconnect (Internet Explorer only)
		*/
		var cleanup = function() {
			if (ua.ie && ua.win) {
				window.attachEvent("onunload", function() {
					// remove listeners to avoid memory leaks
					var ll = listenersArr.length;
					for (var i = 0; i < ll; i++) {
						listenersArr[i][0].detachEvent(listenersArr[i][1], listenersArr[i][2]);
					}
					// cleanup dynamically embedded objects to fix audio/video threads and force open sockets and NetConnections to disconnect
					var il = objIdArr.length;
					for (var j = 0; j < il; j++) {
						removeSWF(objIdArr[j]);
					}
					// cleanup library's main closures to avoid memory leaks
					for (var k in ua) {
						ua[k] = null;
					}
					ua = null;
					for (var l in swfobject) {
						swfobject[l] = null;
					}
					swfobject = null;
				});
			}
		}();
		
		return {
			/* Public API
				- Reference: http://code.google.com/p/swfobject/wiki/documentation
			*/ 
			registerObject: function(objectIdStr, swfVersionStr, xiSwfUrlStr, callbackFn) {
				if (ua.w3 && objectIdStr && swfVersionStr) {
					var regObj = {};
					regObj.id = objectIdStr;
					regObj.swfVersion = swfVersionStr;
					regObj.expressInstall = xiSwfUrlStr;
					regObj.callbackFn = callbackFn;
					regObjArr[regObjArr.length] = regObj;
					setVisibility(objectIdStr, false);
				}
				else if (callbackFn) {
					callbackFn({success:false, id:objectIdStr});
				}
			},
			
			getObjectById: function(objectIdStr) {
				if (ua.w3) {
					return getObjectById(objectIdStr);
				}
			},
			
			embedSWF: function(swfUrlStr, replaceElemIdStr, widthStr, heightStr, swfVersionStr, xiSwfUrlStr, flashvarsObj, parObj, attObj, callbackFn) {
				var callbackObj = {success:false, id:replaceElemIdStr};
				if (ua.w3 && !(ua.wk && ua.wk < 312) && swfUrlStr && replaceElemIdStr && widthStr && heightStr && swfVersionStr) {
					setVisibility(replaceElemIdStr, false);
					addDomLoadEvent(function() {
						widthStr += ""; // auto-convert to string
						heightStr += "";
						var att = {};
						if (attObj && typeof attObj === OBJECT) {
							for (var i in attObj) { // copy object to avoid the use of references, because web authors often reuse attObj for multiple SWFs
								att[i] = attObj[i];
							}
						}
						att.data = swfUrlStr;
						att.width = widthStr;
						att.height = heightStr;
						var par = {}; 
						if (parObj && typeof parObj === OBJECT) {
							for (var j in parObj) { // copy object to avoid the use of references, because web authors often reuse parObj for multiple SWFs
								par[j] = parObj[j];
							}
						}
						if (flashvarsObj && typeof flashvarsObj === OBJECT) {
							for (var k in flashvarsObj) { // copy object to avoid the use of references, because web authors often reuse flashvarsObj for multiple SWFs
								if (typeof par.flashvars != UNDEF) {
									par.flashvars += "&" + k + "=" + flashvarsObj[k];
								}
								else {
									par.flashvars = k + "=" + flashvarsObj[k];
								}
							}
						}
						if (hasPlayerVersion(swfVersionStr)) { // create SWF
							var obj = createSWF(att, par, replaceElemIdStr);
							if (att.id == replaceElemIdStr) {
								setVisibility(replaceElemIdStr, true);
							}
							callbackObj.success = true;
							callbackObj.ref = obj;
						}
						else if (xiSwfUrlStr && canExpressInstall()) { // show Adobe Express Install
							att.data = xiSwfUrlStr;
							showExpressInstall(att, par, replaceElemIdStr, callbackFn);
							return;
						}
						else { // show alternative content
							setVisibility(replaceElemIdStr, true);
						}
						if (callbackFn) { callbackFn(callbackObj); }
					});
				}
				else if (callbackFn) { callbackFn(callbackObj);	}
			},
			
			switchOffAutoHideShow: function() {
				autoHideShow = false;
			},
			
			ua: ua,
			
			getFlashPlayerVersion: function() {
				return { major:ua.pv[0], minor:ua.pv[1], release:ua.pv[2] };
			},
			
			hasFlashPlayerVersion: hasPlayerVersion,
			
			createSWF: function(attObj, parObj, replaceElemIdStr) {
				if (ua.w3) {
					return createSWF(attObj, parObj, replaceElemIdStr);
				}
				else {
					return undefined;
				}
			},
			
			showExpressInstall: function(att, par, replaceElemIdStr, callbackFn) {
				if (ua.w3 && canExpressInstall()) {
					showExpressInstall(att, par, replaceElemIdStr, callbackFn);
				}
			},
			
			removeSWF: function(objElemIdStr) {
				if (ua.w3) {
					removeSWF(objElemIdStr);
				}
			},
			
			createCSS: function(selStr, declStr, mediaStr, newStyleBoolean) {
				if (ua.w3) {
					createCSS(selStr, declStr, mediaStr, newStyleBoolean);
				}
			},
			
			addDomLoadEvent: addDomLoadEvent,
			
			addLoadEvent: addLoadEvent,
			
			getQueryParamValue: function(param) {
				var q = doc.location.search || doc.location.hash;
				if (q) {
					if (/\?/.test(q)) { q = q.split("?")[1]; } // strip question mark
					if (param == null) {
						return urlEncodeIfNecessary(q);
					}
					var pairs = q.split("&");
					for (var i = 0; i < pairs.length; i++) {
						if (pairs[i].substring(0, pairs[i].indexOf("=")) == param) {
							return urlEncodeIfNecessary(pairs[i].substring((pairs[i].indexOf("=") + 1)));
						}
					}
				}
				return "";
			},
			
			// For internal usage only
			expressInstallCallback: function() {
				if (isExpressInstallActive) {
					var obj = getElementById(EXPRESS_INSTALL_ID);
					if (obj && storedAltContent) {
						obj.parentNode.replaceChild(storedAltContent, obj);
						if (storedAltContentId) {
							setVisibility(storedAltContentId, true);
							if (ua.ie && ua.win) { storedAltContent.style.display = "block"; }
						}
						if (storedCallbackFn) { storedCallbackFn(storedCallbackObj); }
					}
					isExpressInstallActive = false;
				} 
			}
		};
	}();
	
	
	var thisRoot = "http://img.tgimg.cn/bbs/flash/uploadFace3.0/",
		flashSrc = thisRoot + "uploadFace.swf?v=20121130",	
		swfVersionStr = "10.0.0",
		xiSwfUrlStr = thisRoot + "playerProductInstall.swf",
/*
		isIE = $.browser.msie,
        isIE6 = isIE && $.browser.version == "6.0",

 */
        isIE = !!window.ActiveXObject,
		isIE6 = isIE && !window.XMLHttpRequest,
		_flashvars = {},
		_params = {
			"quality": "high",
			"bgcolor": "#fff",
			"allowscriptaccess": "always",
			//"wmode": "transparent",
			"allowfullscreen": "false"
		},
		_attributes = {
			"id": "uploadFace",
			"name" : "uploadFace",
			"align": "middle",
			"codebase": "http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab"
		},
		/*
		 * options :{
		 * 		cutSize : 截图尺寸
		 * 		tips ： 上传图片界面的提示；用&#xa;换行
		 * }
		 */
		uploadFaceFull = function(areaId, oldFaceSrc, uploadSrc, uploadCompleteFun, options, flashvars, params, attributes, selectFun, cancelFun, fSrc){
			var _replaceId, uploadFaceObj, flashArea, noFlashArea, changeArea, noFlashAreaImage, noFlashAreaLoading, noFlashAreaForm, noFlashAreaData, noFlashAreaBtn, noFlashAreaReadyFile;
			var areaElem;
			if (typeof(areaId) == "string") {
				if (areaId.indexOf("#") == 0) {
					areaId = areaId.substr(1);
				}
				areaElem = $("#" + areaId);
			}else{
				areaElem = $(areaId);
			}
			_replaceId = areaId + "_uploadFaceArea";
			$.extend(_flashvars, flashvars);
			$.extend(_params, params);
			$.extend(_attributes, attributes);
			var cutSize = (cutSize = (options.cutSize || [{width: 150, height:150}])) instanceof Array ? cutSize : [cutSize];
 			window.uploadFaceInit = function() {
            	uploadFaceObj.ref.sendDeployToFlash(oldFaceSrc, uploadSrc, cutSize[0].width, cutSize[0].height, options.tips || "");
            };
			window.selectImageComplete = selectFun || function(){};
			window.cancelUploadFace = function(url){
				if($.isFunction(cancelFun))
					cancelFun(url);
			};
			window.afterUplpadComplete = function(url){
				if($.isFunction(uploadCompleteFun))
					uploadCompleteFun(url);
			};
			flashArea = $("<div/>").append($("<div/>").attr("id", _replaceId).html([
				"<a href='http://www.adobe.com/go/getflashplayer'><img src='",
				(document.location.protocol == "https:") ? "https://" : "http://",
				"www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='下载 Flash player' /></a>"
			].join("")));
			noFlashArea = $("<div/>").toggle(false).html([
				'<div style="height:200px;width:630px">',
					'<img style="float:left;width:150px;height:150px;margin-right:20px" src="', oldFaceSrc,'" alt=""/>',
					'<div style="width:450px;overflow:hidden;float:left">',	
						'<div style="padding-top:20px;overflow:hidden;"><form action="', (uploadSrc ? /\?+/gi.test(uploadSrc) ? uploadSrc + "&js=1" : uploadSrc : "/System/AjaxService.aspx?op=uploadFace&js=1"), '" enctype="multipart/form-data" method="post">',
							'<input type="reset" style="display:none"/>',
							'<span style="display:block;line-height:30px;color:#aaa">支持jpg、jqeg、gif、png格式的图片，文件小于2M</span>',
						'</form></div>',
						'<p style="color:#333;line-height:25px;clear:both">',
							'<span class="uploadReadyFile" style="display:block"></span>',
							'<span class="uploading" style="display:none"><span style="height:25px;display:inline-block;*display:inline;zoom:1;background:url(http://img.tgimg.cn/common/loading.gif) no-repeat 0 30%;width:25px;vertical-align:middle;"></span>图片上传中...</span>',
						'</p>',
					'</div>'			
			].join(""));
			if (isIE6) {
				noFlashAreaBtn = $([
					'<div>',
						'<input type="file" name="Filedata" id="uploadFace_Filedata" value="选择要上传的图片" />',
						'<input type="button" class="sltUploadFaceBtn" value="保 存" id="uploadFace_UploadFaceBtn" style="width:80px;margin-left:10px" />',
					'</div>'
				].join(""));
				noFlashAreaBtn.find("input").height(25);
			}
			else {
				var label = isIE ? "label" : "span";
				noFlashAreaBtn = $(['<div>', '<', label, ' for="uploadFace_Filedata">选择要上传的图片</', label,'>', '<input type="file" name="Filedata" id="uploadFace_Filedata" hidefocus="hidefocus"/>', '</div>', '<div style="left:10px">', '<', label,' for="uploadFace_UploadFaceBtn">保 存</', label,'>', '<input type="button" class="sltUploadFaceBtn" value="保 存" id="uploadFace_UploadFaceBtn" />', '</div>'].join(""));
				noFlashAreaBtn.each(function(){
					var $this = $(this);
					$this.css({
						"display": "block",
						"overflow": "hidden",
						"line-height": "33px",
						"text-align": "center",
						"position": "relative",
						"z-index": 1,
						"float": "left"
					});
					$this.find(label).css({
						"padding": "0 1em",
						"font-size": "14px",
						"font-weight": "bold",
						"border": "1px solid #c9c7c7",
						"display": "inline-block",
						"*display": "inline",
						"zoom": 1,
						"height": "33px",
						"position": "relative",
						"z-index": 2,
						"background": "#fafafa",
						"color": "#787878",
						"white-space": "nowrap",
						"cursor": "pointer"
					}).hover(function(){
						$(this).css({
							"background": "#e9f5ff",
							"color": "#369",
							"text-decoration": "none"
						});
					}, function(){
						$(this).css({
							"background": "#fafafa",
							"color": "#787878"
						});
					}).click(function(){
						if(!isIE){
							$(this).next().click();
						}
					});
					$this.find("input").css({
						"position": "absolute",
						"zoom": 1,
						"height": "35px",
						"display": "block",
						"opacity": 0,
						"filter": "Alpha(opacity=0)",
						"_filter": "Alpha(opacity=1)",
						"top": 0,
						"right": 0,
						"cursor": "pointer",
						"z-index": 1
					});
				});
			}
			noFlashArea.find("form").append(noFlashAreaBtn);
			noFlashAreaImage = noFlashArea.find("img");
			noFlashAreaLoading = noFlashArea.find(".uploading");
			noFlashAreaReadyFile = noFlashArea.find(".uploadReadyFile");
			noFlashAreaData = noFlashArea.find("input[name=Filedata]");
			noFlashAreaForm = noFlashArea.find("form");
			noFlashAreaBtn.find("[type=file]").change(function(){
				noFlashAreaReadyFile.html($(this).val());
			});
			noFlashAreaBtn.find(".sltUploadFaceBtn").click(function(){
			    //noFlashAreaForm.submit();
			    if(!noFlashAreaData.val()){
			        alert("请先选择图片！");
			        return false;
			    }
				var _this = this;
				noFlashAreaLoading.toggle(true);
				$.ajaxForm(noFlashAreaForm, function(data){
                    data = $.parseJSON(data);
					if (data === null) {
						alert("网络错误，请稍候重试！");
					}else if(data[0] == 1){
						noFlashAreaForm.find("[type=reset]").click();
						noFlashAreaImage.attr("src", data[1]);
						noFlashAreaReadyFile.html("");	
						if ($.isFunction(uploadCompleteFun)) {
							uploadCompleteFun(data[1]);
						}else{							
							alert("上传成功！");				
						}
					}else{
						alert(data[1]);
					}			
					noFlashAreaLoading.toggle(false);			
					$(_this).attr("disabled", false);
				});				
				$(_this).attr("disabled", true);
			});
			changeArea = $("<span style = 'padding-left:10px'/>").html("<em style='color:#aaa'>如果无法上传头像，请尝试使用</em><span style='color:#369;cursor:pointer'>普通上传模式</span>");
			changeArea.children("span").data("flashOpen", true).click(function(){
				var $this = $(this), open = $this.data("flashOpen"), w;				
				noFlashArea.toggle(open);
				flashArea.toggle(!open);
				$this.prev().html(open ? "返回" : "如果无法上传头像，请尝试使用");
				$this.html(open ? "更多上传模式" : "普通上传模式")
				$this.data("flashOpen", !open);
			});
			areaElem.prepend(changeArea).prepend(noFlashArea).prepend(flashArea);
			swfobject.embedSWF(
                            fSrc ? fSrc : flashSrc,
                            _replaceId,
                            "630", "445",
                            swfVersionStr, xiSwfUrlStr,
                            _flashvars, _params, _attributes, function (obj) { uploadFaceObj = obj; });
		},		
		uploadFace = function (areaId, oldFaceSrc, uploadSrc, uploadCompleteFun, flashvars, params, attributes, selectFun, cancelFun, fSrc) {
		    uploadFaceFull(areaId, oldFaceSrc, uploadSrc, uploadCompleteFun, {}, flashvars, params, attributes, selectFun, cancelFun, fSrc);
		};
	window.uploadFace = uploadFace;
	window.uploadFaceFull = uploadFaceFull;
})(jQuery, window);
