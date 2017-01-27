
var channelNamecomma;
function SetViewMoreType(a) {
    ViewMoreType = a
}

function StoreGenres() {
    for (var a = $("#ContentPlaceHolder1_ddlChannelGenre option"), b = "", c = 0; c < a.length; c++)
        b = a[c].innerText || a[c].textContent, GenreHolder.push({
            name: b,
            channels: ""
        })
}

function FilterChannels(a, b) {

    return c = a.GenreHolder.slice((parseInt(b) - 1) * ChannelsToDisplay, parseInt(b) * ChannelsToDisplay);
    c.toString();
}
function FilterChannelsByGener(a, b) {

    return c = a.GenreHolder1.slice((parseInt(b) - 1) * ChannelsToDisplay, parseInt(b) * ChannelsToDisplay);
    c.toString();
}

function Arraylist() {
    this.GenreHolder = [];
}
function Arraylist1() {
    this.GenreHolder1 = [];
}

function GetChannelList(a, b) {

    var c;
    for (i = 0; i < GenreHolder.length; i++)
        if ("" != GenreHolder[i].channels)
            return FilterChannels(GenreHolder[i].channels, b);
    return $.ajax({
        type: "POST",
        async: !1,
        url: GetChannelResultUrl,
        data: "{'Genre':'" + a + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (d) {
            var value = d.channellist.channel;

            for (var j = 0; j < value.length; j++) {
                Arraylist.GenreHolder.push(value[j].name);
            }
            if (null != d.channellist.channel) {
                for (i = 0; i < GenreHolder.length; i++)
                    if (GenreHolder[i].name == a) {
                        GenreHolder[i].channels = Arraylist;
                        c = FilterChannels(Arraylist, b);
                    }
                //    GenreHolder[0].name == a && (GenreHolder[i].channels = Arraylist);
                
            }
        },
        error: function (a) {
            alert("Channels not found"), $("#ViewMoreDiv,#divLoaderPopup").hide()
        }

    }), c
}
function GetChannelListByGener(a, b) {
    var c;
    for (i = 0; i < GenreHolder1.length; i++)
        if ("" != GenreHolder1[i].channels)
            return FilterChannelsByGener(GenreHolder1[i].channels, b);
    return $.ajax({
        type: "POST",
        async: !1,
        url: "Handler/HanFreeText.ashx?Searchvalue=" + a,
        // data: "{'Genre':'" + a + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (d) {
            var value = d.Search.Programme;
            Arraylist1.GenreHolder1.length = 0;
            for (var j = 0; j < value.length; j++) {
                Arraylist1.GenreHolder1.push(value[j].ChannelName);
            }
            if (null != d.Search.Programme) {
                for (i = 0; i < GenreHolder.length; i++)
                    if(GenreHolder[i].name== a){
                        GenreHolder[i].channels = Arraylist1;
                        c = FilterChannelsByGener(Arraylist1, b)
                    }                
            }
        },
        error: function (a) {
            alert("Channels not found"), $("#ViewMoreDiv,#divLoaderPopup").hide()
        }

    }), c
}
function GetDatabySearch(a, b, c, d) {

    $("#divLoaderPopup").show();
    var e = a,
      f = c + "_" + b + "_" + a;
    if (null != sessionStorage.getItem(f)) {
        var g = CryptoJS.AES.decrypt(sessionStorage.getItem(f), f).toString(CryptoJS.enc.Utf8);
        GetCacheData(a, b, c, d, g)
    } else "" != e && void 0 != e ? $.ajax({
        type: "POST",
        url: "Handler/HanFreeText.ashx?Searchvalue=" + a,
        contentType: "application/json; charset=utf-8",
        success: function (a) {
            var jsonData = JSON.stringify(a)
            sessionStorage.setItem(f, CryptoJS.AES.encrypt(jsonData, f)), a;
            // var value = JSON.parse(a)
            var c = a.Search.Programme;
            if (ProcessTvGuideData(c), c.length >= 20 ? ($("#ViewMoreDiv").show(), PageNo = b + 1) : $("#ViewMoreDiv").hide(), Start = GetStartDate($("#ContentPlaceHolder1_ddlDate").val()), End = GetEndDate(Start), "0" == $("#ContentPlaceHolder1_ddlDate")[0].selectedIndex ? (ActiveHour = new Date(GetCurrentIST()).getHours(), ApplyTimeBar(!0)) : (ActiveHour = Start.getHours(), ApplyTimeBar(!1)), "" != $("#ContentPlaceHolder1_ddlDayPart").val() && "-1" != $("#ContentPlaceHolder1_ddlDayPart").val()) {
                var d = $("#ContentPlaceHolder1_ddlDayPart").val();
                "1" == d && (ActiveHour = 6), "2" == d && (ActiveHour = 14), "3" == d && (ActiveHour = 18), "4" == d && (ActiveHour = 20), "5" == d && (ActiveHour = 22), ScrollToCurrentHour = !0
            }
            ScrollContainer();

        },
        error: function (a) {
            alert("Could not load data"), $("#ViewMoreDiv,#divLoaderPopup").hide()
        }
    }) : ($("#ViewMoreDiv,#divLoaderPopup").hide(), alert("Channels not available"))
}

