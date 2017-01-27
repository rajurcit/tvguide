<%@ WebHandler Language="C#" Class="GetStates" %>

using System.Data;
using System.Linq;
using System.Web;
using System.Net;
using Newtonsoft;
using Newtonsoft.Json;

public class GetStates : IHttpHandler {
     public Siti_Cable.DAL.BroadbandPackagesBL objBroadbandBL = new Siti_Cable.DAL.BroadbandPackagesBL();
    public void ProcessRequest (HttpContext context) {
        string json = this.GetStateList();
            context.Response.ContentType = "text/plain";
            context.Response.Write(json);  
    }
  private string GetStateList()        {
            DataSet dsBroadbandSubArea = new DataSet();
            dsBroadbandSubArea = objBroadbandBL.GetBroadbandSubAreaDetail();
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dsBroadbandSubArea, Formatting.Indented);
            return JSONString;
        }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}