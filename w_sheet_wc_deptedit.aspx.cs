using System;
using System.IO;
using System.Globalization;
using System.Data;
using System.Configuration;
using System.Collections;
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
    public partial class w_sheet_wc_deptedit : System.Web.UI.Page
    {

        allFunction Fc = new allFunction();
        Class1 Cndb = new Class1();
        

        string str;
        string branchId;
        string csType;
        string deptaccount_no;
        string vWhere="";
        HttpCookie myCookie = new HttpCookie("myCookie");

        protected void Page_Load(object sender, EventArgs e)
        {

          
            Cndb.GetDb();

            csType = "1";
            branchId = "1001";
            try
            {
                vWhere = Request.Cookies["myCookie"]["v"].ToString();
            }
            catch (Exception)
            {
                
                
            }
            

            if (!this.IsPostBack)
            {
                //Get_Request();
                this.BindGrid("");
                
                
                //จังหวัด อำเภอ ตำบล
                DLPrvince.Items.Insert(0, "-- เลือกจังหวัด--");
                DLMariage_Provine.Items.Insert(0, "-- เลือกจังหวัด--");
                DLMariage_Ampher.Items.Insert(0, "--- เลือกอำเถอ --");
                DLAmpher.Items.Insert(0, "-- เลือกอำเภอ--");
                DLtambon.Items.Insert(0, "-- เลือกตำบล--");
                Gen_Province();
                Gen_Mariage_Provine();
              

                //คำนำหน้าชื่อ
                PreName.Items.Insert(0, "---เลือกคำนำหน้าชื่อ---");
                Gen_Prename();

                // สังกัด/หน่วย

                MemberGroup.Items.Insert(0, "---เลือกสังกัด/หน่วย---");
                Gen_MemberGroup();
                
                //ประเภทสมาชิก
                MemberType.Items.Insert(0, "---ประเภท---");
                Gen_MemberType();
                TabGrid();
            }
          
        }

        protected void Search(object sender, EventArgs e)
        {
            //this.BindGrid();
        }
        protected void ShowModal(object sender, EventArgs e)
        {
           // string vWhere = "";
            
            ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), "Popup", "ShowPopup();", true);
            //Msgbox.Show(tttt.Text);
           // Msgbox.Show(txtSearch.Text);
            vWhere = "";
            str = "SELECT * FROM wcdeptmaster WHERE deptclose_status=0 and wcdeptmaster.branch_Id ='" + branchId + "'";

           
            if (Tbx_Search_Account.Text!="" )
            {
                vWhere = " and deptaccount_no like '%" + Tbx_Search_Account.Text + "%'";
            }
            else if (Tbx_Search_Idcard.Text != "")
            {
                vWhere = " and card_person like '%" + Tbx_Search_Idcard.Text + "%'";
            }
            else if (Tbx_member.Text != "")
            {
                vWhere = " and member_no='" + Cndb.Get_MemberFormate(Tbx_member.Text) + "'";
            }
            else if (Tbx_Fname.Text != "" && Tbx_Sname.Text == "")
            {
                vWhere = " and deptaccount_name like '%" + Tbx_Fname.Text + "%'";
            }
            else if (Tbx_Fname.Text == "" && Tbx_Sname.Text != "")
            {
                vWhere = " and deptaccount_sname like '%" + Tbx_Sname.Text + "%'";
            }
            else if (Tbx_Fname.Text != "" && Tbx_Sname.Text != "")
            {
                vWhere = " and deptaccount_sname like '%" + Tbx_Fname.Text + "%' and deptaccount_sname like '%" + Tbx_Sname.Text + "%'";
            }


            //myCookie["v"] = vWhere;
            Label42.Text = vWhere;
           
            BindGrid(vWhere);
        }
        private void BindGrid(string vWhere)
        {
            
            string str = "SELECT * FROM wcdeptmaster WHERE  wcdeptmaster.branch_Id ='" + branchId + "'";
            str += vWhere;
            DataTable dt = Cndb.SelectQuery(str);
            GridView1.DataSource = Cndb.SelectQuery(str);
            GridView1.DataBind();
            
        }

        private void TabGrid()
        {
           // if (TbxAccount_no.Text != "") {
           //     str = "SELECT wcdeptmaster.deptaccount_no,wcdeptmaster.branch_id,wccodeposit.deptaccount_no,wccodeposit.name,wccodeposit.seq_no,wccodeposit.codept_addre,wccodeposit.codept_relation,wccodeposit.codept_id" +
           //"FROM wcdeptmaster " +
           //"INNER JOIN wccodeposit ON wcdeptmaster.deptaccount_no = wccodeposit.deptaccount_no " +
           //"WHERE wcdeptmaster.branch_id ='" + branchId + "' AND deptaccount_no ='" + TbxAccount_no.Text + "'";
           // }

           // string vWhere = "";
           // str = "SELECT wcdeptmaster.deptaccount_no,wcdeptmaster.branch_id,wccodeposit.deptaccount_no,wccodeposit.name,wccodeposit.seq_no,wccodeposit.codept_addre,wccodeposit.codept_relation,wccodeposit.codept_id" +
           //"FROM wcdeptmaster " +
           //"INNER JOIN wccodeposit ON wcdeptmaster.deptaccount_no = wccodeposit.deptaccount_no " +
           //"WHERE wcdeptmaster.branch_id ='" + branchId + "";

           // if (TbxAccount_no.Text != "")
           // {
           //     vWhere = " and deptaccount_no='" + dept_no2 + "'";
           // }

           // str += vWhere;

            //if (TbxAccount_no.Text != "")
            //{
            //    str = "SELECT * FROM wccodeposit WHERE branch_Id = '" + branchId + "'";
            //}




            str = "SELECT wcdeptmaster.deptaccount_no,wcdeptmaster.branch_id,wccodeposit.deptaccount_no,wccodeposit.name,wccodeposit.seq_no,wccodeposit.codept_addre,wccodeposit.codept_relation,wccodeposit.codept_id FROM wcdeptmaster INNER JOIN wccodeposit ON wcdeptmaster.deptaccount_no = wccodeposit.deptaccount_no WHERE wccodeposit.branch_id ='" + branchId + "' AND wccodeposit.deptaccount_no ='00007767'";
            
                DataSet ds = Cndb.SelectQueryDropdown(str);
                DataTable dt = Cndb.SelectQuery(str);
                GridView2.DataSource = Cndb.SelectQuery(str);
                GridView2.DataBind();
                GridView3.DataSource = Cndb.SelectQuery(str);
                GridView3.DataBind();
            
        }
 
        private void Gen_MemberType()
        {
            str = "select * from wcmembertype where cs_type ='"+csType+"' order by wcmembertype_desc";
            MemberType.DataSource = Cndb.SelectQueryDropdown(str);
            MemberType.DataMember = "show";
            MemberType.DataTextField = "wcmembertype_desc";
            MemberType.DataValueField = "wftype_code";
            MemberType.Items.Insert(0, "---ประเภท---");
            MemberType.DataBind();

        }

        private void Gen_MemberGroup()
        {
            str = "select * from wcucfmembgroup order by membgroup_desc";
            MemberGroup.DataSource = Cndb.SelectQueryDropdown(str);
            MemberGroup.DataMember = "show";
            MemberGroup.DataTextField = "membgroup_desc";
            MemberGroup.DataValueField = "membgroup_code";
            MemberGroup.Items.Insert(0, "---เลือกสังกัด/หน่วย---");
            MemberGroup.DataBind();
        }

        private void Gen_MemberGroup(string membgroup_code)
        {
            str = "select * from wcucfmembgroup where membgroup_code";
            MemberGroup.DataSource = Cndb.SelectQueryDropdown(str);
            MemberGroup.DataMember = "show";
            MemberGroup.DataTextField = "membgroup_desc";
            MemberGroup.DataValueField = "membgroup_code";
            MemberGroup.Items.Insert(0, "---เลือกสังกัด/หน่วย---");
            MemberGroup.DataBind();
        }
   
        private void Gen_Prename()
        {
            str = "select * from wcucfprename order by prename_desc";
            PreName.DataSource = Cndb.SelectQueryDropdown(str);
            PreName.DataMember = "show";
            PreName.DataTextField = "prename_desc";
            PreName.DataValueField = "prename_code";
            PreName.Items.Insert(0, "---เลือกคำนำหน้าชื่อ---");
            PreName.DataBind();
        }

        private void Gen_Province()
        {
            str = "select * from wcucfprovince order by province_desc";
            DLPrvince.DataSource = Cndb.SelectQueryDropdown(str);
            DLPrvince.DataMember = "show";
            DLPrvince.DataTextField = "province_desc";
            DLPrvince.DataValueField = "Province_code";
            DLPrvince.Items.Insert(0, "-- เลือกจังหวัด --");
            DLPrvince.DataBind();

        }

        private void Gen_Mariage_Provine()
        {
            str = "select * from wcucfprovince order by province_desc";
            DLMariage_Provine.DataSource = Cndb.SelectQueryDropdown(str);
            DLMariage_Provine.DataMember = "show";
            DLMariage_Provine.DataTextField = "province_desc";
            DLMariage_Provine.DataValueField = "Province_code";
            DLMariage_Provine.Items.Insert(0, "-- เลือกจังหวัด --");
            DLMariage_Provine.DataBind();

        }

        void Gen_Mariage_Ampher(string Province_code)
        {
            str = "select * from wcucfdistrict where province_code ='" + Province_code.ToString() + "' order by district_desc";
            DLMariage_Ampher.DataSource = Cndb.SelectQueryDropdown(str);
            DLMariage_Ampher.DataMember = "show";
            DLMariage_Ampher.DataTextField = "district_desc";
            DLMariage_Ampher.DataValueField = "district_code";
            DLMariage_Ampher.Items.Insert(0, "-- เลือกจังหวัด--");
            DLMariage_Ampher.DataBind();
            
        }

        void Gen_Mariage_Ampher(string Province_code, string Ampher_code)
        {
            str = "select * from wcucfdistrict where district_code ='" + Ampher_code.ToString() + "'";
            DLMariage_Ampher.DataSource = Cndb.SelectQueryDropdown(str);
            DLMariage_Ampher.DataMember = "show";
            DLMariage_Ampher.DataTextField = "district_desc";
            DLMariage_Ampher.DataValueField = "district_code";
            DLMariage_Ampher.Items.Insert(0, "-- เลือกจังหวัด--");
            DLMariage_Ampher.DataBind();
           
        }

        void Gen_Ampher(string Province_code)
        {
            str = "select * from wcucfdistrict where province_code ='" + Province_code.ToString() + "' order by district_desc";
            DLAmpher.DataSource = Cndb.SelectQueryDropdown(str);
            DLAmpher.DataMember = "show";
            DLAmpher.DataTextField = "district_desc";
            DLAmpher.DataValueField = "district_code";
            DLAmpher.Items.Insert(0, "-- เลือกจังหวัด--");
            DLAmpher.DataBind();
            TbxPostcode.Text = "";
        }
        void Gen_Ampher(string Province_code, string Ampher_code)
        {
            str = "select * from wcucfdistrict where province_code ='" + Province_code.ToString() + "' order by district_desc";
            DLAmpher.DataSource = Cndb.SelectQueryDropdown(str);
            DLAmpher.DataMember = "show";
            DLAmpher.DataTextField = "district_desc";
            DLAmpher.DataValueField = "district_code";
            DLAmpher.Items.Insert(0, "-- เลือกจังหวัด--");
            DLAmpher.DataBind();
            TbxPostcode.Text = "";

            DLAmpher.SelectedValue = Ampher_code;

        }

        void Gen_Tambol(string district_code)
        {
            str = "select * from wcucftambol where district_code ='" + district_code.ToString() + "' order by tambol_desc";
            DataSet ds = Cndb.SelectQueryDropdown(str);

            DLtambon.DataSource = Cndb.SelectQueryDropdown(str);
            DLtambon.DataMember = "show";
            DLtambon.DataTextField = "tambol_desc";
            DLtambon.DataValueField = "tambol_code";
            DLtambon.Items.Insert(0, "-- เลือกตำบล --");
            DLtambon.DataBind();
        }

        void Gen_Tambol(string district_code, string tambol_code)
        {
            str = "select * from wcucftambol where tambol_code ='" + tambol_code.ToString() + "'";
            DataSet ds = Cndb.SelectQueryDropdown(str);
            DLtambon.DataSource = Cndb.SelectQueryDropdown(str);
            DLtambon.DataMember = "show";
            DLtambon.DataTextField = "tambol_desc";
            DLtambon.DataValueField = "tambol_code";
            DLtambon.Items.Insert(0, "-- เลือกตำบล --");
            DLtambon.DataBind();
        }

        protected void DLPrvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DLPrvince.SelectedIndex == 0)
            {
                Msgbox.Show("- กรุณาเลือกจังหวัด --");
                DLPrvince.Focus();
                return;
            }
            Gen_Tambol(DLAmpher.SelectedValue.ToString());
            Gen_Ampher(DLPrvince.SelectedValue.ToString());
            Get_postcode(DLAmpher.SelectedValue.ToString()); // ไปหาค่า รหัสไปรษณีย์
        }

        protected void DLAmpher_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DLAmpher.SelectedIndex < 0)
            {
                Msgbox.Show("-- กรุณาเลือกอำเภอ --");
                DLAmpher.Focus();
                return;
            }
            Gen_Tambol(DLAmpher.SelectedValue.ToString());
            Get_postcode(DLAmpher.SelectedValue.ToString()); // ไปหาค่า รหัสไปรษณีย์

        }

        void Get_selectAll(string dept_no)
        {
           
            string vWhere = "";
            str = "select * from wcdeptmaster where branch_Id ='" + branchId + "'";

            if (dept_no!="")
            {
                vWhere=" and deptaccount_no='"+ dept_no +"'";
            }

            str += vWhere;

            
            DataTable dt = Cndb.SelectQuery(str);
   
            if (dt.Rows.Count <= 0) { return; }
            TbxAccount_no.Text = dt.Rows[0]["deptaccount_no"].ToString();
            Tbx_Name.Text = dt.Rows[0]["deptaccount_name"].ToString();
            Tbx_Sername.Text = dt.Rows[0]["deptaccount_sname"].ToString();
            PreName.SelectedValue = dt.Rows[0]["Prename_code"].ToString();
            try
            {
                MemberType.SelectedValue = dt.Rows[0]["member_type"].ToString();
            }
            catch (Exception){ }
            
            Tbx_Birthday.Text = Fc.GetshotDate(dt.Rows[0]["wfbirthday_date"].ToString(), 17);
            Tbx_Deptopen_data.Text = Fc.GetshotDate(dt.Rows[0]["deptopen_date"].ToString(), 17);
            Tbx_Accessdata.Text = Fc.GetshotDate(dt.Rows[0]["lastaccess_date"].ToString(), 17);
            Tbx_Fullname.Text = dt.Rows[0]["wfaccount_name"].ToString();
            Tbx_member_no.Text = dt.Rows[0]["member_no"].ToString();
            Tbx_Idcard.Text = dt.Rows[0]["card_person"].ToString();
            Tbx_Contact_Address.Text = dt.Rows[0]["contact_address"].ToString();
           // Txt_Deptclose_Status.Text = Fc.GetshotDate(dt.Rows[0]["deptclose_status"].ToString(), 17);
            Txt_Deptclose_Status.Text = Fc.GetshotDate(dt.Rows[0]["deptclose_status"].ToString(), 17);
            Txt_Die_Date.Text = Fc.GetshotDate(dt.Rows[0]["die_date"].ToString(), 17);

            try
            {
                DLPrvince.SelectedValue = dt.Rows[0]["province_code"].ToString().Trim();
            }
            catch (Exception) { }

            try
            {
                Gen_Ampher(dt.Rows[0]["province_code"].ToString(), dt.Rows[0]["ampher_code"].ToString());
            }
            catch (Exception) { }
            try
            {
                Gen_Tambol(dt.Rows[0]["ampher_code"].ToString(), dt.Rows[0]["tambol_code"].ToString());
            }
            catch (Exception) { }
            try
            {
            Get_postcode(DLAmpher.SelectedValue.ToString()); // ไปหาค่า รหัสไปรษณีย์       {
            }            
            catch (Exception) { }


            try
            {
                DLMariage_Provine.SelectedValue = dt.Rows[0]["mariage_province"].ToString().Trim();
            }
            catch (Exception) { }
            Tbx_Phone.Text = dt.Rows[0]["phone"].ToString();
            Tbx_Manage_Name.Text = dt.Rows[0]["manage_corpse_name"].ToString();
            DLStatus.SelectedValue = dt.Rows[0]["mariage_status"].ToString();
            Tbx_Mariage_Name.Text = dt.Rows[0]["mariage_name"].ToString();
            Tbx_Mariage_Sname.Text = dt.Rows[0]["mariage_sname"].ToString();
            Tbx_Mariage_Date.Text = Fc.GetshotDate(dt.Rows[0]["mariage_date"].ToString(), 17);
            Tbx_Mariage_Id.Text = dt.Rows[0]["mariage_id"].ToString();
            

            try
            {
                DLMariage_Provine.SelectedValue = dt.Rows[0]["mariage_province"].ToString().Trim();
            }
            catch (Exception) { }
            
           
            try
            {
                Gen_Mariage_Ampher(dt.Rows[0]["province_code"].ToString(), dt.Rows[0]["ampher_code"].ToString());
            }
            catch (Exception) { }

            try
            {
                MemberGroup.SelectedValue = dt.Rows[0]["membgroup_code"].ToString();
            }
            catch (Exception) {}

            // --  อายุ --
            DateTime birthdate = Convert.ToDateTime(dt.Rows[0]["wfbirthday_date"].ToString());
            Age currentAge = new Age(birthdate);            
            Age fixedAge = new Age(birthdate, DateTime.Now);         
            Tbx_Age.Text = fixedAge.ToString();
            // --------------------------------------
            string Sex = dt.Rows[0]["sex"].ToString();                        
            RadioButtonList1.SelectedValue = Sex;

            DLStatus.SelectedValue = dt.Rows[0]["mariage_status"].ToString();
            DL_Payref_Method.SelectedValue = dt.Rows[0]["payref_method"].ToString();
            Txt_Tran_Deptacc_No.Text = dt.Rows[0]["tran_deptacc_no"].ToString();
            
        }

        void Get_postcode(string Amper_code)
        {
            str = "select * from wcucfdistrict where district_code ='" + DLAmpher.SelectedValue.ToString() + "'";
            DataTable dt = Cndb.SelectQuery(str);
            if (dt.Rows.Count <= 0) { return; }
            TbxPostcode.Text = dt.Rows[0]["postcode"].ToString();
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
           
           // this.BindGrid("");
 
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {    
            string deptaccount_no = GridView1.SelectedRow.Cells[0].Text;
            Get_selectAll(deptaccount_no);
            Tbx_Search_Account.Text = "";
            Tbx_Search_Idcard.Text = "";
            Tbx_member.Text ="";
            Tbx_Fname.Text = "";
            Tbx_Sname.Text = "";
            Label42.Text = "";
            BindGrid("");
        }

        

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string V = Label42.Text;

            GridView1.PageIndex = e.NewPageIndex;
            
            this.BindGrid(V);

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                                                
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
  

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
                
        //        DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);
                

        //        DataTable dt = Cndb.SelectQuery(str);
        //        GridView2.DataSource = Cndb.SelectQuery(str);
        //        GridView2.DataBind();


        //        str = "SELECT codept_relation FROM wccodeposit";
        //        DropDownList1.DataSource = dt;

        //        DropDownList1.DataTextField = "codept_relation";
        //        DropDownList1.DataValueField = "codept_relation";
        //        DropDownList1.DataBind();
        //        DropDownList1.Items.Insert(0, new ListItem("--Select Qualification--", "0"));


        //    }

        //}


           //str = "select * from wcucftambol where tambol_code ='" + tambol_code.ToString() + "'";
           // DataSet ds = Cndb.SelectQueryDropdown(str);
           // DLtambon.DataSource = Cndb.SelectQueryDropdown(str);
           // DLtambon.DataMember = "show";
           // DLtambon.DataTextField = "tambol_desc";
           // DLtambon.DataValueField = "tambol_code";
           // DLtambon.Items.Insert(0, "-- เลือกตำบล --");
           // DLtambon.DataBind();

        //protected void GridView2_OnRowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        DataTable dt = Cndb.SelectQuery(str);
        //        if (dt.Rows.Count <= 0) { return; }
               
        //        str = "select wccodeposit from codept_relation ";
        //        DataSet ds = Cndb.SelectQueryDropdown(str);
        //        DropDownList ddlCountries = (e.Row.FindControl("ddlCountries") as DropDownList);
        //        ddlCountries.DataSource = Cndb.SelectQueryDropdown(str);
        //        //ddlCountries.DataSource = Cndb("SELECT DISTINCT Country FROM Customers");
        //        ddlCountries.DataMember = "show";
        //        ddlCountries.DataTextField = "codept_relation";
        //        ddlCountries.DataValueField = "codept_relation";
        //        ddlCountries.Items.Insert(0, "Please select");
        //        ddlCountries.DataBind();
                

        //        //Select the Country of Customer in DropDownList.
        //        //string country = (e.Row.FindControl("lblCountry") as Label).Text;
        //        //ddlCountries.Items.FindByValue(country).Selected = true;
        //    }
        //}
  
    }
}