<?php
	
		class DBContext{
			public static function Connect(){
				$db = new mysqli('localhost','root','','mydb');
				if(!$db->connect_errno){
					return $db;
				}return FALSE;
			}
		}
 
?>