function GetData(a, b, c, d) {
    $("#divLoaderPopup").show();
    if (a == "All Channels") {
        var e = GetChannelList(a, b),
                f = c + "_" + b + "_" + a;
    }
    else {
        var e = GetChannelListByGener(a, b), f = c + "_" + b + "_" + a;
    }

    if (null != sessionStorage.getItem(f)) {
        var g = CryptoJS.AES.decrypt(sessionStorage.getItem(f), f).toString(CryptoJS.enc.Utf8);
        GetCacheData(a, b, c, d, g)
    } else "" != e && void 0 != e ? $.ajax({
        type: "POST",
        url: "Handler/HanProgramList.ashx?Channels=" + e + '&Start=' + c + '&todatetime=' + d,
        //url: GetTvGuideScheduleUrl,
        // data: "{'Channels':'" + e + "','Start':'" + c + "','Page':'" + b + "','todatetime':'" + d + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (a) {
            var jsonData = JSON.stringify(a)
            sessionStorage.setItem(f, CryptoJS.AES.encrypt(jsonData, f)), a;
            // var value = JSON.parse(a)
            var c = a.ScheduleGrid.channel;
            if (ProcessTvGuideData(c), c.length >= 20 ? ($("#ViewMoreDiv").show(), PageNo = b + 1) : $("#ViewMoreDiv").hide(), Start = GetStartDate($("#ContentPlaceHolder1_ddlDate").val()), End = GetEndDate(Start), "0" == $("#ContentPlaceHolder1_ddlDate")[0].selectedIndex ? (ActiveHour = new Date(GetCurrentIST()).getHours(), ApplyTimeBar(!0)) : (ActiveHour = Start.getHours(), ApplyTimeBar(!1)), "" != $("#ContentPlaceHolder1_ddlDayPart").val() && "-1" != $("#ContentPlaceHolder1_ddlDayPart").val()) {
                var d = $("#ContentPlaceHolder1_ddlDayPart").val();
                "1" == d && (ActiveHour = 6), "2" == d && (ActiveHour = 14), "3" == d && (ActiveHour = 18), "4" == d && (ActiveHour = 20), "5" == d && (ActiveHour = 22), ScrollToCurrentHour = !0
            }
            ScrollContainer();
            GenreHolder1=[];
        },
        error: function (a) {
            alert("Could not load data"), $("#ViewMoreDiv,#divLoaderPopup").hide()
        }
    }) : ($("#ViewMoreDiv,#divLoaderPopup").hide(), alert("Channels not available"))
}

function GetCacheData(a, b, c, d, e) {

    e = JSON.parse(e);
    var f = e.ScheduleGrid.channel;
    if (ProcessTvGuideData(f), Start = GetStartDate($("#ContentPlaceHolder1_ddlDate").val()), End = GetEndDate(Start), "0" == $("#ContentPlaceHolder1_ddlDate")[0].selectedIndex ? (ActiveHour = new Date(GetCurrentIST()).getHours(), ApplyTimeBar(!0)) : (ActiveHour = Start.getHours(), ApplyTimeBar(!1)), "" != $("#ContentPlaceHolder1_ddlDayPart").val() && "-1" != $("#ContentPlaceHolder1_ddlDayPart").val()) {
        var g = $("#ContentPlaceHolder1_ddlDayPart").val();
        "1" == g && (ActiveHour = 6), "2" == g && (ActiveHour = 14), "3" == g && (ActiveHour = 18), "4" == g && (ActiveHour = 20), "5" == g && (ActiveHour = 22), ScrollToCurrentHour = !0
    }
    ScrollContainer(), f.length >= 20 ? ($("#ViewMoreDiv").show(), PageNo = b + 1) : $("#ViewMoreDiv").hide()
}

