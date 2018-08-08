<?php
session_start();

if(!isset($_SESSION['user'])&&empty($_SESSION['user'])){
  header('location:login.php');
}else{
$username=$_SESSION['user']['username'];
}
$page=isset($_GET['page'])?intval($_GET['page']):1;
$page=max($page,1);
$pagesize=6;
$offset=($page-1)*$pagesize;

$con=mysqli_connect('127.0.0.1','root','','mall');
if(!$con){
    mysqli_errno();
}
$test="select COUNT(ID) AS nums FROM goods ";

$obx=mysqli_query($con,$test);
$res=mysqli_fetch_assoc($obx);
$total = isset($res['nums'])?$res['nums']:0;


$sql="select * from goods order by ID asc ,view desc limit {$offset} ,{$pagesize}";

$obj=mysqli_query($con,$sql);

$goods=array();
while ($res=mysqli_fetch_assoc($obj)){
    $goods[]=$res;
}



include_once './lib/fun.php';
$pages=pages($total,$page,$pagesize,6);




?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>M-GALLARY|首页</title>
    <link rel="stylesheet" type="text/css" href="./static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="./static/css/index.css"/>
</head>


<body>
<div class="header">
    <div class="logo f1">
        <img src="./static/image/logo.png">
    </div>
    <div class="auth fr">
        <ul>


            <li><span>用户：</span><?php echo $username ?></li>
            <li><a href="logout.php"> 退出</a></li>
            <li><button><a href="publish.php">上传商品</a></button></li>





        </ul>
    </div>
</div>

<div class="content">
    <div class="banner">
        <img class="banner-img" src="./static/image/welcome.png" width="732px" height="372" alt="图片描述">
    </div>
    <div class="img-content">
        <ul>
            <?php foreach ($goods as $v):?>
            <li>
                <img class="img-li-fix" src="<?php echo $v['pic'] ?>" alt="<?php echo $v['goodsname'] ?>">
                <div class="info">
                    <a href="detail.php?id=<?php echo $v['ID']?>"><h3 class="img_title"><?php echo $v['goodsname'] ?></h3></a>
                    <p><?php echo $v['des'] ?>
</p>
                    <div class="btn">
                        <a href="edit.php?id=<?php echo $v['ID']?>" class="edit">编辑</a>
                        <a href="delete.php?id=<?php echo $v['ID']?>" class="del">删除</a>
                    </div>
                </div>
            </li>
            <?php endforeach;?>
            </ul>

                </div>

<?php echo $pages; ?>
<!--    <div class="page-nav">-->
<!--        <ul>-->
<!--            <li><a href="#">首页</a></li>-->
<!--            <li><a href="#">上一页</a></li>-->
<!--            <li>...</li>-->
<!--            <li><a href="#">5</a></li>-->
<!--            <li><a href="#">6</a></li>-->
<!--            <li><span class="curr-page">7</span></li>-->
<!--            <li><a href="#">8</a></li>-->
<!--            <li><a href="#">9</a></li>-->
<!--            <li>...</li>-->
<!--            <li><a href="#">下一页</a></li>-->
<!--            <li><a href="#">尾页</a></li>-->
<!--        </ul>-->
<!--    </div>-->
</div>

<div class="footer">
    <p><span>M-GALLARY</span>©2017 POWERED BY IMOOC.INC</p>
</div>
</body>
<script src="./static/js/jquery-1.10.2.min.js"></script>
<script>
$(function () {
    $('.del').on('click',function () {
        if(confirm('确认删除该画品吗?'))
        {
            window.location = $(this).attr('href');
        }
        return false;
    })
    })
</script>


</html>
