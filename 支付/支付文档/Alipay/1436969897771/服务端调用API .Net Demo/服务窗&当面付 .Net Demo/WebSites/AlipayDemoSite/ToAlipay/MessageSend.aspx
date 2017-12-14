<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageSend.aspx.cs" Inherits="Alipay.Demo.MessageSend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="biz_content" runat="server" Height="325px" Width="611px" OnTextChanged="TextBox1_TextChanged" TextMode="MultiLine">
{
  "msgType": "image-text",
  "createTime": "1407229992",
  "articles": [
    {
      "actionName": "立即查看",
      "desc": "描述",
      "imageUrl": "https://i.alipayobjects.com/e/201310/1H9ctsy9oN_src.jpg",
      "title": "标题",
      "url": "http://wap.taobao.com",
      "authType": "loginAuth"
    },
    {
      "actionName": "立即查看",
      "desc": "描述",
      "imageUrl": "https://i.alipayobjects.com/e/201310/1H9ctsy9oN_src.jpg",
      "title": "标题",
      "url": "http://wap.taobao.com",
      "authType": "loginAuth"
    }
  ],
  "toUserId": "BM7PjM8f8-v6VFqeTlFUqo97w0QKRHRl-OmymTOxsGHnKDWiwQekMHiEi06tEbjg01"
}

        </asp:TextBox>
        <br />
        <br />
        <asp:Button ID="submit" runat="server" OnClick="Button1_Click" Text="提交" />
    
    </div>
    </form>
</body>
</html>
