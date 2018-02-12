﻿<%@ Page Title="已完成订单" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="OrderFinished.aspx.cs" Inherits="UI.Admin.OrderFinished" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="GridView1"  AutoGenerateColumns="false" CssClass="table table-bordered table-hover table-responsive" AllowPaging="True"  OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" >
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
                   操作
                </HeaderTemplate>
                <ItemTemplate>
                  
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
