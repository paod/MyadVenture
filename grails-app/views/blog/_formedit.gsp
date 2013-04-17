
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
	<g:textArea rows="4" name="body" required="" value="${blogInstance?.body}"/>
</div>

<!-- <div class="fieldcontain">
	<label>
		<g:message code="blog.keywords.label" default="Keywords" />
	</label>
	<input type="button" id="btnAddKeyword" value="Add more keywords" />
</div>

<g:if test="${blogInstance}">
<g:if test="${blogInstance.keywords}">
<g:each status="i" in="${blogInstance.keywords}" var="keyword0">
<div class="clonedInputKeyword" name="keyInput" id="keyInput${i+1}">
	<input type="text" name="keywordKey" id="keywordKey${i+1}" value="${keyword0.name}" />
</div>
</g:each>
</g:if>
<g:else>
<div class="clonedInputKeyword" name="keyInput" id="keyInput1">
	<input type="text" name="keywordKey" id="keywordKey1"/>
</div>
</g:else>
</g:if>
<g:else>
<div class="clonedInputKeyword" name="keyInput" id="keyInput1">
	<input type="text" name="keywordKey" id="keywordKey1"/>
</div>
</g:else> -->
