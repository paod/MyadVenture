
<%@ page import="TEC.Blog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blog" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'blog.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="tagLine" title="${message(code: 'blog.tagLine.label', default: 'Tag Line')}" />
					
						<g:sortableColumn property="body" title="${message(code: 'blog.body.label', default: 'Body')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'blog.type.label', default: 'Type')}" />
					
						<th><g:message code="blog.creator.label" default="Creator" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'blog.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blogInstanceList}" status="i" var="blogInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blogInstance.id}">${fieldValue(bean: blogInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: blogInstance, field: "tagLine")}</td>
					
						<td>${fieldValue(bean: blogInstance, field: "body")}</td>
					
						<td>${fieldValue(bean: blogInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: blogInstance, field: "creator")}</td>
					
						<td><g:formatDate date="${blogInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blogInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
