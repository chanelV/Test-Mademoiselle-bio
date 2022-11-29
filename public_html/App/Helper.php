<?php

namespace App;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

/**
 * Class Helper
 * @package App
 */
class Helper
{   
    public static function render($view, $data = [])
    {
        $file = __DIR__. '/../Views/' . $view . '.php';
        if (is_readable($file)) require_once $file;
        else die('404 Page not found');
    }

	public static function redirect(string $url)
	{
		echo '<script> window.location.replace("'.$url.'"); </script>;';
	}
	
	public static function upload($file, $destination){
		$extre = explode('.',$file['name']);
        $fichier = round(microtime(true)).'.'.end($extre);
        if(move_uploaded_file($file['tmp_name'], __DIR__. '/../public/'.$destination . $fichier)){
            return $fichier;
        }
        else{
            return false;
        }
	}

    public function uniqidReal($lenght = 10) {
		
		if (function_exists("random_bytes")) {
			$bytes = random_bytes(ceil($lenght / 2));
		} elseif (function_exists("openssl_random_pseudo_bytes")) {
			$bytes = openssl_random_pseudo_bytes(ceil($lenght / 2));
		} else {
			throw new Exception("no cryptographically secure random function available");
		}
		return substr(bin2hex($bytes), 0, $lenght);
	}
}
