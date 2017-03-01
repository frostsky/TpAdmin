<?php
return array(
    //*************************************后台系统设置***********************************
    // 后台管理目录名，建议小写
    'ADMIN_APP_NAME' => 'admincp',
    // 后台系统名称
    'SITE_NAME' => 'TpAdmin CMS',
    // 后台加密key，系统安装完成后请修改为您自己的key值
    'ADMIN_KEY' => 'f061gmQAMaKnvVwPDu6eYYtzwBIc4Dk2wOFpaHnsLPP7ubla8XFdYC1tLnG1vV5ZFW',
    'SESSION_PREFIX'      => 'admincp', // session 前缀

    // auth设置
    'AUTH_CONFIG'        => array(
        'AUTH_USER'      => 'auth_user' //管理员信息表
    ),

    // 后台跳转模板文件
    'TMPL_ACTION_ERROR'      => THINK_PATH . 'Tpl/dispatch_jump.tpl', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'    => THINK_PATH . 'Tpl/dispatch_jump.tpl', // 默认成功跳转对应的模板文件

);
