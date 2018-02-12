<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="UserManager.aspx.cs" Inherits="UI.Admin.UserManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        用户管理
    </title>
    <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script>
        function updateSucc()
        {
            alert("更新成功！");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox runat="server" ID="txtSearch" CssClass=" input-sm" /> <asp:Button runat="server" ID="btnSearch" Text="搜索" CssClass="btn btn-primary" OnClick="btnSearch_Click"/><br /><br />
    <asp:GridView CssClass="table table-hover table-responsive table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"  OnPageIndexChanging="GridView1_PageIndexChanging"  PageSize="5" OnRowEditing="GridView1_RowEditing"  OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField >
                <HeaderTemplate >
                    UID
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labUid" runat="server"  Text='<%#Eval("UID") %>'></asp:Label>
                </ItemTemplate>
               <EditItemTemplate>
                   <asp:Label ID="labUid" runat="server"  Text='<%#Eval("UID") %>'></asp:Label>
               </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate >
                    用户名
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="labName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate >
                    昵称
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labNick" runat="server" Text='<%#Eval("NickName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtNick" runat="server" Text='<%#Eval("NickName") %>' CssClass=" input-sm"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
           <asp:TemplateField >
                <HeaderTemplate >
                    性别
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labSex" runat="server" Text='<%#Eval("Sex") %>'></asp:Label>
                </ItemTemplate>
               <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlsex" CssClass="dropdown">
                        <asp:ListItem Text="女" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="男" Value="1"></asp:ListItem>
                    </asp:DropDownList>
               </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate >
                    地址
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("Address") %>' CssClass=" input-sm"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate >
                   手机
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labPhone" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtPhone" runat="server" Text='<%#Eval("Phone") %>' CssClass=" input-sm"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate >
                   QQ
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labQQ" runat="server" Text='<%#Eval("QQ") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtQQ" runat="server" Text='<%#Eval("QQ") %>' CssClass=" input-sm"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
         
          
           
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
