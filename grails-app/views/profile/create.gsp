<%@ page import="TEC.Profile" %>
  
<script type="text/javascript">
$(document).ready(function () {
    var ck_username = /^[A-Za-z0-9_]{1,20}$/;
    var ck_password =  /^[A-Za-z0-9!@#$%^&*()_]{6,15}$/;
   
    $("#create").die("click").live("click", function () {
       var passwordVal = $("#password").val();
       var checkVal = $("#confirm").val();
       var handleVal = $("#handle").val();
       var hasError = false;
       
       var valResponse = $("#profile_create").validate();
       if (valResponse.form()) 
       {
          $(".errors").hide();
           if (!ck_username.test(handleVal)) {
                $("#handle").after($('<span/>')
                    .attr('class','errors')
                    .html('<br/>Must be alphanumeric.'));
                hasError = true;
           }else
           if (!ck_password.test(passwordVal)) {
              $("#password").after($('<span/>')
                    .attr('class','errors')
                    .html('<br/>Must contain atleast 6 to 15 alphanumeric characters.'));
              hasError = true;
           }else
           if (!ck_password.test(checkVal)) {
              $("#confirm").after($('<span/>')
                    .attr('class','errors')
                    .html('<br/>Must contain atleast 6 to 15 alphanumeric characters.'));
              hasError = true;
           }else
           if (passwordVal != checkVal ) {
              $("#confirm").after($('<span/>')
                    .attr('class','errors')
                    .html('<br/>Passwords do not match.'));
                hasError = true;
            }
            
            /*
            if(!hasError){
                
                 *form = $("#profile_create").serialize();
                $.ajax({
                   type: 'POST',
                   url: "/MyadVenture/profile/save/",
                   data: form,
                   beforeSend: function () {//Notify user of processing message                            
                        $("#create").attr("disabled", "true");
                   },
                   success: function (data) {//Handle Success  
                       $('#modal-body').html(data);
                       //$('#SR_modal').modal('hide'); 
                   }
                   
                });      
            }else return false;
            */
           return !hasError;
        }
    });
});
</script>
<div id="create-profile" class="content scaffold-create" role="main">
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${profileInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${profileInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form id="profile_create" name="profile_create" action="save">
    <fieldset class="form">
      <g:render template="profile"/>
    </fieldset>
    <fieldset class="buttons">
      <div class="modal-footer">
        <g:submitButton name="create" id="create"class="btn btn-info" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <a href="#" id="closebtn" name="closebtn" data-dismiss="modal" class="btn btn-primary">Cancel</a>
      </div>
    </fieldset>
  </g:form>
</div>