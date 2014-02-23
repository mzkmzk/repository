<%@ page language="java" import="java.util.*,bean.*,java.lang.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <meta charset="utf-8">
	<meta http-equiv="description" content="This is my page">
	
 <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->


  
    <!-- Styles --> 
    <link type="text/css" href="css/custom-theme/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
    <link href="bootstrap/bootstrap.css" rel="stylesheet">
    <link href="css/demo.css" rel="stylesheet">
    <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; /* 40px to make the container go all the way to the bottom of the topbar */
      }
      .container > footer p {
        text-align: center; /* center align it with the container */
      }
      .container {
        width: 820px; /* downsize our container to make the content feel a bit tighter and more cohesive. NOTE: this removes two full columns from the grid, meaning you only go to 14 columns and not 16. */
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; /* negative indent the amount of the padding to maintain the grid system */
        -webkit-border-radius: 0 0 6px 6px;
           -moz-border-radius: 0 0 6px 6px;
                border-radius: 0 0 6px 6px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

      /* Page header tweaks */
      .page-header {
        background-color: #f5f5f5;
        padding: 20px 20px 10px;
        margin: -20px -20px 20px;
      }

      /* Styles you shouldn't keep as they are for displaying this base example only */
      .content .span10,
      .content .span4 {
        min-height: 500px;
      }
      /* Give a quick and non-cross-browser friendly divider */
      .content .span4 {
        margin-left: 0;
        padding-left: 19px;
        border-left: 1px solid #eee;
      }

      .topbar .btn {
        border: 0;
      }


   #ui-button-success2{
  color:#ffffff;
  background-color: #57a957;
  background-repeat: repeat-x;
  background-image: -khtml-gradient(linear, left top, left bottom, from(#62c462), to(#57a957));
  background-image: -moz-linear-gradient(top, #62c462, #57a957);
  background-image: -ms-linear-gradient(top, #62c462, #57a957);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #62c462), color-stop(100%, #57a957));
  background-image: -webkit-linear-gradient(top, #62c462, #57a957);
  background-image: -o-linear-gradient(top, #62c462, #57a957);
  background-image: linear-gradient(top, #62c462, #57a957);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#62c462', endColorstr='#57a957', GradientType=0);
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  border-color: #57a957 #57a957 #3d773d;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  width: 100px;
  height: 32px;
}

#ui-button-primary2 {
  color: #ffffff;
  background-color: #0064cd;
  background-repeat: repeat-x;
  background-image: -khtml-gradient(linear, left top, left bottom, from(#049cdb), to(#0064cd));
  background-image: -moz-linear-gradient(top, #049cdb, #0064cd);
  background-image: -ms-linear-gradient(top, #049cdb, #0064cd);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #049cdb), color-stop(100%, #0064cd));
  background-image: -webkit-linear-gradient(top, #049cdb, #0064cd);
  background-image: -o-linear-gradient(top, #049cdb, #0064cd);
  background-image: linear-gradient(top, #049cdb, #0064cd);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#049cdb', endColorstr='#0064cd', GradientType=0);
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  border-color: #0064cd #0064cd #003f81;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  width: 100px;
  height: 32px;
}

#ui-button-primary3 {
  color: #ffffff;
  background-color: #0064cd;
  background-repeat: repeat-x;
  background-image: -khtml-gradient(linear, left top, left bottom, from(#049cdb), to(#0064cd));
  background-image: -moz-linear-gradient(top, #049cdb, #0064cd);
  background-image: -ms-linear-gradient(top, #049cdb, #0064cd);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #049cdb), color-stop(100%, #0064cd));
  background-image: -webkit-linear-gradient(top, #049cdb, #0064cd);
  background-image: -o-linear-gradient(top, #049cdb, #0064cd);
  background-image: linear-gradient(top, #049cdb, #0064cd);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#049cdb', endColorstr='#0064cd', GradientType=0);
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  border-color: #0064cd #0064cd #003f81;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  width: 100px;
  height: 32px;
}

    </style>

  </head>

  <body>

  <!--[if IE]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.8.16.ie.css"/>
  <![endif]-->
  
  <s:hidden id="login_session" value="%{#session.user_r.uid}"></s:hidden>
  <s:hidden id="login_request" ></s:hidden>
  <div class="topbar">
      <div class="fill">
        <div class="container">
          <a class="brand" href="#">天津大学仁爱学院</a>
          <ul class="nav">
          <s:if test="#session.user_r.uid!=0">
              <li id="TopShow"><a href="#"><s:property value="#session.user_r.uname"/></a></li>
              <li id="TopShow2"><a href="User/ExitUser" onclick="if(confirm('Are you sure you want to exit')){return true;} return false;">Exit</a></li>
          </s:if>
          <!-- 用户未登陆 -->
            <s:else>
            <li id="TopShow"><a href="#" id="Login_k">Login</a></li>
            <li id="TopShow2"><a href="#" id="Sign_k">Sign in</a></li>
            </s:else>
          </ul>
          <form action="" class="pull-right">
          </form>
        </div>
      </div>
    </div>
    
   
    
        <div class="container">
            <div class="content">
             <div class="page-header">
                     <h2>校车座位统计系统(v0.1)</h2>您要预订的是<select style="width :60px ;height :32px;" id="selectCar">
                                                        <OPTION value="1">1号车</OPTION>
                                                        <OPTION value="2">2号车</OPTION>
                                                        <OPTION value="3">3号车</OPTION>
                                                        <OPTION value="4">4号车</OPTION>
                                                        <OPTION value="5">5号车</OPTION>
                                                 </select>
                                                 <button  id="ui-button-primary2" >Reserve</button><!-- 更登陆时的按钮 -->
              </div>
               <div class="row" >
          <!--left col-->
          <div class="span10">
            <div id="tabs" style="width: 700px;">
           
              <ul>
                <li><a href="#tabs-1">1号车(<s:property value="#request.oneCar.size()"/>/48)</a></li>
                <li><a href="#tabs-2">2号车(<s:property value="#request.twoCar.size()"/>/48)</a></li>
                <li><a href="#tabs-3">3号车(<s:property value="#request.threeCar.size()"/>/48)</a></li>
                <li><a href="#tabs-4">4号车(<s:property value="#request.fourCar.size()"/>/30)</a></li>
                <li><a href="#tabs-5">5号车(<s:property value="#request.fiveCar.size()"/>/14)</a></li>
              </ul>
		              <div id="tabs-1" >
		                        <div id="center" >
		                                        <s:iterator value="#request.oneCar" var="list">
		                                            <s:if test="%{#list.uid == #session.user_r.uid}"> <!-- 当按钮是自己的Reserve时 -->
		                                            <button id="ui-button-success2" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:if>
		                                            <s:else>
		                                            <button class="ui-button-primary" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:else>
		                                        </s:iterator>                
		                                        <!--                             
											    <s:bean name="org.apache.struts2.util.Counter" id="counter"> 
													<s:param name="first" value="1" /> 
													<s:param name="last" value="48" /> 
															<s:iterator> 
															  	 <button class="ui-button-primary">座位空</button>
															</s:iterator> 
												   </s:bean> 
												   <button id="Login_k_Ding" class="ui-button-primary">Login</button>
												   <button id="Cancel_Dialog" class="ui-button-primary">Cancel</button>
												   -->  
								</div>
		              </div>
		              <div id="tabs-2">
		                         		         <s:iterator value="#request.twoCar" var="list">
		                                            <s:if test="%{#list.uid == #session.user_r.uid}"> <!-- 当按钮是自己的Reserve时 -->
		                                            <button id="ui-button-success2" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:if>
		                                            <s:else>
		                                            <button class="ui-button-primary" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:else>
		                                        </s:iterator>  
		              </div>
		              <div id="tabs-3">
		                       		                                        <s:iterator value="#request.threeCar" var="list">
		                                            <s:if test="%{#list.uid == #session.user_r.uid}"> <!-- 当按钮是自己的Reserve时 -->
		                                            <button id="ui-button-success2" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:if>
		                                            <s:else>
		                                            <button class="ui-button-primary" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:else>
		                                        </s:iterator>  
		              </div>
		              <div id="tabs-4">
		                        		                                        <s:iterator value="#request.fourCar" var="list">
		                                            <s:if test="%{#list.uid == #session.user_r.uid}"> <!-- 当按钮是自己的Reserve时 -->
		                                            <button id="ui-button-success2" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:if>
		                                            <s:else>
		                                            <button class="ui-button-primary" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:else>
		                                        </s:iterator>  
		              </div>
		              <div id="tabs-5">
		                       		                                        <s:iterator value="#request.fiveCar" var="list">
		                                            <s:if test="%{#list.uid == #session.user_r.uid}"> <!-- 当按钮是自己的Reserve时 -->
		                                            <button id="ui-button-success2" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:if>
		                                            <s:else>
		                                            <button class="ui-button-primary" value="${list.rid }" name="${ list.uid}">
		                                                  <s:property value="#list.uname"/>
		                                            </button>
		                                            </s:else>
		                                        </s:iterator>  
		              </div>
                       
            </div>
            <!--end tabs-->
            </div>
          <!--end col-->
        </div>
         <!--end row-->
           </div>
           <!--end content-->
       </div>
        <!--end container-->
  
          <!--Login Dialogs-->
            <style>
              #dialog2 label, #dialog2 input { display:block; }
              #dialog2 label { margin-top: 0.5em; }
              #dialog2 input, #dialog2 textarea { width: 95%; }
              #tabs2 { margin-top: 1em; }
              #tabs2 li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
              #add_tab { cursor: pointer; }          
            </style>
              <div id="dialog2" title="Login">
                <form id="login">
                  <fieldset class="ui-helper-reset">
                    <label for="tab_title">Name</label>
                    <input type="text" name="uname" id="uname" value="" class="ui-widget-content ui-corner-all" />
                    <label for="tab_content">Password</label>
                    <input name="upasswd" id="upasswd" class="ui-widget-content ui-corner-all" type="password"></input>
                    <input type="hidden" name="suiji2" id="suiji2" >
                  </fieldset>
                </form>
              </div>
       <!--Login Dialogs-->
       
        <!--Sign in Dialogs-->
            <style>
              #dialog3 label, #dialog3 input { display:block; }
              #dialog3 label { margin-top: 0.5em; }
              #dialog3 input, #dialog3 textarea { width: 95%; }
              #tabs3 { margin-top: 1em; }
              #tabs3 li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
              #add_tab { cursor: pointer; }          
            </style>
              <div id="dialog3" title="Sign in">
                <form id="SignIn" >
                  <fieldset class="ui-helper-reset">
                    <label for="uname">Name</label>
                    <input type="text" name="uname" id="uname" class="ui-widget-content ui-corner-all" />
                    <label for="upasswd">Password</label>
                    <input name="upasswd" id="upasswd_sign" class="ui-widget-content ui-corner-all" type="password"></input>
                     <label for="cupasswd">Confirm Password</label>
                    <input name="cupasswd" id="cupasswd" class="ui-widget-content ui-corner-all" type="password"></input>
                    <input type="hidden" name="suiji" id="suiji" >
                  </fieldset>
                </form>
              </div>
             
       <!--Login Dialogs-->
       
      
       
       <!--Cancel dialog-->
          <div id="dialog-Cancel" title="Cancel Reserve">
          <p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
           You have successfully booked
          </p>
            <p>
              Whether or not <b>to cancel the reservation?</b>
            </p>
          </div>
        <!--end Cancel dialog-->
          <!--Reserve dialog-->
          <div id="dialog-Reserve" title="Reserve a seat">
            <p><span class="ui-icon ui-icon-circle-plus" style="float:left; margin:0 7px 50px 0;"></span>
              Are you sure you want to make a reservation? 
            </p>
          </div>
        
        <!--end Reserve dialog-->
  
               <!--scripts-->

        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
        

        <!--daterangepicker-->
        <script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>
        <script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>

        <!--wijmo-->
        <script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
        <script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>


        <!-- FileInput -->
        <script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
        <script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>


        <!--init for this page-->
        <script type="text/javascript" src="js/demo.js"></script>
      <script type="text/javascript">
       function onclickTopshow2(){
      return confirm('Are you sure you want to exit');
    }
      
      </script>
  </body>
</html>
