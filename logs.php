<?php

header('Access-Control-Allow-Origin: *');

   // Define database connection parameters
   $hn      = 'localhost';
   $un      = 'root';
   $pwd     = '';
   $db      = 'cos_login_db';
   $cs      = 'utf8';

   // Set up the PDO parameters
   $dsn  = "mysql:host=" . $hn . ";port=3306;dbname=" . $db . ";charset=" . $cs;
   $opt  = array(
                        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
                        PDO::ATTR_EMULATE_PREPARES   => false,
                       );
   // Create a PDO instance (connect to the database)
   $pdo  = new PDO($dsn, $un, $pwd, $opt);
   $key  = strip_tags($_REQUEST['key']);
   
   // Retrieve specific parameter from supplied URL
   $data    = array();

   

   switch($key)
   {

      // Add a new record to the technologies table
      case "getall":

         // Sanitise URL supplied values
         $uname       = filter_var($_REQUEST['uname'], FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

         // Attempt to run PDO prepared statement
         try {

            $stmt    = $pdo->prepare("SELECT * FROM chat");
            $stmt->execute();
            while($row  = $stmt->fetch(\PDO::FETCH_ASSOC))
                  {  
                     if($row['username'] ==  $uname){
                        //echo "<span style='float:right;'>" . $row['msg'] . "</span><br />";
                        echo "<span style='float:right;'>" . $row['username'] . "</span> <hr><div class='container1'>
                              <p style='float:right;word-wrap: break-word;'>" . $row['msg'] . "</p>
                              </div>";
                     }
                     else{
                        echo "<span >" . $row['username'] . "</span>:<div class='container1 darker'>
                              <p  style='word-wrap: break-word;'>" . $row['msg'] . "</p>
                              </div>";
                     }
                     
                  }
                 // if($row['username'] ==  $uname){
                 //    echo "<span style='float:right;'> " . $row['msg'] . "</span><br />";
                 // }
                 // else{
                 //    echo "<span >" . $row['username'] . "</span>: <span>" . $row['msg'] . "</span><br />";
                 // }
               }
         catch(PDOException $e)
         {
            echo $e->getMessage();
         }

      break;

      case "getmy":

         // Sanitise URL supplied values
         $fname       = filter_var($_REQUEST['fname'], FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $user_id       = filter_var($_REQUEST['user_id'], FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

         $my_id = filter_var($_REQUEST['my_id'], FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);
         $my_fname = filter_var($_REQUEST['my_fname'], FILTER_SANITIZE_STRING, FILTER_FLAG_ENCODE_LOW);

         // Attempt to run PDO prepared statement
         try {
            // SELECT * FROM chat WHERE username = 'admin' AND user_id = 2 OR username = 'test1' AND user_id = 1 
            $stmt    = $pdo->prepare("SELECT * FROM chat WHERE username = :fname AND user_id = :my_id OR username = :my_fname AND user_id = :user_id");
            $stmt->bindParam(':fname', $fname, PDO::PARAM_STR);
            $stmt->bindParam(':my_id', $my_id, PDO::PARAM_STR);
            $stmt->bindParam(':my_fname', $my_fname, PDO::PARAM_STR);
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_STR);
            $stmt->execute();
            while($row  = $stmt->fetch(\PDO::FETCH_ASSOC))
                  {  
                     if($row['username'] ==  $my_fname){
                        //echo "<span style='float:right;'>" . $row['msg'] . "</span><br />";
                        echo "<span style='float:right;'>" . $row['username'] . "</span> <hr><div class='container1'>
                              <p style='float:right;word-wrap: break-word;'>" . $row['msg'] . "</p>
                              </div>";
                     }
                     else{
                        echo "<span >" . $row['username'] . "</span>:<div class='container1 darker'>
                              <p  style='word-wrap: break-word;'>" . $row['msg'] . "</p>
                              </div>";
                     }
                     
                  }
                 // if($row['username'] ==  $uname){
                 //    echo "<span style='float:right;'> " . $row['msg'] . "</span><br />";
                 // }
                 // else{
                 //    echo "<span >" . $row['username'] . "</span>: <span>" . $row['msg'] . "</span><br />";
                 // }
               }
         catch(PDOException $e)
         {
            echo $e->getMessage();
         }

      break;
  }
   