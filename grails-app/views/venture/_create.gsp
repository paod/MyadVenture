<%@ page import="TEC.Venture" %>
<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="venture.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ventureInstance?.name}"/>
</div>

<label for="logoUri">
   Logo
</label>
<g:field type="file" name="logoUri"/>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="venture.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${ventureInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'dateOfIncorporation', 'error')} required">
	<label for="dateOfIncorporation">
		<g:message code="venture.dateOfIncorporation.label" default="Date Of Incorporation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfIncorporation" precision="day" required="" value="${ventureInstance?.dateOfIncorporation}"  />
</div>