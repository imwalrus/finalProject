<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <style>
   body {
      color: #999;
      background: #f3f3f3;
      font-family: 'InfinitySans-RegularA1','Roboto', sans-serif;
   }
    .form-control {
      border-color: #eee;
        min-height: 41px;
      box-shadow: none !important;
      padding-left:10px !important;
   }
    .form-control:focus {
      border-color: #5cd3b4;
   }
    .form-control, .btn {        
        border-radius: 3px;
    }
   .signup-form {
      width: 500px;
      margin: 0 auto;
      padding: 30px 0;
      margin-left:380px;
   }
    .signup-form h2 {
      color: #333;
        margin: 0 0 30px 0;
      display: inline-block;
      padding: 0 30px 10px 0;
      border-bottom: 3px solid #5cd3b4;
    }
    .signup-form form {
      color: #999;
      border-radius: 3px;
       margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
   .signup-form .form-group {
      margin-bottom: 20px;
   }
   .signup-form label {
      font-weight: normal;
      font-size: 13px;
   }
    .signup-form input[type="checkbox"] {
      margin-top: 2px;
   }
    .signup-form .btn {        
        font-size: 16px;
        font-weight: bold;
      background: #78c2ad !important;
      border: none;
      /* margin-top: 20px; */
      min-width: 140px;
    }
   .signup-form .btn:hover, .signup-form .btn:focus {
      background: rgb(119, 119, 119);
        outline: none !important;
   }
    .signup-form a {
      color: #5cd3b4;
      text-decoration: underline;
   }
   .signup-form a:hover {
      text-decoration: none;
   }
    .signup-form form a {
      color: #5cd3b4;
      text-decoration: none;
   }   
   .signup-form form a:hover {
      text-decoration: underline;
   }
   #idCheck,#searchAddr,#sendEmailJoinCode {
      font-size:13px;
      width:90px !important;
      height:41px;
      background-color:#78c2ad;
   }
   .inputControl{
      width:200px !important;
      margin-right:20px;
   }
   .inputControl2{
      width:120px !important;
   }
</style>
<script>
      /*
       * form ?????? ?????? ????????? type??? ???????????? ????????? submit ?????? ???????????? post??? ???????????? ????????? button ?????? ?????? ???????????????
       */
      var pwCk=0;
      var emailCk=0;
      
      $(document).ready(function(){
         //???????????? ??????
         $(function(){
               $('[name=user_pwd]').keyup(function(){
                  $('#pwCkNotice').html('');
               });
               $('[name=confirm_pwd]').keyup(function(){
                  if($('[name=user_pwd]').val() != $('[name=confirm_pwd]').val()){
                     $('#pwCkNotice').html('???????????? ???????????? ??????<br>');
                     $('#pwCkNotice').attr('color', '#f82a2aa3');
                  } else if($('[name=user_pwd]').val() == $('[name=confirm_pwd]').val()){
                     pwCk=1;
                     $('#pwCkNotice').html('???????????? ?????????<br>');
                     $('#pwCkNotice').attr('color', '#51ad95');
                  }
               });
            });
            
         //????????? ???????????? ??????
         $('#sendEmailJoinCode').on('click',function(){
            var email = $('[name=user_email]').val();
            console.log(email);
            $.ajax({
               url:"emailCheck",
               data:{"user_email":email},
               async:false,
               method:"post",
               dataType: "json",
               success: function(data){
                  if(data==0){
                     alert('?????? ????????? ??????????????? ?????????????????????. ????????? ????????? ??????????????? ???????????? ??????????????????.')
                     $('[name=user_email]').css("background-color", "#EBF7FF");
                     $('[name=user_emailJoinCode]').focus();
                     emailCk=1;
                     if(emailCk == 1){
                        $.ajax({
                           url: "sendEmailJoinCode",
                           data: {"user_email":email},
                           success:function(response){
                              console.log(response);
                              if($('#emailJoinCode').val() == ""){
                                 emailCk=0;
                                 $('#emailJoinCodeNotice').html('??????????????? ???????????????. <br>');
                                 $('#emailJoinCodeNotice').attr('color', '#f82a2aa3');
                              }
                               $('#emailJoinCode').keyup(function(){
                                    if($('#emailJoinCode').val() != response){
                                       emailCk=0;
                                       $('#emailJoinCodeNotice').html('??????????????? ???????????? ????????????. <br>');
                                       $('#emailJoinCodeNotice').attr('color', '#f82a2aa3');
                                    } else if($('#emailJoinCode').val() === response){
                                       emailCk=1;
                                       $('#emailJoinCodeNotice').html('????????? ?????? ??????! <br>');
                                       $('#emailJoinCodeNotice').attr('color', '#51ad95');
                                    }
                              }); 
                           }
                        });
                     } 
                  } else if(data == 1){
                     alert("?????? ???????????? ????????? ?????????. ?????? ???????????? ??????????????????. ")
                     $('[name=signUpBtn]').prop("disabled",false);
                     $('[name=user_email]').focus();
                     emailCk=0;
                  }
               }
            });
         });

         });//end 

         function updateCheck(){
            var pw = $('[name=user_pwd]').val();
            var em = $('[name=user_email]').val();
            console.log(pw);
            if(pw != null && pw != ""){
               if(pwCk == 0){
                  alert("???????????? ??????????????? ??????????????????.");
                  return false;
               } 
            } else if(em != '${list.user_email}'){
               if(emailCk === 0 ){
                  alert("????????? ??????????????? ??????????????????.");
                  return false;
               } 
            } else{
               return true;
            }
         }
