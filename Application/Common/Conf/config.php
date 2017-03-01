<?php
return array(
    //***********************************URL设置**************************************
    'MODULE_ALLOW_LIST'      => array('Home','Admincp','Api','User'), //允许访问列表
    'URL_HTML_SUFFIX'        => '',  // URL伪静态后缀设置
    'URL_MODEL'              => 2,  //启用rewrite
    //*************************************附加设置***********************************

    'SHOW_PAGE_TRACE'        => false,                           // 是否显示调试面板
    'URL_CASE_INSENSITIVE'   => false,                           // url区分大小写
    'TAGLIB_BUILD_IN'        => 'Cx,Common\Tag\My',              // 加载自定义标签
    'LOAD_EXT_CONFIG'        => 'db,pay,oauth',               // 加载网站设置文件
    'TMPL_PARSE_STRING'      => array(                           // 定义常用路径
        '__OSS__'            => CDN_URL,
        '__PUBLIC__'         => CDN_URL.__ROOT__.'/Public',
        '__PUBLIC_CSS__'     => CDN_URL.__ROOT__.'/Public/statics/css',
        '__PUBLIC_JS__'      => CDN_URL.__ROOT__.'/Public/statics/js',
        '__PUBLIC_IMAGES__'  => CDN_URL.__ROOT__.'/Public/statics/images',
        '__ADMIN_CSS__'      => __ROOT__.trim(TMPL_PATH,'.').'Admincp/static/css',
        '__ADMIN_JS__'       => __ROOT__.trim(TMPL_PATH,'.').'Admincp/static/js',
        '__ADMIN_IMAGES__'   => CDN_URL.trim(TMPL_PATH,'.').'Admincp/static/images',
        '__ADMIN_ACEADMIN__' => CDN_URL.__ROOT__.'/Public/statics/aceadmin',
        '__HOME_CSS__'       => __ROOT__.trim(TMPL_PATH,'.').'Home/static/css',
        '__HOME_JS__'        => __ROOT__.trim(TMPL_PATH,'.').'Home/static/js',
        '__HOME_IMAGES__'    => CDN_URL.trim(TMPL_PATH,'.').'Home/static/images',
        '__USER_CSS__'       => __ROOT__.trim(TMPL_PATH,'.').'User/static/css',
        '__USER_JS__'        => __ROOT__.trim(TMPL_PATH,'.').'User/static/js',
        '__USER_IMAGES__'    => CDN_URL.trim(TMPL_PATH,'.').'User/static/images',
    ),

//***********************************SESSION设置**********************************
    'SESSION_OPTIONS'        => array(
        'name'               => 'CMSID',//设置session名
        'expire'             => 24*3600*15, //SESSION保存15天
        'use_trans_sid'      => 1,//跨页传递
    ),
//***********************************页面设置**************************************
    'TMPL_EXCEPTION_FILE'    => APP_DEBUG ? THINK_PATH.'Tpl/think_exception.tpl' : './Template/default/Home/Public/404.html',
    'TMPL_ACTION_ERROR'      => TMPL_PATH.'/Publicres/dispatch_jump.tpl', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'    => TMPL_PATH.'/Publicres/dispatch_jump.tpl', // 默认成功跳转对应的模板文件

//***********************************邮件服务器**********************************
    'EMAIL_FROM_NAME'        => '',   // 发件人
    'EMAIL_SMTP'             => '',   // smtp
    'EMAIL_USERNAME'         => '',   // 账号
    'EMAIL_PASSWORD'         => '',   // 密码  注意: 163和QQ邮箱是授权码；不是登录的密码
    'EMAIL_SMTP_SECURE'      => '',   // 链接方式 如果使用QQ邮箱；需要把此项改为  ssl
    'EMAIL_PORT'             => '25', // 端口 如果使用QQ邮箱；需要把此项改为  465

);
