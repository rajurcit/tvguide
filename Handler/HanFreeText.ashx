<%@ WebHandler Language="C#" Class="HanFreeText" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO; 
using System.Net;
 

public class HanFreeText : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string SearchText = context.Request["Searchvalue"];
        string json = this.GetProgramList(SearchText);        
        context.Response.ContentType = "text/json";
        context.Response.Write(json);   
    }
    private string  GetProgramList(string SearchText)
    {
        WebRequest request = WebRequest.Create("http://services.whatsonindia.com/recoStar/recoStarHost.svc/Search/v2?apikey=ca060c5dcf9310fa98523d8914b829eb4833093f&responseformat=json&responselanguage=english&pageno=1&context=headendid=9483;applicationname=SitiCable;pagesize=20;outdatetimeformat=s;channelimagedimension=70x53;programmeimagewidth=360;programmeimageheight=270&searchvalue=" + SearchText + "&searchcriteria=freetextsearch&userid=2558494");
        WebResponse response = request.GetResponse();
        Stream dataStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        string responseChannel = reader.ReadToEnd();
       // var items = JsonConvert.DeserializeObject<ChannelsBL.jsonChannelList>(responseChannel);
        return responseChannel;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}