
<%@ page import="TEC.Skillset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'skillset.label', default: 'Skillset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-skillset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-skillset" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'skillset.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="proficiency" title="${message(code: 'skillset.proficiency.label', default: 'Proficiency')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'skillset.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="yearsOfExperience" title="${message(code: 'skillset.yearsOfExperience.label', default: 'Years Of Experience')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${skillsetInstanceList}" status="i" var="skillsetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${skillsetInstance.id}">${fieldValue(bean: skillsetInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: skillsetInstance, field: "proficiency")}</td>
					
						<td>${fieldValue(bean: skillsetInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: skillsetInstance, field: "yearsOfExperience")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${skillsetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
