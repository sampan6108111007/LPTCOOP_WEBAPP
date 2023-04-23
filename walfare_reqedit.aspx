<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="walfare_reqedit.aspx.cs" Inherits="icoop_webapp.walfare_reqedit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: left; margin-top: 72px">
    
        <asp:Label ID="Label1" runat="server" BorderStyle="Solid" Text="เลขที่คำขอ:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Width="79px"></asp:TextBox>
        <asp:Label ID="Label38" runat="server" Text="ประเภท:"></asp:Label>
        <asp:DropDownList ID="MemberType" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label39" runat="server" Text="วันที่คุ้มครอง:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label40" runat="server" Text="โรคร้ายแรง:"></asp:Label>
        <asp:DropDownList ID="DropDownList14" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label4" runat="server" Text="เลขสมาชิก สอ.:"></asp:Label>
        <asp:TextBox ID="TbxMember_no" runat="server">00017410</asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="..." onclick="Button1_Click" />  
        <asp:Label ID="Label45" runat="server" Text="เลขฌาปนกิจ"></asp:Label>
        <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>&nbsp
        <asp:Label ID="Label46" runat="server" Text="เพศ"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="M">ชาย</asp:ListItem>
            <asp:ListItem Value="F">หญิง</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label8" runat="server" Text="คำนำหน้า"></asp:Label>
          <asp:DropDownList ID="DL_PreName" runat="server" Width="91px">


        </asp:DropDownList>
        <asp:Label ID="Label9" runat="server" Text="ชื่อ"></asp:Label>
        <asp:TextBox ID="Tbx_Fname" runat="server"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" Text="นามสกุล"></asp:Label>
        <asp:TextBox ID="Tbx_Sname" runat="server"></asp:TextBox>
        <br />
         <asp:Label ID="Label2" runat="server" Text="บัตรประชาชน:"></asp:Label>
        <asp:TextBox ID="Tbx_Idcard" runat="server"></asp:TextBox>
        <asp:Label ID="Label11" runat="server" Text="วันเกิด"></asp:Label>
        <asp:TextBox ID="Tbx_Birthday" runat="server">00/00/0000</asp:TextBox>
        <asp:Label ID="Label13" runat="server" Text="อายุ"></asp:Label>
        <asp:TextBox ID="Tbx_Age" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label14" runat="server" Text="กลุ่ม/บ้าน:"></asp:Label>
        <asp:DropDownList ID="DL_Membergroup" runat="server" Height="20px" 
            Width="262px">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label42" runat="server" Text="ชื่อผู้จัดการศพที่ระบุไว้:"></asp:Label>
        <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
        <asp:Label ID="Label43" runat="server" Text="วันที่สมัคร"></asp:Label>
        <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label22" runat="server" style="font-weight: 700" 
            Text="ข้อมูลคู่สมรส:"></asp:Label>
        <br />
        <asp:Label ID="Label23" runat="server" Text="สถานะความสัมพันธ์ :"></asp:Label>
        <asp:DropDownList ID="DL_Mariage_Status" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label24" runat="server" Text="ชื่อคู่สมรส :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Name" runat="server"></asp:TextBox>
        <asp:Label ID="Label25" runat="server" Text="นามสกุล :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Sname" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label26" runat="server" Text="จดทะเบียนที่:"></asp:Label>
        <asp:DropDownList ID="DL_Mariage_Ampher" runat="server">
        </asp:DropDownList>
        <asp:Label ID="Label27" runat="server" Text="จังหวัด :"></asp:Label>
        <asp:DropDownList ID="DLPrvince1" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label28" runat="server" Text="เมื่อวันที่ :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Date" runat="server">00/00/0000</asp:TextBox>
        <asp:Label ID="Label29" runat="server" Text="เลขทะเบียนสมรส :"></asp:Label>
        <asp:TextBox ID="Tbx_Mariage_Id" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label30" runat="server" style="font-weight: 700" 
            Text="ที่อยู่ตามทะเบียนบ้าน:"></asp:Label>
        <br />
        <asp:Label ID="Label31" runat="server" Text="ที่อยู่ :"></asp:Label>
        <asp:TextBox ID="Tbx_Contact_Address" runat="server"></asp:TextBox>
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
            onselectedindexchanged="DLPrvince_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label35" runat="server" Text="ไปรษณีย์ : "></asp:Label>
        <asp:TextBox ID="TbxPostcode" runat="server"></asp:TextBox>
        <asp:Label ID="Label36" runat="server" Text="โทรศัพท์  : "></asp:Label>
        <asp:TextBox ID="Tbx_Phone" runat="server"></asp:TextBox>
        <br />
        <br />
        <strong>การชำระเงิน<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3">
            <Columns>
                <asp:BoundField HeaderText="ลำดับ" />
                <asp:BoundField HeaderText="รายการ">
                <ItemStyle Width="500px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="จำนวนเงิน">
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
        <br />
        <br />
        ผู้รับเงินสงเคราะห์&nbsp;&nbsp;&nbsp;
        </strong>
        <asp:Button ID="Button2" runat="server" Text="เพิ่มแถว" />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3">
            <Columns>
                <asp:BoundField HeaderText="ลำดับ" />
                <asp:TemplateField HeaderText="ชื่อขนามสกุล">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="บัตรประชาชน">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ที่อยู่เลขที่">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox30" runat="server" Height="25px" Width="222px"></asp:TextBox>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ความสัมพันธ์">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList15" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField Text="ลบรายการ" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
