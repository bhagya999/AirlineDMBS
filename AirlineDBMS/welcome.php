<html>
<head>
  <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>welcome</title>

  <link href="css.css" rel="stylesheet" type="text/css">
  <style type="text/css">
  body {
    background: #418491; /* fallback for old browsers */
    font-family: "Roboto", sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;      
    }
 }
  </style>
  </head>
  <?php
    require 'databaseaccess.php';
    session_start();
    if (isset($_SESSION['user_name'])) {
      header('location: flightscheduler.php');
    }
    elseif(isset($_POST['Fname'])){
      $first_name = $_POST['Fname'];
      $last_name = $_POST['Lname'];
      $address = $_POST['address'];
      $email_address = $_POST['email'];
      $user_name = $_POST['userName'];
      $password = $_POST['password'];
      $database = new DbConnect();  
      $databaseconnect = $database->connect();
      $sql1 = "SELECT * FROM customer";
      $result1 = mysqli_query($databaseconnect,$sql1);
      $count = mysqli_num_rows($result1)+1;
      $customer_id = "u-"."$count";
      $sqlf = "INSERT INTO customer(customer_id,first_name,last_name,address,email,user_name,password,package_type) VALUES ('$customer_id','$first_name','$last_name','$address','$email_address','$user_name','$password','Guest')";
      $result = mysqli_query($databaseconnect,$sqlf);
      if($result){
        echo"<h4 align= 'center'>Susccusfully Registred</h4>";
      }else{
        echo("<h4 align='center'>".'Error description: ' . mysqli_error($databaseconnect)."</h4>");
        echo("<style type='text/css'>
.signin{
    display: none;
 }
 .signup{
    display: block;
 }
 </style>");
      }
    }elseif (isset($_POST['userName'])) {
      
      $user_name = $_POST['userName'];
      $password = $_POST['password'];
      $database = new DbConnect();  
      $databaseconnect = $database->connect();
      $sql1 = "SELECT * FROM customer WHERE user_name='$user_name' AND password='$password'";
      $result1 = mysqli_query($databaseconnect,$sql1);
      $count = mysqli_num_rows($result1);
      if($count){
        
        $result = $result1->fetch_assoc();
        $_SESSION["customer_id"] = $result['customer_id'];
        $_SESSION["user_name"] = $user_name;
        $_SESSION["first_name"] = $result['first_name'];
        $_SESSION["type"] = $result['customer'];
        header('location: flightscheduler.php');
      }else{
        echo("<h4 align='center'>Incorrect Email OR Password.</h4>");
      }
    }
    ?>

  <body>
    <div id ="login" class="signin">
      <div class="login-page">
        <h4 id = "error"></h4>
        <h4 id="test"></h4>
        <div class="form">
          <form class="login-form" action="welcome.php" method="post">
            <input id ="userName" type="text" placeholder="User Name" name="userName"/>
            <input id ="password" type="password" placeholder="password" name="password" />
            <button class="mainbutton" type= "submit">log</button>
          </form>
          
          <p class="message">Not registered? <button class="button" onclick="signup1()">Open Account</button></p>
        </div>
      </div>
    </div>
    <div id="signup" class="signup">
      <div class="login-page">
        <div class="form" >
          <form class="register-form" name="register" action="welcome.php" method="post">
            <input name ="Fname" type="text" placeholder="First Name" name="Fname" />
            <input name ="Lname" type="text" placeholder="Last Name" name="Lname" />
            <input name ="email" type="text" placeholder="Email" name="email" />
            <textarea name="address" rows="4" placeholder="Address"></textarea>
            <input name ="userName" type="text" placeholder="User Name" name="userName" />
            <input name ="password" type="password" placeholder="password" name="password" />
            <!-- <input name ="password2" type="password" placeholder="Re enter password" name="password2" /> -->
            <button class="mainbutton" type= "submit">create</button>
          </form>
          
          <p class="message">Already registered? <button class="button" onclick="login()">Log In</button></p>
        </div>
      </div>
    </div>

  </body>
  <script type="text/javascript">
      function login(){
        document.getElementById('login').style.display= 'block' ;
        document.getElementById('signup').style.display= 'none' ;
      }
      function signup1(){
        document.getElementById('signup').style.display= 'block' ;
        document.getElementById('login').style.display= 'none' ;
      }
  </script>

  </html>