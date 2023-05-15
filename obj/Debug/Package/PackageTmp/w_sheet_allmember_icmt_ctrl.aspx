<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_sheet_allmember_icmt_ctrl.aspx.cs" Inherits="icoop_webapp.w_sheet_allmember_icmt_ctrl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="เลขสมาคม :"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="..." Height="27px" Width="37px" />
        <asp:TextBox ID="TextBox2" runat="server" Width="584px"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="สถานะ :"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Height="21px" Width="172px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="พิมพ์รายละเอียด" />
        <br />
        <br />
        <br />
        <h3 style="padding: 0px; margin: 0px; color: rgb(34, 34, 34); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
            สมาคมฌาปนกิจสงเคราะห์สหกรณ์ออมทรัพย์ครูลำปาง</h3>
        <h3 style="padding: 0px; margin: 0px; color: rgb(34, 34, 34); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
            รายละเอียด</h3>
        <p style="padding: 0px; margin: 0px; color: rgb(34, 34, 34); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
            <asp:Label ID="Label3" runat="server" Text="เลขสมาชิกสมาคม"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" Width="206px"></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server" Width="272px"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" Width="257px"></asp:TextBox>
        </p>
        <p style="padding: 0px; margin: 0px; color: rgb(34, 34, 34); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
            &nbsp;</p>
        <h3 style="padding: 0px; margin: 0px; color: rgb(34, 34, 34); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
            ผู้รับผลประโยชน์</h3>
        <p style="padding: 0px; margin: 0px; color: rgb(34, 34, 34); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: -webkit-left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                Height="224px" style="margin-right: 0px" Width="856px">
                <Columns>
                    <asp:BoundField HeaderText="ลำดับ" />
                    <asp:TemplateField HeaderText="ชื่อ-นามสกุล">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="เลขบัตรประชาชน">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="เกี่ยวพันเป็น">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="71px" Width="262px">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ที่อยู่"></asp:TemplateField>
                </Columns>
            </asp:GridView>
        </p>
    
    </div>
    </form>
</body>
</html>
