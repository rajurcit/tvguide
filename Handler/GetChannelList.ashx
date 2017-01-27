<%@ WebHandler Language="C#" Class="GetChannelList" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO; 
using System.Net;

public class GetChannelList : IHttpHandler {
    
  
    public void ProcessRequest (HttpContext context)
    {
        string json = this.GetChannelList1();        
        context.Response.ContentType = "text/json";
        context.Response.Write(json);        
    }
    private string  GetChannelList1()
    {
        WebRequest request = WebRequest.Create("http://services.whatsonindia.com/guideStar/guideStarHost.svc/channel/v1?apikey=e5b088349a802b84e981bd16273875b3ea68bb0e&responseformat=json&responselanguage=english&channelname=all&context=headendid=9483;applicationname=SitiCable;channelimagedimension=70x70");
        WebResponse response = request.GetResponse();
        Stream dataStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        string responseChannel = reader.ReadToEnd();
        //var items = JsonConvert.DeserializeObject<ChannelsBL.jsonChannelList>(responseChannel);
        return responseChannel;
    }

    public bool IsReusable
    {
        get {
            return false;
        }
    }

}