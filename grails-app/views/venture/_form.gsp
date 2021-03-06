<%@ page import="TEC.Venture" %>



<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="venture.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ventureInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="venture.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${ventureInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'logoUri', 'error')} ">
	<label for="logoUri">
		<g:message code="venture.logoUri.label" default="Logo Uri" />
		
	</label>
	<g:field type="url" name="logoUri" value="${ventureInstance?.logoUri}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'dateOfIncorporation', 'error')} required">
	<label for="dateOfIncorporation">
		<g:message code="venture.dateOfIncorporation.label" default="Date Of Incorporation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfIncorporation" precision="day"  value="${ventureInstance?.dateOfIncorporation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'admin', 'error')} required">
	<label for="admin">
		<g:message code="venture.admin.label" default="Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="admin" name="admin.id" from="${TEC.Profile.list()}" optionKey="id" required="" value="${ventureInstance?.admin?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'availableRoles', 'error')} ">
	<label for="availableRoles">
		<g:message code="venture.availableRoles.label" default="Available Roles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventureInstance?.availableRoles?}" var="a">
    <li><g:link controller="role" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="role" action="create" params="['venture.id': ventureInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'role.label', default: 'Role')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'blogs', 'error')} ">
	<label for="blogs">
		<g:message code="venture.blogs.label" default="Blogs" />
		
	</label>
	<g:select name="blogs" from="${TEC.Blog.list()}" multiple="multiple" optionKey="id" size="5" value="${ventureInstance?.blogs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'filledRoles', 'error')} ">
	<label for="filledRoles">
		<g:message code="venture.filledRoles.label" default="Filled Roles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventureInstance?.filledRoles?}" var="f">
    <li><g:link controller="role" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="role" action="create" params="['venture.id': ventureInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'role.label', default: 'Role')])}</g:link>
</li>
</ul>

</div>

