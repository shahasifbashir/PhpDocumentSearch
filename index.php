

<link rel="stylesheet" href="style/style.css" />
<div id="serwrapper">
	<?php
		include('inc/search.tpl');
	 ?>
     
     <div class="sheader">
     <div id="SearchDiv">
     	<form action="" method="post">
        	<input type="search" name="Searchtxtbox" id ="Searchtxtbox" placeholder="Search Here"/>
            <input type="submit" value="Search" class="searchButton" />
        </form>
        </div>
     </div>
     
</div>

            <div id="SearchDisplay">
          		
                <?php 
					if(isset($Search->results)){
						if($ress =$Search->results){
							$num =count($ress);
							$suffix =($num !=1) ?'s':'';
							?>
                                                      
                            <div style="color:red; padding:10px; margin-bottom:20px;">
                            	<span > Your Search Returned <strong><?php echo  $num;?>
                                	</strong>
                                </span> Result<?php echo $suffix;?>
                                <hr />
                            </div>
                            <?php
                            
                            foreach($Search->results as $result)
                            {
                            ?>
                            <a href="<?php echo  $result['Link']; ?>" target="new">
                            <strong style="color:green" >
                            	<?php echo  $result['Heading']; ?><br />
                            </strong>
                          <span><small style="color:green"><?php echo  $result['Link']; ?></small></span><br /><br />
                            <?php echo  $result['DESCP']; ?>............<br />
                           </a>
                            <?php echo  $result['CONTENT'];?>................. <br /><br /><br />
                            
                            <?php
                            }
                            
                           
						}
						else{
							echo "<span style='color:red'>Your Search returned no results</span>";
						}
					}
				?>
     
            </div>