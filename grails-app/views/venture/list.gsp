
<%@ page import="TEC.Venture" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venture.label', default: 'Venture')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="list-venture" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <center>
                          <table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'venture.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="dateOfIncorporation" title="${message(code: 'venture.dateOfIncorporation.label', default: 'Date Of Incorporation')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${ventureInstanceList}" status="i" var="ventureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td> 
                                                  <a class="pull-left" href="#">
                                                    <img class="media-object" src="http://localhost:8081/uploads/no-pic-avatar.jpg" width="64px" height="64px"/>
                                                  </a>

                                                  <h4 class="media-heading"> <g:link controller="venture" action="show" id="${ventureInstance[0]}">${ventureInstance[1]}</g:link></h4>
                                                  <div class="media"><small></small></div>
                                              </td>
					
						<td><g:formatDate date="${ventureInstance[3]}" /></td>
			
					</tr>
				</g:each>
				</tbody>
			</table>
                        </center>
			<div class="pagination">
				<g:paginate total="${ventureInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
