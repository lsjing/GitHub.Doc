<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Button ID="Button1" runat="server" Text="发送测试" onclick="Button1_Click" />
    <br />
    <asp:TextBox ID="txtSignRet" runat="server" ContentPlaceHolderID="txtSignRet" 
        Width="481px"></asp:TextBox>
</asp:Content>
