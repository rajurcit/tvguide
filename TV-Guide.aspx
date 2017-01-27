<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="TV-Guide.aspx.cs" Inherits="Siti_Cable.TV_Guide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <title> Siti TV Guide | Channel Guide | TV Channel Guide | User Guide for Customer</title>
<meta name="description" content="Find out all the channels name and other details in this TV- Guide and also get scheduled timing of every programme on channels within seconds." />
<meta name="keywords" content="siti, tv guide, channel guide, user guide, tv channel guide, siticable, SITI Networks TV, CableTV, Digital Cable TV, Digital Cable Television,digitalization in India, sitidigital, SITI networks delhi" />
<meta name="author" content="Siti Networks." />
<meta name="robots" content="index, follow" />
<meta name="revisit-after" content="1 days" />
<meta name="distribution" content="global" />
<meta name="language" content="English" />
<meta name="copyright" content="Siti Network Limited" />
 <link rel="http://www.sitinetworks.com/TV-Guide.aspx"/>

     <link href="siti-assets/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome -->
    <link href="siti-assets/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="siti-assets/css/custom.css" rel="stylesheet" />
    <link rel="Stylesheet" type="text/css" href="siti-assets/css/broadband.css" />
    <link rel="Stylesheet" type="text/css" href="siti-assets/css/tvguide.css" />
    <link rel="Stylesheet" type="text/css" href="siti-assets/css/bootstrap-select.css" />


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <style>
        .white24 {
            color: #fff;
            font-size: 17.7px;
            !important;
        }

        body {
            padding-top: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="innerPageBody">
        
            <!--Inner bannere-->
            <div class="innerBanner">
                <div class="bannerimg posrel">
                    <img src="siti-assets/images/banner_broadband_page.jpg" />
                    <div class="bannerTextContainer border_red">
                        <div class="container posrel">
                            <div class="textInner">
                                <div class="col-md-6 hideonmobile">&nbsp;</div>
                                <div class="col-md-6">
                                    <div class="bannerText">
                                        <p class="uppercase">The Best Broadband Connection for </p>
                                        <h2>Your Home</h2>
                                        <p class="smallcase">Know more about our Broadband services including high speed Internet, affordability, service capability, customer care and much more.  </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <h1>TV Guide</h1>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tvguideContainer">
                            <div id="sticky_tv_header">
                                <div class="tv_filter">
                                    <div class="now">
                                        <a title="Go to playing now" class="active" id="selected_tv_option">Now</a>
                                    </div>
                                    <div class="date selectdt">
                                        <div tabindex="0" class="selecter  closed">
                                          
                                            <asp:DropDownList ID="ddlDate" class="selectpicker form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="day selectdt">
                                        <div tabindex="0" class="selecter  closed">
                                            <asp:DropDownList ID="ddlDayPart" class="selectpicker form-control" runat="server"></asp:DropDownList>

                                        </div>
                                    </div>
                                     <div class="allChannel selectdt">
                                     <div tabindex="0" class="selecter closed">
                                         <asp:DropDownList ID="ddlChannelGenre" class="selectpicker form-control" runat="server"></asp:DropDownList>
                                     </div>
                    </div> 
                                </div>
                                <div class="tv_timeBar">
                                    <div class="channel_bg">Channel No. </div>
                                    <div class="time_bar">
                                        <ul>
                                            <li>
                                                <div class="time_text">00:00 am</div>
                                                <div class="half_time">00:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">01:00 am</div>
                                                <div class="half_time">01:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">02:00 am</div>
                                                <div class="half_time">02:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">03:00 am</div>
                                                <div class="half_time">03:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">04:00 am</div>
                                                <div class="half_time">04:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">05:00 am</div>
                                                <div class="half_time">05:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">06:00 am</div>
                                                <div class="half_time">06:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">07:00 am</div>
                                                <div class="half_time">07:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">08:00 am</div>
                                                <div class="half_time">08:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">09:00 am</div>
                                                <div class="half_time">09:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">10:00 am</div>
                                                <div class="half_time">10:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">11:00 am</div>
                                                <div class="half_time">11:30 am</div>
                                            </li>
                                            <li>
                                                <div class="time_text">12:00 pm</div>
                                                <div class="half_time">12:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">01:00 pm</div>
                                                <div class="half_time">01:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">02:00 pm</div>
                                                <div class="half_time">02:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">03:00 pm</div>
                                                <div class="half_time">03:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">04:00 pm</div>
                                                <div class="half_time">04:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">05:00 pm</div>
                                                <div class="half_time">05:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">06:00 pm</div>
                                                <div class="half_time">06:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">07:00 pm</div>
                                                <div class="half_time">07:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">08:00 pm</div>
                                                <div class="half_time">08:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">09:00 pm</div>
                                                <div class="half_time">09:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">10:00 pm</div>
                                                <div class="half_time">10:30 pm</div>
                                            </li>
                                            <li>
                                                <div class="time_text">11:00 pm</div>
                                                <div class="half_time">11:30 pm</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div id="ancNext" class="arrow_r"></div>
                                    <div id="ancPrev" class="arrow_l"></div>
                                </div>
                            </div>
                            <div class="jThumbnailScroller">
                                <div class="preloader" id="divLoaderPopup" style="display: none">
                                    <div class="loader-one"><i class="fa fa-spinner fa-pulse"></i></div>
                                </div>
                                <div class="jTscrollerContainer">
                                    <div class="channel_logo_panel">
                                        <ul id="ChannelContainer">
                                        </ul>
                                    </div>
                                    <div id="ProgramContainer" class="scrollcontainer">

                                        <div class="curent_time">
                                            <div class="curent_time_bar"></div>
                                        </div>
                                    </div>
                                    <div style="clear: both;">
                                    </div>
                                    <div class="view_more_bg" id="ViewMoreDiv" style="">
                                        <div class="view_more"><a><i class="fa fa-plus"></i></a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tvguideTablewrap" style="display: none">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <div class="popup_mask" style="display: none;"></div>
    <div id="popup_tag-sticky-wrapper" class="sticky-wrapper" style="height: 269px; display: none">
        <div class="popup_tag" id="popup_tag" style="top: 256.667px; left: 494.688px; display: none;">
            <div class="popup_close">X</div>
            <div class="popup_content">
                <div class="popup_Pro_header" id="lblProgramName"></div>
                <div class="popup_Pro_time" id="lblProgramTime"> </div>
                <div class="popup_Pro_other_info">
                    <div id="divGenre">
                        <%--<div class="other_info_left">Program Name: </div>--%>
                        
                        <div class="other_info_right" id="lblProgramGenre"></div>
                    </div> 
                    <div class="clear"></div>
                    <div id="divDuration">
                        <%--<div class="other_info_left"></div>
                        <div class="other_info_center"></div>--%>
                        <div class="other_info_right" id="lblProgramDuration"></div>
                    </div>
                   

                    
                    <div class="clearfix"></div>

                  <%--  <div id="divYear">
                        <div class="other_info_left">Year</div>
                        <div class="other_info_center">:</div>
                        <div class="other_info_right" id="lblProgramYear"></div>
                    </div>--%>
                   <%--  <div class="other_info_left">Desc : </div>--%>
                <div class="popup_Pro_info" id="lblProgramSynopsis" title=""> </div>
                </div>
               
            </div>
            <div class="popup_img">
                <img src=""  id="lblProgramImg" alt="" />
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphpagescript" runat="server">
      <!-- GO to Top -->
    <a href="#" class="scrollup"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
   
    <script src="siti-assets/js/bootstrap-select.min.js"></script>
    <!-- Custom JS -->
    <script src="siti-assets/js/aes.js"></script>    
    <script src="siti-assets/js/tvguide.js"></script>

    <script>
        var encrypted = CryptoJS.AES.encrypt("Message", "Secret Passphrase");
        // AABsAABkAABiAAAAAAAAAABNAABlAABPAAC0AABHAAA=

        var decrypted = CryptoJS.AES.decrypt(encrypted, "Secret Passphrase");
        // 4d657373616765
        console.log(encrypted);
        console.log(decrypted);
        console.log(decrypted.toString(CryptoJS.enc.Utf8));
        // Message
    </script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#divLoaderPopup").show();
            var h = $(window).height() / 3 + "px";
            var w = $(window).width() / 3.2 + "px";
            $("#popup_tag").css({ "top": h, "left": w });
            $("#backgroundPopup").hide();
           // $("#ddlChannelGenre,#ddlDate,#ddlDayPart").selecter();
            $(".day").find(".selecter-item[data-value='-1']").hide();
            SetViewMoreType("click");
            ChannelsToDisplay = 20;
            PageNo = 1;
            //UtcOffset = 120;
            StoreGenres();
            ActiveHour = Start.getHours();
            var dtSt = GetFormattedDate(Start);
            var dtEnd = GetFormattedDate(End);
            GetData($("#ContentPlaceHolder1_ddlChannelGenre").val(), PageNo, dtSt, dtEnd);
        });

        $("#ContentPlaceHolder1_ddlChannelGenre").change(function () {
            
            var SelectedGenre = $(this).val();            
            PageNo = 1;
            ClearTvGuideHtml();
            $("#ViewMoreDiv").hide();

            $(".now a").html("Reset");
            $(".now a").attr("title", "Reset your filters");
            $(".now a").removeClass("active");

            ActiveHour = new Date(GetCurrentIST()).getHours();
            var dtSt = GetFormattedDate(Start);
            var dtEnd = GetFormattedDate(End);
           // GetDatabySearch(SelectedGenre, PageNo, dtSt, dtEnd);
            GetData(SelectedGenre, PageNo, dtSt, dtEnd);
        });

        $("#ContentPlaceHolder1_ddlDate").change(function () {
            PageNo = 1;
            ClearTvGuideHtml();
            $("#ViewMoreDiv").hide();
            $("#divLoaderPopup").show();
            Start = GetStartDate($(this).val());
            End = GetEndDate(Start);

            $(".now a").html("Reset");
            $(".now a").attr("title", "Reset your filters");
            $(".now a").removeClass("active");

            ActiveHour = Start.getHours();

            var dtSt = GetFormattedDate(Start);
            var dtEnd = GetFormattedDate(End);
            GetData($("#ContentPlaceHolder1_ddlChannelGenre").val(), PageNo, dtSt, dtEnd);
        });

        $("#ContentPlaceHolder1_ddlDayPart").change(function () {
            var dayPart = $(this).val();
            ScrollToCurrentHour = true;

            $(".now a").html("Reset");
            $(".now a").attr("title", "Reset your filters");
            $(".now a").removeClass("active");

            if (dayPart != "-1" && dayPart != "") {
                if (dayPart == "1")
                    ActiveHour = 6;
                if (dayPart == "2")
                    ActiveHour = 14;
                if (dayPart == "3")
                    ActiveHour = 18;
                if (dayPart == "4")
                    ActiveHour = 20;
                if (dayPart == "5")
                    ActiveHour = 22;
                ScrollContainer();
            }
        });

        $("#ViewMoreDiv a").click(function () {
            ViewMore();

        });

        $("#ancNext").click(function () {            
            MoveNext();

        });

        $("#ancPrev").click(function () {
            MovePrev();
        });

        $(".now").click(function () {

            ChannelsToDisplay = 20;
            PageNo = 1;
            ScrollToCurrentHour = true;
            //UtcOffset = 120;
            var Start = GetStartDate(0); //Today
            var End = GetEndDate(Start); //End of the day

            ActiveHour = Start.getHours();
            var dtSt = GetFormattedDate(Start);
            var dtEnd = GetFormattedDate(End);
            $("#ContentPlaceHolder1_ddlDate").val("0");
          //  $("#ContentPlaceHolder1_ddlDayPart").val("0");
            $("#ContentPlaceHolder1_ddlChannelGenre").val("All Channels");
            location.reload();
           
            $(".now a").addClass("active");
            $(".now a").html("Now");
            $(".now a").attr("title", "Go to playing now");
            $("#ContentPlaceHolder1_ddlDate").val("Today")
            
           //  $("#ContentPlaceHolder1_ddlDate,#ContentPlaceHolder1_ddlDayPart").selecter("destroy");

            
            //$("#ddlDate").parent().find(".scroller-content .selecter-item:first").addClass("selected");
            
            // Initialize the select picker.
            $('select[name=ddlDayPart]').selectpicker();

            // Extract the value of the first option.
            var sVal = $('select[name=ddlDayPart] option:first').val();

            // Set the "selected" value of the <select>.
            $('select[name=ddlDayPart]').val(sVal);

            // Force a refresh.
            $('select[name=ddlDayPart]').selectpicker('refresh')
            
            //$("#ddlChannelGenre").parent().find(".scroller-content .selecter-item").removeClass("selected");
           
            //$("#ddlChannelGenre").parent().find(".scroller-content .selecter-item:first").addClass("selected");

            ClearTvGuideHtml();
            $(".date").find("span.selecter-selected").html("Today");
         
            $(".day").find("span.selecter-selected").html("Day Part");
            $(".allChannel").find("span.selecter-selected").html("All Channels");

            $("#ViewMoreDiv").hide();
            GetData($("#ContentPlaceHolder1_ddlChannelGenre").val(), PageNo, dtSt, dtEnd);
            // $("#ddlChannelGenre,#ddlDate,#ddlDayPart").selecter();
            $(".day").find(".selecter-item[data-value='-1']").hide();
        });

        function Search(searchstr, searchcriteria) {
            location.href = "/Search/Result" + "/" + searchstr + "/" + searchcriteria;
        }
    </script>
  
    <script>
        $(function () {
        $('header').addClass("sticky");
        $('#adigital').addClass("active");
            $('.popup_close').click(function () {
                $('#popup_tag-sticky-wrapper, .popup_mask').fadeOut();
            });
        })

    </script>
</asp:Content>
