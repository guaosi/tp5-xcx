<?php

/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 20:17
 */
namespace app\api\behavior;
class CORS
{
    public function appInit(&$params)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: token,Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: POST,GET,PUT');
        if(request()->isOptions()){
            exit();
        }
    }
}