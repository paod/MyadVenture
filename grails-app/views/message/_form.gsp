<%@ page import="TEC.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'thread', 'error')} ">
	<label for="thread">
		<g:message code="message.thread.label" default="Thread" />
		
	</label>
	<g:textField name="thread" value="${messageInstance?.thread}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="message.body.label" default="Body" />
		
	</label>
	<g:textArea name="body" cols="40" rows="5" maxlength="320" value="${messageInstance?.body}"/>
</div>

