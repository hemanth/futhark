<?php
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
"k" => "|<",
"l" => "|_",
"m" => "|v|",
"n" => "()",
"o" => "0",
"p" => "|*",
"q" => "0_",
"r" => "|2",
"s" => "5",
"t" => "+",
"u" => "|_|",
"v" => "\\//",
"w" => 'uu',
"x" => "%",
"y" => "`/",
"z" => "7_"
);

$data=htmlspecialchars(urldecode($_SERVER['QUERY_STRING']));
$j = mb_strlen($data);
$output="";
for ($k = 0; $k < $j; $k++) {
$output .= (isset($map[$data[$k]])) ? $map[$data[$k]]:$data[$k];
}
echo $output
?>
