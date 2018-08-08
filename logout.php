<?php
/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2018/8/7
 * Time: 15:54
 */
session_start();
if(!isset($_SESSION['user'])&&empty($_SESSION['user'])){
    echo'<script>alert("未登录")</script>';
}else{
    unset($_SESSION['user']);
    echo'<script>alert("未登录")</script>';
    header('location:login.php');

}
