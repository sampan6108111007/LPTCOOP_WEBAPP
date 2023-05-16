<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_sheet_wc_deptedit.aspx.cs" Inherits="icoop_webapp.w_sheet_wc_deptedit" EnableEventValidation = "false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>

<body>

<style type="text/css">
.modalPopup
{
    background-color:white;
    border-width: 3px;
    border-style: solid;
    border-color:Black;
    padding-top: 10px;
    width: 650px;
    height:750px;
    }
    
    .background 
    {
        background-color:Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
        }
    .round
    {
        font-size:11pt;
        margin-left:auto;
        margin-right:auto;
        margin-top:1px;
        margin-bottom:1px;
        padding:3px;
        border-top:1px solid;
        border-left:1px solid;
        border-right:1px solid;
        border-bottom:1px solid;
        -moz-border-radius: 8px;
        -webkit-border-radius:8px;
        }
        
        .mydatagrid
{
width: 80%;
border: solid 2px black;
min-width: 80%;
}
.header
{
background-color: #646464;
font-family: Arial;
color: White;
height: 25px;
text-align: center;
font-size: 16px;
}

.rows
{
background-color: #fff;
font-family: Arial;
font-size: 14px;
color: #000;
min-height: 25px;
text-align: left;
}
.rows:hover
{
background-color: #249447;
}

