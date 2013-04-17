<%@ page import="TEC.Specialization" %>
  <script type="text/javascript">
  $(document).ready(function() {
    //queries Google Products
    $("#name").googleSuggest({service: "web"}); s
  });
  </script>
  
<div id="create-specialization" class="content scaffold-create" role="main">
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${specializationInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${specializationInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form  id="specialization_create" name="specialization_create" action="save" >
    <fieldset class="form">
      <g:render template="form"/>
    </fieldset>
    <fieldset class="buttons">
      <div class="modal-footer">
        <g:submitButton name="create" id="create"class="btn btn-info" value="Create" />
        <a href="#" id="closebtn" name="closebtn" data-dismiss="modal" class="btn btn-primary">Cancel</a>
      </div>
    </fieldset>
  </g:form>
</div>