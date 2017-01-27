using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Siti_Cable
{
    public partial class TV_Guide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDatetime();
                BindDatePart();
                BindChannelGener();
            }

        }
        private void BindDatetime()
        {
            DateTime today = DateTime.Now;
            string ToDayText = "ddd, d MMM";
            string ToDayItem = today.ToString(ToDayText);

            DateTime NextOne = today.AddDays(1);
            string NextDayText = "ddd, d MMM";
            string NextDayItem = NextOne.ToString(NextDayText);

            DateTime NextTwo = today.AddDays(2);
            string SecondDayText = "ddd, d MMM";
            string SecondDayItem = NextTwo.ToString(SecondDayText);

            DateTime NextThree = today.AddDays(3);
            string ThreeDayText = "ddd, d MMM";
            string ThreeDayItem = NextThree.ToString(ThreeDayText);

            DateTime NextFour = today.AddDays(4);
            string FourDayText = "ddd, d MMM";
            string FourDayItem = NextFour.ToString(FourDayText);

            DateTime NextFive = today.AddDays(5);
            string FiveDayText = "ddd, d MMM";
            string FiveDayItem = NextFive.ToString(FiveDayText);

            DateTime Nextsix = today.AddDays(6);
            string sixDayText = "ddd, d MMM";
            string sixDayItem = Nextsix.ToString(sixDayText);

            DateTime Nextseven = today.AddDays(7);
            string sevenDayText = "ddd, d MMM";
            string sevenDayItem = Nextseven.ToString(sevenDayText);

            if (!string.IsNullOrEmpty(ToDayItem))
            {
                ddlDate.Items.Add(new ListItem("Today", "0"));
            }
            if (!string.IsNullOrEmpty(NextDayItem))
            {
                ddlDate.Items.Add(new ListItem(NextDayItem, "1"));
            }
            if (!string.IsNullOrEmpty(SecondDayItem))
            {
                ddlDate.Items.Add(new ListItem(SecondDayItem, "2"));
            }
            if (!string.IsNullOrEmpty(ThreeDayItem))
            {
                ddlDate.Items.Add(new ListItem(ThreeDayItem, "3"));
            }
            if (!string.IsNullOrEmpty(FourDayItem))
            {
                ddlDate.Items.Add(new ListItem(FourDayItem, "4"));
            }
            if (!string.IsNullOrEmpty(FiveDayItem))
            {
                ddlDate.Items.Add(new ListItem(FiveDayItem, "5"));
            }
            if (!string.IsNullOrEmpty(sixDayItem))
            {
                ddlDate.Items.Add(new ListItem(sixDayItem, "6"));
            }
            
        }

        private void BindDatePart()
        {
            ddlDayPart.Items.Add(new ListItem("Day Part", "-1"));
            ddlDayPart.Items.Add(new ListItem("Morning", "1"));
            ddlDayPart.Items.Add(new ListItem("Afternoon", "2"));
            ddlDayPart.Items.Add(new ListItem("Evening", "3"));
            ddlDayPart.Items.Add(new ListItem("Prime Time", "4"));
            ddlDayPart.Items.Add(new ListItem("Late Night", "5"));

        }
        private void BindChannelGener()
        {
            ddlChannelGenre.Items.Add(new ListItem("All Channels", "All Channels"));
            ddlChannelGenre.Items.Add(new ListItem("English GEC", "English GEC"));
            ddlChannelGenre.Items.Add(new ListItem("English Movies", "English Movies"));
            ddlChannelGenre.Items.Add(new ListItem("English News", "English News"));
            ddlChannelGenre.Items.Add(new ListItem("Hindi GEC", "Hindi GEC"));
            ddlChannelGenre.Items.Add(new ListItem("Hindi Movies", "Hindi Movies"));
            ddlChannelGenre.Items.Add(new ListItem("Hindi News", "Hindi News"));
            ddlChannelGenre.Items.Add(new ListItem("Infotainment", "Infotainment"));
            ddlChannelGenre.Items.Add(new ListItem("International", "International"));
            ddlChannelGenre.Items.Add(new ListItem("Kids", "Kids"));
            ddlChannelGenre.Items.Add(new ListItem("Lifestyle", "Lifestyle"));
            ddlChannelGenre.Items.Add(new ListItem("Music", "Music"));
            ddlChannelGenre.Items.Add(new ListItem("Regional", "Regional"));
            ddlChannelGenre.Items.Add(new ListItem("Religious", "Religious"));
            ddlChannelGenre.Items.Add(new ListItem("Sports", "Sports"));
            ddlChannelGenre.Items.Add(new ListItem("Tamil", "Tamil"));

        }
    }
}