</script>
</head>
<body>
<section class="pcoded-main-container">
   <div class="pcoded-main-container">
      <div class="signup-form">
          <form onsubmit="return updateCheck();" action="updateUser" method="post" class="form-horizontal" name="form">
            <div class="col-xs-8 col-xs-offset-4">
               <h2>?????? ?????? ??????</h2>
            </div>   
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >?????????</label>
               <div class="col-xs-8">
                  <input type="text" class="form-control" name="user_id" value="${list.user_id }" readonly="readonly">
                  <font id="idCheckNotice" size=2></font>
               </div>                 
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >???????????? ??????</label>
               <div class="col-xs-8">
                  <input type="password" class="form-control" name="user_pwd" >
               </div>           
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >?????? ??????</label>
               <div class="col-xs-8">
                  <input type="password" class="form-control" name="confirm_pwd">
                  <font id="pwCkNotice" size=2></font>
               </div>           
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >??? ???</label>
               <div class="col-xs-8">
                  <input type="text" class="form-control" name="user_name" value="${list.user_name }">
               </div>           
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >?????????</label>
               <div class="col-xs-8">
                  <input type="email" class="form-control" name="user_email" value="${list.user_email }">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >????????? ????????????</label>
               <div class="col-xs-8 inputControl">
                      <input type="text" class="form-control" name="emailJoinCode" id="emailJoinCode" placeholder="???????????? ??????" style="float:left;">
                     <font id="emailJoinCodeNotice" size=2 style="float:left;"></font>
                  </div>
                  <div >
                        <button type="button" class="btn btn-primary" id="sendEmailJoinCode" name="sendEmailJoinCode" style="margin-left: 100px;">????????? ??????</button>
                  </div>
              </div>
              <br>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >?????????</label>
               <div class="col-xs-8">
                <input type="text" class="form-control" name="user_phone" value="${list.user_phone }">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol" >????????????</label>
               <div class="col-xs-8">
                  <input type="date" class="form-control" name="user_birth" value="${list.user_birth }">
               </div>           
            </div>
            <div class="form-group">
               <label class="control-label col-xs-4 divcountrol">??? ???</label>
               <div class="inputControl">
                  <input type="text" class="form-control" name="user_zip" placeholder="????????????" value="${list.user_zip }" style="float:left;">
               </div>
               <div class="btnControl">
                  <button type="button" class="btn btn-primary" id="searchAddr" onclick="goPopup()" style="float:right;">?????? ??????</button>
               </div> 
               <br> 
               <label class="control-label col-xs-4 divcountrol"></label>
               <div class="col-xs-8">
                  <input type="text" class="form-control" name="user_adr" value="${list.user_adr }">
                  <input type="text" class="form-control" name="user_detailadr" value="${list.user_detailadr }" >
               </div>
            </div>            
         
            <div class="form-group" align="center">
               <div class="col-xs-8 col-xs-offset-4" >
                  <button type="submit" class="btn btn-primary btn-lg" name="updateBtn">??????</button>
               </div>  
            </div>               
         </form>
      </div>
   </div>   
</section>      
<script type="text/javascript">
/*??????????????? API*/
   function goPopup(){
      var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   }
   
   function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2, zipNo){
       document.form.user_zip.value = zipNo;
       document.form.user_adr.value = roadAddrPart1;
       document.form.user_detailadr.value = addrDetail+" "+roadAddrPart2;
   }
</script>
</body>
</html>