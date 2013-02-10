<?php
header('Content-type: application/json'); 
/*header('Access-Control-Allow-Origin: *');*/

$map = Array(
"a" => "4",
"b" => "8",
"c" => "(",
"d" => "[)",
"e" => "3",
"f" => "|=",
"g" => "6",
"h" => "|-|",
"i" => "!",
"j" => "_|",
"k" => "k",
"l" => "|_",
"m" => "|v|",
"n" => "()",
"o" => "0",
"p" => "|*",
"q" => "0_",
"r" => "|2",
"s" => "5",
"t" => "7",
"u" => "|_|",
"v" => "\/",
"w" => '\/\/',
"x" => "%",
"y" => "`/",
"z" => "7_"
);

$data=strtolower(htmlspecialchars(urldecode($_GET['str'])));
$j = mb_strlen($data);
$output="";
for ($k = 0; $k < $j; $k++) {
$output .= (isset($map[$data[$k]])) ? $map[$data[$k]]:$data[$k];
}
$l33t = array();
$l33t['result'] = $output;
echo $_GET['callback'] . '(' .json_encode($l33t). ');';
?>