function ProcessTvGuideData(a) {
    for (var b = "", c = "", d = 0; d < a.length; d++) b += MakeChannelDiv(a[d]), c += "<div class='jTscroller' channel-id='" + a[d].channelid + "' alt='" + a[d].channeldisplayname + "'>", c += MakeProgramDiv(a[d].programme, a[d].channelid, a[d].channeldisplayname), c += "</div>";
    var e = $(".curent_time"),
        f = "";
    e.length < 1 && (f = "<div class='curent_time'><div class='curent_time_bar'></div></div>"), $("#ChannelContainer").append(b), $("#ProgramContainer").append(f + c), $("#divLoaderPopup").hide()
}

function ScrollContainer() {
    21 == parseInt(ActiveHour) ? $("#ancNext").hide() : $("#ancNext").show(), 0 == parseInt(ActiveHour) ? $("#ancPrev").hide() : $("#ancPrev").show(), ActiveHour > 21 && (ActiveHour = 21), ScrollToCurrentHour ? $(".scrollcontainer,.time_bar").animate({
        left: -(SingleHourWidth * ActiveHour) + "px"
    }) : $(".scrollcontainer,.time_bar").animate({
        left: "0px"
    }), ResizeText();

}

function MakeProgramDiv(a, b, c) {
    for (var f, g, d = "", e = 0, h = 0; h < a.length; h++) {

        0 == h ? (a[h].start = a[h].start.substr(0, 4) + a[h].stop.substr(5, 2) + a[h].stop.substr(8, 2) + "0000",
        f = new Date(a[h].start.substr(0, 4), parseInt(a[h].stop.substr(5, 2)) - 1, a[h].stop.substr(8, 2), 0, 0)) :
        f = new Date(a[h].start.substr(0, 4), parseInt(a[h].start.substr(5, 2)) - 1, a[h].start.substr(8, 2), a[h].start.substr(11, 2), a[h].start.substr(14, 2)),
        h == a.length - 1 ? (a[h].stop = a[h].start.substr(0, 4) + a[h].start.substr(5, 2) + a[h].start.substr(8, 2) + "2359",
        g = new Date(a[h].start.substr(0, 4), parseInt(a[h].start.substr(5, 2)) - 1, a[h].start.substr(8, 2), 23, 59)) :
        g = new Date(a[h].start.substr(0, 4), parseInt(a[h].stop.substr(5, 2)) - 1, a[h].stop.substr(8, 2), a[h].stop.substr(11, 2), a[h].stop.substr(14, 2)),
        e = parseInt(CalculateWidth(f, g));
        var i = "";
        "1" == a[h].isrecommended && (i = "<div class='popular_pro'></div>");
        var j = Math.abs(g.getTime() - f.getTime()),
            k = Math.floor(j / 1e3 / 60)
        var start = a[h].start;
        var res = start.replace(/-/gi, "");
        var out = res.replace(/:/gi, "");
        var output = out.replace(/T/gi, "");
        var startp = output.substring(0, 12);
        var stop = a[h].stop;
        var res = stop.replace(/-/gi, "");
        var out = res.replace(/:/gi, "");
        var output = out.replace(/T/gi, "");
        var stopp = output.substring(0, 12);

        l = f.getHours() + ":" + f.getMinutes() + ":" + g.getHours() + ":" + g.getMinutes(),
        m = "onclick=\"javascript:ShowProgramInfo('" + a[h].programmeid + "','" + b + "','" + startp + "','" + k + "','" + l + "','" + c + "','" + a[h].programmeurl + "','" + a[h].desc + "','" + a[h].title + "','" + a[h].genre + "','" + a[h].subgenre + "');\"",
        n = "",
        o = "<a title='" + a[h].title + "' onclick=\"javascript:Search('" + a[h].title + "','SubCategory');\">" + + "</a>";
        "Film" == a[h].channeldisplayname && (n = "<a title='" + a[h].channeldisplayname + "' onclick=\"javascript:Search('" + a[h].channeldisplayname + "','Category');\">" + a[h].channeldisplayname + "</a> | "),
        d += "<div class='Programmedetail' program-id='" + a[h].programmeid + "' program-start='" + startp + "' program-stop='" + stopp + "' title='" + a[h].title + "' style='width:" + e + "px;'> <span><div class='pro_title fitText' " + m + ">" + a[h].title + " <br/><span style='text-align: center;cursor: pointer;display: block;padding: 15px 0 0 0;font-size: 13px;font-weight: normal;line-height: 0px;'>" + a[h].subgenre + "</span> </div></span>" + i + "</div>"

    }
    return d
}

