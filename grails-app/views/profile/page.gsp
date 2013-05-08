<%@ page import="TEC.Profile" %>
<%@ page import="TEC.Specialization" %>
<%@ page import="TEC.Skillset" %>
<%@ page import="TEC.Blog" %>
<%@ page import="TEC.Role" %>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>	

  <script type="text/javascript">   
$(document).ready(function() {  
  <g:if test="${session?.user}">
      $(".createventure").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Create Venture</h3>');
        $("#myModal .modal-body").load($(this).attr('href'));
        $('#myModal').modal('show');  
        return false;
      });
      
      $(".specialization_show").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Update Specialization</h3>');
        $("#myModal .modal-body").load($(this).attr('href'));
        $('#myModal').modal('show');  
        return false;
      });
      
      $(".skillset_show").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Update Skillset</h3>');
        $("#myModal .modal-body").load($(this).attr('href'));
        $('#myModal').modal('show');  
        return false;
      });
      
      $(".specialization_show").tooltip({
          position: {
                my: "center bottom-20",
                at: "center top",
                using: function( position, feedback ) {
                    $( this ).css( position );
                    $( "<div>" )
                        .addClass( "arrow" )
                        .addClass( feedback.vertical )
                        .addClass( feedback.horizontal )
                        .appendTo( this );
                }
            },
            track:true
      });
      
        $(".skillset_show").tooltip({
          position: {
                my: "center bottom-20",
                at: "center top",
                using: function( position, feedback ) {
                    $( this ).css( position );
                    $( "<div>" )
                        .addClass( "arrow" )
                        .addClass( feedback.vertical )
                        .addClass( feedback.horizontal )
                        .appendTo( this );
                }
            },
            track:true
      });
  
      $("#update_specialization").die("click").live("click", function () {        
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Specialization</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'specialization', action: 'create', params:[type: 'Personal'])}");
        $('#myModal').modal('show');  
      });
      
      $("#update_skillset").die("click").live("click", function () {        
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Skillset</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'skillset', action: 'create', params:[type: 'Personal'])}");
        $('#myModal').modal('show');  
      });
  
      $("#send_message").die("click").live("click", function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Send Message</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'message', action: 'single', params:[id: profileInstance?.id])}");
        $('#myModal').modal('show'); 
        return false;
      });
  </g:if>
  
  });
  </script> 
