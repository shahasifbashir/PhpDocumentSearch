
		<?php
			include('connect.tpl');
				class Search{				
					var $results;
					function __construct($search){
						 $this->results = $this->SearchKeywords($search);
					}
					private function SearchKeywords($search){
						$keywords = $search->getSearch(); 
						$returned_result = array();
						$where ="";
						
						$words = preg_split('/[\s]+/',$keywords); 
						
						$totalkeywords = count($words);
						
						foreach($words as $key=>$word){
							$where .= "`Content`LIKE '%$word%'";
							if($key != $totalkeywords -1)
							{
								$where .= " OR";
							}
						}
						 $sql =  "SELECT `Heading`, LEFT(`Descp`,100) as `description`,`link`, LEFT(`Content`,300) as `Content` 
                         FROM `myengine` WHERE $where;";
                         
						 $connection  = DBContext::Connect();
						 
						 if($results =$connection->query($sql)){
							 $numrows = mysqli_num_rows($results);
							 
							 if($numrows == 0)
							 {
								 return FALSE;
							 }
							 else
							 {
								 while($row = mysqli_fetch_assoc($results)){
									 $returned_result[] = array(
									 'Heading'  =>$row['Heading'],
									 'DESCP'	=>$row['description'],
                                     'Link' 	=>$row['link'],
                                     'CONTENT'  =>$row['Content']
									 );
								 }
								 return $returned_result; 
							 }
						 }				
					}
				}
		
				class SearchModel{
					private $search;
					
					function getSearch(){
						return $this->search;
					}
					function setSearch($s){
						 $this->search = htmlentities(trim($s));
					}
				}
			
			if($_SERVER['REQUEST_METHOD']=='POST'){
				if(strlen($_POST['Searchtxtbox'])>=3){
				$SearchModel = new SearchModel();
				$SearchModel->setSearch($_POST['Searchtxtbox']);
				$Search  = new Search($SearchModel);
				}
			}
	     ?>
	 
    