<%@ page import="TEC.Blog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="profile" action="show" id="${session.profileInstance.id}"><g:message code="default.button.profile.label" default="My Profile" /></g:link></li>
				<li><g:link controller="profile" action="logout" id="${profileInstance?.id}"><g:message code="default.button.logout.label" default="Sign out" /></g:link></li>
			</ul>
		</div>
		<div id="create-blog" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
					<g:submitButton name="create" class="save" value="This is the create.gsp, not createProfileBlog.gsp or createIdeationBlog.gsp" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
