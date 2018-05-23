// JavaScript Document

function login() {
	"use strict";
	//alert("hello");
	var phoneNum = document.getElementById('phoneNum').value;
	var password = document.getElementById('password').value;
	//alert(password);
	var tip = document.getElementById('Tip');
	var isTrue = JudgePhoneNum(phoneNum);
	if (isTrue == false) {
		tip.innerHTML = "请输入正确的手机号";
		return false;
	}
	isTrue = JudgePassword(password);
	if (isTrue == false) {
		tip.innerHTML = "请输入正确的密码（8-16位）";
		return false;
	}
	tip.innerHTML = "";
	return true;
}

function load() {
	"use strict";
	var thisURL = location.search;
	//alert(thisURL);
	var tip = document.getElementById('Tip');
	if (thisURL.indexOf('=') === -1) {
	}else {
		tip.innerHTML = "账号与密码不匹配";
		return;
	}
	tip.innerHTML = "";
}


function JudgePhoneNum(phone) {
	"use strict";
	var isTrue = false;
	if(/\d{11}$/.test(phone))//判断是否为11位
    {
    	if(/^1(3|8)\d{9}$/.test(phone))//13字段、18字段
    	{
        	isTrue = true;
        }
        else if(/17(3|[5-8])\d{8}$/.test(phone))//17字段
        {
        	isTrue = true;
        }
        else if (/15([0-3]|[5-9])\d{8}$/.test(phone))//15字段
        {
        	isTrue = true;
        }
    }
	return isTrue;
}

function JudgePassword(password) {
	"use strict";
	if (password.length < 8) {
		return false;
	}
	return true;
}