﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopUp_w_sheet_wc_deptedit.aspx.cs" Inherits="icoop_webapp.PopUp_w_sheet_wc_deptedit" EnableEventValidation = "false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>  
    <form id="form1" runat="server">  
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
<asp:Button ID="Button1" Text="Search" runat="server" />
<hr />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        OnPageIndexChanging="OnPageIndexChanging" PageSize="25" AllowPaging="True" OnRowDataBound="OnRowDataBound"
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
    </form>  
</body>  
</html>