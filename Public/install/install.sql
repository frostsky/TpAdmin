/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3307
Source Database       : tpadmin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : utf-8

Date: 2017-02-27 17:35:22
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `pre_admin_nav`
-- ----------------------------
DROP TABLE IF EXISTS `pre_admin_nav`;
CREATE TABLE `pre_admin_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单表',
  `pid` int(11) unsigned DEFAULT '0' COMMENT '所属菜单',
  `name` varchar(15) DEFAULT '' COMMENT '菜单名称',
  `mca` varchar(255) DEFAULT '' COMMENT '模块、控制器、方法',
  `ico` varchar(20) DEFAULT '' COMMENT 'font-awesome图标',
  `order_number` int(11) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='后台管理菜单';

-- ----------------------------
--  Records of `pre_admin_nav`
-- ----------------------------
BEGIN;
INSERT INTO `pre_admin_nav` VALUES (1, 0, '系统设置', 'ShowNav/config', 'cog', 1);
INSERT INTO `pre_admin_nav` VALUES (2, 1, '菜单管理', 'Nav/index', NULL, 1);
INSERT INTO `pre_admin_nav` VALUES (5, 1, '权限管理', 'Rule/index', '', 4);
INSERT INTO `pre_admin_nav` VALUES (3, 1, '用户组管理', 'Rule/group', '', 2);
INSERT INTO `pre_admin_nav` VALUES (4, 1, '管理员列表', 'Rule/admin_user_list', '', 3);
INSERT INTO `pre_admin_nav` VALUES (6, 0, '用户管理', 'ShowNav/user', 'users', 2);
INSERT INTO `pre_admin_nav` VALUES (7, 6, '用户列表', 'User/index', '', 1);
COMMIT;

-- ----------------------------
--  Table structure for `pre_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `pre_auth_group`;
CREATE TABLE `pre_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text COMMENT '规则id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
--  Records of `pre_auth_group`
-- ----------------------------
BEGIN;
INSERT INTO `pre_auth_group` VALUES ('1', '超级管理员', '1', '6,96,20,1,2,3,4,5,64,21,7,8,9,10,11,12,13,14,15,16,123,124,125,19,104,105,106,107,108,118,109,110,111,112,117'),
('2', '产品管理员', '1', '6,96,1,2,3,4,56,57,60,61,63,71,72,65,67,74,75,66,68,69,70,73,77,78,82,83,88,89,90,99,91,92,97,98,104,105,106,107,108,118,109,110,111,112,117,113,114');
COMMIT;

-- ----------------------------
--  Table structure for `pre_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `pre_auth_group_access`;
CREATE TABLE `pre_auth_group_access` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
--  Records of `pre_auth_group_access`
-- ----------------------------
BEGIN;
INSERT INTO `pre_auth_group_access` VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `pre_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `pre_auth_rule`;
CREATE TABLE `pre_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
--  Records of `pre_auth_rule`
-- ----------------------------
BEGIN;
INSERT INTO `pre_auth_rule` VALUES (1, 20, 'ShowNav/nav', '菜单管理', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (2, 1, 'Nav/index', '菜单列表', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (3, 1, 'Nav/add', '添加菜单', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (4, 1, 'Nav/edit', '修改菜单', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (5, 1, 'Nav/delete', '删除菜单', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (6, 0, 'Index/index', '后台首页', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (7, 20, 'Rule/index', '权限管理', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (8, 7, 'Rule/add', '添加权限', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (9, 7, 'Rule/edit', '修改权限', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (10, 7, 'Rule/delete', '删除权限', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (11, 20, 'Rule/group', '用户组管理', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (12, 11, 'Rule/add_group', '添加用户组', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (13, 11, 'Rule/edit_group', '修改用户组', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (14, 11, 'Rule/delete_group', '删除用户组', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (15, 11, 'Rule/rule_group', '分配权限', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (16, 11, 'Rule/check_user', '添加成员', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (19, 20, 'Rule/admin_user_list', '管理员列表', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (20, 0, 'ShowNav/config', '系统设置', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (64, 1, 'Nav/order', '菜单排序', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (96, 6, 'Index/welcome', '欢迎界面', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (104, 0, 'ShowNav/posts', '文章管理', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (105, 104, 'Posts/index', '文章列表', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (106, 105, 'Posts/add_posts', '添加文章', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (107, 105, 'Posts/edit_posts', '修改文章', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (108, 105, 'Posts/delete_posts', '删除文章', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (109, 104, 'Posts/category_list', '分类列表', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (110, 109, 'Posts/add_category', '添加分类', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (111, 109, 'Posts/edit_category', '修改分类', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (112, 109, 'Posts/delete_category', '删除分类', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (117, 109, 'Posts/order_category', '分类排序', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (118, 105, 'Posts/order_posts', '文章排序', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (123, 11, 'Rule/add_user_to_group', '设置为管理员', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (124, 11, 'Rule/add_admin', '添加管理员', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (125, 11, 'Rule/edit_admin', '修改管理员', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (126, 0, 'ShowNav/user', '用户管理', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (127, 126, 'User/index', '用户列表', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (128, 127, 'User/edit_user', '修改用户', 1, 1, '');
INSERT INTO `pre_auth_rule` VALUES (129, 127, 'User/delete_user', '删除用户', 1, 1, '');
COMMIT;

-- ----------------------------
--  Records of `pre_auth_user`
-- ----------------------------
BEGIN;
CREATE TABLE `pre_auth_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
--  Records of `pre_auth_rule`
-- ----------------------------
BEGIN;
INSERT INTO `pre_auth_user` VALUES ('1', 'admin', '7e41fa2be2f1ca7519510535f4a22679', '1', '127.0.0.1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `pre_user`
-- ----------------------------
DROP TABLE IF EXISTS `pre_user`;
CREATE TABLE `pre_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `password` varchar(250) NOT NULL COMMENT '密码',
  `avater` varchar(80) NOT NULL COMMENT '头像',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：0禁用  1正常',
  `description` varchar(150) NOT NULL COMMENT '个人介绍',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` varchar(15) NOT NULL COMMENT '注册IP',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `pre_user_login`
-- ----------------------------
DROP TABLE IF EXISTS `pre_user_login`;
CREATE TABLE `pre_user_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL NULL DEFAULT '0',
  `login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户登录日志';

-- ----------------------------
--  Table structure for `pre_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `pre_user_oauth`;
CREATE TABLE `pre_user_oauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT 'oauth类型：qq,wb,wx',
  `uname` varchar(40) NOT NULL DEFAULT '',
  `openid` varchar(40) NOT NULL DEFAULT '',
  `accesstoken` varchar(180) NOT NULL DEFAULT '',
  `refreshtoken` varchar(180) NOT NULL DEFAULT '',
  `headimg` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `unionid` varchar(40) NOT NULL DEFAULT '' COMMENT '微信用户统一标示符',
  `ctime` int(10) unsigned NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方授权登录用户';

-- ----------------------------
--  Table structure for `pre_order`
-- ----------------------------
DROP TABLE IF EXISTS `pre_order`;
CREATE TABLE `pre_order` (
  `order_sn` char(18) NOT NULL COMMENT '订单号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单用户id',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '下单用户名',
  `amount` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下订单时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  PRIMARY KEY (`order_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
--  Table structure for `pre_order_alipay`
-- ----------------------------
DROP TABLE IF EXISTS `pre_order_alipay`;
CREATE TABLE `pre_order_alipay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付宝回执单主键id',
  `product_order_sn` bigint(15) NOT NULL COMMENT '订单号',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '支付金额',
  `alipay_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '阿里支付单号',
  `buyer_email` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者邮箱',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `detail` text NOT NULL COMMENT '详细内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='支付宝订单表';

SET FOREIGN_KEY_CHECKS = 1;
