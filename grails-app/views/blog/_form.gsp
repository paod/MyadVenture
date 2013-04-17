<%@ page import="TEC.Blog" %>



<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="blog.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="30" required="" value="${blogInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'tagLine', 'error')} ">
	<label for="tagLine">
		<g:message code="blog.tagLine.label" default="Tag Line" />
		
	</label>
	<g:textField name="tagLine" maxlength="30" value="${blogInstance?.tagLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'body', 'error')} required">
	<label for="body">
		<g:message code="blog.body.label" default="Body" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="body" cols="40" rows="5" maxlength="500" required="" value="${blogInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="blog.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${blogInstance.constraints.type.inList}" value="${blogInstance?.type}" valueMessagePrefix="blog.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="blog.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${blogInstance?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['blog.id': blogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="blog.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${TEC.Profile.list()}" optionKey="id" required="" value="${blogInstance?.creator?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'keywords', 'error')} ">
	<label for="keywords">
		<g:message code="blog.keywords.label" default="Keywords" />
		
	</label>
	<g:select name="keywords" from="${TEC.Keyword.list()}" multiple="multiple" optionKey="id" size="5" value="${blogInstance?.keywords*.id}" class="many-to-many"/>
</div>

