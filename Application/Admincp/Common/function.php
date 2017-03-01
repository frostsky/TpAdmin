<?php
function admin_url($url = '', $vars = '', $suffix = true, $domain = false) {
    $url = U(C('ADMIN_APP_NAME').'/'.$url, $vars, $suffix, $domain);
    //return str_replace('/index.php/', '/', $url);
    return $url;
}

/**
 * 返回一个JSON格式的数据
 *
 * @access  public
 * @param   string $content
 * @param   integer $error
 * @param   string $message
 * @param   array $append
 * @return  void
 * @author frostsky <dongsm@cng.com.cn>
 */
function make_json_response($content = '', $error = "0", $message = '', $append = array())
{
    $res = array('error' => $error, 'message' => $message, 'content' => $content);
    if (!empty($append)) {
        foreach ($append AS $key => $val) {
            $res[$key] = $val;
        }
    }
    header('Content-Type:application/json; charset=utf-8');
    $val = json_encode($res);

    exit($val);
}

/**
 * 生成JSON格式结果
 *
 * @access  public
 * @param
 * @return  void
 */
function make_json_result($content = '', $message = '', $append = array())
{
    make_json_response($content, 0, $message, $append);
}

/**
 * 创建一个JSON格式的错误信息
 *
 * @access  public
 * @param   string $msg
 * @return  json string
 * @author frostsky <dongsm@cng.com.cn>
 */
function make_json_error($msg)
{
    make_json_response('', 1, $msg);
}