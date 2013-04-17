
<%@ page import="TEC.Specialization" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'specialization.label', default: 'Specialization')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-specialization" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-specialization" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'specialization.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'specialization.description.label', default: 'Description')}" />
					
						<th><g:message code="specialization.profiles.label" default="Profiles" /></th>
					
						<th><g:message code="specialization.ventures.label" default="Ventures" /></th>
					
						<g:sortableColumn property="proficiency" title="${message(code: 'specialization.proficiency.label', default: 'Proficiency')}" />
					
						<g:sortableColumn property="yearsOfExperience" title="${message(code: 'specialization.yearsOfExperience.label', default: 'Years Of Experience')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${specializationInstanceList}" status="i" var="specializationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${specializationInstance.id}">${fieldValue(bean: specializationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: specializationInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: specializationInstance, field: "profiles")}</td>
					
						<td>${fieldValue(bean: specializationInstance, field: "ventures")}</td>
					
						<td>${fieldValue(bean: specializationInstance, field: "proficiency")}</td>
					
						<td>${fieldValue(bean: specializationInstance, field: "yearsOfExperience")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${specializationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
