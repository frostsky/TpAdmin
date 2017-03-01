<?php
return array(
    //***********************************数据和缓存设置**********************************
    'DATA_CACHE_TIME'        => 1800,        // 数据缓存有效期s
    'DATA_CACHE_PREFIX'      => 'mem_',      // 缓存前缀
    'DATA_CACHE_TYPE'        => 'Memcached', // 数据缓存类型,
    'MEMCACHED_SERVER'       => '127.0.0.1', // 服务器ip

    // 阿里云OSS
    'ALIOSS_CONFIG'          => array(
        'KEY_ID'             => '', // 阿里云oss key_id
        'KEY_SECRET'         => '', // 阿里云oss key_secret
        'END_POINT'          => '', // 阿里云oss endpoint
        'BUCKET'             => ''  // bucken 名称
    ),
    'NEED_UPLOAD_OSS'        => array( // 需要上传的目录
        '/Upload/avatar',
        '/Upload/cover',
        '/Upload/image/webuploader',
        '/Upload/video',
    ),
);