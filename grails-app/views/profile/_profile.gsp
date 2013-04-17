<%@ page import="TEC.Profile" %>
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${profileInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${profileInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'handle', 'error')} required">
	<label for="handle">
		<g:message code="profile.handle.label" default="Handle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="handle" required="" value="${profileInstance?.handle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${profileInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="profile.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" maxlength="15" name="password" required="" value="${profileInstance?.password}"/>
</div>

<div class="fieldcontain required">
	<label>
		<g:message code="profile.password.label" default="Confirm Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" id="confirm" name="confirm" maxlength="15" required="" value="${profileInstance?.password}"/>
</div>