<html>
<head>
  <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>welcome</title>

  <link href="css.css" rel="stylesheet" type="text/css">
  <style type="text/css">
  body {
    background: #76b852; /* fallback for old browsers */
    background: -webkit-linear-gradient(right, #76b852, #8DC26F);
    background: -moz-linear-gradient(right, #76b852, #8DC26F);
    background: -o-linear-gradient(right, #76b852, #8DC26F);
    background: linear-gradient(to left, #76b852, #8DC26F);
    font-family: "Roboto", sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;      
    }
 }
  </style>
  </head>
  <?php 
  if(isset($_POST['Fname'])){
    echo "Sign Up";
  }elseif (isset($_POST['userName'])) {
    echo "Log In";
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
          
          <p class="message">Not registered? <button onclick="signup1()">Open Account</button></p>
        </div>
      </div>
    </div>
    <div id="signup" class="signup">
      <div class="login-page">
        <div class="form" >
          <form class="register-form" name="register" action="welcome.php" method="post">
            <input name ="Fname" type="text" placeholder="First Name" name="Fname" />
            <input name ="Lname" type="text" placeholder="Last Name" name="Lname" />
            <input name ="email" type="email" placeholder="Email" name="email" />
            <textarea name="address" rows="4" placeholder="Address"></textarea>
            <input name ="userName" type="text" placeholder="User Name" name="userName" />
            <input name ="password1" type="password" placeholder="password" name="password1" />
            <input name ="password2" type="password" placeholder="Re enter password" name="password2" />
            <button class="mainbutton" type= "submit">create</button>
          </form>
          
          <p class="message">Already registered? <button onclick="login()">Log In</button></p>
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

  <script src="app.js"></script>

  </html>