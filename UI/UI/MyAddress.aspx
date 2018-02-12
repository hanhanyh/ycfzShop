<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="MyAddress.aspx.cs" Inherits="UI.MyAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:TextBox ID="txtName" runat="server" CssClass="input-sm input" style="width:90px;" placeholder=" 姓名"></asp:TextBox>
     <asp:TextBox ID="txtEmail" runat="server" CssClass="input-sm input" style="width:80px;" placeholder=" 邮编"></asp:TextBox>
      <asp:TextBox ID="txtPhone" runat="server" CssClass="input-sm input" style="width:80px;" placeholder=" 电话"></asp:TextBox>
      <asp:TextBox ID="txtAddress" runat="server" placeholder=" 地址" CssClass="input-sm input"></asp:TextBox>
      <asp:Button runat="server" Text="添加" ID="btnfootAdd" OnClick="btnfootAdd_Click" CssClass="btn btn-default" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-bordered table-responsive" ShowFooter="true" OnRowDeleting="GridView1_RowDeleting" EmptyDataText="没有收货地址">
        <Columns>
            <asp:TemplateField HeaderText="AID">
                <ItemTemplate>
                    <asp:Label ID="labAID" runat="server" Text='<%#Eval("AID") %>'></asp:Label>
                </ItemTemplate>
                 <FooterTemplate>
                
                 </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收件人姓名">
                <ItemTemplate>
                    <asp:Label ID="labName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                 
               </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="邮编">
                <ItemTemplate>
                    <asp:Label ID="labMail" runat="server" Text='<%#Eval("MailNumber") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                 
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="电话">
                <ItemTemplate>
                    <asp:Label ID="labPhone" runat="server" Text='<%#Eval("Phone") %>' CssClass="input-sm input" style="width:60px;"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                 
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址">
                <ItemTemplate>
                    <asp:Label ID="labAddress" runat="server" Text='<%#Eval("Address") %>' ></asp:Label>
                </ItemTemplate>
               <FooterTemplate>
                 
               </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="true"  />
        </Columns>
    </asp:GridView>
</asp:Content>
