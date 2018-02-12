<%@ Page Title="商品分类管理" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="GoodsTypeManager.aspx.cs" Inherits="UI.Admin.GoodsTypeManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>商品分类管理</title>
    <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script>
        function f()
        {
            alert("新增成功");
        }
        function deleteSuss()
        {
            alert("删除成功");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-responsive table-bordered" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    GTID
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("GTID") %>' ID="gtidlab"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                                  <asp:Label runat="server" Text='<%#Eval("GTID") %>' ID="gtidlab" CssClass="input-sm"></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    类型名称：<asp:TextBox ID="txtTypeName" runat="server" CssClass="input-sm"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                  类型名称
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtTypeName" runat="server" Text='<%#Eval("Name") %>' CssClass="input-sm"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    描述：<asp:TextBox ID="txtTypeDes" runat="server" CssClass="input-sm"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                   描述
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDes" runat="server" Text='<%#Eval("Description") %>' CssClass="input-sm"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="btn btn-primary"  OnClick="btnadd_Click" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            
            <asp:CommandField ShowDeleteButton="True"  />
            
        </Columns>

    </asp:GridView>
</asp:Content>
