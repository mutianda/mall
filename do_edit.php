<?php
/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2018/8/6
 * Time: 16:24
 */
session_start();
if(!isset($_SESSION['user'])||empty($_SESSION['user'])){
    header('location:login.php');
    exit;
}
include_once './lib/fun.php';
$user=$_SESSION['user'];
if(!empty($_POST['name'])) {
    $con = mysqli_connect('127.0.0.1', 'root', '', 'mall');
    if (!$con) {
        die("Connection failed: " . mysqli_connect_error());
        mysqli_set_charset($conn, "utf8");
    }

    if (!$goodsId = intval($_POST['id'])) {
        echo '参数非法';
    }
    //根据ID校验商品

    $sql = "SELECT * from goods where ID ='$goodsId'LIMIT 1";

    $obj = mysqli_query($con, $sql);
    if (!$goods = mysqli_fetch_assoc($obj)) {
        echo '<script>alert("商品不存在！");location:index.php</script>';
    }


    $name = mysqli_real_escape_string($con, trim($_POST['name']));
    $price = intval($_POST['price']);
    $des = mysqli_real_escape_string($con, trim($_POST['des']));
    $content = mysqli_real_escape_string($con, trim($_POST['content']));
    $userId = $user['ID'];
    $file = $_FILES['file'];
    $now = $_SERVER['REQUEST_TIME'];
//检查上传文件是否合法
    $namelength = mb_strlen($name, 'utf-8');
    if ($namelength <= 0 || $namelength > 30) {
        echo '<script>alert("商品名1-30位")</script>';
    }

//
//    $update = array(
//        'goodsname' => $name,
//        'price' => $price,
//        'des' => $des,
//        'content' => $content
//    );
//
//    if ($_FILES['file']['size'] > 0) {
//        $pic = imgUpload($_FILES['file']);
//        $update['pic'] = $pic;
//    }
//
//    foreach ($update as $key => $value) {
//        if ($goods[$key] == $value) {
//            unset($update[$key]);
//        }
//    }
//    //对比数组是否有需要更新的字段
//    if (empty($update)) {
//        header('location:edit.php?');
//    }
//    //只更新数组
//    //更新sql
//    $updateSql = ' ';
//    foreach ($update as $key => $value) {
//        $updateSql .= "'{$key}'='{$value}',";
//
//    }3
//    $updateSql = rtrim($updateSql, ',');
//    var_dump($updateSql);
//
    unset($sql, $obj, $res);
    $sql = "UPDATE goods SET goodsname='$name',price='$price',des='$des',content='$content' WHERE  ID ='$goodsId'";
    if ($obj = mysqli_query($con, $sql)) {
        echo '<script>
alert("更新成功")</script>';
        header("refresh:3;url=detail.php?id=".$goodsId);


//header('location:detail.php?id='.$goodsId);
    } else {
        echo '<script>alert("更新失败")</script>';
        header("refresh:3;url=edit.php?id=".$goodsId);
    }

}

else{
        echo '<script>alert("路由非法！");location:  index.php</script>';
    }


