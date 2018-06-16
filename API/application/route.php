<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;




Route::get('api/:version/banner/:id','api/:version.Banner/getbanner');
Route::get('api/v2/banner/:id','api/v2.Banner/getbanner');

Route::get('api/:version/theme','api/:version.theme/getSimpleList');
Route::get('api/:version/theme/:id','api/:version.theme/getComplexOne');

Route::get('api/:version/product/:id','api/:version.product/getOne',[],['id'=>'\d+']);

Route::get('api/:version/product/recent','api/:version.product/getRecent');
Route::get('api/:version/product/by_category','api/:version.product/getAllByCategoryId');

//Route::group('api/:version/product',function (){
//   Route::get('/:id','api/:version.product/getOne',[],['id'=>'\d+']);
//    Route::get('/recent','api/:version.product/getRecent');
//    Route::get('/by_category','api/:version.product/getAllByCategoryId');
//});

Route::get('api/:version/category/all','api/:version.category/getAllCategory');
Route::post('api/:version/token/user','api/:version.token/gettoken');
Route::post('api/:version/token/verify','api/:version.token/verifyToken');
Route::post('api/:version/token/app','api/:version.token/getAppToken');


Route::post('api/:version/address','api/:version.Address/createOrSaveUser');
//Route::get('api/:version/second','api/:version.Address/second');

Route::get('api/:version/address','api/:version.address/getUserAddress');

Route::post('api/:version/order','api/:version.order/placeOrder');
Route::get('api/:version/order/by_user', 'api/:version.order/getSummaryByUser');
Route::get('api/:version/order/:id', 'api/:version.order/getDetail',[],['id'=>'\d+']);
Route::get('api/:version/order/paginate','api/:version.order/getSummaryAll');
Route::put('api/:version/order/delivery','api/:version.order/delivery');

Route::post('api/:version/pay/pre_order','api/:version.pay/getPreOrder');
Route::post('api/:version/pay/notify','api/:version.pay/reviceNotify');
Route::post('api/:version/pay/re_notify', 'api/:version.Pay/redirectNotify');
Route::post('api/:version/pay/successpay', 'api/:version.Pay/successpay',[],['id'=>'\d+']);