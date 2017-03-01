<?php
/**
* 运营中心登录模块
* --------------------------------------------------------------------------
* @copyright Copyright (c) 2013-2099 http://www.dili360.com
* @author frostsky <dongsm@cng.com.cn>
* @version $Id: PublicController.class.php 2015-5-4 10:53:19 frostsky $
* --------------------------------------------------------------------------
**/
namespace Admincp\Controller;
use Think\Controller;
class LoginController extends Controller
{
    public function index()
    {
        $this->assign('page_title', C('SITE_NAME'));
        $this->display ();
    }

    // 登录
    public function doLogin()
    {
        $secure_code = C ( 'ADMIN_KEY' );
        $userUsername = I("post.username", '');
        $userPassword = I("post.password", '');

        $userPassword = md5($secure_code . md5($userPassword));

        // 生成认证条件
        $map = array ();
        $map ["username"] = $userUsername;
        $map ["status"] = 1;
        $userDao = D ( 'AuthUser' );
        $user = $userDao -> field('uid,username,password') -> where ( $map )-> find();

        // 使用用户名、密码和状态的方式进行认证
        if (false === $user || $user ['username'] != $userUsername || $user ['password'] != $userPassword) {
            $this->error('帐号或密码错误！');
        }

        $last ['last_login_time'] = time ();
        $last ['last_login_ip'] = get_client_ip (0,true);
        $userDao -> where ( "uid=" . $user ['uid'] )-> save ( $last );

        // 读取用户组
        $group_ids = D('AuthGroupAccess')->getGroupidsByUid($user['uid']);
        if (in_array(1, $group_ids)) { // 超级管理员组id为1
            $user['is_superadmin'] = 1;
        } else {
            $user['is_superadmin'] = 0;
        }

        session('admin', $user);

        //生成权限信息
        //self::setMenu();
        redirect (U('index/index'));
    }

    // 注销退出
    public function logout()
    {
        session('admin', NULL);

        redirect (U('login/index'));
    }

    // 验证码
    public function verify() {
        $Verify = new \Think\Verify ();
        $Verify->codeSet = '0123456789';
        $Verify->imageH = 30;
        $Verify->imageW = 120;
        $Verify->length = 4;
        $Verify->fontSize = 14;
        $Verify->entry ();
    }

    /**
     * 验证码校验
     *
     * @param unknown $code
     * @param string $id
     * @return boolean
     */
    private function check_verify($code, $id = '') {
        $verify = new \Think\Verify ();
        return $verify->check ( $code, $id );
    }

    public function getphpinfo()
    {
        phpinfo();
    }

    public function _empty()
    {
        die('403 Forbidden');
    }
}