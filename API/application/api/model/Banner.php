<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/7/30/0030
 * Time: 21:31
 */

namespace app\api\model;

use think\Model;

class Banner extends Model
{
    protected $hidden=['update_time','delete_time'];
    public function item()
    {
        return $this->hasMany('banner_item', 'banner_id', 'id');
    }

    public static function getBannerById($id)
    {
        $res = self::with(['item', 'item.img'])->find($id);

        return $res;
    }
}