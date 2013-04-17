<%@ page import="TEC.Profile" %>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${profileInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${profileInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'avatar', 'error')} ">
	<label for="avatar">
		Avatar
		
	</label>
	<input type="file" id="avatar" name="avatar" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'headline', 'error')} ">
	<label for="headline">
		<g:message code="profile.headline.label" default="Headline" />
		
	</label>
	<g:textField name="headline" value="${profileInstance?.headline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'personalWebpage', 'error')} ">
	<label for="personalWebpage">
		<g:message code="profile.personalWebpage.label" default="Personal Webpage" />
		
	</label>
	<g:field type="url" name="personalWebpage" value="${profileInstance?.personalWebpage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${profileInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="profile.location.label" default="Location" />
		
	</label>
	<input id="location" name="location" value="${profileInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="profile.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day" value="${profileInstance?.birthDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${profileInstance?.phone}"/>
</div>
