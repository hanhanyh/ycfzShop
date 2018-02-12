<%@ Page Title="待收货订单" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="OrderDoning.aspx.cs" Inherits="UI.Admin.OrderDoning" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:GridView runat="server" ID="GridView1"  AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-responsive"  OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    订单ID
                </HeaderTemplate>
                <ItemTemplate>
                   <asp:Label runat="server" Text='<%#Eval("订单ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    商品名称
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label runat="server" Text='<%#Eval("商品名称") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    购买用户
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label runat="server" Text='<%#Eval("购买用户") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    付款金额
                </HeaderTemplate>
                <ItemTemplate>
                      <asp:Label runat="server" Text='<%#Eval("付款金额") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    收货地址
                </HeaderTemplate>
                <ItemTemplate>
                  <asp:Label runat="server" Text='<%#Eval("收货地址") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    购买时间
                </HeaderTemplate>
                <ItemTemplate>
                   <asp:Label runat="server" Text='<%#Eval("购买时间") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    发货方式
                </HeaderTemplate>
                <ItemTemplate>
                   <asp:Label runat="server" Text='<%#Eval("发货方式") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    运单号
                </HeaderTemplate>
                <ItemTemplate>
                   <asp:Label runat="server" Text='<%#Eval("运单号") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                   状态
                </HeaderTemplate>
                <ItemTemplate>
                   <label style="color:red;font-size:12px;"> 配送中</label> 
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                   操作
                </HeaderTemplate>
                <ItemTemplate>
                  <asp:LinkButton runat="server" Text="关闭交易" CommandName="closeOrder" CommandArgument='<%#Eval("订单ID") %>'  />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
