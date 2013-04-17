
<%@ page import="TEC.Blog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
						<li><g:link controller="profile" action="show" id="${session.profileInstance.id}"><g:message code="default.button.profile.label" default="My Profile" /></g:link></li>
						<li><g:link controller="profile" action="logout" id="${profileInstance?.id}"><g:message code="default.button.logout.label" default="Sign out" /></g:link></li>
			</ul>
		</div>
		<div id="show-blog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blog">
			
				<g:if test="${blogInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="blog.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${blogInstance}" field="type"/></span>
					
				</li>
				</g:if>

				<g:if test="${blogInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="blog.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${blogInstance}" field="title"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${blogInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="blog.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="profile" action="show" id="${blogInstance?.creator?.id}">${blogInstance?.creator?.email}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${blogInstance?.type == 'Venture'}">
					<g:if test="${session?.ventureInstance}">
						<li class="fieldcontain">
							<span id="ventureOwner-label" class="property-label"><g:message code="blog.ventureOwner.label" default="Venture" /></span>
							<span class="property-value" aria-labelledby="ventureOwner-label"><g:link controller="venture" action="show" id="${blogInstance?.ventureOwner?.id}">${blogInstance?.ventureOwner?.name}</g:link></span>
						</li>
					</g:if>
				</g:if>
				
				<g:if test="${blogInstance?.tagLine}">
				<li class="fieldcontain">
					<span id="tagLine-label" class="property-label"><g:message code="blog.tagLine.label" default="Tag Line" /></span>
					
						<span class="property-value" aria-labelledby="tagLine-label"><g:fieldValue bean="${blogInstance}" field="tagLine"/></span>
					
				</li>
				</g:if>
						
				<g:if test="${blogInstance?.body}">
				<li class="fieldcontain">
					<span id="body-label" class="property-label"><g:message code="blog.body.label" default="Body" /></span>
					
						<span class="property-value" aria-labelledby="body-label"><g:fieldValue bean="${blogInstance}" field="body"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogInstance?.keywords}">
				<li class="fieldcontain">
					<span id="keywords-label" class="property-label"><g:message code="blog.keywords.label" default="Keywords" /></span>
					
						<g:each in="${blogInstance.keywords}" var="k">
						<span class="property-value" aria-labelledby="keywords-label">${k?.name}</span>
						</g:each>
					
				</li>
				</g:if>
			















				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="blog.comments.label" default="Comments" /></span>
					<g:if test="${blogInstance?.comments}">
						<g:each in="${blogInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.reply}</g:link></span>
						</g:each>
					</g:if>

					<span class="property-value" aria-labelledby="comments-label">Add a Comment</span>
					<span class="property-label"><g:message code="blog.opinion.label" default="Opinion" /></span>
				<span class="property-value" aria-labelledby="comments-label">
					<select name="commentAffinity" value="Like it">
						<option value="Like it">Like it</option>
						<option value="Love it">Love it</option>
						<option value="Hate it">Hate it</option>
						<option value="Too vague">Too vague</option>
						<option value="It's OK">It's OK</option>
						<option value="Don't do it">Don't do it</option>
						<option value="It's been done">It's been done</option>
					</select>
				</span>

					<span id="comments-label" class="property-label"><g:message code="blog.opinion.label" default="Response" /></span>
				<span class="property-value" aria-labelledby="comments-label"><g:textField name="commentReply" />
</span>
					<span class="property-value" aria-labelledby="comments-label">
						<g:link class="show" action="addComment" id="${blogInstance?.id}"><g:message code="default.button.show.label" default="Add Comment" /></g:link>
					</span>
				</li>
			</ol>















			<g:if test="${blogInstance?.creator}">
				<g:if test="${session?.profileInstance?.email == blogInstance?.creator?.email}">
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${blogInstance?.id}" />
							<g:link class="edit" action="edit" id="${blogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</g:if>
			</g:if>
		</div>
	</body>
</html>
