
<%@ page import="TEC.Message" %>
<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} required">
	<label for="specialization">
		<g:message code="profile.firstName.label" default="Specialization" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="specialization" required="" value="${specialization?.specialization}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'recipient', 'error')} required">
	<label for="">
		<g:message code="profile.lastName.label" default="Years Experience" />
	</label>
	<g:select name="yearsOfExperience" from="${1..50}" value="${yearsOfExperience}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'body', 'error')} ">
	<label for="proficiency">
		<g:message code="profile.handle.label" default="Proficiency" />
		
	</label>
	<select name="proficiency">
		<option value="Beginner"> Beginner </option>
		<option value="Intermediate"> Intermediate </option>
		<option value="Advanced"> Advanced </option>
		<option value="Expert"> Expert </option>
	</select>
</div>