function CalculateWidth(a, b) {
    var c = Math.abs(b.getTime() - a.getTime()),
        d = Math.floor(c / 1e3 / 60);
    return d * (SingleHourWidth / 60)
}

function MakeChannelDiv(a) {
    var b = a.channellogourl,
        c = "<li><div channel-id='" + a.channelid + "' class='channel_logo_bg'><img class='ch_logo_img'  alt='" + a.channeldisplayname + "' title='" + a.channeldisplayname + "' src='" + b + "'/></div></li>";
    return c
}

function ClearTvGuideHtml() {
    $("#ChannelContainer,#ProgramContainer").html("")
}

function GetCurrentIST() {
    var a = new Date;
    a.setTime(a.getTime() + 60 * (a.getTimezoneOffset() + parseInt(UtcOffset)) * 1e3);
    var b = a.getHours(),
        c = b >= 12 ? "pm" : "am",
        d = a.getMonth() + 1 + "/" + a.getDate() + "/" + a.getFullYear() + ", " + (12 != b ? a.getHours() % 12 : a.getHours()) + ":" + a.getMinutes() + ":" + a.getSeconds() + " " + c;
    return d
}

function padZeroLeft(a) {
    return 1 == a.toString().length && (a = "0" + a.toString()), a.toString()
}

function GetFormattedDate(a) {
    return a.getFullYear() + padZeroLeft(a.getMonth() + 1) + padZeroLeft(a.getDate()) + padZeroLeft(a.getHours()) + "00"
}

function GetStartDate(a) {
    var b = new Date(GetCurrentIST());
    return b.setDate(b.getDate() + parseInt(a)), b.setHours(0), b.setMinutes(0), b
}

function GetEndDate(a) {
    var b = new Date(a);
    return b.setHours(23), b.setMinutes(59), b
}

function MoveNext() {
    parseInt(ActiveHour) < 22 && (21 == parseInt(ActiveHour) ? $("#ancNext").hide() : $("#ancNext").show(), 0 == parseInt(ActiveHour) && $("#ancPrev").show(), ActiveHour += 1, $(".scrollcontainer,.time_bar").animate({
        left: -(SingleHourWidth * ScrollByHour) * ActiveHour + "px"
    }), ResizeText())
}

function MovePrev() {
    parseInt(ActiveHour) >= 1 && (1 == parseInt(ActiveHour) ? $("#ancPrev").hide() : $("#ancPrev").show(), 22 == parseInt(ActiveHour) && $("#ancNext").show(), ActiveHour -= 1, $(".scrollcontainer,.time_bar").animate({
        left: -(SingleHourWidth * ScrollByHour) * ActiveHour + "px"
    }), ResizeText())
}

function ViewMore() {
    var a = GetFormattedDate(Start),
        b = GetFormattedDate(End);
    $("#divLoaderPopup").show();
    $("#ViewMoreDiv").hide(),
    GetData($("#ContentPlaceHolder1_ddlChannelGenre :selected").html(), PageNo, a, b)
}

