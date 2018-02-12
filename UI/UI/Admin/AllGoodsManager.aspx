<%@ Page Title=" 所有商品" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="AllGoodsManager.aspx.cs" Inherits="UI.Admin.AllGoodsManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
      <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%-- 商品分类： <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
    <asp:TextBox ID="txtSearch" runat="server" CssClass="input-sm"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive table-hover" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" AllowPaging="True"  OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    商品ID
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="labGID" Text='<%#Eval("GID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server"   ID="labGID" Text='<%#Eval("GID") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    商品名称
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label runat="server" Text='<%#Eval("Name") %>' />
                </ItemTemplate>
                 <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%#Eval("Name") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    缩略图
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Image runat="server" ImageUrl='<%#"../productImg/"+Eval("DesImg1Url") %>' Width="80" Height="80" />
                </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Image runat="server" ImageUrl='<%#"../productImg/"+Eval("DesImg1Url") %>' Width="80" Height="380" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    缩略图2
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Image runat="server" ImageUrl='<%#"../productImg/"+Eval("DesImg2Url") %>'  Width="80" Height="80"/>
                </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Image runat="server" ImageUrl='<%#"../productImg/"+Eval("DesImg2Url") %>' Width="80" Height="80" />
                </EditItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField>
                <HeaderTemplate>
                    市场价
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label runat="server" Text='<%#Eval("SCPrice") %>' />
                </ItemTemplate>
                 <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%#Eval("SCPrice") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    促销价
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("CXPrice") %>' />
                </ItemTemplate>
                 <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%#Eval("CXPrice") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
          <%-- <asp:TemplateField>
               <ItemTemplate>
                   <asp:LinkButton runat="server" CommandName="EditLBtn" CommandArgument='<%#Eval("GID") %>' Text="编辑" CssClass="btn btn-primary" />
               </ItemTemplate>
           </asp:TemplateField>--%>
            <asp:CommandField  ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
