<%@ page import="TEC.Skillset" %>

<g:hiddenField name="type" value="${skillsetInstance?.type}" />
<div class="fieldcontain ${hasErrors(bean: skillsetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="skillset.name.label" default="Name" />
		<span class="required-indicator">*</span>
                
	</label>
	<g:textField name="name" maxlength="25" required="" value="${skillsetInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: skillsetInstance, field: 'proficiency', 'error')} ">
	<label for="proficiency">
		<g:message code="skillset.proficiency.label" default="Proficiency" />
		
	</label>
	<g:select name="proficiency" from="${skillsetInstance.constraints.proficiency.inList}" value="${skillsetInstance?.proficiency}" valueMessagePrefix="skillset.proficiency" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: skillsetInstance, field: 'yearsOfExperience', 'error')} required">
	<label for="yearsOfExperience">
		<g:message code="skillset.yearsOfExperience.label" default="Years Of Experience" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="yearsOfExperience" from="${1..60}" class="range" required="" value="${skillsetInstance?.yearsOfExperience ?: 1}"/>
</div>