function ResizeText() {
    var a = ActiveHour;
    $(".Programmedetail").each(function () {
        var b = $(this).width(),
            c = $(this).attr("program-start"),
            d = $(this).attr("program-stop"),
            e = c.substr(8, 2),
            f = d.substr(8, 2);
        c.substr(10, 2), d.substr(8, 2);
        if (parseInt(b) > 50 && $(this).find(".pro_title,.pro_sub").css("margin-left", "10px"), parseInt(e) < parseInt(a) && parseInt(f) >= parseInt(a)) {
            var i = new Date(c.substr(0, 4), parseInt(c.substr(4, 2)) - 1, c.substr(6, 2), c.substr(8, 2), c.substr(10, 2)),
              j = new Date(d.substr(0, 4), parseInt(d.substr(4, 2)) - 1, d.substr(6, 2), ActiveHour, 0),
            //var i = new Date(c.substr(0, 4), parseInt(c.substr(4, 2)) - 1, c.substr(6, 2), c.substr(8, 2), c.substr(10, 2)),
            //    j = new Date(d.substr(0, 4), parseInt(d.substr(4, 2)) - 1, d.substr(6, 2), ActiveHour, 0),
                k = CalculateWidth(i, j);
            parseInt(b) - k > 120 && $(this).find(".pro_title,.pro_sub").css("margin-left", k + 20 + "px")
        }
    })
}

function ShowProgramInfo(a, b, c, d, e, f, pimg, desc, title, genre, subgenre) {

    $("#lblProgramName").html(title), $("#lblProgramImg").attr("src", pimg), $("#lblProgramImg").attr("title", b.programtitle)
    $("#lblProgramSynopsis").attr("title", desc).html(desc),
    $("#lblProgramGenre").html(genre + " - " + subgenre)
    $("#lblDuration").html("Duration   :  "+d + " minutes")
    
    //"0" != b.productionyear && "" != b.productionyear ? $("#lblProgramYear").html(b.productionyear) : $("#divYear").hide(),
    //"" != b.languagename ? $("#lblLanguage").html(b.languagename) : $("#divLanguage").hide(), $("#lblProgramDuration").html(d + " minutes");
    var c = e.split(":"),
        f = parseInt(c[0]) > 12 ? parseInt(c[0]) - 12 + ":" + padZeroLeft(c[1]) + " pm" : parseInt(padZeroLeft(c[0])) + ":" + padZeroLeft(c[1]) + " am",
        g = parseInt(c[2]) > 12 ? parseInt(c[2]) - 12 + ":" + padZeroLeft(c[3]) + " pm" : parseInt(padZeroLeft(c[2])) + ":" + padZeroLeft(c[3]) + " am";
    $("#lblProgramTime").html(f + " - " + g), $("#popup_tag").fadeIn(300), $("#popup_tag-sticky-wrapper, .popup_mask").show()

}

function ApplyTimeBar(a) {
    try {
        if (a) {
            var b = new Date;
            b.setTime(b.getTime() + 60 * (b.getTimezoneOffset() + parseInt(UtcOffset)) * 1e3), $(".curent_time_bar").show().animate({
                left: 136 + SingleHourWidth * ScrollByHour * ActiveHour + 7 * b.getMinutes() + "px"
            }), setInterval(function () {
                var a = $(".curent_time_bar").css("left");
                void 0 != a && (a = parseFloat(a.split("px")[0]), a = a + 7 + "px", $(".curent_time_bar").animate({
                    left: a
                }))
            }, 6e4)
        } else $(".curent_time_bar").animate({
            left: "184px"
        }).hide()
    } catch (c) { }
}

function formatAMPM(a) {
    var b = a.getHours(),
        c = a.getMinutes(),
        d = b >= 12 ? "pm" : "am";
    b %= 12, b = b ? b : 12, c = 10 > c ? "0" + c : c;
    var e = b + ":" + c + " " + d;
    return e
}

function getFullDate() {
    var a = new Date,
        b = a.getMonth() + 1,
        c = a.getDate();
    a.getFullYear() + "/" + (10 > b ? "0" : "") + b + "/" + (10 > c ? "0" : "") + c
}
var GenreHolder = [],
     GenreHolder1 = [],
    ChannelsToDisplay = 20,
    ViewMoreType = "click",
    UtcOffset = 330,
    SingleHourWidth = 420,
    PageNo = 1,
    FetchedHourArray = [],
    ActiveHour = 0,
    ScrollToCurrentHour = !0,
    ScrollByHour = 1,
    Start = GetStartDate(0),
    End = GetEndDate(Start),
    GetChannelResultUrl = "Handler/GetChannelList.ashx",
    GetProgramDetailsUrl = "Handler/HanProgramList.ashx";
var Arraylist = new Arraylist();
var Arraylist1 = new Arraylist1();