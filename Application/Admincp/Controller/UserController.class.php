<?php
namespace Admincp\Controller;
use Common\Controller\AdminBaseController;
/**
 * 后台首页控制器
 */
class UserController extends AdminBaseController{

	/**
	 * 用户列表
	 */
	public function index(){
		$word=I('get.word','');
		if (empty($word)) {
			$map=array();
		}else{
			$map=array(
				'username'=>$word
				);
		}
		$assign=D('User')->getUserPage($map,'reg_time desc');
		$this->assign($assign);
		$this->display();
	}




}
