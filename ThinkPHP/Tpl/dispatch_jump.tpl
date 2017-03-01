<?php
    if(C('LAYOUT_ON')) {
        echo '{__NOLAYOUT__}';
    }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>跳转提示</title>
<style type="text/css">
*{ padding: 0; margin: 0; }
body{ background: #fff; font-family: '微软雅黑'; color: #333; font-size: 12px; }
.system-message {margin:10% auto 0px auto;clear:both;padding:20px 0;border:1px solid silver; text-align:center; width:40%}
.system-message h1{ font-size: 100px; font-weight: normal; line-height: 120px; margin-bottom: 12px; }
.system-message .jump{ padding-top: 10px; color:#888;}
.system-message .jump a{ color: #999;}
.system-message .success { line-height: 1.5em; font-size: 14px }
.system-message .error { line-height: 1.5em; font-size: 14px; color:#FF0000; }
.tips_success {background-color: #f0ffe5; border-color: #aae77f;}
.tips_error {background-color: #fff3f3; border-color: #ffb2b2;}
</style>
</head>
<body>
<?php if(isset($message)) {?>
<div class="system-message tips_success">
<p class="success"><?php echo($message); ?> :）</p>
<?php }else{?>
<div class="system-message tips_error">
<p class="error"><?php echo($error); ?>:）</p>
<?php }?>
<p class="jump">
页面将自动 <a id="href" href="<?php echo($jumpUrl); ?>">跳转</a> 等待时间： <b id="wait"><?php echo($waitSecond); ?></b>
</p>
</div>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
</body>
</html>
