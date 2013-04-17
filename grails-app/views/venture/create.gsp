<%@ page import="TEC.Venture" %>

		<div id="create-venture" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ventureInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ventureInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="create"/>
				</fieldset>
    <fieldset class="buttons">
      <div class="modal-footer">
        <g:submitButton name="create" id="create"class="btn btn-info" value="Create Venture" />
        <a href="#" id="closebtn" name="closebtn" data-dismiss="modal" class="btn btn-primary">Cancel</a>
      </div>
    </fieldset>
			</g:form>
		</div>