.mydatagrid a /** FOR THE PAGING ICONS **/
{
background-color: Transparent;
padding: 5px 5px 5px 5px;
color: #000;
text-decoration: none;
font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/
{
background-color: #fff;
color: #000;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{

padding: 5px 5px 5px 5px;
background-color: #000;
color: #fff;
}
.pager
{
background-color: #249447;
font-family: Arial;
color: White;
height: 30px;
text-align: left;
}

.mydatagrid td
{
padding: 5px;
}
.mydatagrid th
{
padding: 5px;
}
   
</style>
    
 
    <form id="form1" runat="server">

     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        //var SearchValue;
        $(function () {
            // SearchValue = localStorage.getItem("SearchValue") != "" ? localStorage.getItem("SearchValue") : $("[id*=txtSearch]").val().trim();
            $("[id*=btnShowPopup]").click(function () {
                ShowPopup();
                return false;
            });
            $("#dialog").parent().appendTo($("form:first"));
        });
        function ShowPopup() {
            $("#dialog").dialog({
                title: "ดู/แก้ไข ข้อมูลทะเบียนสมาชิก",
                width: 900,
                // appendTo: "form",
                buttons: {
                    Ok: function () {
                        $(this).dialog('close');
                    }
                },

                modal: true
            });
            return true;
        }

        $(document).ready(function () {
            $("[id*=GridView2]").Scrollable({
                ScrollHeight: 300,
                IsInUpdatePanel: true
            });
        });
        var isApplied = false;
        function TabChanged(sender, args) {
            if (!isApplied) {
                if (sender.get_activeTabIndex() == 1) {
                    $("[id*=GridView3]").Scrollable({
                        ScrollHeight: 300,
                        IsInUpdatePanel: true
                    });
                    isApplied = true;               
            }
        }
            else if (!isApplied) {
                if (sender.get_activeTabIndex() == 2) {
                    $("[id*=GridView4]").Scrollable({
                        ScrollHeight: 300,
                        IsInUpdatePanel: true
                    });
                    isApplied = true;
                }
            }

            else if (!isApplied) {
                if (sender.get_activeTabIndex() == 3) {
                    $("[id*=GridView5]").Scrollable({
                        ScrollHeight: 300,
                        IsInUpdatePanel: true
                    });
                    isApplied = true;
                }
            }
        }

</script>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:updatepanel ID="Updatepanel1" runat="server">
 <ContentTemplate>
 </ContentTemplate>
 </asp:updatepanel>
    <div style="text-align: left; margin-top: 72px">
    
        <asp:Label ID="Label1" runat="server" BorderStyle="Solid" Text="เลขฌาปนกิจ:" 
            BackColor="#AEE2FF" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="TbxAccount_no" runat="server" Width="79px" Height="17px"></asp:TextBox>
        <asp:Button ID="btnShowPopup" runat="server" Text="..." Width="24px" 
            onclick="Button1_Click" Height="25px" />
        <asp:Label ID="Label2" runat="server" Text="ชื่อสมาชิก:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="PreName" runat="server" Width="91px" Height="17px">
           
        </asp:DropDownList>
        <asp:TextBox ID="Tbx_Name" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="นามสกุล:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Sername" runat="server" Height="17px"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="ประเภท:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="MemberType" runat="server" Height="17px">
        </asp:DropDownList>  
        
        <asp:Label ID="Label38" runat="server" Text="วันที่สมัคร:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Accessdata" runat="server" Height="17px"></asp:TextBox>
        &nbsp
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" RepeatLayout="Flow" Height="17px">
            <asp:ListItem Value="M">ชาย</asp:ListItem>
            <asp:ListItem Value="F">หญิง</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="Label39" runat="server" Text="วันเกิด:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Birthday" runat="server" Height="17px"></asp:TextBox>
        
        <asp:Label ID="Label7" runat="server" Text="อายุ:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Age" runat="server" Height="17px"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" Text="สมาชิกอ้างอิง:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_member_no" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label9" runat="server" Text="ชื่อ นามสกุล:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Fullname" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" Text="บัตรประชาชน:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Idcard" runat="server" Height="17px"></asp:TextBox>
        <br />
        <asp:Label ID="Label11" runat="server" Text="วันที่คุ้มครอง:" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Deptopen_data" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label13" runat="server" Text="สังกัด/หน่วย" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="MemberGroup" runat="server" Height="17px" Width="557px" 
            AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label14" runat="server" Text="วันที่พ้นสภาพ:" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Txt_Deptclose_Status" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label15" runat="server" Text="วันที่เสียชีวิต:" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Txt_Die_Date" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label16" runat="server" Text="สถานะภาพ:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label17" runat="server" Text="ชื่อผู้จัดการศพที่ระบุไว้" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Manage_Name" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label18" runat="server" Text="เงินสงเคราะห์ล่วงหน้าคงเหลือ" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="TextBox14" runat="server" Height="17px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="พิมพ์รายละเอียด" 
            onclick="Button2_Click" BackColor="#AEE2FF" BorderStyle="Solid" 
            BorderWidth="1px" Height="30px" />
        <br />
        <br />
        <asp:Label ID="Label19" runat="server" style="font-weight: 700" 
            Text="วิธีเรียกเก็บ:"></asp:Label>
        <br />
        <asp:Label ID="Label20" runat="server" Text="ชำระโดย :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DL_Payref_Method" runat="server" Height="17px">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="1">หักจากเงินเดือน</asp:ListItem>
            <asp:ListItem Value="2">เงินสด</asp:ListItem>
            <asp:ListItem Value="3">หักจากเงินฝาก</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label21" runat="server" Text="เลขที่บัญชี :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Txt_Tran_Deptacc_No" runat="server" Height="17px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label22" runat="server" style="font-weight: 700" 
            Text="ข้อมูลคู่สมรส:"></asp:Label>
        <br />
        <asp:Label ID="Label23" runat="server" Text="สถานะความสัมพันธ์ :" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DLStatus" runat="server" Height="17px" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="0">โสด</asp:ListItem>
            <asp:ListItem Value="1">สมรส</asp:ListItem>
            <asp:ListItem Value="2">หย่า</asp:ListItem>
            <asp:ListItem Value="3">ม่าย</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label24" runat="server" Text="ชื่อคู่สมรส :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Name" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label25" runat="server" Text="นามสกุล :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Sname" runat="server" Height="17px"></asp:TextBox>
        <br />
        <asp:Label ID="Label26" runat="server" Text="จดทะเบียนที่:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DLMariage_Ampher" runat="server" Height="17px">
        </asp:DropDownList>
        <asp:Label ID="Label27" runat="server" Text="จังหวัด :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DLMariage_Provine" runat="server" Height="17px" 
            onselectedindexchanged="DLPrvince_SelectedIndexChanged">
        
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label28" runat="server" Text="เมื่อวันที่ :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Date" runat="server" Height="17px"></asp:TextBox>
        <asp:Label ID="Label29" runat="server" Text="เลขทะเบียนสมรส :" 
            BackColor="#AEE2FF" BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Id" runat="server" Height="17px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label30" runat="server" style="font-weight: 700" 
            Text="ที่อยู่ตามทะเบียนบ้าน:"></asp:Label>
        <br />
        <asp:Label ID="Label31" runat="server" Text="ที่อยู่ :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Contact_Address" runat="server" Width="347px" 
            Height="17px"></asp:TextBox>
       
        <br />
        <asp:Label ID="Label32" runat="server" Text="ตำบล:" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DLtambon" runat="server" Height="17px">
        </asp:DropDownList>
        <asp:Label ID="Label33" runat="server" Text="อำเภอ :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DLAmpher" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DLAmpher_SelectedIndexChanged" Height="17px">
        </asp:DropDownList>
        <asp:Label ID="Label34" runat="server" Text="จังหวัด : " BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:DropDownList ID="DLPrvince" runat="server" AutoPostBack="True" 
            Height="17px" onselectedindexchanged="DLPrvince_SelectedIndexChanged">
        
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label35" runat="server" Text="ไปรษณีย์ : " BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="TbxPostcode" runat="server" Height="17px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label36" runat="server" Text="โทรศัพท์  : " BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="Tbx_Phone" runat="server" Height="17px"></asp:TextBox>
        <br />
        <asp:Label ID="Label37" runat="server" Text="หมายเหตุ  :" BackColor="#AEE2FF" 
            BorderStyle="Solid" BorderWidth="1px" Height="20px"></asp:Label>
        <asp:TextBox ID="TextBox22" runat="server" Height="17px"></asp:TextBox>


    

<div id="dialog" style="display: none" >
    <%--<asp:Label ID="Label40" runat="server" Text="เลขฌาปนกิจ :"></asp:Label>
        <asp:TextBox ID="Tbx_Search_Account" runat="server" Height="20px" Width="85px"></asp:TextBox>
         <asp:Label ID="Label5" runat="server" Text="บัตรประชาชน :"></asp:Label>
        <asp:TextBox ID="Tbx_Search_Idcard" runat="server" Height="20px" Width="207px"></asp:TextBox><br /><br /> 
        <asp:Label ID="Label6" runat="server" Text="เลขสมาชิก สอ :"></asp:Label>
         <asp:TextBox ID="Tbx_member" runat="server" Height="16px" Width="86px"></asp:TextBox>
         <asp:Label ID="Label12" runat="server" Text="ชื่อ :"></asp:Label>
        <asp:TextBox ID="Tbx_Fname" runat="server" Height="20px" Width="85px"></asp:TextBox>
         <asp:Label ID="Label41" runat="server" Text="นามสกุล :"></asp:Label>
        <asp:TextBox ID="Tbx_Sname" runat="server" Height="20px" Width="111px"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
         <asp:Button ID="Button3"  Text="Search" runat="server" OnClick="Button3_Click" />
          
         <br />--%>
        <%-- <p style="text-align: right; width: 500px; margin-top: 50px; margin-left: 150px">  
       <span style="font-weight: bold;">Search:</span>  
       <input type="text" id="txtSearch" name="txtSearch" maxlength="50" style="height: 25px; font: 100" />   
   </p>  --%>
   <asp:Label ID="Label40" runat="server" Text="เลขฌาปนกิจ :"></asp:Label>
        <asp:TextBox ID="Tbx_Search_Account" runat="server" Height="20px" Width="85px"></asp:TextBox>
         <asp:Label ID="Label5" runat="server" Text="บัตรประชาชน :"></asp:Label>
        <asp:TextBox ID="Tbx_Search_Idcard" runat="server" Height="20px" Width="207px"></asp:TextBox><br /><br /> 
        <asp:Label ID="Label6" runat="server" Text="เลขสมาชิก สอ :"></asp:Label>
         <asp:TextBox ID="Tbx_member" runat="server" Height="16px" Width="86px"></asp:TextBox>
         <asp:Label ID="Label12" runat="server" Text="ชื่อ :"></asp:Label>
        <asp:TextBox ID="Tbx_Fname" runat="server" Height="20px" Width="85px"></asp:TextBox>
         <asp:Label ID="Label41" runat="server" Text="นามสกุล :"></asp:Label>
        <asp:TextBox ID="Tbx_Sname" runat="server" Height="20px" Width="111px"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:Label ID="Label42" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="btnSearch" Text="Search" UseSubmitBehavior="false" runat="server"
            OnClick="ShowModal" />
      
<hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
        OnPageIndexChanging="OnPageIndexChanging" PageSize="20" AllowPaging="True" OnRowDataBound="OnRowDataBound"
        onselectedindexchanged="GridView1_SelectedIndexChanged">
         
        <Columns>
            <asp:BoundField DataField="deptaccount_no" HeaderText="เลขฌาปนกิจ" 
                ItemStyle-Width="200" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="member_no" HeaderText="เลขสมาชิก สอ" 
                ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="wfaccount_name" HeaderText="ชื่อ นามสกุล" 
                ItemStyle-Width="1000" >
<ItemStyle Width="1000px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="card_person" HeaderText="บัตรประชาชน" 
                ItemStyle-Width="200" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <%--<asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnDetail" Text="Get Details" runat="server" OnClick="OnGetDetails" />
            </ItemTemplate>
        </asp:TemplateField>--%>
        </Columns>
    </asp:GridView>
</div>

     <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <cc1:TabContainer ID="tabDemo" runat="server" 
                OnClientActiveTabChanged="TabChanged" ActiveTabIndex="1">
                <cc1:TabPanel ID="tabPanelDemo" HeaderText="ผู้รับเงินสงเคราะห์" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView2" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="False" onrowdatabound="GridView2_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="seq_no" HeaderText="ลำดับ" >
<ItemStyle Width="50px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="ชื่อ นามสกุล" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="codept_id" HeaderText="บัตรประชาชน" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="codept_addre" HeaderText="ที่อยู่เลขที่" >
<ItemStyle Width="1000px"></ItemStyle>
            </asp:BoundField>
                   <asp:TemplateField HeaderText = "ความสัมพันธ์">
            <ItemTemplate>
                <asp:Label ID="Label43" runat="server" Text='<%#Eval("codept_relation")%>' Visible=false></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" >
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="tabPanelDemo2" HeaderText="ข้อมูลการเรียกเก็บ" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                             <Columns>
                                <asp:BoundField DataField="seq_no" HeaderText="ลำดับ" >
<ItemStyle Width="50px"></ItemStyle>
            </asp:BoundField>
                                 <asp:TemplateField HeaderText="วันที่">
                                     <ItemTemplate>
                                         <asp:Label ID="Label44" runat="server" Text='<%#GetThaidate(Eval("operate_date"))%>'></asp:Label>
                                     </ItemTemplate>
                                     <ItemStyle Width="100px" />
                                 </asp:TemplateField>
            <asp:BoundField DataField="deptitemtype_code" HeaderText="รายการ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="deptitem_amt" HeaderText="จำนวนเงิน" >
<ItemStyle Width="100px"></ItemStyle>
            </asp:BoundField>
           <asp:BoundField DataField="statement_status" HeaderText="ประเภทรายการ" >
<ItemStyle Width="100px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="ยอดคงเหลือ" >
<ItemStyle Width="100px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="entry_id" HeaderText="ผู้บันทึก" >
<ItemStyle Width="100px"></ItemStyle>
            </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </cc1:TabPanel>

                <cc1:TabPanel ID="tabPanelDemo3" HeaderText="ข้อมูลการโอนย้าย" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false">
                             <Columns>
                                <asp:BoundField DataField="seq_no" HeaderText="เลขที่อ้างอิง" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="ผู้ทำรายการ" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="codept_id" HeaderText="วันที่ทำรายการ" >
<ItemStyle Width="1000px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="codept_addre" HeaderText="ไปยังศูนย์ฯ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField DataField="codept_addre" HeaderText="จากศูนย์ฯ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField DataField="codept_addre" HeaderText="ไปยังศูนย์ฯ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
           
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </cc1:TabPanel>

                <cc1:TabPanel ID="tabPanel1" HeaderText="ข้อมูลการโอนย้าย" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false">
                             <Columns>
                                <asp:BoundField DataField="seq_no" HeaderText="เลขที่อ้างอิง" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="ผู้ทำรายการ" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="codept_id" HeaderText="วันที่ทำรายการ" >
<ItemStyle Width="1000px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="codept_addre" HeaderText="ไปยังศูนย์ฯ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField DataField="codept_addre" HeaderText="จากศูนย์ฯ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField DataField="codept_addre" HeaderText="ไปยังศูนย์ฯ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
           
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </cc1:TabPanel>

            </cc1:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>

    
       

     </div>
  

   

    </form>
   
</body>
</html>
