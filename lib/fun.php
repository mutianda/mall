<?php
/**初始数据化
 * Created by PhpStorm.
 * User: chen
 * Date: 2018/8/2
 * Time: 9:49
 */
function mysqlinit($host,$username,$password,$dbName){
$conn=mysqli_connect($host,$username,$password,$dbName);
if(!$conn){
    die("Connection failed: " . mysqli_connect_error());
}
    mysqli_set_charset($conn,"utf8");
return $conn;
}

function createPassword($password){
    if(!$password){
        return false;
    }
    return md5(md5($password).'mall');
}
function imgUpload($file){
    if(!is_uploaded_file($file['tmp_name'])){
        echo '<script>alert("请上传规范的图片！")</script>';

    }
    $type=$file['type'];
    if(!in_array($type,array("image/png","image/gif","image/jpeg"))){
        echo '<script>alert("请上传 png,jpeg,gif格式")<script>';
    }

    //上传目录
    $uploadPath='./static/file/';
    //上传访问URL
    $uploadPUrl='/static/file/';
    //上传文件夹
    $fileDir=date("Y/md/",$_SERVER['REQUEST_TIME']);
    //检查上传目录是否存在
    if(!is_dir($uploadPath.$fileDir )){
        mkdir($uploadPath .$fileDir,0777,true);
    }
    $ext=strtolower(pathinfo($file['name'],PATHINFO_EXTENSION));
    //将扩展名小写
    $img=uniqid().mt_rand(1000,9999).'.'.$ext;
    $imgPath=$uploadPath.$fileDir.$img;//物理地址
    $imgUrl='http://localhost:63342/mall'.$uploadPUrl.$fileDir.$img;
    //url地址

    //操作失败查看上传地址权限
    if(!move_uploaded_file($file['tmp_name'],$imgPath)){
        echo '<script>alert("无法上传，查看权限")<script>';
    }
    return $imgUrl;
}

//
//function pages($total,$currentpage,$pagesize,$show=6){
//    $pagestr='';
//    if($total>$pagesize){
//        //总页数
//        $totalpage= ceil($total/$pagesize);//向上取证
//        //当前页
//        $currentpage=$currentpage>$totalpage?$totalpage:$currentpage;
//        $from=max(1,$currentpage-intval($show/2));
//        $to=$from+$show-1;
//        //当前结束页
//
//
//
//        $pagestr.='<div class="page-nav">';
//        $pagestr.='<ul>';
//
//        if($currentpage>1){
//            $pagestr.="<li><a href='".pageurl(1)."'>首页</a></li>";
//            $pagestr.="<li><a href='".pageurl($currentpage-1)."'>上一页</a></li>";
//        }
//        if($to>$totalpage){
//            $to=$totalpage;
//            $from=max(1,$to-$show+1);
//
//        }
//        if($from>1){
//            $pagestr.='<li>...</li>';
//        }
//        for($i=$from;$i<=$to;$i++){
//            if($i!=$currentpage){
//                $pagestr.="<li><a href='".pageurl($i)."'>{$i}</a></li> ";
//            }
//            else{
//                $pagestr.="<li><span class='curr-page'>{$i}</span></li>";
//            }
//        }
//        if($to<$totalpage){
//            $pagestr.='<li>...</li>';
//        }
//
//         if($currentpage<$totalpage){
//             $pagestr.="<li><a href='".pageurl($currentpage+1)."'>下一页</a></li>";
//                $pagestr.="<li><a href='".pageurl($totalpage)."'>尾页 </a></li>";
//
//
//        }
// $pagestr.="<ul/>";
//        $pagestr.="<div/>";
//    }
//    return $pagestr;
//}
//function geturl(){
//    $url='';
//    $url.=$_SERVER['SERVER_PORT']==443?'https://':'http://';
//    $url.=$_SERVER['HTTP_HOST'];
//    $url.=$_SERVER['REQUEST_URI'];
//    return $url;
//}
//function pageurl($page,$url=''){
//    $url=empty($url)?geturl() :$url;
//    $pos=strpos($url,'?');//查询问号
//    if($pos==false){
//        $url.='?page='.$page;
//    }else{
//        $querystr=substr($url,$pos+1);
//        parse_str($querystr,$queryArr);
//        if(isset($queryArr['page'])){
//            unset($queryArr['page']);
//        }
//        $queryArr['page']=$page;
//       $str= http_build_query($queryArr);
//
//        $url=substr($url,0,$pos).'?'.$querystr;
//        var_dump($url);
//    }
//    return $url;
//
//}

