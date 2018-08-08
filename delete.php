<?php
/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2018/8/7
 * Time: 14:50
 */
session_start();
if(!isset($_SESSION['user'])&&empty($_SESSION['user'])){
    header('location:login.php');
    exit;
}
$userid=$_SESSION['user']['ID'];
//校验url中商品ID
$goodsId=isset($_GET['id'])&&is_numeric($_GET['id'])?intval($_GET['id']):'';
if(!$goodsId){
    echo '<script>alert("参数非法");location:index.php</script>';
}
$con=mysqli_connect('127.0.0.1','root','','mall');
if(!$con){
    mysqli_errno();
}
$sql="SELECT ID from goods where ID ='$goodsId'LIMIT 1";

$obj=mysqli_query($con,$sql);
if(!$goods = mysqli_fetch_assoc($obj)){
    echo '<script>alert("画品不存在！");location:index.php</script>';
}
$sql="delete from goods where ID='$goodsId'";
if($res=mysqli_query($con,$sql)){
    echo '<script>alert("删除成功")</script>';
    header('location:index.php');
}else{
    echo '<script>alert("删除失败")</script>';
    header('location:index.php');
}
