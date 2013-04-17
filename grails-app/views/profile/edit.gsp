<%@ page import="TEC.Profile" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'venture.label', default: 'Venture')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <script type="text/javascript">
    $(document).ready(function () {
        $("#location").addresspicker();
        var valResponse = $("#profile_edit").validate();
        $("#update").die("click").live("click", function () {
            return valResponse.form();
        });
     });
  </script>
</head>
<body>
  <div class="container" style="width:320px">
  <div id="edit-profile" class="content scaffold-edit" role="main" >
    <g:hasErrors bean="${profileInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${profileInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form method="post" id="profile_edit" name="profile_edit" enctype="multipart/form-data">
      <g:hiddenField name="id" value="${profileInstance?.id}" />
      <g:hiddenField name="version" value="${profileInstance?.version}" />
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>

      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>

      <fieldset class="buttons">
        <div class="modal-footer">
          <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="btn" action="delete" value="Suspend Profile" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
          <g:link controller="profile" action="page" class="btn btn-primary">Cancel</g:link>
          <!--<a href="#" id="closebtn" name="closebtn" data-dismiss="modal" class="btn btn-primary">Cancel</a>-->
        </div>
      </fieldset>
    </g:form>
  </div>
  </div>
</body>
</html>