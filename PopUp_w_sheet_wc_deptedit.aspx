<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopUp_w_sheet_wc_deptedit.aspx.cs" Inherits="icoop_webapp.PopUp_w_sheet_wc_deptedit" EnableEventValidation = "false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>  
  <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <cc1:TabContainer ID="tabDemo" runat="server" 
                OnClientActiveTabChanged="TabChanged" ActiveTabIndex="0">
                <cc1:TabPanel ID="tabPanelDemo" HeaderText="Customers" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="deptaccount_no" HeaderText="ลำดับ" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="member_no" HeaderText="ชื่อ นามสกุล" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="wfaccount_name" HeaderText="บัตรประชาชน" >
<ItemStyle Width="1000px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="card_person" HeaderText="ที่อยู่เลขที่" >
<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
           <asp:TemplateField HeaderText="ความสัมพันธ์">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:DropDownList ID="DropDownList1" runat="server">  
                        </asp:DropDownList>  
                    </ItemTemplate>  
                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="tabPanelDemo2" HeaderText="Customers2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
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
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../Scripts/jQuery_1.8.3.js" type="text/javascript"></script>
    <script src="../Scripts/ScrollableGridViewPlugin_ASP.NetAJAXmin.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("[id*=GridView1]").Scrollable({
                ScrollHeight: 300,
                IsInUpdatePanel: true
            });
        });
        var isApplied = false;
        function TabChanged(sender, args) {
            if (!isApplied) {
                if (sender.get_activeTabIndex() == 1) {
                    $("[id*=GridView2]").Scrollable({
                        ScrollHeight: 300,
                        IsInUpdatePanel: true
                    });
                    isApplied = true;
                }
            }
        }
    </script>
     </form>
</body>  
</html>