function getUrl()
{
    $url = '';
    $url .= $_SERVER['SERVER_PORT'] == 443 ? 'https://' : 'http://';
    $url .= $_SERVER['HTTP_HOST'];
    $url .= $_SERVER['REQUEST_URI'];
    return $url;
}


/**
 * 根据page生成url
 * @param $page
 * @param string $url
 * @return string
 */
function pageUrl($page, $url = '')
{
    $url = empty($url) ? getUrl() : $url;
    //查询url中是否存在?
    $pos = strpos($url, '?');
    if($pos === false)
    {
        $url .= '?page=' . $page;
    }
    else
    {
        $queryString = substr($url, $pos + 1);
        //解析querystring为数组
        parse_str($queryString, $queryArr);
        if(isset($queryArr['page']))
        {
            unset($queryArr['page']);
        }
        $queryArr['page'] = $page;

        //将queryArr重新拼接成queryString
        $queryStr = http_build_query($queryArr);

        $url = substr($url, 0, $pos) . '?' . $queryStr;

    }
    return $url;

}


/**
 * 分页显示
 * @param  int $total 数据总数
 * @param  int $currentPage 当前页
 * @param  int $pageSize 每页显示条数
 * @param  int $show 显示按钮数
 * @return string
 */
function pages($total, $currentPage, $pageSize, $show = 6)
{
    $pageStr = '';

    //仅当总数大于每页显示条数 才进行分页处理
    if($total > $pageSize)
    {
        //总页数
        $totalPage = ceil($total / $pageSize);//向上取整 获取总页数

        //对当前页进行处理
        $currentPage = $currentPage > $totalPage ? $totalPage : $currentPage;
        //分页起始页
        $from = max(1, ($currentPage - intval($show / 2)));
        //分页结束页
        $to = $from + $show - 1;


        $pageStr .= '<div class="page-nav">';
        $pageStr .= '<ul>';

        //仅当 当前页大于1的时候 存在 首页和上一页按钮
        if($currentPage > 1)
        {

            $pageStr .= "<li><a href='" . pageUrl(1) . "'>首页</a></li>";
            $pageStr .= "<li><a href='" . pageUrl($currentPage - 1) . "'>上一页</a></li>";

        }


        //当结束页大于总页
        if($to > $totalPage)
        {
            $to = $totalPage;
            $from = max(1, $to - $show + 1);
        }


        if($from > 1)
        {
            $pageStr .= '<li>...</li>';
        }


        for($i = $from; $i <= $to; $i++)
        {
            if($i != $currentPage)
            {
                $pageStr .= "<li><a href='" . pageUrl($i) . "'>{$i}</a></li>";
            }
            else
            {
                $pageStr .= "<li><span class='curr-page'>{$i}</span></li>";
            }
        }


        if($to < $totalPage)
        {
            $pageStr .= '<li>...</li>';

        }

        if($currentPage < $totalPage)
        {
            $pageStr .= "<li><a href='" . pageUrl($currentPage + 1) . "'>下一页</a></li>";
            $pageStr .= "<li><a href='" . pageUrl($totalPage) . "'>尾页</a></li>";
        }

        $pageStr .= '</ul>';
        $pageStr .= '</div>';

    }

    return $pageStr;

}