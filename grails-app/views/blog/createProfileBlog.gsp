<%@ page import="TEC.Blog" %>

<body>
	<div id="create-blog" class="content scaffold-create" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${blogInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${blogInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
		<g:form action="createProfileBlog" >
			<fieldset class="form">
				<g:render template="formcreate"/>
			</fieldset>
			<fieldset class="buttons">
				<div class="modal-footer">
					<button class="btn" type="button" id="cancel">Cancel</button>
					<g:submitButton name="create" class="btn btn-info" value="Create Blog" />
				</div>
			</fieldset>
		</g:form>
	</div>
</body>