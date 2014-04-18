<?php
/**
 * Created by IntelliJ IDEA.
 * User: Mads Røskar
 * Date: 18.04.2014
 * Time: 03:50
 */

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");

if(isset($_GET['keyword'])){
    getContentFromWikipedia($_GET['keyword']);
}

function getContentFromWikipedia($keyword){
    if($html = file_get_contents('http://en.wikipedia.org/wiki/' . $keyword))
        echo $html;
    else
        echo "Not Found";
}