</head>
<body>
  <div>
      <div class="message" name="message" id="message" role="status"><g:if test="${flash.message}">${flash.message}</g:if></div>
    
    <g:if test="${!profileInstance?.suspended}">
      <!-- Right side -->
      <div class="span11">
        <div class="well well-large">
          <div id="show-profile" class="content scaffold-show" role="main">
            <text align="center">
            <legend>
              <b>
                <g:fieldValue bean="${profileInstance}" field="firstName"/>
                <g:fieldValue bean="${profileInstance}" field="lastName"/>
              </b>
              <g:if test="${profileInstance?.headline}">
                <span><i><font size="2em">&nbsp;<g:fieldValue bean="${profileInstance}" field="headline"/></font></i></span>
              </g:if>
            </legend>
            </text>
            <div class="span3">
              <g:if test="${profileInstance?.hasAvatar}">
                <img src="http://localhost:8081/uploads/${fieldValue(bean: profileInstance, field: 'handle')}.jpg" class="img-polaroid thumbnail" width="110px" height="110px"/>
              </g:if>
              <g:else>
                <img src="http://localhost:8081/uploads/no-pic-avatar.jpg" class="img-polaroid thumbnail" width="200px" height="200px"/>
              </g:else>
            </div>

            <div class="span4">
              <!--<table border="0">-->
              <g:if test="${profileInstance?.email}">
                <br/>
                <span id="email-label" class="property-label"><g:message code="profile.email.label" default="Email : " /></span>
                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${profileInstance}" field="email"/></span>
              </g:if>

              <g:if test="${profileInstance?.handle}">
                <br/>
                <span id="handle-label" class="property-label"><g:message code="profile.handle.label" default="Handle : " /></span>
                <span class="property-value" aria-labelledby="handle-label"><g:fieldValue bean="${profileInstance}" field="handle"/></span>
              </g:if>

              <g:if test="${profileInstance?.location}">
                <br/>
                <span id="location-label" class="property-label"><g:message code="profile.location.label" default="Location : " /></span>	
                <span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${profileInstance}" field="location"/></span>
              </g:if>

              <g:if test="${profileInstance?.personalWebpage}">
                <br/>
                <span id="location-label" class="property-label"><g:message code="profile.personalWebpage.label" default="Personal Webpage : " /></span>	
                <span class="property-value" aria-labelledby="location-label">
                  <a href="${profileInstance?.personalWebpage}" target="_blank">${profileInstance?.personalWebpage}</a>
                </span>
              </g:if>

              <g:if test="${profileInstance?.birthDate}">
                <br/>
                <span id="birthDate-label" class="property-label"><g:message code="profile.birthDate.label" default="Birth Date : " /></span>
                <span class="property-value" aria-labelledby="birthDate-label"> <g:formatDate format="MMMMMMMMM dd, yyyy" date="${profileInstance?.birthDate}"/></span>
              </g:if>
              <!--</table>-->
            </div>

            <br/><br/><br/><br/><br/><br><legend></legend>

            <div class="pull-right">
              <g:if test="${session?.user?.id == profileInstance?.id}">
                <g:link controller="profile" action="edit" class="btn btn-info">Update Profile</g:link> <!--<button type="button" id="update_profile" name="update_profile" class="btn btn-info">Update Profile</button>-->
              </g:if>
              <g:else>
                <g:if test="${connected == 0}"><g:link controller="ConnectionRequest" action="connectionRequest" id="${profileInstance?.id}" name="connect" class="btn btn-primary">Connect</g:link></g:if>
                <g:if test="${profileInstance?.id != session?.user?.id}"><button type="button" id="send_message" name="send_message" class="btn">Send Message</button></g:if>
              </g:else>
            </div>
            <br/><br/>
          </div> <!-- content scaffold-show -->
        </div>
      </div>
      <div class="span7">
        <div class="well">
          <h4>Blogs<div class="pull-right">${blogCount} Published</div></h4>
          <hr/>
          <g:if test="${blogCount > 0}">
            <div id="list-blog" class="content scaffold-list" role="main">
              <table>
                <thead>
                  <tr>
                <g:sortableColumn property="title" title="${message(code: 'blog.title.label', default: 'Title')}" />
                <g:sortableColumn property="type" title="${message(code: 'blog.type.label', default: 'Type')}" />
                <g:sortableColumn property="c.id" title="${message(code: 'blog.comments.label', default: 'Comments')}" />
                <g:sortableColumn property="dateCreated" title="${message(code: 'blog.dateCreated.label', default: 'Date Created')}" />
                <g:sortableColumn property="lastUpdated" title="${message(code: 'blog.dateCreated.label', default: 'Last Updated')}" />
                </tr>
                </thead>
                <tbody>
                <g:each in="${blogs}" status="i" var="blogInstance">
                  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>
                      <span><g:link controller="blog" action="show" id="${blogInstance.id}">${fieldValue(bean: blogInstance, field: "title")}</g:link>
                        <br/>&emsp;&emsp;<small>${fieldValue(bean: blogInstance, field: "tagLine")}</small></span>
                    </td>
                    <td>${fieldValue(bean: blogInstance, field: "type")}</td>
                    <td><a class="post-com-count" href="#" title="0 pending"><span class="comment-count">${fieldValue(bean: blogInstance, field: "c.id")}</span> </a></td>
                    <td><g:formatDate date="${blogInstance.dateCreated}" /></td>
                  <td>
                  <g:formatDate format="MMMMMMMMM dd, yyyy" date="${blogInstance.lastUpdated}"/> - <g:link controller="blog" action="edit" id="${blogInstance.id}"> edit</g:link>
                  </td>
                  </tr>
                </g:each>
                </tbody>
              </table>
              <div class="pagination"><g:paginate total="${blogCount}" /></div>
            </div>
          </g:if>
          <g:else>
            <center>
              <g:if test="${profileInstance?.id == session?.user?.id}">You don't </g:if>
              <g:else>${profileInstance?.firstName} doesn't</g:else> have any blogs!
            </center>
            <br/>
          </g:else>
          <g:if test="${profileInstance?.id == session?.user?.id}">
            <button type="button" id="createblogprofile" class="btn btn-primary pull-right">Create Blog</button>
            <br/><br/>
          </g:if>
        </div>
      </div> <!-- End span7 -->

      <div class="span4">
        <div class="well">
          <h4>Skills and Specializations</h4><hr/>
          <h4>Skills</h4>
          <g:if test="${skills}">
            <br/><div style="height:200px; overflow-y:scroll;">
            <table class="table table-condensed" >
              <thead>
                <tr>&nbsp;</tr>
                <tr>&nbsp;</tr>
              </thead>
              <tbody>
              <g:each in="${skills}">
                <tr>
                  <td >
                    <g:if test="${session?. user?.id == profileInstance?.id}">
                      <g:link controller="skillset" class="skillset_show" title="Proficiency: ${it[3]} | Experience: ${it[2]} years" action="edit" id="${it[0]}">${it[1]}</g:link>
                    </g:if>
                    <g:else>
                      <g:link class="skillset_show" title="Proficiency: ${it[3]} | Experience: ${it[2]} years">${it[1]}</g:link>
                    </g:else>  <!--<g:link controller="skillset" class="skillset_show" title="Proficiency: ${it[3]} | Experience: ${it[2]} years" action="show" id="${it[0]}">${it[1]}</g:link>-->
                  </td>
                  <td>
                    <g:if test="${session?.user?.id == profileInstance?.id}"><g:link controller="skillset" onclick="return confirm('Do you want to delete this skillset?');" action="delete" class="specialization_delete" class="btn" id="${it[0]}">X</g:link></g:if>
                  </td>
                </tr>
              </g:each>
              <tr><td></td></tr>
            </tbody>
            </table>
            </div>
          </g:if>
          <g:else>
            <small><center>
                <br/><g:if test="${profileInstance?.id == session?.user?.id}">You doesn't</g:if>
                <g:else>${profileInstance?.firstName} doesn't </g:else> have any skills!
              </center></small>
            <br/>
          </g:else>
          <h4>Specializations </h4> 
          <g:if test="${specializations}">
            <br/><div style="height:200px; overflow-y:scroll;">
            <table class="table table-condensed" >
              <thead>
                <tr>&nbsp;</tr>
                <tr>&nbsp;</tr>
              </thead>
              <tbody>
              <g:each in="${specializations}">
                <tr>
                  <td >
                    <g:if test="${session?. user?.id == profileInstance?.id}">
                      <g:link controller="specialization" class="specialization_show" title="Proficiency: ${it[3]} | Experience: ${it[2]} years" action="edit" id="${it[0]}">${it[1]}</g:link>
                    </g:if>
                    <g:else>
                      <g:link class="specialization_show" title="Proficiency: ${it[3]} | Experience: ${it[2]} years">${it[1]}</g:link>
                    </g:else>  <!--<g:link controller="specialization" class="specialization_show" title="Proficiency: ${it[3]} | Experience: ${it[2]} years" action="show" id="${it[0]}">${it[1]}</g:link>-->
                  </td>
                  <td>
                    <g:if test="${session?.user?.id == profileInstance?.id}"><g:link controller="specialization" onclick="return confirm('Do you want to delete this specialization?');" action="delete" class="specialization_delete" class="btn" id="${it[0]}">X</g:link></g:if>
                  </td>
                </tr>
              </g:each>
              <tr><td></td></tr>
            </tbody>
            </table>
            </div>
          </g:if>
          <g:else>
            <small><center><br/>
                <g:if test="${profileInstance?.id == session?.user?.id}">You don't</g:if>
                <g:else>${profileInstance?.firstName} doesn't</g:else> have any specializations!</center></small>
          </g:else>
          <br/>
          <g:if test="${profileInstance?.id == session?.user?.id}">
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-mini btn-primary ">Add</button>
              <button type="button" class="btn btn-mini btn-primary dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#" id="update_skillset" id="update_skillset">Skillsets</a></li>
                <li><a href="#" id="update_specialization" name="update_specialization">Specializations</a></li>
              </ul>
            </div>
            <br/><br/>
          </g:if>
        </div>

        <div class="well well-large">
          <h4>Ventures</h4>
          <hr/>
          <g:if test="${ventures}">
            <br/><div style="height:200px; overflow-y:scroll;">
            <table class="table table-condensed" >
              <thead>
                <tr>&nbsp;</tr>
                <tr>&nbsp;</tr>
              </thead>
              <tbody>
              <g:each in="${ventures}">
                <tr>
                  <td>
                    
                  </td>
                  <td>
                  </td>
                </tr>
              </g:each>
              <tr><td></td></tr>
            </tbody>
            </table>
            </div>
          </g:if>
          
          
          
          
          
          <!-- For each venture -->
          <g:if test="${ventures}">
            <g:each in="${ventures}">
              <div class="media-body">
                <a class="pull-left" href="#">
                  <img class="media-object" src="http://localhost:8081/uploads/no-pic-avatar.jpg" width="64px" height="64px"/>
                </a>
                <div class="media"><small></small></div>
              </div>
            </g:each>
          </g:if>
          
          
          
          <g:else>
            <center><g:if test="${profileInstance?.id == session?.user?.id}">You aren't</g:if>
              <g:else>${profileInstance?.firstName} isn't</g:else> part of a venture!
            </center>
          </g:else>
          <!-- End for each venture -->

          <br/>
          <g:if test="${profileInstance?.id == session?.user?.id}">
            <div class="btn-group pull-right">
              <button type="button" class="btn btn-mini btn-primary ">Actions</button>
              <button type="button" class="btn btn-mini btn-primary dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
              <ul class="dropdown-menu">
                <li><a href="${createLink(controller: 'venture', action: 'show', id: session?.user?.id)}">View Ventures</a></li>
                <li><a href="${createLink(controller: 'venture', action: 'create')}" class="createventure">Add Venture</a></li>
              </ul>
            </div>
            <br/><br/>
          </g:if>
        </div>

        <div class="well well-large">
          <h4>Connection Requests</h4>
          <hr/><br/>
          <!-- <div class="pull-right"><a href="#">show all</a></div> -->
          <!-- For each contact -->
          <g:if test="${connectionRequestCount > 0}">
            <g:each in="${connectionRequestList}">
              <div class="media-body">
                <a class="pull-left" href="#">
              <g:if test="${it[0][2]}">
                <img src="http://localhost:8081/uploads/${it[0][1]}.jpg" class="img-polaroid thumbnail" width="110px" height="110px"/>
              </g:if>
              <g:else>
                <img src="http://localhost:8081/uploads/no-pic-avatar.jpg" class="img-polaroid thumbnail" width="200px" height="200px"/>
              </g:else>
                </a>
                <h4 class="media-heading"> <g:link controller="profile" action="show" id="${it[0][0]}">${it[0][3]} ${it[0][4]}</g:link></h4>
                <div class="media"><small> ${it[0][1]} </small></div>
              </div>
            </g:each>
            <!-- End for each contact -->
            <br/>
            <g:if test="${profileInstance?.id == session?.user?.id}">
              <div class="btn-group pull-right">
                <button type="button" class="btn btn-mini btn-primary ">Actions</button>
                <button type="button" class="btn btn-mini btn-primary dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                  <li><a href="#" id="FIXME">View Connections</a></li>
                  <li><a href="#" id="addcontact">Add Connection</a></li>
                </ul>
              </div>
              <br/><br/>
            </g:if>
          </g:if>
          <g:else>
            <center><g:if test="${profileInstance?.id == session?.user?.id}">You don't </g:if>
              <g:else>${profileInstance?.firstName} doesn't</g:else> have any connection requests!</center><br/>
          </g:else>
        </div>
      </div>
    </g:if>
    <g:else>
      <div id="show-profile" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
        <!--<g:if test="${flash.message}">-->
          <div class="message" role="status">${flash.message}</div>
        <!--</g:if>-->
        <label>This profile has been suspended</label>
      </div>
    </g:else>
  </div>
</body>
</html>
