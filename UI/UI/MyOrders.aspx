<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="UI.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>我的所有订单</title>
    <style>
        .GridView1 {
           margin-top:50px;
        }
        .lbtnhide {
          display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-bordered table-responsive GridView1 " AllowPaging="True"   PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    订单ID
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labid" runat="server" Text='<%#Eval("订单ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    商品名称
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="L21" runat="server" Text='<%#Eval("商品名称") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%-- <asp:TemplateField>
                <HeaderTemplate>
                    尺码
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%#Eval("商品名称") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
           <%--  <asp:TemplateField>
                <HeaderTemplate>
                    数量
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
             <asp:TemplateField>
                <HeaderTemplate>
                    付款金额
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="Ll1" runat="server" Text='<%#Eval("付款金额") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                    收货地址
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="Lab" runat="server" Text='<%#Eval("收货地址") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                  购买时间
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="Lael1" runat="server" Text='<%#Eval("购买时间") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <HeaderTemplate>
                  状态
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="LaborderStatus" runat="server"  style="font-size:12px;color:red;">配送中</asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>

                <HeaderTemplate>
                   操作
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="确认收货" ID="btnshouhuo" CommandName="btnshouhuo"  CommandArgument='<%#Eval("订单ID") %>' style="color:blue;" />
                </ItemTemplate>
            </asp:TemplateField>
            <%-- <asp:TemplateField>

                <HeaderTemplate>
                    详情
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="详情" CommandName="btnDetail"  CommandArgument='<%#Eval("订单ID") %>' style="color:blue;" />
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
    </asp:GridView>
</asp:Content>
