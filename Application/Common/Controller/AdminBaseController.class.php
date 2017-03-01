<?php
namespace Common\Controller;
use Common\Controller\BaseController;
/**
 * admin 基类控制器
 */
class AdminBaseController extends BaseController{
	/**
	 * 初始化方法
	 */
	public function _initialize(){
		parent::_initialize();
		$auth = new \Think\Auth();
		$rule_name = CONTROLLER_NAME.'/'.ACTION_NAME;

		$result = session('admin')['is_superadmin'] || $auth->check($rule_name, session('admin')['uid']);
		if(!$result){
			$this->error('您没有权限访问', U('login/index'));
		}
	}


}