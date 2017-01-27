<%@ WebHandler Language="C#" Class="HanProgramList" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Net;


public class HanProgramList : IHttpHandler,System.Web.SessionState.IRequiresSessionState {
    // string channellist = "",fromdatetime="";
    int ddlDateValue = 0;
    public void ProcessRequest (HttpContext context) {

        string channellist = context.Request["Channels"];
        string fromdatetime = context.Request["Start"];
        string todatetime = context.Request["todatetime"];
        if (context.Session["ddlDate"] != null)
            ddlDateValue = Convert.ToInt32(context.Session["ddlDate"]);
        string json = this.GetChannelShedule(channellist,fromdatetime,todatetime);
        context.Response.ContentType = "text/json";
        context.Response.Write(json);

    }

    private string GetChannelShedule(string channellist,string fromdatetime,string todatetime)
    {  // DateTime today = DateTime.Now;
       // double value = Convert.ToDouble(ddlDate.SelectedItem.Value);
        //DateTime NextOne = today.AddDays(0);
        //string fromdateDay = NextOne.ToString("yyyyMMdd");
        //fromdatetime = fromdateDay + "0000";
        //todatetime = fromdateDay + "2359";
        //string channellist1=  channellist.TrimStart(',');Adhyatma TV
       //channellist = "10TV,7S Music,9X Jalwa,9X Jhakaas,9X Tashan,9XM,9XO,A2Z News,Aaj Tak,Aakash Aath,Aalami Samay,Aastha,Aastha Bhajan,ABP Ananda,ABP Majha,ABP News,Adhyatma TV,Adithya TV";// channellist.TrimStart(',');

        WebRequest request = WebRequest.Create("http://services.whatsonindia.com/guideStar/guideStarHost.svc/schedulegrid/V3?apikey=50ce41dc05c4888b3cb778b060c044741b100565&channellist=" + channellist + "&responseformat=json&responselanguage=english&fromdatetime=" + fromdatetime + "&todatetime=" + todatetime + "&context=headendid=9483;applicationname=SitiCable;channelimagedimension=medium;programmeimagewidth=70;programmeimageheight=70;includeprevdayspillover=true;outdatetimeformat=s;forcechannelmetadatafiltering=true&userid=2558494");
        WebResponse response = request.GetResponse();
        Stream dataStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        string responseChannel = reader.ReadToEnd();
        //var items = JsonConvert.DeserializeObject<GridListBL.RootObject>(responseChannel);
        return responseChannel;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}