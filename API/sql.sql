/*
Navicat MySQL Data Transfer

Source Server         : 腾讯云
Source Server Version : 50556
Source Host           : 118.89.20.47:3306
Source Database       : zerg

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2018-06-14 22:45:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页置顶', '首页轮播图', null, null);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('1', '2', '25', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('2', '65', '6', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('3', '3', '11', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('5', '1', '10', '1', null, '1', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '果味', '6', null, null, null);
INSERT INTO `category` VALUES ('3', '蔬菜', '5', null, null, null);
INSERT INTO `category` VALUES ('4', '炒货', '7', null, null, null);
INSERT INTO `category` VALUES ('5', '点心', '4', null, null, null);
INSERT INTO `category` VALUES ('6', '粗茶', '8', null, null, null);
INSERT INTO `category` VALUES ('7', '淡饭', '9', null, null, null);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/banner-1a.png', '1', null, null);
INSERT INTO `image` VALUES ('2', '/banner-2a.png', '1', null, null);
INSERT INTO `image` VALUES ('3', '/banner-3a.png', '1', null, null);
INSERT INTO `image` VALUES ('4', '/category-cake.png', '1', null, null);
INSERT INTO `image` VALUES ('5', '/category-vg.png', '1', null, null);
INSERT INTO `image` VALUES ('6', '/category-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('7', '/category-fry-a.png', '1', null, null);
INSERT INTO `image` VALUES ('8', '/category-tea.png', '1', null, null);
INSERT INTO `image` VALUES ('9', '/category-rice.png', '1', null, null);
INSERT INTO `image` VALUES ('10', '/product-dryfruit@1.png', '1', null, null);
INSERT INTO `image` VALUES ('13', '/product-vg@1.png', '1', null, null);
INSERT INTO `image` VALUES ('14', '/product-rice@6.png', '1', null, null);
INSERT INTO `image` VALUES ('16', '/1@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('17', '/2@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('18', '/3@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('19', '/detail-1@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('20', '/detail-2@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('21', '/detail-3@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('22', '/detail-4@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('23', '/detail-5@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('24', '/detail-6@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('25', '/detail-7@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('26', '/detail-8@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('27', '/detail-9@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('28', '/detail-11@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('29', '/detail-10@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('31', '/product-rice@1.png', '1', null, null);
INSERT INTO `image` VALUES ('32', '/product-tea@1.png', '1', null, null);
INSERT INTO `image` VALUES ('33', '/product-dryfruit@2.png', '1', null, null);
INSERT INTO `image` VALUES ('36', '/product-dryfruit@3.png', '1', null, null);
INSERT INTO `image` VALUES ('37', '/product-dryfruit@4.png', '1', null, null);
INSERT INTO `image` VALUES ('38', '/product-dryfruit@5.png', '1', null, null);
INSERT INTO `image` VALUES ('39', '/product-dryfruit-a@6.png', '1', null, null);
INSERT INTO `image` VALUES ('40', '/product-dryfruit@7.png', '1', null, null);
INSERT INTO `image` VALUES ('41', '/product-rice@2.png', '1', null, null);
INSERT INTO `image` VALUES ('42', '/product-rice@3.png', '1', null, null);
INSERT INTO `image` VALUES ('43', '/product-rice@4.png', '1', null, null);
INSERT INTO `image` VALUES ('44', '/product-fry@1.png', '1', null, null);
INSERT INTO `image` VALUES ('45', '/product-fry@2.png', '1', null, null);
INSERT INTO `image` VALUES ('46', '/product-fry@3.png', '1', null, null);
INSERT INTO `image` VALUES ('47', '/product-tea@2.png', '1', null, null);
INSERT INTO `image` VALUES ('48', '/product-tea@3.png', '1', null, null);
INSERT INTO `image` VALUES ('49', '/1@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('50', '/2@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('51', '/3@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('52', '/product-cake@1.png', '1', null, null);
INSERT INTO `image` VALUES ('53', '/product-cake@2.png', '1', null, null);
INSERT INTO `image` VALUES ('54', '/product-cake-a@3.png', '1', null, null);
INSERT INTO `image` VALUES ('55', '/product-cake-a@4.png', '1', null, null);
INSERT INTO `image` VALUES ('56', '/product-dryfruit@8.png', '1', null, null);
INSERT INTO `image` VALUES ('57', '/product-fry@4.png', '1', null, null);
INSERT INTO `image` VALUES ('58', '/product-fry@5.png', '1', null, null);
INSERT INTO `image` VALUES ('59', '/product-rice@5.png', '1', null, null);
INSERT INTO `image` VALUES ('60', '/product-rice@7.png', '1', null, null);
INSERT INTO `image` VALUES ('62', '/detail-12@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('63', '/detail-13@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('65', '/banner-4a.png', '1', null, null);
INSERT INTO `image` VALUES ('66', '/product-vg@4.png', '1', null, null);
INSERT INTO `image` VALUES ('67', '/product-vg@5.png', '1', null, null);
INSERT INTO `image` VALUES ('68', '/product-vg@2.png', '1', null, null);
INSERT INTO `image` VALUES ('69', '/product-vg@3.png', '1', null, null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  `form_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'A804144493601798', '1', null, '1501814449', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501814449', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('2', 'A804593482272238', '1', null, '1501859348', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859348', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('3', 'A804593721356969', '1', null, '1501859372', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859372', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('4', 'A804593741954743', '1', null, '1501859374', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859374', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('5', 'A804593755323796', '1', null, '1501859375', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859375', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('6', 'A804593766024727', '1', null, '1501859376', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859376', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('7', 'A804593777372665', '1', null, '1501859377', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859377', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('8', 'A804593784920806', '1', null, '1501859378', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859378', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('9', 'A804593792567261', '1', null, '1501859379', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859379', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('10', 'A804593792623323', '1', null, '1501859379', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859379', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('11', 'A804593793696954', '1', null, '1501859379', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859379', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('12', 'A804593797743957', '1', null, '1501859379', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859379', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('13', 'A804593798895741', '1', null, '1501859379', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859379', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('14', 'A804593800265976', '1', null, '1501859380', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859380', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('15', 'A804593800395084', '1', null, '1501859380', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859380', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('16', 'A804593800695789', '1', null, '1501859380', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859380', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('17', 'A804593801451422', '1', null, '1501859380', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859380', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('18', 'A804593805370050', '1', null, '1501859380', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859380', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('19', 'A804593806590908', '1', null, '1501859380', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1501859380', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\",\"city\":\"\\u798f\\u5dde\",\"country\":\"\\u4ed3\\u5c71\\u533a\",\"detail\":\"\\u9f99\"}', null, null);
INSERT INTO `order` VALUES ('20', 'A807976080976740', '1', null, '1502097608', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502097608', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('21', 'A807976098407353', '1', null, '1502097609', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502097609', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('22', 'A807066101056185', '1', null, '1502106610', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106610', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('23', 'A807066812079852', '1', null, '1502106681', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106681', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('24', 'A807067624128986', '1', null, '1502106762', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106762', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('25', 'A807069169066803', '1', null, '1502106916', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106916', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('26', 'A807069384686881', '1', null, '1502106938', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106938', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('27', 'A807069688857762', '1', null, '1502106968', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106968', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('28', 'A807069757813758', '1', null, '1502106975', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502106975', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('29', 'A807070069493590', '1', null, '1502107006', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107006', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('30', 'A807070398035958', '1', null, '1502107039', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107039', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('31', 'A807071383143824', '1', null, '1502107138', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107138', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('32', 'A807073427855506', '1', null, '1502107342', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107342', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('33', 'A807073461224068', '1', null, '1502107346', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107346', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('34', 'A807073765485766', '1', null, '1502107376', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107376', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('35', 'A807074169439232', '1', null, '1502107416', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107416', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('36', 'A807074408206075', '1', null, '1502107440', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107440', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('37', 'A807074772422423', '1', null, '1502107477', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107477', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('38', 'A807076775748606', '1', null, '1502107677', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502107677', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('39', 'A807080094525962', '1', null, '1502108009', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502108009', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('40', 'A807080112980705', '1', null, '1502108011', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502108011', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('41', 'A807082093059862', '1', null, '1502108209', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502108209', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('42', 'A807082962865163', '1', null, '1502108296', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1502108296', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('43', 'A807106221559628', '1', null, '1502110622', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '2', '1502110622', '[{\"id\":2,\"haveStock\":true,\"count\":2,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('44', 'A807107877995226', '1', null, '1502110787', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '2', '1502110787', '[{\"id\":2,\"haveStock\":true,\"count\":2,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('45', 'A807108157341546', '1', null, '1502110815', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-rice@1.png', '素米 327克', '2', '1502110815', '[{\"id\":3,\"haveStock\":true,\"count\":2,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('46', 'A807108851208127', '1', null, '1502110885', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-rice@1.png', '素米 327克', '1', '1502110885', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('47', 'A807109669709374', '1', null, '1502110966', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-rice@1.png', '素米 327克', '1', '1502110966', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('48', 'A807110154992965', '1', null, '1502111015', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502111015', '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('49', 'A807116563839080', '1', null, '1502111656', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502111656', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('50', 'A807117266319321', '1', null, '1502111726', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-rice@1.png', '素米 327克', '1', '1502111726', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('51', 'A807117861658573', '1', null, '1502111786', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1502111786', '[{\"id\":11,\"haveStock\":true,\"count\":1,\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('52', 'A807118256402485', '1', null, '1502111825', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502182395', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('53', 'A807131358393573', '1', null, '1502113135', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@3.png', '夏日芒果 3个等', '2', '1502113135', '[{\"id\":8,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit@3.png\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01},{\"id\":11,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit-a@6.png\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('54', 'A807138481331899', '1', null, '1502113848', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502113848', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('55', 'A808613296869969', '1', null, '1502161329', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502161329', '[{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('56', 'A808616009826872', '1', null, '1502161600', '0.05', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克等', '5', '1502164486', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01},{\"id\":8,\"haveStock\":true,\"count\":4,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit@3.png\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.04}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('57', 'A808646683059236', '1', null, '1502164668', '0.02', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@1.png', '小明的妙脆角 120克', '2', '1502168213', '[{\"id\":25,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@1.png\",\"name\":\"\\u5c0f\\u660e\\u7684\\u5999\\u8106\\u89d2 120\\u514b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('58', 'A808649959203091', '1', null, '1502164995', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502165073', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('59', 'A808651511592566', '1', null, '1502165151', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502166119', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('60', 'A808660909982458', '1', null, '1502166091', '0.02', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '2', '1502166097', '[{\"id\":6,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('61', 'A808661819485492', '1', null, '1502166181', '0.03', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克等', '3', '1502166188', '[{\"id\":6,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.02},{\"id\":9,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit@4.png\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('62', 'A808679370016285', '1', null, '1502167937', '0.02', '2', 'https://xcxapi.guaosi.com.cn/images/product-rice@1.png', '素米 327克', '2', '1502167952', '[{\"id\":3,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-rice@1.png\",\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('63', 'A808824487630920', '1', null, '1502182448', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502185292', '[{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, 'the formId is a mock one');
INSERT INTO `order` VALUES ('64', 'A808828906091568', '1', null, '1502182890', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502463532', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('65', 'A808830267574789', '1', null, '1502183026', '0.01', '3', 'http://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502463527', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('66', 'A808832110744733', '1', null, '1502183211', '0.02', '3', 'http://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋等', '2', '1502463252', '[{\"id\":18,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-fry@2.png\",\"name\":\"\\u6625\\u6ce5\\u897f\\u74dc\\u5b50 128\\u514b\",\"totalPrice\":0.01},{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('67', 'A808853120551339', '1', null, '1502185312', '0.01', '3', 'http://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502192664', '[{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, 'the formId is a mock one');
INSERT INTO `order` VALUES ('68', 'A808855952708766', '1', null, '1502185595', '0.02', '1', 'http://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋等', '2', '1502185595', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01},{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, null);
INSERT INTO `order` VALUES ('69', 'A808861715619671', '1', null, '1502186171', '0.02', '3', 'http://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '2', '1502192613', '[{\"id\":4,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"http:\\/\\/z.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u67d0\\u5df7\\u67d0\\u53f7\"}', null, 'the formId is a mock one');
INSERT INTO `order` VALUES ('70', 'A811621020898299', '1', null, '1502462102', '0.02', '3', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '2', '1502465468', '[{\"id\":4,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, 'c9a8a0eea883823c94ca260e6ac05571');
INSERT INTO `order` VALUES ('71', 'A811631637569897', '1', null, '1502463163', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1502465457', '[{\"id\":11,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit-a@6.png\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, '31e24eb5aa7de807f486fe3ff0ff1e1f');
INSERT INTO `order` VALUES ('72', 'A811637025094382', '1', null, '1502463702', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502465454', '[{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, '8c4c6aac5443e906f6f85ccc4d9b04fa');
INSERT INTO `order` VALUES ('73', 'A811647703513252', '1', null, '1502464770', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502465180', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, '08f0dff43115c3b5f9a3f589bbd3c61d');
INSERT INTO `order` VALUES ('74', 'A811652505208288', '1', null, '1502465250', '0.02', '3', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '2', '1502465299', '[{\"id\":4,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, '1a1c69b5c46a2356701539d164834b6c');
INSERT INTO `order` VALUES ('75', 'A811654924210466', '1', null, '1502465492', '0.04', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个等', '4', '1502465504', '[{\"id\":2,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.02},{\"id\":9,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@4.png\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, 'cd7a2530ef2e7fa66f0d1d310d29a8dc');
INSERT INTO `order` VALUES ('76', 'A811668648128331', '4', null, '1502466864', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1502466864', '[{\"id\":4,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":3,\"name\":\"\\u4f20\\u5174\",\"mobile\":\"15060572813\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"111\"}', null, null);
INSERT INTO `order` VALUES ('77', 'A811669047617134', '4', null, '1502466904', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1502466904', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":3,\"name\":\"\\u4f20\\u5174\",\"mobile\":\"15060572813\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"111\"}', null, null);
INSERT INTO `order` VALUES ('78', 'A811669347348580', '4', null, '1502466934', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@3.png', '夏日芒果 3个', '1', '1502613770', '[{\"id\":8,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@3.png\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":3,\"name\":\"\\u4f20\\u5174\",\"mobile\":\"15060572813\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"111\"}', null, '5657a65470b3b771b171786fbcb8a4f3');
INSERT INTO `order` VALUES ('79', 'A812674944028947', '1', null, '1502467494', '0.02', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@2.png', '春生龙眼 500克', '2', '1502467494', '[{\"id\":5,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@2.png\",\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, null);
INSERT INTO `order` VALUES ('80', 'A812678398945058', '5', null, '1502467839', '0.03', '3', 'https://xcxapi.guaosi.com.cn/images/product-tea@1.png', '红袖枸杞 6克*3袋等', '3', '1502467899', '[{\"id\":4,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-tea@1.png\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.02},{\"id\":8,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@3.png\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":4,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"13123329831\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u4ed3\\u5c71\\u533a\\u9ad8\\u6e56\\u9633\\u5149\\u5e7c\\u513f\\u56ed\\u897f\\u5317(\\u9f99\\u9662\\u8def\\u4e1c)\"}', null, '9d2207b71edb17f67fc3dbff1f7e5eb5');
INSERT INTO `order` VALUES ('81', 'A813062666693276', '1', null, '1502606266', '0.02', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@7.png', '珍奇异果 3个', '2', '1502608183', '[{\"id\":12,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@7.png\",\"name\":\"\\u73cd\\u5947\\u5f02\\u679c 3\\u4e2a\",\"totalPrice\":0.02}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, '3ce0bc784d7c6c21cfbb226d455b2abe');
INSERT INTO `order` VALUES ('82', 'A813102808323119', '4', null, '1502610280', '0.02', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@2.png', '春生龙眼 500克', '2', '1502613767', '[{\"id\":5,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@2.png\",\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"totalPrice\":0.02}]', '{\"id\":3,\"name\":\"\\u4f20\\u5174\",\"mobile\":\"15060572813\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"111\"}', null, 'cf37d14dac5d4a4827ff62ac3d6879bf');
INSERT INTO `order` VALUES ('83', 'A816272300391717', '22', null, '1502827230', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1502827230', '[{\"id\":6,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-cake@2.png\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":7,\"name\":\".\",\"mobile\":\"18542584255\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u8def\\u5f84\\n\"}', null, null);
INSERT INTO `order` VALUES ('84', 'A823823917202463', '4', null, '1503482391', '0.04', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '4', '1503482437', '[{\"id\":2,\"haveStock\":true,\"count\":4,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.04}]', '{\"id\":3,\"name\":\"\\u4f20\\u5174\",\"mobile\":\"15060572813\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"111\"}', null, 'ee4333803f29aad4dd69d0fb4f7e99f5');
INSERT INTO `order` VALUES ('85', 'A902650630265545', '1', null, '1504365063', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1504695884', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, '1504365065843');
INSERT INTO `order` VALUES ('86', 'A906925994599292', '4', null, '1504692599', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1504695788', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@5.png\",\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":3,\"name\":\"\\u4f20\\u5174\",\"mobile\":\"15060572813\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"111\"}', null, '1504692603508');
INSERT INTO `order` VALUES ('87', 'A906959012558319', '1', null, '1504695901', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1504695901', '[{\"id\":11,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit-a@6.png\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, null);
INSERT INTO `order` VALUES ('88', 'A906959030057333', '1', null, '1504695903', '0.01', '3', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1504695914', '[{\"id\":11,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit-a@6.png\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"id\":1,\"name\":\"\\u90ed\\u65b0\",\"mobile\":\"13123329831\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u8fbe\\u7406\\u6d3b\\u52a8\\u4e2d\\u5fc3\"}', null, 'f1e6d8feb42bb331d683f6713e886e60');
INSERT INTO `order` VALUES ('89', 'A917405868878573', '40', null, '1505640586', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@4.png', '冬木红枣 500克', '1', '1505640604', '[{\"id\":9,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@4.png\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"id\":8,\"name\":\"\\u54bf\\u5440\\u54bf\\u5440\\u5466\",\"mobile\":\"13131313131\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u6b66\\u5b89\\u5e02\",\"detail\":\"\\u77ff\\u5efa\\u8def\"}', null, '1505640603354');
INSERT INTO `order` VALUES ('90', 'A921827737534006', '10', null, '1505982773', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-cake@1.png', '小明的妙脆角 120克', '1', '1505982781', '[{\"id\":25,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-cake@1.png\",\"name\":\"\\u5c0f\\u660e\\u7684\\u5999\\u8106\\u89d2 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":9,\"name\":\"\\u4fe1\\u78ca\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u897f\\u58ee\\u65cf\\u81ea\\u6cbb\\u533a\",\"city\":\"\\u5357\\u5b81\\u5e02\",\"country\":\"\\u897f\\u4e61\\u5858\\u533a\",\"detail\":\" \"}', null, 'a46c1aa96bd6488b3b4d64bb1dd6700c');
INSERT INTO `order` VALUES ('91', 'A921893474713004', '10', null, '1505989347', '0.04', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit-a@6.png', '贵妃笑 100克', '4', '1505989357', '[{\"id\":11,\"haveStock\":true,\"count\":4,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit-a@6.png\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.04}]', '{\"id\":9,\"name\":\"\\u4fe1\\u78ca\",\"mobile\":\"18888888888\",\"province\":\"\\u5e7f\\u897f\\u58ee\\u65cf\\u81ea\\u6cbb\\u533a\",\"city\":\"\\u5357\\u5b81\\u5e02\",\"country\":\"\\u897f\\u4e61\\u5858\\u533a\",\"detail\":\" \"}', null, 'c340716a6a13c366f0d7f91a8b1e26b9');
INSERT INTO `order` VALUES ('92', 'AA05165484032750', '27', null, '1507216548', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1507216561', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":6,\"name\":\"\\u9648\\u4ece\\u6da6\",\"mobile\":\"13960033835\",\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u6f33\\u5dde\\u5e02\",\"country\":\"\\u8297\\u57ce\\u533a\",\"detail\":\"\\u798f\\u5efa\\u7701\\u6f33\\u5dde\\u5e02\\u8297\\u57ce\\u533a\\u95fd\\u5357\\u5e08\\u8303\\u5927\\u5b66\\u745e\\u4eac\\u516c\\u5bd3\"}', null, 'd4e3e5646727647f565afef6f2b8db55');
INSERT INTO `order` VALUES ('93', 'AC12882197620696', '52', null, '1513088219', '0.02', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@3.png', '夏日芒果 3个等', '2', '1513088262', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@5.png\",\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01},{\"id\":8,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@3.png\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1513088261405');
INSERT INTO `order` VALUES ('94', 'AC12883218905218', '52', null, '1513088321', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '1', '1513088330', '[{\"id\":10,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@5.png\",\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1513088329256');
INSERT INTO `order` VALUES ('95', 'AC12883929685481', '52', null, '1513088392', '0.03', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@5.png', '万紫千凤梨 300克', '3', '1513331412', '[{\"id\":10,\"haveStock\":true,\"count\":3,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@5.png\",\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.03}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1513331411139');
INSERT INTO `order` VALUES ('96', 'AC15313910077565', '52', null, '1513331391', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@2.png', '春生龙眼 500克', '1', '1513331396', '[{\"id\":5,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@2.png\",\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1513331395259');
INSERT INTO `order` VALUES ('97', 'AC15368585596054', '52', null, '1513336858', '0.03', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@4.png', '冬木红枣 500克等', '3', '1513336871', '[{\"id\":9,\"haveStock\":true,\"count\":2,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@4.png\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.02},{\"id\":10,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@5.png\",\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1513336871288');
INSERT INTO `order` VALUES ('98', 'AC20654760701942', '52', null, '1513765476', '0.01', '1', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@4.png', '冬木红枣 500克', '1', '1513765476', '[{\"id\":9,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@4.png\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, null);
INSERT INTO `order` VALUES ('99', 'B103598825524361', '52', null, '1514959882', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1514960454', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1514960453662');
INSERT INTO `order` VALUES ('100', 'B103604304684056', '51', null, '1514960430', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@2.png', '春生龙眼 500克', '1', '1514960434', '[{\"id\":5,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@2.png\",\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"totalPrice\":0.01}]', '{\"id\":12,\"name\":\"\\u7248\\u672c\",\"mobile\":\"13585866911\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"country\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"detail\":\"\\u4e0d\\u662f\\u5b9d\\u8d1d\"}', null, '1514960434065');
INSERT INTO `order` VALUES ('101', 'B103605183039528', '52', null, '1514960518', '0.01', '2', 'https://xcxapi.guaosi.com.cn/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1514960527', '[{\"id\":2,\"haveStock\":true,\"count\":1,\"price\":\"0.01\",\"main_img_url\":\"https:\\/\\/xcxapi.guaosi.com.cn\\/images\\/product-dryfruit@1.png\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":11,\"name\":\"\\u563f\\u563f\\u563f\",\"mobile\":\"13369655699\",\"province\":\"\\u6cb3\\u5317\\u7701\",\"city\":\"\\u90af\\u90f8\\u5e02\",\"country\":\"\\u5cf0\\u5cf0\\u77ff\\u533a\",\"detail\":\"\\u597d\\u5427v\\u5531\\u6b4c\"}', null, '1514960526600');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('2', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('3', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('4', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('5', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('6', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('7', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('8', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('9', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('10', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('11', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('12', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('13', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('14', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('15', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('16', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('17', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('18', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('19', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('1', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('2', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('3', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('4', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('5', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('6', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('7', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('8', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('9', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('10', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('11', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('12', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('13', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('14', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('15', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('16', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('17', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('18', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('19', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('43', '2', '2', null, null);
INSERT INTO `order_product` VALUES ('44', '2', '2', null, null);
INSERT INTO `order_product` VALUES ('58', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('64', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('65', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('73', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('75', '2', '2', null, null);
INSERT INTO `order_product` VALUES ('77', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('84', '2', '4', null, null);
INSERT INTO `order_product` VALUES ('85', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('92', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('99', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('101', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('45', '3', '2', null, null);
INSERT INTO `order_product` VALUES ('46', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('47', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('50', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('62', '3', '2', null, null);
INSERT INTO `order_product` VALUES ('48', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('55', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('63', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('66', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('67', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('68', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('69', '4', '2', null, null);
INSERT INTO `order_product` VALUES ('70', '4', '2', null, null);
INSERT INTO `order_product` VALUES ('72', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('74', '4', '2', null, null);
INSERT INTO `order_product` VALUES ('76', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('80', '4', '2', null, null);
INSERT INTO `order_product` VALUES ('79', '5', '2', null, null);
INSERT INTO `order_product` VALUES ('82', '5', '2', null, null);
INSERT INTO `order_product` VALUES ('96', '5', '1', null, null);
INSERT INTO `order_product` VALUES ('100', '5', '1', null, null);
INSERT INTO `order_product` VALUES ('49', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('52', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('54', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('56', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('59', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('60', '6', '2', null, null);
INSERT INTO `order_product` VALUES ('61', '6', '2', null, null);
INSERT INTO `order_product` VALUES ('68', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('83', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('53', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('56', '8', '4', null, null);
INSERT INTO `order_product` VALUES ('78', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('80', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('93', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('61', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('75', '9', '2', null, null);
INSERT INTO `order_product` VALUES ('89', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('97', '9', '2', null, null);
INSERT INTO `order_product` VALUES ('98', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('20', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('21', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('22', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('23', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('24', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('25', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('26', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('27', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('28', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('29', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('30', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('31', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('32', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('33', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('34', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('35', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('36', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('37', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('38', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('39', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('40', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('41', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('42', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('86', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('93', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('94', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('95', '10', '3', null, null);
INSERT INTO `order_product` VALUES ('97', '10', '1', null, null);
INSERT INTO `order_product` VALUES ('51', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('53', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('71', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('87', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('88', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('91', '11', '4', null, null);
INSERT INTO `order_product` VALUES ('81', '12', '2', null, null);
INSERT INTO `order_product` VALUES ('66', '18', '1', null, null);
INSERT INTO `order_product` VALUES ('57', '25', '2', null, null);
INSERT INTO `order_product` VALUES ('90', '25', '1', null, null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '芹菜 半斤', '0.01', '0', null, '3', '/product-vg@1.png', '1', null, null, null, '13');
INSERT INTO `product` VALUES ('2', '梨花带雨 3个', '0.01', '999', null, '2', '/product-dryfruit@1.png', '1', null, null, null, '10');
INSERT INTO `product` VALUES ('3', '素米 327克', '0.01', '996', null, '7', '/product-rice@1.png', '1', null, null, null, '31');
INSERT INTO `product` VALUES ('4', '红袖枸杞 6克*3袋', '0.01', '998', null, '6', '/product-tea@1.png', '1', null, null, null, '32');
INSERT INTO `product` VALUES ('5', '春生龙眼 500克', '0.01', '995', null, '2', '/product-dryfruit@2.png', '1', null, null, null, '33');
INSERT INTO `product` VALUES ('6', '小红的猪耳朵 120克', '0.01', '997', null, '5', '/product-cake@2.png', '1', null, null, null, '53');
INSERT INTO `product` VALUES ('7', '泥蒿 半斤', '0.01', '998', null, '3', '/product-vg@2.png', '1', null, null, null, '68');
INSERT INTO `product` VALUES ('8', '夏日芒果 3个', '0.01', '995', null, '2', '/product-dryfruit@3.png', '1', null, null, null, '36');
INSERT INTO `product` VALUES ('9', '冬木红枣 500克', '0.01', '996', null, '2', '/product-dryfruit@4.png', '1', null, null, null, '37');
INSERT INTO `product` VALUES ('10', '万紫千凤梨 300克', '0.01', '999', null, '2', '/product-dryfruit@5.png', '1', null, null, null, '38');
INSERT INTO `product` VALUES ('11', '贵妃笑 100克', '0.01', '994', null, '2', '/product-dryfruit-a@6.png', '1', null, null, null, '39');
INSERT INTO `product` VALUES ('12', '珍奇异果 3个', '0.01', '999', null, '2', '/product-dryfruit@7.png', '1', null, null, null, '40');
INSERT INTO `product` VALUES ('13', '绿豆 125克', '0.01', '999', null, '7', '/product-rice@2.png', '1', null, null, null, '41');
INSERT INTO `product` VALUES ('14', '芝麻 50克', '0.01', '999', null, '7', '/product-rice@3.png', '1', null, null, null, '42');
INSERT INTO `product` VALUES ('15', '猴头菇 370克', '0.01', '999', null, '7', '/product-rice@4.png', '1', null, null, null, '43');
INSERT INTO `product` VALUES ('16', '西红柿 1斤', '0.01', '999', null, '3', '/product-vg@3.png', '1', null, null, null, '69');
INSERT INTO `product` VALUES ('17', '油炸花生 300克', '0.01', '999', null, '4', '/product-fry@1.png', '1', null, null, null, '44');
INSERT INTO `product` VALUES ('18', '春泥西瓜子 128克', '0.01', '997', null, '4', '/product-fry@2.png', '1', null, null, null, '45');
INSERT INTO `product` VALUES ('19', '碧水葵花籽 128克', '0.01', '999', null, '4', '/product-fry@3.png', '1', null, null, null, '46');
INSERT INTO `product` VALUES ('20', '碧螺春 12克*3袋', '0.01', '999', null, '6', '/product-tea@2.png', '1', null, null, null, '47');
INSERT INTO `product` VALUES ('21', '西湖龙井 8克*3袋', '0.01', '998', null, '6', '/product-tea@3.png', '1', null, null, null, '48');
INSERT INTO `product` VALUES ('22', '梅兰清花糕 1个', '0.01', '997', null, '5', '/product-cake-a@3.png', '1', null, null, null, '54');
INSERT INTO `product` VALUES ('23', '清凉薄荷糕 1个', '0.01', '998', null, '5', '/product-cake-a@4.png', '1', null, null, null, '55');
INSERT INTO `product` VALUES ('25', '小明的妙脆角 120克', '0.01', '999', null, '5', '/product-cake@1.png', '1', null, null, null, '52');
INSERT INTO `product` VALUES ('26', '红衣青瓜 混搭160克', '0.01', '999', null, '2', '/product-dryfruit@8.png', '1', null, null, null, '56');
INSERT INTO `product` VALUES ('27', '锈色瓜子 100克', '0.01', '998', null, '4', '/product-fry@4.png', '1', null, null, null, '57');
INSERT INTO `product` VALUES ('28', '春泥花生 200克', '0.01', '999', null, '4', '/product-fry@5.png', '1', null, null, null, '58');
INSERT INTO `product` VALUES ('29', '冰心鸡蛋 2个', '0.01', '999', null, '7', '/product-rice@5.png', '1', null, null, null, '59');
INSERT INTO `product` VALUES ('30', '八宝莲子 200克', '0.01', '999', null, '7', '/product-rice@6.png', '1', null, null, null, '14');
INSERT INTO `product` VALUES ('31', '深涧木耳 78克', '0.01', '999', null, '7', '/product-rice@7.png', '1', null, null, null, '60');
INSERT INTO `product` VALUES ('32', '土豆 半斤', '0.01', '999', null, '3', '/product-vg@4.png', '1', null, null, null, '66');
INSERT INTO `product` VALUES ('33', '青椒 半斤', '0.01', '999', null, '3', '/product-vg@5.png', '1', null, null, null, '67');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('4', '19', null, '1', '11');
INSERT INTO `product_image` VALUES ('5', '20', null, '2', '11');
INSERT INTO `product_image` VALUES ('6', '21', null, '3', '11');
INSERT INTO `product_image` VALUES ('7', '22', null, '4', '11');
INSERT INTO `product_image` VALUES ('8', '23', null, '5', '11');
INSERT INTO `product_image` VALUES ('9', '24', null, '6', '11');
INSERT INTO `product_image` VALUES ('10', '25', null, '7', '11');
INSERT INTO `product_image` VALUES ('11', '26', null, '8', '11');
INSERT INTO `product_image` VALUES ('12', '27', null, '9', '11');
INSERT INTO `product_image` VALUES ('13', '28', null, '11', '11');
INSERT INTO `product_image` VALUES ('14', '29', null, '10', '11');
INSERT INTO `product_image` VALUES ('18', '62', null, '12', '11');
INSERT INTO `product_image` VALUES ('19', '63', null, '13', '11');

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('1', '品名', '杨梅', '11', null, null);
INSERT INTO `product_property` VALUES ('2', '口味', '青梅味 雪梨味 黄桃味 菠萝味', '11', null, null);
INSERT INTO `product_property` VALUES ('3', '产地', '火星', '11', null, null);
INSERT INTO `product_property` VALUES ('4', '保质期', '180天', '11', null, null);
INSERT INTO `product_property` VALUES ('5', '品名', '梨子', '2', null, null);
INSERT INTO `product_property` VALUES ('6', '产地', '金星', '2', null, null);
INSERT INTO `product_property` VALUES ('7', '净含量', '100g', '2', null, null);
INSERT INTO `product_property` VALUES ('8', '保质期', '10天', '2', null, null);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '专题栏位一', '美味水果世界', '16', null, '49', null);
INSERT INTO `theme` VALUES ('2', '专题栏位二', '新品推荐', '17', null, '50', null);
INSERT INTO `theme` VALUES ('3', '专题栏位三', '做个干物女', '18', null, '18', null);

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '5');
INSERT INTO `theme_product` VALUES ('1', '8');
INSERT INTO `theme_product` VALUES ('1', '10');
INSERT INTO `theme_product` VALUES ('1', '12');
INSERT INTO `theme_product` VALUES ('2', '1');
INSERT INTO `theme_product` VALUES ('2', '2');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '5');
INSERT INTO `theme_product` VALUES ('2', '6');
INSERT INTO `theme_product` VALUES ('2', '16');
INSERT INTO `theme_product` VALUES ('2', '33');
INSERT INTO `theme_product` VALUES ('3', '15');
INSERT INTO `theme_product` VALUES ('3', '18');
INSERT INTO `theme_product` VALUES ('3', '19');
INSERT INTO `theme_product` VALUES ('3', '27');
INSERT INTO `theme_product` VALUES ('3', '30');
INSERT INTO `theme_product` VALUES ('3', '31');

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES ('1', 'admin', 'de48ad76dadd3d693eedeaa2713db7bb', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_address
-- ----------------------------