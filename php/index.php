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
    if($html = file_get_contents('http://en.wikipedia.org/wiki/' . $keyword)){
        $returnArr = array();
        $dom = new DOMDocument();
        $dom->loadHTML($html);
        $xpath = new DOMXpath($dom);
        $result = $xpath->query('//body/div[@id="content"]/div[@id="bodyContent"]/div[@id="mw-content-text"]/p');
        if(strstr($result[0]->nodeValue, "may refer to:") > -1){
            $returnArr[] = "disambiguation";
            $ul = $xpath->query('//body/div[@id="content"]/div[@id="bodyContent"]/div[@id="mw-content-text"]/ul/li/a');
            foreach($ul as $u){
                $returnArr[] = str_replace(" ", "_", $u->nodeValue);
            }
        }else {
            foreach ($result as $p) {
                $value = $p->nodeValue;
                $value = preg_replace('/\[.+]/', '', $value);
                $returnArr[] = $value;
            }
        }
        echo json_encode($returnArr);
    }else
        echo "Not Found";
}
