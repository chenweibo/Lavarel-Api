<?php


/**
*调整后台导航树
*
*调整数据结构成方法
* @author   chenweibo
* @version     1.0
*/
function make_tree($list, $pk='id', $pid='pid', $child='children', $root=0)
{
    $tree=array();
    $packData=array();
    foreach ($list as  $data) {
        $packData[$data[$pk]] = $data;
    }
    foreach ($packData as $key =>$val) {
        if ($val[$pid]==$root) {//代表跟节点
            $tree[]=& $packData[$key];
        } else {
            //找到其父类
            $packData[$val[$pid]][$child][]=& $packData[$key];
        }
    }
    return $tree;
}
