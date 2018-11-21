(function(window, undefined){
	try{
        var document = window.document;
		var params = window.params;

		var kfuin = encodeURIComponent(params['kfuin']),
			ws = encodeURIComponent(params['ws']),
			referrer = encodeURIComponent(params['referrer']),
			cref = encodeURIComponent(params['cref']),
			pt = encodeURIComponent(params['pt']),
            a = params['a'] || '',
            aty = params['aty'] || '',
			btn1 = params['btn1'];
		
        document.getElementById('wpa_release_a01_btn').innerText = btn1;
        getOnlineStatus(params);

		//绑定事件
        document.getElementById('wpa_release_a01_btn').onclick = function(){
			window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin='+kfuin+'&cref='+cref+'&ref='+referrer+'&pt='+pt+'&f=1&ty=1&ap=&as=&aty=' + aty + '&a=' + a, '_blank', 'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');
		}
    }catch(e){}
}(window));