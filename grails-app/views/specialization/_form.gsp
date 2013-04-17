<%@ page import="TEC.Specialization" %>

<g:hiddenField name="type" value="${specializationInstance?.type}" />
<div class="fieldcontain ${hasErrors(bean: specializationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="specialization.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" maxlength="25" value="${specializationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specializationInstance, field: 'proficiency', 'error')} ">
	<label for="proficiency">
		<g:message code="specialization.proficiency.label" default="Proficiency" />
		
	</label>
	<g:select name="proficiency" from="${specializationInstance.constraints.proficiency.inList}" value="${specializationInstance?.proficiency}" valueMessagePrefix="specialization.proficiency" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specializationInstance, field: 'yearsOfExperience', 'error')} required">
	<label for="yearsOfExperience">
		<g:message code="specialization.yearsOfExperience.label" default="Years Of Experience" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="yearsOfExperience" from="${1..60}" class="range" value="${specializationInstance?.yearsOfExperience ?: 1}"/>
</div>