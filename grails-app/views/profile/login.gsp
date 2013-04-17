  
<script type="text/javascript">
$(document).ready(function () {
    var ck_username = /^[A-Za-z0-9_@.]{1,20}$/;
    var ck_password =  /^[A-Za-z0-9!@#$%^&*()_]{6,15}$/;
    var hasError = false;
        
    $("#login_form").submit( function () {
       var passwordVal = $("#password").val();
       var checkVal = $("#username").val();
      
       $(".errors").hide();
       if (!ck_username.test(checkVal)) {
            $("#username").after($('<span/>')
                .attr('class','errors')
                .html("<br/><font size='3em' color='red'>Must be alphanumeric.</font>"));
                
            hasError = true;
       }else
       if (!ck_password.test(passwordVal)) {
          $("#password").after($('<span/>')
                .attr('size','4em')
                .attr('color','red')
                .attr('class','errors')
                .html("<br/><font size='3em' color='red'>Must contain atleast 6 to 15 alphanumeric characters.</font>"));
          hasError = true;
       }
       return !hasError
    });
});
</script>

<g:if test="${flash.message}">
  <div class="message" role="status">${flash.message}</div>
</g:if>

<g:form id="login_form" name="login_form" controller="profile" action="authenticate">                      
  <fieldset class="form">
    <div class="email-div">
      <label for="email">
        <strong class="email-label">Handle or Email</strong>
      </label>
      <input id="username" type="text" class="required" maxlength="30" name="username" spellcheck="false">
    </div>

    <div class="passwd-div">
      <label for="password">
        <strong class="passwd-label">Password</strong>
      </label>
      <input id="password" class="required" type="password" maxlength="15" name="password">
    </div>
  </fieldset>
  <fieldset class="buttons">
    <div class="modal-footer">
      <g:submitButton name="login" id="login" class="btn btn-info" value="Login" />
      <a href="#" id="closebtn" name="closebtn" data-dismiss="modal" class="btn btn-primary">Cancel</a>
    </div>
  </fieldset>
</g:form>