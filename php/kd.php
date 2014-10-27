<html>
<head>
<STYLE TYPE="text/css">
.url { width: 90%; border: 1px solid #999999; padding: 5px; 
-webkit-box-shadow:5px 5px 5px #999999; 
-moz-box-shadow: 5px 5px 5px #999999; 
box-shadow:5px 5px 5px #999999; 
}
.submit{
   border: 1px solid #8ec1da;
   background-color: #ddeef6;
   border-radius: 4px;
   -webkit-box-shadow:5px 5px 5px #999999;
   -moz-box-shadow: 5px 5px 5px #999999;
   box-shadow:5px 5px 5px #999999;
   color: #3985a8;
   text-shadow: 0 1px #fff;
   padding: 5px 30px;
}
p { text-shadow: 1px 1px 1px #000; }
</STYLE>
</head>
<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
   <input type="text" name="url" class="url" value="Type in your URL" onfocus="value=''"> <input type="submit" name="submit" class="submit" value="Download"><br>
</form>
</html>
<?php
$time_start = microtime(true);
if (isset($params['host']) && $params['host'])      $header[]="Host: " . $params['host'];
/* creates a compressed zip file */
function create_zip($files = array(),$destination = '',$overwrite = true) {
	//if the zip file already exists and overwrite is false, return false
	if(file_exists($destination) && !$overwrite) { return false; }
	//vars
	$valid_files = array();
	//if files were passed in...
	if(is_array($files)) {
		//cycle through each file
		foreach($files as $file) {
			//make sure the file exists
			if(file_exists($file)) {
				$valid_files[] = $file;
			}
		}
	}
	//if we have good files...
	if(count($valid_files)) {
		//create the archive
		$zip = new ZipArchive();
		if($zip->open($destination,$overwrite ? ZIPARCHIVE::OVERWRITE : ZIPARCHIVE::CREATE) !== true) {
			return false;
		}
		//add the files
		foreach($valid_files as $file) {
			$zip->addFile($file,$file);
		}
		//debug
		//echo 'The zip archive contains ',$zip->numFiles,' files with a status of ',$zip->status;
		
		//close the zip -- done!
		$zip->close();
		
		//check to make sure the file exists
		return file_exists($destination);
	}
	else
	{
		return false;
	}
}

function get_data($url)
{
        $url = chop($url);
	$ch = curl_init();
	$timeout = 5;
	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
	curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);
	$data = curl_exec($ch);
	curl_close($ch);
	return $data;
}

function isValidURL($url)
{
return preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $url);
}

if(isset($_POST['submit']))
{
    $url = chop($_POST['url']);
    $songs = array();
   
    $pieces = explode('/',parse_url($url, PHP_URL_PATH)); 
    $album  = $pieces[count($pieces)-2];
    
    if(isValidURL($url) and substr(trim($url), -4) === ".php")
    {
	$url = str_replace(".php","/All.ram", $url);
        $url = str_replace("/home","",$url);
	$album = $pieces[count($pieces) - 1];
	$album = str_replace(".php","",$album);
    }
   
    if(!isValidURL($url) or substr(trim($url), -4) != ".ram"){
        echo "<p>Error! Please check the URL guru!</p>";
    }
 

    else{
	$returned_content = get_data($url);
	foreach(explode("\n", get_data($url)) as $dload){
		$song=rtrim(end(explode("/",$dload)));
		if(!empty($song))
		{
		    array_push($songs,$song);
		    file_put_contents($song,get_data($dload)); 
		}
	}
	$result = create_zip($songs,$album.'.zip');
	exec("rm -rf *.rm");
	echo '<p>Download must start automatically, else click <a href=./'.$album.'.zip>Songs</a> <br /><b> NOTE : The file will be alive for the next 2 hours!</b></p>';
	echo'<iframe width="1" height="1" frameborder="0" src=./'.$album.'.zip></iframe>';

    }

    $time_end = microtime(true);
    $time = $time_end - $time_start; 
    #echo "<b> Time : $time</b>";
}

?>

