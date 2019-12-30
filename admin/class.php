<?php
include "../../../include/cp_header.php";
include_once XOOPS_ROOT_PATH."/Frameworks/art/functions.php";
include_once XOOPS_ROOT_PATH."/Frameworks/art/functions.admin.php";
//-----函數區-----

//上傳的表格
function chooseForm(){
  $form="<form method='post' action='class.php?op=classShow'>";
  $form.="<table align='center'>";
  $form.="<tr><td>第<input type='text' name='place' size='1'>試場學生名單<Input Type='Reset' Value='清除'><Input Type='Submit' Value='傳送'></td></tr>";
  $form.="</table>";
  $form.="</form>";
  return $form;
}

//show出目前所有的對照表
function classShow($place){
  $p=$place;
  global $xoopsDB;
  $sql="select sn,id from `" . $xoopsDB->prefix('second_grade') . "` where `place`=$p order by id";
  $result=$xoopsDB->query($sql);
  $classNum=$xoopsDB->getRowsNum($result);
  if ($classNum==0){
    $classList="<h2><font color='blue'>目前試場未設置學生</font></h2>";
  }else{
    $classList="<h1 align='center'>第" . $p . "試場名單</h1>";
    $classList.="<table>";
    $classList.="<tr><th>鑑定證號碼</th><th>管理</th></tr>";
    while(list($sn,$id)=$xoopsDB->fetchRow($result)){
      $classList.="<tr align='center'><td>$id</td><td><a href='class.php?op=updateForm&sn=$sn'>修改</a> | <a href='class.php?op=del&sn=$sn'>刪除</a></td></tr>";
    }
    $classList.="</table>";
  }
  return $classList;
}


//刪除
function del($sn){
  global $xoopsDB;
  $sql="delete from `" . $xoopsDB->prefix('second_grade') . "` where sn=$sn";
  $xoopsDB->queryF($sql) or die($sql);
}


//修改鑑定證號的表單
function updateForm($sn){
  global $xoopsDB;
  $sql="select sn,id from `" . $xoopsDB->prefix('second_grade') . "` where `sn`=$sn";
  $result=$xoopsDB->query($sql) or die($sql);
  list($sn, $id)=$xoopsDB->fetchRow($result);
  $main="<h1>修改$name</h1>";
  $main.="<form action='class.php?op=update&sn=$sn' method='POST'>";
  $main.="<table>";
  $main.="<tr><th>編號</th><td><input type='text' name='id' value=$id></td></tr>";
  $main.="<tr><td></td><td><input type='hidden' name='sn' value=$sn></td></tr>";
  $main.="<tr><td></td><td><input type='submit' value='修改'></td></tr>";
  $main.="</table>";
  $main.="</form>";

  return $main;
}


//修改資料
function update($sn){
  global $xoopsDB;
  $sql="update `" . $xoopsDB->prefix('second_grade') . "` set
  `id`    =   '{$_POST['id']}' where sn=$sn";
  $xoopsDB->queryF($sql) or die($sql);

}


//-----判斷區-----
$op=(empty($_REQUEST['op']))?"":$_REQUEST['op'];
$sn=(empty($_REQUEST['sn']))?"":$_REQUEST['sn'];
$id=(empty($_REQUEST['id']))?"":$_REQUEST['id'];
$place=(empty($_REQUEST['place']))?"":$_REQUEST['place'];

$main="";
switch ($op)
{
  case "del":

  del($sn);
  redirect_header("class.php", 3, "刪除成功");

  break;


  case "classShow":

  $main=chooseForm();
  $main."<br><br>";
  $main.=classShow($place);

  break;

  case "updateForm":

  $main=updateForm($sn);

  break;

  case "update";

  update($sn);
  redirect_header("class.php",3,"修改成功");

  break;





  default:
  $main = chooseForm();
}






//-----顯示區-----
xoops_cp_header();
loadModuleAdminMenu(8);
echo $main;
xoops_cp_footer();
?>