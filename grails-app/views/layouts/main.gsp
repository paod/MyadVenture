<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title><g:layoutTitle default="MyadVenture"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'jquery/css/ui-lightness/jquery-ui-1.9.2.custom.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'datatable/media/css/demo_page.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'datatable/media/css/demo_table.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'jquery/css/autoSuggest.css')}" type="text/css">
      <!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css"> -->

    <script src="http://maps.google.com/maps/api/js?sensor=false"/>
  <g:javascript src="application.js" />
  <g:javascript src="jquery/js/jquery-1.8.3.js" />
  <g:javascript src="jquery/js/jquery-ui-1.9.2.custom.min.js"/>
  <g:javascript src="jquery/js/jquery.autoSuggest.minified.js" />
  <g:javascript src="bootstrap.js" />
  <g:javascript src="jquery.validate.min.js" />
  <g:javascript src="jquery.googleSuggest.js" />
  <g:javascript src="jquery.ui.addresspicker.js"/>
  <g:javascript src="datatable/media/js/jquery.dataTables.min.js"/>

  <style type="text/css">
    body {
      padding-top: 20px;
      padding-bottom: 40px;
    }
  </style>
  <script type="text/javascript">
  $(document).ready(function() {
      $('.dropdown-toggle').dropdown();
      // Click create shows modal
      $("#createprofile").die("click").live("click", function () {  
              $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Account</h3>');
              $("#myModal .modal-body").load("${createLink(controller: 'profile', action: 'create')}");
              //$("#myModal .modal-footer").load("${createLink(controller: 'profile', action: 'create')}");
              $('#myModal').modal('show');
      });

      // Click signin shows modal
      $("#signin").die("click").live("click", function () {  
              $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Sign in</h3>');
              $("#myModal .modal-body").load("${createLink(controller: 'profile', action: 'login')}");
              $('#myModal').modal('show');
      });

      $('#myModal').on('hidden', function () {
          // clear html from modal
          $("#myModal .modal-header").html("");
          $("#myModal .modal-body").html("");
      });
    
  });
  </script>
  <g:layoutHead/>
  <r:layoutResources />
</head>
<body>
  <div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
        <span class="brand">MyadVenture</span>
        <g:if test="${session.user}">
          <!-- ONLY IF LOGGED IN -->
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><g:link controller="profile" action="page">My Profile</g:link></li>
              <li><a href="${createLink(controller: 'message', action: 'list')}">Messages</a></li>
              <li><a href="${createLink(controller: 'profile', action: 'generateIdeationCorner')}">Ideas</a></li>

              <li class="dropdown">

                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ventures <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">My Ventures</li>

                  <li><a href="${createLink(controller: 'venture', action: 'generateVentureView', id: session.user.id)}">Show Mine</a></li>
                  <li><a href="#" id="createventure">Create</a></li>

                </ul>
              </li>

              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">People <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="nav-header">Contacts</li>
                  <li><a href="${createLink(controller: 'mailbox', action: 'show', id: session?.profileInstance?.mailboxId )}">Messages</a></li>
                  <li><a href="#">Show All</a></li>
                </ul>
              </li>

            </ul>
        </g:if>
        <g:else>
          <button type="button" name="signin" id="signin" class="btn btn-primary">Sign in</button>
          <button type="button" id="createprofile" name="createprofile" class="btn" value="Create Profile"/>Create Profile</button>
        </g:else>
        <g:form class="navbar-form pull-right">

          <g:if test="${session.user}">
            <div id="show-profile" class="content scaffold-show topbartext" role="main">
                    <!-- Welcome <g:link controller="profile" action="show" id="${session.user?.id}">${session.user.firstName} ${session.user.lastName}</g:link>! -->
                    <!-- <g:link controller="profile" action="logout" id="${profileInstance?.id}"> -->
                    <!-- <button type="button" class="btn btn-primary"><i class="icon-user icon-white"></i> Welcome ${session.user.firstName} ${session.user.lastName}</button> -->
              <!-- </g:link> -->

              <div class="btn-group">
                <button type="button" class="btn btn-primary" id="showprofile">
                  <i class="icon-user icon-white"></i> Welcome ${session.user.firstName}
                </button>
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                  <li><a href="#" id="changepassword">Suspend Account</a></li>
                  <li><a href="#" id="changepassword">Change Password</a></li>
                  <li><g:link controller="profile" action=" logout">Sign Out</g:link></li>
                </ul>
              </div>
            </div>
          </g:if>
          <g:else>
            <div id="show-profile" class="content scaffold-show topbartext" role="main">
              <g:form>
                <fieldset class="buttons">
                  <g:link controller="profile" action="login"></g:link>
                  <g:link controller="profile" action="create"></g:link>
                  <g:if test="${flash.message}">
                    <div class="errormessage" role="status"><font size="4em" color="red">${flash.message}</font></div>
                  </g:if>
                </fieldset>
              </g:form>
            </div>
          </g:else>

        </g:form>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>


<div class="container">
  <!-- Modal -->
  <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-header">
      <button type="button" id="close" class="close" data-dismiss="modal" aria-hidden="true">X</button>
      <h3 id="myModalLabel">Modal header</h3>
    </div>
    <div class="modal-body">
      <p></p>
    </div>
    <div class="modal-footer">
    </div>
  </div>
  <!-- End Modal -->
  <!-- Button to trigger modal -->

  <g:layoutBody/>
  <div class="footer" role="contentinfo"></div>
  <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
  <g:javascript library="application"/>
  <r:layoutResources />

  <div id="footer">
    <div class="container">
    </div>
  </div>

  <div id="footer">
    <div class="container">
      <center><p class="muted ">&copy TEC 2012</a>.</p></center>
    </div>
  </div>
</div> <!-- /container -->

</body>
</html>