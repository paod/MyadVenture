<%@ page import="TEC.Skillset" %>
<script type="text/javascript">
$(document).ready(function () {
    $("#name").googleSuggest({service: "web"}); 
    
    var valResponse = $("#specialization_edit").validate();
    $("#update").die("click").live("click", function () {
        return valResponse.form();
    });
 });
</script>
<div id="edit-skillset" class="content scaffold-edit" role="main">
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${skillsetInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${skillsetInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form method="post" >
    <g:hiddenField name="id" value="${skillsetInstance?.id}" />
    <g:hiddenField name="version" value="${skillsetInstance?.version}" />
    <fieldset class="form">
      <g:render template="form"/>
    </fieldset>
    <fieldset class="buttons">
      <div class="modal-footer">
	<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <a href="#" id="closebtn" name="closebtn" data-dismiss="modal" class="btn btn-primary">Cancel</a>
      </div>
    </fieldset>
  </g:form>
</div>