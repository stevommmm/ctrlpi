<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<title>CTRLpi</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="/static/style.css">
</head>
<body>
	<ul id="content">
		<li class="listbar">
			<span class="header">Raspberry Pi Control</span>
			<span class="container"><h3>Welcome!</h3><p>This raspberry pi is controlled by CTRLpi</p></span>
		</li>
		% for tab in tabs:
		<li class="listbar">
			<span class="header">{{tab}}</span>
			<span class="container _dynamic" data-plugin="{{tab}}">Content loading...</span>
		</li>
		% end
	</ul>
	<script type="text/javascript">
		var xmlhttp;
		function fetch(url, callback) {
			callback = callback || function() {};
			xmlhttp=GetXmlHttpObject();
			if (xmlhttp==null)
			{
				alert ("Browser does not support HTTP Request");
				return;
			}
			xmlhttp.onreadystatechange=function() {
				if (xmlhttp.readyState==4) {
					callback(xmlhttp.responseText);
				}  
			};
			xmlhttp.open("GET",url,true);
			xmlhttp.send(null);
		}

		function GetXmlHttpObject() {
			if (window.XMLHttpRequest) {
				return new XMLHttpRequest();
			}
			if (window.ActiveXObject) {
			  return new ActiveXObject("Microsoft.XMLHTTP");
			}
			return null;
		}

		function toggleChild(e) {
			var listin = e.getElementsByClassName("container");
			for (var i = 0; i < listin.length; i++) {
				var el = listin[i];
				if( el.style.display == "block") {
					el.style.display = "none";
				} else {
					el.style.display = "block";
					if(el.className.indexOf("_dynamic") != -1){
						fetch("/tab/" +  el.getAttribute("data-plugin"), function(data) {
							 el.innerHTML = data;
						});
					}
				}
			}
		}
	</script>
	<script type="text/javascript">
		window.onload = function() {
			var listbars = document.getElementsByClassName("header");
			for(var i = 0; i < listbars.length; i++) {
				listbars[i].style.color = "hsl(" + i * 20 + ", 100%, 50%)";
				listbars[i].onclick = function() { toggleChild(this.parentNode); };
			}
		}
	</script>
</body>
</html>
