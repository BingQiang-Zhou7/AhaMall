// JavaScript Document

function load() {
	"use strict";
	var thisURL = location.search;
	//alert(thisURL);
	var tip = document.getElementById('Tip');
	if (thisURL.indexOf('=') === -1) {
	}else {
		tip.innerHTML = "该手机号已注册，请更换手机号注册";
		return;
	}
	tip.innerHTML = "";
}

function register()
{
	"use strict";
	//alert("hello");
	var phoneNum = document.getElementById('phoneNum').value;
	var userID = document.getElementById('userID').value;
	var userName = document.getElementById('userName').value;
	var pw1 = document.getElementById('pw1').value;
	var pw2 = document.getElementById('pw2').value;
	
	
	if(phoneNum.length !== 0 && userID.length !== 0 && userName.length !== 0 && pw1.length !== 0 && pw2.length !== 0)
		{
			//alert("hello");
		//验证密码
		var passwordTip = document.getElementById('passwordTip');
			if(pw1.toString() == pw2.toString())
				{
					//alert("hello");
				passwordTip.innerHTML = "请再次输入密码";
				passwordTip.setAttribute('style','color:#8D8D8D');
					if (pw1.length < 8) {
						passwordTip.innerHTML = "密码不得小于8位";
						passwordTip.setAttribute('style','color:red');
						return false;
					}
				}
			else	
				{
					
					passwordTip.innerHTML = "两次密码不一致";
					passwordTip.setAttribute('style','color:red');
					return false;
				}
			//验证手机号
			var isTrue = JudgePhoneNum(phoneNum);
			var phoneNumTip = document.getElementById('phoneNumTip');
			if (isTrue == false) {
				phoneNumTip.innerHTML = "请输入正确的手机号";
				phoneNumTip.setAttribute('style','color:red');
				return false;
			}
			else {
				phoneNumTip.innerHTML = "作为登录帐号，每个手机号码只能注册一次";
				phoneNumTip.setAttribute('style','color:#8D8D8D');
			}
			//验证身份证
			isTrue = JudgeUserID(userID);
			var userIDTip = document.getElementById('userIDTip');
			if (isTrue == false) {
				userIDTip.innerHTML = "请输入正确的身份证号";
				userIDTip.setAttribute('style','color:red');
				return false;
			}
			else {
				userIDTip.innerHTML = "作为更改密码的凭证";
				userIDTip.setAttribute('style','color:#8D8D8D');
			}
			return true;
		}
	else
		{
			//alert("请填写完信息后，再试");
			return false;
		}
}

function registerFocus()
{
	"use strict";
	var phoneNum = document.getElementById('phoneNum').value;
	var userID = document.getElementById('userID').value;
	var userName = document.getElementById('userName').value;
	var pw1 = document.getElementById('pw1').value;
	var pw2 = document.getElementById('pw2').value;
	
	
	
	//$("registerBtn").removeClass("btn_disabled");
	//alert("hello");
	//alert("hello");
	//alert(phoneNum+userID+userName+pw1+pw2);
	//设置注册按钮是否可用
	var registerBtnSpan = document.getElementById('registerBtnSpan');
	//var registerBtn = document.getElementById('registerBtn');
	//registerBtn.diasbled = true;
	
	if(phoneNum.length !== 0 && userID.length !== 0 && userName.length !== 0 && pw1.length !== 0 && pw2.length !== 0)
		{
			//alert("hello");
			
			//registerStep.removeAttribute('className');
			registerBtnSpan.className='btn btn_primary btn_input';
			//registerBtn.onclick = 'register()';
			//registerBtn.addEventListener('click',register);
			//alert(registerBtn.diasbled);
			//var classss =  registerStep.getAttribute("class");
			
			//registerStep.className = "btn btn_primary btn_input";
			//alert(classss);
		}
		else
		{
			registerBtnSpan.className='btn btn_disabled btn_primary btn_input';
			//registerBtn.removeEventListener('click',register);
			//registerBtn.unbind()
			return false;
			//alert(registerBtn.diasbled);
		}

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

function JudgeUserID(userID) 
{ 
	"use strict";
// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X 
	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
	if(reg.test(userID) === false) 
	{ 
	//alert("身份证输入不合法"); 
	return false; 
	}
	return true;
} 
