<?php

session_start();
if(!isset($_SESSION['user'])||empty($_SESSION['user'])){
    header('location:login.php');
}
include_once './lib/fun.php';
$user=$_SESSION['user'];
$username=$user['username'];
//校验url中商品ID
$goodsId=isset($_GET['id'])&&is_numeric($_GET['id'])?intval($_GET['id']):'';
if(!$goodsId){
    echo '<script>alert("参数非法");location:index.php</script>';
}
$con=mysqli_connect('127.0.0.1','root','','mall');
if(!$con){
    mysqli_errno();
}
$sql="SELECT * from goods where ID ='$goodsId'LIMIT 1";


$obj=mysqli_query($con,$sql);
if(!$goods = mysqli_fetch_assoc($obj)){
    echo '<script>alert("画品不存在！");location:index.php</script>';
}
$fabuid=$goods['user_id'];
$sqluser="SELECT * from user where ID = '$fabuid' LIMIT 1";

$fabures=mysqli_query($con,$sqluser);
if(!$fabuinfo = mysqli_fetch_assoc($fabures)){
    echo '<script>alert("查无此人！");location:index.php</script>';
}
$fabuname=$fabuinfo['username'];
unset($sql,$res,$obj);
$sql="update goods set view = view+1 where ID='$goodsId'LIMIT 1";
$obj=mysqli_query($con,$sql);
//var_dump(mysqli_affected_rows($con));影响行数

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>M-GALLARY|imooc</title>
    <link rel="stylesheet" type="text/css" href="./static/css/common.css" />
    <link rel="stylesheet" type="text/css" href="./static/css/detail.css" />
</head>
<body class="bgf8">
<div class="header">
    <div class="logo f1">
        <img src="./static/image/logo.png">
    </div>
    <div class="auth fr">
        <ul>
            <?php if($user) { echo  " <li>用户：$username</li>
            <li><a href='logout.php'>退出</a></li>";
            }
              else{
                echo "<li><a href='login.php'>登录</a></a></li><li><a href='register.php'>注册</a></a></li>";
              }


            ?>
        </ul>
    </div>
</div>
<div class="content">
    <div class="section" style="margin-top:20px;">
        <div class="width1200">
            <div class="fl"><img src="<?php echo $goods['pic']?>" width="720px" height="432px"/></div>
            <div class="fl sec_intru_bg">
                <dl>
                    <dt><?php echo $goods['goodsname']?></dt>
                    <dd>
                        <p>发布人：<span><?php echo $fabuname?></span></p>
                        <p>发布时间：<span><?php echo date('Y年m月d日',$goods['create_time'])?></span></p>
                        <p>修改时间：<span><?php echo date('Y年m月d日',$goods['updata_time'])?></span></p>
                        <p>浏览次数：<span><?php echo $goods['view']?></span></p>
                    </dd>
                </dl>
                <ul>
                    <li>售价：<br/><span class="price"><?php echo $goods['price']?></span>元</li>
                    <li class="btn"><a href="javascript:;" class="btn btn-bg-red" style="margin-left:38px;">立即购买</a></li>
                    <li class="btn"><a href="javascript:;" class="btn btn-sm-white" style="margin-left:8px;">收藏</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="secion_words">
        <div class="width1200">
            <div class="secion_wordsCon">
                <?php echo $goods['content']?>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <p><span>慕天大网络科技</span>©2018 CREATE BY MUTIANDA.COM</p>
</div>
</div>
</body>
</html>

