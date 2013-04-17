
<%@ page import="TEC.Specialization" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'specialization.label', default: 'Specialization')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-specialization" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-specialization" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list specialization">
			
				<g:if test="${specializationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="specialization.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${specializationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specializationInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="specialization.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${specializationInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specializationInstance?.profiles}">
				<li class="fieldcontain">
					<span id="profiles-label" class="property-label"><g:message code="specialization.profiles.label" default="Profiles" /></span>
					
						<span class="property-value" aria-labelledby="profiles-label"><g:link controller="profile" action="show" id="${specializationInstance?.profiles?.id}">${specializationInstance?.profiles?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specializationInstance?.ventures}">
				<li class="fieldcontain">
					<span id="ventures-label" class="property-label"><g:message code="specialization.ventures.label" default="Ventures" /></span>
					
						<span class="property-value" aria-labelledby="ventures-label"><g:link controller="venture" action="show" id="${specializationInstance?.ventures?.id}">${specializationInstance?.ventures?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specializationInstance?.proficiency}">
				<li class="fieldcontain">
					<span id="proficiency-label" class="property-label"><g:message code="specialization.proficiency.label" default="Proficiency" /></span>
					
						<span class="property-value" aria-labelledby="proficiency-label"><g:fieldValue bean="${specializationInstance}" field="proficiency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specializationInstance?.yearsOfExperience}">
				<li class="fieldcontain">
					<span id="yearsOfExperience-label" class="property-label"><g:message code="specialization.yearsOfExperience.label" default="Years Of Experience" /></span>
					
						<span class="property-value" aria-labelledby="yearsOfExperience-label"><g:fieldValue bean="${specializationInstance}" field="yearsOfExperience"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${specializationInstance?.id}" />
					<g:link class="edit" action="edit" id="${specializationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
