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
   
</style>
    
 
    <form id="form1" runat="server">

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:updatepanel ID="Updatepanel1" runat="server">
 <ContentTemplate>
 </ContentTemplate>
 </asp:updatepanel>
    <div style="text-align: left; margin-top: 72px">
    
        <asp:Label ID="Label1" runat="server" BorderStyle="Solid" Text="เลขฌาปนกิจ:"></asp:Label>
        <asp:TextBox ID="TbxAccount_no" runat="server" Width="79px"></asp:TextBox>
        <asp:Button ID="btnShowPopup" runat="server" Text="..." Width="24px" 
            onclick="Button1_Click" />
        <asp:Label ID="Label2" runat="server" Text="ชื่อสมาชิก:"></asp:Label>
        <asp:DropDownList ID="PreName" runat="server" Width="91px">
           
        </asp:DropDownList>
        <asp:TextBox ID="Tbx_Name" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="นามสกุล:"></asp:Label>
        <asp:TextBox ID="Tbx_Sername" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="ประเภท:"></asp:Label>
        <asp:DropDownList ID="MemberType" runat="server">
        </asp:DropDownList>  
        
        <asp:Label ID="Label38" runat="server" Text="วันที่สมัคร:"></asp:Label>
        <asp:TextBox ID="Tbx_Accessdata" runat="server"></asp:TextBox>
        &nbsp
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="M">ชาย</asp:ListItem>
            <asp:ListItem Value="F">หญิง</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="Label39" runat="server" Text="วันเกิด:"></asp:Label>
        <asp:TextBox ID="Tbx_Birthday" runat="server"></asp:TextBox>
        
        <asp:Label ID="Label7" runat="server" Text="อายุ:"></asp:Label>
        <asp:TextBox ID="Tbx_Age" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" Text="สมาชิกอ้างอิง:"></asp:Label>
        <asp:TextBox ID="Tbx_member_no" runat="server"></asp:TextBox>
        <asp:Label ID="Label9" runat="server" Text="ชื่อ นามสกุล:"></asp:Label>
        <asp:TextBox ID="Tbx_Fullname" runat="server"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" Text="บัตรประชาชน:"></asp:Label>
        <asp:TextBox ID="Tbx_Idcard" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label11" runat="server" Text="วันที่คุ้มครอง:"></asp:Label>
        <asp:TextBox ID="Tbx_Deptopen_data" runat="server"></asp:TextBox>
        <asp:Label ID="Label13" runat="server" Text="สังกัด/หน่วย"></asp:Label>
        <asp:DropDownList ID="MemberGroup" runat="server" Height="26px" Width="557px" 
            AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label14" runat="server" Text="วันที่พ้นสภาพ:"></asp:Label>
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <asp:Label ID="Label15" runat="server" Text="วันที่เสียชีวิต:"></asp:Label>
        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        <asp:Label ID="Label16" runat="server" Text="สถานะภาพ:"></asp:Label>
        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label17" runat="server" Text="ชื่อผู้จัดการศพที่ระบุไว้"></asp:Label>
        <asp:TextBox ID="Tbx_Manage_Name" runat="server"></asp:TextBox>
        <asp:Label ID="Label18" runat="server" Text="เงินสงเคราะห์ล่วงหน้าคงเหลือ"></asp:Label>
        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="พิมพ์รายละเอียด" 
            onclick="Button2_Click" />
        <br />
        <br />
        <asp:Label ID="Label19" runat="server" style="font-weight: 700" 
            Text="วิธีเรียกเก็บ:"></asp:Label>
        <br />
        <asp:Label ID="Label20" runat="server" Text="ชำระโดย :"></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label21" runat="server" Text="เลขที่บัญชี :"></asp:Label>
        <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label22" runat="server" style="font-weight: 700" 
            Text="ข้อมูลคู่สมรส:"></asp:Label>
        <br />
        <asp:Label ID="Label23" runat="server" Text="สถานะความสัมพันธ์ :"></asp:Label>
        <asp:DropDownList ID="DLStatus" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="0">โสด</asp:ListItem>
            <asp:ListItem Value="1">สมรส</asp:ListItem>
            <asp:ListItem Value="2">หย่า</asp:ListItem>
            <asp:ListItem Value="3">ม่าย</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label24" runat="server" Text="ชื่อคู่สมรส :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Name" runat="server"></asp:TextBox>
        <asp:Label ID="Label25" runat="server" Text="นามสกุล :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Sname" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label26" runat="server" Text="จดทะเบียนที่:"></asp:Label>
        <asp:DropDownList ID="DLMariage_Ampher" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label27" runat="server" Text="จังหวัด :"></asp:Label>
        <asp:DropDownList ID="DLMariage_Provine" runat="server" Height="16px" 
            onselectedindexchanged="DLPrvince_SelectedIndexChanged">
        
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label28" runat="server" Text="เมื่อวันที่ :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Date" runat="server"></asp:TextBox>
        <asp:Label ID="Label29" runat="server" Text="เลขทะเบียนสมรส :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Id" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label30" runat="server" style="font-weight: 700" 
            Text="ที่อยู่ตามทะเบียนบ้าน:"></asp:Label>
        <br />
        <asp:Label ID="Label31" runat="server" Text="ที่อยู่ :"></asp:Label>
        <asp:TextBox ID="Tbx_Contact_Address" runat="server" Width="347px"></asp:TextBox>
       
        <br />
        <asp:Label ID="Label32" runat="server" Text="ตำบล:"></asp:Label>
        <asp:DropDownList ID="DLtambon" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label33" runat="server" Text="อำเภอ :"></asp:Label>
        <asp:DropDownList ID="DLAmpher" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DLAmpher_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Label ID="Label34" runat="server" Text="จังหวัด : "></asp:Label>
        <asp:DropDownList ID="DLPrvince" runat="server" AutoPostBack="True" 
            Height="16px" onselectedindexchanged="DLPrvince_SelectedIndexChanged">
        
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label35" runat="server" Text="ไปรษณีย์ : "></asp:Label>
        <asp:TextBox ID="TbxPostcode" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label36" runat="server" Text="โทรศัพท์  : "></asp:Label>
        <asp:TextBox ID="Tbx_Phone" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label37" runat="server" Text="หมายเหตุ  :"></asp:Label>
        <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>


    

<div id="dialog" style="display: none">
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
          <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Button" />
         <br />--%>
      
<hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
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

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("[id*=btnShowPopup]").click(function () {
            ShowPopup();
            return false;
        });
       
    });
    function ShowPopup() {
       $("#dialog").dialog({
            title: "ดู/แก้ไข ข้อมูลทะเบียนสมาชิก", 
            width: 1000,
            lable: "ffff",
            buttons: {
                Ok: function () {
                    $(this).dialog('close');
                }
            },
            modal: true

        });
    
    }
</script>

    </form>
   
</body>
</html>
