<?php
namespace Admincp\Model;
use Common\Model\BaseModel;
/**
 * ModelName
 */
class AuthUserModel extends BaseModel{
    // 自动验证
    protected $_validate=array(
        array('username','require','用户名必须',0,'',3), // 验证字段必填
    );

    /**
     * 添加用户
     */
    public function addData($data){
        // 对data数据进行验证
        $data['password'] = md5(C('ADMIN_KEY'). md5($data['password']));
        if(!$data=$this->create($data)){
            // 验证不通过返回错误
            return false;
        }else{
            // 验证通过
            $result=$this->add($data);
            return $result;
        }
    }

    /**
     * 修改用户
     */
    public function editData($map,$data){
        // 对data数据进行验证
        if(!$data=$this->create($data)){
            // 验证不通过返回错误
            return false;
        }else{
            // 验证通过
            $result=$this
                ->where(array($map))
                ->save($data);
            return $result;
        }
    }

    // 读取用户列表
    public function getAdminPage($map, $order){
        return $this->getPage($this, $map, $order);
    }

    /**
     * 删除数据
     * @param   array   $map    where语句数组形式
     * @return  boolean         操作是否成功
     */
    public function deleteData($map){
        die('禁止删除用户');
    }
}
