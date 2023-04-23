using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;



namespace icoop_webapp
{
    public partial class walfare_reqedit : System.Web.UI.Page
    {
        allFunction Fc = new allFunction();
        Class1 Cndb = new Class1();
        string str;
        string csType;
        string branchId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Cndb.GetDb();

            csType = "1";
            branchId = "1001";

            if (!IsPostBack)
            {
                //จังหวัด อำเภอ ตำบล
                DLPrvince.Items.Insert(0, "-- เลือกจังหวัด--");
                DLPrvince1.Items.Insert(0, "-- เลือกจังหวัด--");
                DLAmpher.Items.Insert(0, "-- เลือกอำเภอ--");
                DLtambon.Items.Insert(0, "-- เลือกตำบล--");
                Gen_Province();
                Gen_Province1();

                //คำนำหน้าชื่อ
                DL_PreName.Items.Insert(0, "---เลือกคำนำหน้าชื่อ---");
                Gen_Prename();

                // สังกัด/หน่วย
                DL_Membergroup.Items.Insert(0, "---เลือกสังกัด/หน่วย---");
                Gen_MemberGroup();

                ////ประเภทสมาชิก
                //MemberType.Items.Insert(0, "---ประเภท---");
                //Gen_MemberType();
            }
        }

        private void Gen_Province()
        {
            str = "select * from wcucfprovince order by province_desc";
            
            DLPrvince.DataSource = Cndb.SelectQueryDropdown(str);
            DLPrvince.DataMember = "show";
            DLPrvince.DataTextField = "province_desc";
            DLPrvince.DataValueField = "Province_code";
            DLPrvince.Items.Insert(0, "-- เลือกจังหวัด--");
            DLPrvince.DataBind();            
        }

        private void Gen_Province1()
        {
            str = "select * from wcucfprovince order by province_desc";
            DLPrvince1.DataSource = Cndb.SelectQueryDropdown(str);
            DLPrvince1.DataMember = "show";
            DLPrvince1.DataTextField = "province_desc";
            DLPrvince1.DataValueField = "Province_code";
            DLPrvince1.Items.Insert(0, "-- เลือกจังหวัด --");
            DLPrvince1.DataBind();

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

        private void Gen_Prename()
        {
            str = "select * from wcucfprename order by prename_desc";
            DL_PreName.DataSource = Cndb.SelectQueryDropdown(str);
            DL_PreName.DataMember = "show";
            DL_PreName.DataTextField = "prename_desc";
            DL_PreName.DataValueField = "prename_code";
            DL_PreName.Items.Insert(0, "---เลือกคำนำหน้าชื่อ---");
            DL_PreName.DataBind();
        }

        private void Gen_MemberGroup()
        {
            str = "select * from wcucfmembgroup order by membgroup_desc";
            DL_Membergroup.DataSource = Cndb.SelectQueryDropdown(str);
            DL_Membergroup.DataMember = "show";
            DL_Membergroup.DataTextField = "membgroup_desc";
            DL_Membergroup.DataValueField = "membgroup_code";
            DL_Membergroup.Items.Insert(0, "---เลือกสังกัด/หน่วย---");
            DL_Membergroup.DataBind();
        }

        private void Gen_MemberGroup(string membgroup_code)
        {
            str = "select * from wcucfmembgroup where membgroup_code";
            DL_Membergroup.DataSource = Cndb.SelectQueryDropdown(str);
            DL_Membergroup.DataMember = "show";
            DL_Membergroup.DataTextField = "membgroup_desc";
            DL_Membergroup.DataValueField = "membgroup_code";
            DL_Membergroup.Items.Insert(0, "---เลือกสังกัด/หน่วย---");
            DL_Membergroup.DataBind();
        }

        void Get_selectAll()
        {
            str = "select * from wcdeptmaster where branch_Id ='" + branchId + "' and member_no ='" + TbxMember_no.Text + "'";
            DataTable dt = Cndb.SelectQuery(str);

            if (dt.Rows.Count <= 0) { return; }
            TbxMember_no.Text = dt.Rows[0]["member_no"].ToString();
            Tbx_Fname.Text = dt.Rows[0]["deptaccount_name"].ToString();
            Tbx_Sname.Text = dt.Rows[0]["deptaccount_sname"].ToString();
            DL_PreName.SelectedValue = dt.Rows[0]["Prename_code"].ToString();
            MemberType.SelectedValue = dt.Rows[0]["member_type"].ToString();
            Tbx_Birthday.Text = Fc.GetshotDate(dt.Rows[0]["wfbirthday_date"].ToString(), 17);
            //Tbx_Deptopen_data.Text = Fc.GetshotDate(dt.Rows[0]["deptopen_date"].ToString(), 17);
            //Tbx_Accessdata.Text = Fc.GetshotDate(dt.Rows[0]["lastaccess_date"].ToString(), 17);
            Tbx_Idcard.Text = dt.Rows[0]["card_person"].ToString();
            Tbx_Contact_Address.Text = dt.Rows[0]["contact_address"].ToString();
            DLPrvince.SelectedValue = dt.Rows[0]["province_code"].ToString().Trim();
            Gen_Ampher(dt.Rows[0]["province_code"].ToString(), dt.Rows[0]["ampher_code"].ToString());
            Gen_Tambol(dt.Rows[0]["ampher_code"].ToString(), dt.Rows[0]["tambol_code"].ToString());
            Get_postcode(DLAmpher.SelectedValue.ToString()); // ไปหาค่า รหัสไปรษณีย์       
            Tbx_Phone.Text = dt.Rows[0]["phone"].ToString();

            //DL_Membergroup.SelectedValue = dt.Rows[0]["membgroup_code"].ToString();
            try
            {
                DL_Membergroup.SelectedValue = dt.Rows[0]["membgroup_code"].ToString();
            }
            catch (Exception) {  }

            // --  อายุ --
            DateTime birthdate = Convert.ToDateTime(dt.Rows[0]["wfbirthday_date"].ToString());
            Age currentAge = new Age(birthdate);
            Age fixedAge = new Age(birthdate, DateTime.Now);
            Tbx_Age.Text = fixedAge.ToString();
            // --------------------------------------
            string Sex = dt.Rows[0]["sex"].ToString();
            RadioButtonList1.Items.FindByValue(Sex).Selected = true;
        }

        protected void DLPrvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DLPrvince.SelectedIndex==0)
            {
                Msgbox.Show("- กรุณาเลือกจังหวัด --");
                 DLPrvince.Focus();
                return;
            }
            Gen_Ampher(DLPrvince.SelectedValue.ToString());
            Get_postcode(DLAmpher.SelectedValue.ToString()); // ไปหาค่า รหัสไปรษณีย์
        }

        protected void DLAmpher_SelectedIndexChanged( object sender, EventArgs e)
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
        void Get_postcode(string Amper_code)
        {
            str = "select * from wcucfdistrict where district_code ='" + DLAmpher.SelectedValue.ToString() + "'";
            DataTable dt = Cndb.SelectQuery(str);
            if (dt.Rows.Count <= 0) { return; }
            TbxPostcode.Text = dt.Rows[0]["postcode"].ToString();
            //TextBox19.Text = dt.Rows[0]["district_desc"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Get_selectAll();
        }

    }
}