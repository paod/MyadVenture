
<%@ page import="TEC.Venture" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venture.label', default: 'Venture')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-venture" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list venture">
			
				<g:if test="${ventureInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="venture.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ventureInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="venture.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${ventureInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.logoUri}">
				<li class="fieldcontain">
					<span id="logoUri-label" class="property-label"><g:message code="venture.logoUri.label" default="Logo Uri" /></span>
					
						<span class="property-value" aria-labelledby="logoUri-label"><g:fieldValue bean="${ventureInstance}" field="logoUri"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.dateOfIncorporation}">
				<li class="fieldcontain">
					<span id="dateOfIncorporation-label" class="property-label"><g:message code="venture.dateOfIncorporation.label" default="Date Of Incorporation" /></span>
					
						<span class="property-value" aria-labelledby="dateOfIncorporation-label"><g:formatDate date="${ventureInstance?.dateOfIncorporation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="venture.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="profile" action="show" id="${ventureInstance?.admin?.id}">${ventureInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.availableRoles}">
				<li class="fieldcontain">
					<span id="availableRoles-label" class="property-label"><g:message code="venture.availableRoles.label" default="Available Roles" /></span>
					
						<g:each in="${ventureInstance.availableRoles}" var="a">
						<span class="property-value" aria-labelledby="availableRoles-label"><g:link controller="role" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.blogs}">
				<li class="fieldcontain">
					<span id="blogs-label" class="property-label"><g:message code="venture.blogs.label" default="Blogs" /></span>
					
						<g:each in="${ventureInstance.blogs}" var="b">
						<span class="property-value" aria-labelledby="blogs-label"><g:link controller="blog" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="venture.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ventureInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.filledRoles}">
				<li class="fieldcontain">
					<span id="filledRoles-label" class="property-label"><g:message code="venture.filledRoles.label" default="Filled Roles" /></span>
					
						<g:each in="${ventureInstance.filledRoles}" var="f">
						<span class="property-value" aria-labelledby="filledRoles-label"><g:link controller="role" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ventureInstance?.id}" />
					<g:link class="edit" action="edit" id="${ventureInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
