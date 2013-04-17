<%@ page import="TEC.Blog" %>
<!-- <!DOCTYPE html>
<html>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
		<g:javascript src="jquery/jquery-1.7.1.js"/>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#btnAddKeyword').click(function() {
					var num = $('.clonedInputKeyword').length;	//	get index
					var newNum = new Number(num + 1);	//	get new index
					var newElem = $('#keyInput' + num).clone().attr('id', 'keyInput' + newNum);	//	create new element


			//	set names and ids of new element

					newElem.find(">:#keywordKey" + num).attr('id', 'keywordKey' + newNum).attr('name', 'keywordKey').attr('value', '');

					$('#keywordKey' + num).after(newElem);	//	place new element after current element
				});
			});
		</script>
	<body>
		<!-- <a href="#edit-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="profile" action="show" id="${session.profileInstance.id}"><g:message code="default.button.profile.label" default="My Profile" /></g:link></li>
				<li><g:link controller="profile" action="logout" id="${profileInstance?.id}"><g:message code="default.button.logout.label" default="Sign out" /></g:link></li>
			</ul>
		</div> -->
		<div id="edit-blog" class="content scaffold-edit" role="main">
			<!-- <h1><g:message code="default.edit.label" args="[entityName]" /></h1> -->
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${blogInstance?.id}" />
				<g:hiddenField name="version" value="${blogInstance?.version}" />
				<fieldset class="form">
					<g:render template="formedit"/>
				</fieldset>
				<fieldset class="buttons">
					<div class="modal-footer">
						<g:actionSubmit class="btn" action="cancel" value="${message(code: 'default.button.cancelupdate.label', default: 'Cancel')}" />
						<g:actionSubmit class="btn btn-info save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
<!-- </html> -->
