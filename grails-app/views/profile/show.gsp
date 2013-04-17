<g:if test="${flash.message}">
  <div class="message" role="status">${flash.message}</div>
</g:if>
<ol class="property-list profile">

  <g:if test="${profileInstance?.firstName}">
    <li class="fieldcontain">
      <span id="firstName-label" class="property-label"><g:message code="profile.firstName.label" default="First Name" /></span>

      <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${profileInstance}" field="firstName"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.lastName}">
    <li class="fieldcontain">
      <span id="lastName-label" class="property-label"><g:message code="profile.lastName.label" default="Last Name" /></span>

      <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${profileInstance}" field="lastName"/></span>

    </li>
  </g:if>
  
  <g:if test="${profileInstance?.location}">
    <li class="fieldcontain">
      <span id="location-label" class="property-label"><g:message code="profile.location.label" default="Location" /></span>

      <span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${profileInstance}" field="location"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.birthDate}">
    <li class="fieldcontain">
      <span id="birthDate-label" class="property-label"><g:message code="profile.birthDate.label" default="Birth Date" /></span>

      <span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${profileInstance?.birthDate}" /></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.headline}">
    <li class="fieldcontain">
      <span id="headline-label" class="property-label"><g:message code="profile.headline.label" default="Headline" /></span>

      <span class="property-value" aria-labelledby="headline-label"><g:fieldValue bean="${profileInstance}" field="headline"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.handle}">
    <li class="fieldcontain">
      <span id="handle-label" class="property-label"><g:message code="profile.handle.label" default="Handle" /></span>

      <span class="property-value" aria-labelledby="handle-label"><g:fieldValue bean="${profileInstance}" field="handle"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.personalWebpage}">
    <li class="fieldcontain">
      <span id="personalWebpage-label" class="property-label"><g:message code="profile.personalWebpage.label" default="Personal Webpage" /></span>

      <span class="property-value" aria-labelledby="personalWebpage-label"><g:fieldValue bean="${profileInstance}" field="personalWebpage"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.email}">
    <li class="fieldcontain">
      <span id="email-label" class="property-label"><g:message code="profile.email.label" default="Email" /></span>

      <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${profileInstance}" field="email"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.phone}">
    <li class="fieldcontain">
      <span id="phone-label" class="property-label"><g:message code="profile.phone.label" default="Phone" /></span>

      <span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${profileInstance}" field="phone"/></span>

    </li>
  </g:if>

  <g:if test="${profileInstance?.skillsets}">
    <li class="fieldcontain">
      <span id="skillsets-label" class="property-label"><g:message code="profile.skillsets.label" default="Skillsets" /></span>

    <g:each in="${profileInstance.skillsets}" var="s">
      <span class="property-value" aria-labelledby="skillsets-label"><g:link controller="skillset" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
    </g:each>

    </li>
  </g:if>

  <g:if test="${profileInstance?.specializations}">
    <li class="fieldcontain">
      <span id="specializations-label" class="property-label"><g:message code="profile.specializations.label" default="Specializations" /></span>

    <g:each in="${profileInstance.specializations}" var="s">
      <span class="property-value" aria-labelledby="specializations-label"><g:link controller="specialization" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
    </g:each>

    </li>
  </g:if>
</ol>