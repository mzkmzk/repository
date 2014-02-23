$(function () {
    // keep login uid
    var session_uid;
       
    // Accordion
    $("#accordion").accordion({
        header: "h3"
    });

    // Tabs
    $('#tabs2, #tabs').tabs();

    // Buttons
    $('button').button();

    // Anchors, Submit
    $('.button,#sampleButton').button();

    // Buttonset
    $('#radioset').buttonset();
    $("#format").buttonset();


    // Dialog
    $('#dialog').dialog({
        autoOpen: false,
        width: 600,
        buttons: {
            "Ok": function () {
                $(this).dialog("close");
            },
            "Cancel": function () {
                $(this).dialog("close");
            }
        }
    });

    // Dialog Link
    $('#dialog_link').click(function () {
        $('#dialog').dialog('open');
        return false;
    });

    // Modal Link
    $('#modal_link').click(function () {
        $('#dialog-message').dialog('open');
        return false;
    });
    
     // Cancel Link                                               K
    $('#ui-button-success2').button().click(function () {
        $('#dialog-Cancel').dialog('open');
        return false;
    });
    
    
    // Reserve Link                                                K
    $('#ui-button-primary2').button().click(function () {
    alert($("#login_session").val());
    alert($("#login_request").val());
        if($("#login_session").val() =="" && $("#login_request").val() ==""){
        alert($("#ui-button-success2").length);
             $dialog.dialog("open");
            return false;
        }
        $('#dialog-Reserve').dialog('open');
        return false;
    });
    
    // Reserve Link                                                K
    $('#ui-button-primary3').button().click(function () {
        $('#dialog-Reserve').dialog('open');
        return false;
    });
    // Datepicker
    $('#datepicker').datepicker({
        inline: true
    });

    // Slider
    $('#slider').slider({
        range: true,
        values: [17, 67]
    });

    // Progressbar
    $("#progressbar").progressbar({
        value: 20
    });

    //hover states on the static widgets
    $('#dialog_link, #modal_link, ul#icons li').hover(

    function () {
        $(this).addClass('ui-state-hover');
    }, function () {
        $(this).removeClass('ui-state-hover');
    });

    // Autocomplete
    var availableTags = [];

    $("#tags").autocomplete({
        source: availableTags
    });


    // Dialogs                                     
    $("#dialog-message").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).dialog("close");
            },
            "Cancel": function () {
                $(this).dialog("close");
            }
        }
    });
    
    // Cancel_Dialogs                               K                      
    $("#dialog-Cancel").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            Yes: function () {
             //delete reserve
             var rid =$("#ui-button-success2").val();
             alert(rid);
		    document.location.href="User/deleteReserve?rid="+rid;
                $(this).dialog("close");
            },
            "No thanks": function () {
                $(this).dialog("close");
            }
        }
    });
    
    // dialog-Reserve                               K                      
    $("#dialog-Reserve").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            Yes: function () {
            //Reserve
                alert(document.getElementById("selectCar").value);
                var sc =document.getElementById("selectCar").value;
                 var su;
                if($("#login_session").val()!="")
                su =$("#login_session").val();
                else if($("#login_request").val()!=""){
                su =$("#login_request").val();
                }
                alert("data2")
				$.getJSON('User/addReserve.action',{"uid":su,"rcar":sc,"suiji":Math.random()*1000}).done(function(data){
				alert(data);
				if(data.msg!=0){
					alert('reserve succeeds');
				}else{
					alert("Reserve Error: After you've made a reservation, please cancel the reservation again");
				}
			}).fail(function(){
				alert('Reserve error: network connection problems, please try again later.');
			}).complete(function(){
				
			})
			   document.location.href="/reservations";
                $(this).dialog("close");
            },
            "No thanks": function () {
                $(this).dialog("close");
            }
        }
    });
    
   


    // Remove focus from buttons
    $('.ui-dialog :button').blur();



    // Vertical slider
    $("#slider-vertical").slider({
        orientation: "vertical",
        range: "min",
        min: 0,
        max: 100,
        value: 70,
        slide: function (event, ui) {
            $("#amount").val(ui.value);
        }
    });
    $("#amount").val($("#slider-vertical").slider("value"));


    // Split button
    $("#rerun").button().click(function () {
        alert("Running the last action");
    }).next().button({
        text: false,
        icons: {
            primary: "ui-icon-triangle-1-s"
        }
    }).click(function () {
        alert("Could display a menu to select an action");
    }).parent().buttonset();


    var $tab_title_input = $("#tab_title"),
        $tab_content_input = $("#tab_content");
    var tab_counter = 2;

    // tabs init with a custom tab template and an "add" callback filling in the content
    var $tabs = $("#tabs2").tabs({
        tabTemplate: "<li><a href='#{href}'>#{label}</a></li>",
        add: function (event, ui) {
            var tab_content = $tab_content_input.val() || "Tab " + tab_counter + " content.";
            $(ui.panel).append("<p>" + tab_content + "</p>");
        }
    });

    // modal dialog init: custom buttons and a "close" callback reseting the form inside
    var $dialog = $("#dialog2").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            Login: function () {
            //Login
            document.getElementById("suiji2").value=Math.random()*1000;
                var $form = $("#login");
				postData = $form.serialize();
				$.getJSON('User/LoginUser.action',postData).done(function(data){
				if(data.user_r.uid!=0){
					alert('login succeeds');
					insteadNmae(data.user_r.uname,data.user_r.uid);
				}else{
					alert("Name/password wrong, please input again");
				}
			}).fail(function(){
				alert('Login error: network connection problems, please try again later.');
			}).complete(function(){
				
			})
			
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $tab_title_input.focus();
        },
        close: function () {
            $form[0].reset();
        }
    });
    
     //Sign in modal dialog init: custom buttons and a "close" callback reseting the form inside
    var $dialog_sign = $("#dialog3").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            Register: function () {
            //Judgment to the same password and confirm password
            if(document.getElementById("upasswd_sign").value != document.getElementById("cupasswd").value){
            alert("confirm password is not the same as the password");
             return false;
            }
            //Sign
            document.getElementById("suiji").value=Math.random()*1000;
           var $form = $("#SignIn"),
				postData = $form.serialize();
				$.getJSON('User/SignInUser.action',postData).done(function(data){
				if(data.user_r.uid!=0){
					alert('Register succeeds');
					insteadNmae(data.user_r.uname,data.user_r.uid);
				}else{
					alert("Register error: network connection problems , please try again later");
				}
			}).fail(function(){
				alert('error: network connection problems, please try again later.');
			}).complete(function(){
				
			})
			    
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $tab_title_input.focus();
        },
        close: function () {
            $form[0].reset();
        }
    });
    
    // Login or SignIn complete use name instead of login and registration
    function insteadNmae(uname,uid){
       $("#TopShow").html('<a href="###" >'+uname+'</a>');
       $("#TopShow2").html("<a href='User/ExitUser' onclick='return onclickTopshow2()' >Exit</a>");
         $("button[name="+uid+"]").attr('id','ui-button-success2');
         document.getElementById("login_request").value=uid;
        alert($("#login_request").val());
        alert($("#login_session").val());
    }
    
    

    // addTab form: calls addTab function on submit and closes the dialog
    var $form = $("form", $dialog).submit(function () {
        addTab();
        $dialog.dialog("close");
        return false;
    });

    // actual addTab function: adds new tab using the title input from the form above


    function addTab() {
        var tab_title = $tab_title_input.val() || "Tab " + tab_counter;
        $tabs.tabs("add", "#tabs-" + tab_counter, tab_title);
        tab_counter++;
    }

    // addTab button: just opens the dialog
    $("#add_tab").button().click(function () {
        $dialog.dialog("open");
    });
    
    // Login button: just opens the dialog                K
    $("#Login_k").click(function () {
        $dialog.dialog("open");
        return false; //no guto ###
    });
    
     $("#Login_k_Ding").button().click(function () {
        $dialog.dialog("open");
    });
    
    // sign in  button: just opens the dialog                K
    $("#Sign_k").click(function () {
        $dialog_sign.dialog("open");
        return false;    //no guto ###
    });

    
    
    // close icon: removing the tab on click
    // note: closable tabs gonna be an option in the future - see http://dev.jqueryui.com/ticket/3924
    $("#tabs span.ui-icon-close").live("click", function () {
        var index = $("li", $tabs).index($(this).parent());
        $tabs.tabs("remove", index);
    });

    // Filament datepicker
    $('#rangeA').daterangepicker();
    $('#rangeBa, #rangeBb').daterangepicker();


    // Dynamic tabs
    var $tab_title_input = $("#tab_title"),
        $tab_content_input = $("#tab_content");
    var tab_counter = 2;
    
    

    // tabs init with a custom tab template and an "add" callback filling in the content
    var $tabs = $("#tabs2").tabs({
        tabTemplate: "<li><a href='#{href}'>#{label}</a></li>",
        add: function (event, ui) {
            var tab_content = $tab_content_input.val() || "Tab " + tab_counter + " content.";
            $(ui.panel).append("<p>" + tab_content + "</p>");
        }
    });

    // modal dialog init: custom buttons and a "close" callback reseting the form inside
    var $dialog = $("#dialog2").dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            Add: function () {
                addTab();
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        open: function () {
            $tab_title_input.focus();
        },
        close: function () {
            $form[0].reset();
        }
    });

    // addTab form: calls addTab function on submit and closes the dialog
    var $form = $("form", $dialog).submit(function () {
        addTab();
        $dialog.dialog("close");
        return false;
    });

    // actual addTab function: adds new tab using the title input from the form above

    function addTab() {
        var tab_title = $tab_title_input.val() || "Tab " + tab_counter;
        $tabs.tabs("add", "#tabs-" + tab_counter, tab_title);
        tab_counter++;
    }

    // addTab button: just opens the dialog
    $("#add_tab").button().click(function () {
        $dialog.dialog("open");
    });

    // close icon: removing the tab on click
    // note: closable tabs gonna be an option in the future - see http://dev.jqueryui.com/ticket/3924
    $("#tabs span.ui-icon-close").live("click", function () {
        var index = $("li", $tabs).index($(this).parent());
        $tabs.tabs("remove", index);
    });


    // File input (using http://filamentgroup.com/lab/jquery_custom_file_input_book_designing_with_progressive_enhancement/)
    $('#file').customFileInput({
        button_position : 'right'
    });


    //Wijmo
    $("#menu1").wijmenu({ trigger: ".wijmo-wijmenu-item", triggerEvent: "click" });
    //$(".wijmo-wijmenu-text").parent().bind("click", function () {
    //    $("#menu1").wijmenu("hideAllMenus");
    //});
    //$(".wijmo-wijmenu-link").hover(function () {
    //    $(this).addClass("ui-state-hover");
    //}, function () {
    //    $(this).removeClass("ui-state-hover");
    //});

    //Toolbar
    $("#play, #shuffle").button();
    $("#repeat").buttonset();


});