using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icoop_webapp
{
    public partial class w_sheet_allmember_icmt_ctrl : System.Web.UI.Page
    {

        allFunction Fc = new allFunction();
        Class1 Cndb = new Class1();


        string str;
        string branchId;
        string csType;
        string deptaccount_no;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Cndb.GetDb();

            csType = "1";
            branchId = "1001";

            if (!IsPostBack) { 
            
            }
        }
    }
}