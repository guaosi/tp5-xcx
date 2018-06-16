<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/7/30/0030
 * Time: 19:58
 */

namespace app\api\vailate;
use app\lib\exception\ParameterException;
use think\Exception;
use think\Validate;
use think\Request;
class BaseVailate extends Validate
{
  public function goCheck(){
      $request=Request::instance();
      $data=$request->param();
      $res=$this->batch()->check($data);
      if($res)
      {
       return true;
      }
      else
      {
          $e=new ParameterException([
              'msg'=>$this->error
          ]);
          throw $e;

      }
  }
    protected function IdMustPositive($value,$rule='',$data='',$field=''){
        if(is_numeric($value)&&is_int($value+0)&&($value+0>0))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected function isNotEmpty($value,$rule='',$data='',$field=''){
        if(empty($value)){
            return false;
        }
        return true;
    }
    protected function isMobile($value)
    {
        $rule = '^1(3|4|5|7|8)[0-9]\d{8}$^';
        $result = preg_match($rule, $value);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获得过滤后的数据
     *
     */
    public function getDataByValue(){
        $arrays=input('post.');
        if(array_key_exists('user_id',$arrays)||array_key_exists('uid',$arrays)){
            throw new ParameterException([
                'msg'=>'参数中含有非法的参数名user_id或uid'
            ]);
        }
        $dataArray=[];
        foreach ($this->rule as $key=>$val)
        {
            $dataArray[$key]=$arrays[$key];
        }
        return $dataArray;




    }
}