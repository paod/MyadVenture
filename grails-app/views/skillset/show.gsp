
<%@ page import="TEC.Skillset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'skillset.label', default: 'Skillset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-skillset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-skillset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list skillset">
			
				<g:if test="${skillsetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="skillset.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${skillsetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${skillsetInstance?.proficiency}">
				<li class="fieldcontain">
					<span id="proficiency-label" class="property-label"><g:message code="skillset.proficiency.label" default="Proficiency" /></span>
					
						<span class="property-value" aria-labelledby="proficiency-label"><g:fieldValue bean="${skillsetInstance}" field="proficiency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${skillsetInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="skillset.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${skillsetInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${skillsetInstance?.yearsOfExperience}">
				<li class="fieldcontain">
					<span id="yearsOfExperience-label" class="property-label"><g:message code="skillset.yearsOfExperience.label" default="Years Of Experience" /></span>
					
						<span class="property-value" aria-labelledby="yearsOfExperience-label"><g:fieldValue bean="${skillsetInstance}" field="yearsOfExperience"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${skillsetInstance?.id}" />
					<g:link class="edit" action="edit" id="${skillsetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
