using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using Oracle.DataAccess.Client;

using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;


namespace icoop_webapp
{
    public partial class PopUp_w_sheet_wc_deptedit : System.Web.UI.Page
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

            if (!this.IsPostBack)
            {
                this.BindGrid();
                Cndb.GetDb();
               
            }
        }

        //protected void OnPaging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    this.BindGrid();
        //}

        private void BindGrid()
        {
            str = "SELECT wcdeptmaster.deptaccount_no,wcdeptmaster.branch_id,wccodeposit.deptaccount_no,wccodeposit.name,wccodeposit.seq_no,wccodeposit.codept_addre,wccodeposit.codept_relation,wccodeposit.codept_id FROM wcdeptmaster INNER JOIN wccodeposit ON wcdeptmaster.deptaccount_no = wccodeposit.deptaccount_no WHERE wccodeposit.branch_id ='" + branchId + "' AND wccodeposit.deptaccount_no ='00000008'";
            DataTable dt = Cndb.SelectQuery(str);       
            GridView1.DataSource = Cndb.SelectQuery(str);
            GridView1.DataBind();
            GridView2.DataSource = Cndb.SelectQuery(str);
            GridView2.DataBind();
            GridView3.DataSource = Cndb.SelectQuery(str);
            GridView3.DataBind();
            
        }

        //protected void OnGetDetails(object sender, EventArgs e)
        //{
        //    GridViewRow row = ((sender as Button).NamingContainer as GridViewRow);
         
        //    string deptaccount_no = row.Cells[0].Text;
        //    string member_no = row.Cells[1].Text;
        //    string wfaccount_name = row.Cells[2].Text;
        //    string card_preson = row.Cells[3].Text;
        //    Response.Redirect("w_sheet_wc_deptedit.aspx?TbxAccount_no=" + deptaccount_no + "&Tbx_member_no=" + member_no + "&Tbx_Name=" + wfaccount_name + "&Tbx_Idcard=" + card_preson);
        //}

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void Search(object sender, EventArgs e)
        {
            this.BindGrid();
            
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = ((sender as Button).NamingContainer as GridViewRow);

            string deptaccount_no = GridView1.SelectedRow.Cells[0].Text;
            string codept_id = GridView1.SelectedRow.Cells[1].Text;
            string codept_addre = GridView1.SelectedRow.Cells[2].Text;
          //  string card_preson = GridView1.SelectedRow.Cells[3].Text;
            //Response.Redirect("w_sheet_wc_deptedit.aspx?TbxAccount_no=" + deptaccount_no + "&Tbx_member_no=" + member_no + "&Tbx_Name=" + wfaccount_name + "&Tbx_Idcard=" + card_preson);
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

  

    }
}