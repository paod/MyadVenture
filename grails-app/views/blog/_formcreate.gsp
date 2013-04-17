<%@ page import="TEC.Blog" %>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'title', 'error')} required">
<label for="title">
<g:message code="blog.title.label" default="Title" />
<span class="required-indicator">*</span>
</label>
<g:textField name="title" required="" value="${blogInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'tagLine', 'error')} ">
<label for="tagLine">
<g:message code="blog.tagLine.label" default="Tag Line" />

</label>
<g:textField name="tagLine" value="${blogInstance?.tagLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'body', 'error')} required">
<label for="body">
<g:message code="blog.body.label" default="Body" />
<span class="required-indicator">*</span>	
</label>
<g:textArea name="body" rows="5" required="" value="${blogInstance?.body}"/>
</div>
