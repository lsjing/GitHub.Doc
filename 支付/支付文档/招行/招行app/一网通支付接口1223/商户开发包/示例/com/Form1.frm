VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5640
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7005
   LinkTopic       =   "Form1"
   ScaleHeight     =   5640
   ScaleWidth      =   7005
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton QuerySingle 
      Caption         =   "Query Single"
      Height          =   255
      Left            =   2640
      TabIndex        =   21
      Top             =   1920
      Width           =   1335
   End
   Begin VB.TextBox SingleBill 
      Height          =   285
      Left            =   1200
      TabIndex        =   20
      Text            =   "005002"
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox SingleDate 
      Height          =   285
      Left            =   120
      TabIndex        =   19
      Text            =   "20080104"
      Top             =   1920
      Width           =   975
   End
   Begin VB.CommandButton bPart 
      Caption         =   "partial"
      Height          =   255
      Left            =   5040
      TabIndex        =   18
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton bCancel 
      Caption         =   "Cancel"
      Height          =   255
      Left            =   3720
      TabIndex        =   17
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton bsettle 
      Caption         =   "Settle"
      Height          =   255
      Left            =   2520
      TabIndex        =   16
      Top             =   1560
      Width           =   855
   End
   Begin VB.CommandButton mc 
      Caption         =   "Merchant Code"
      Height          =   375
      Left            =   5280
      TabIndex        =   15
      Top             =   1080
      Width           =   1455
   End
   Begin VB.TextBox ed 
      Height          =   285
      Left            =   1200
      TabIndex        =   14
      Text            =   "20041010"
      Top             =   1560
      Width           =   855
   End
   Begin VB.TextBox st 
      Height          =   285
      Left            =   120
      TabIndex        =   13
      Text            =   "20040101"
      Top             =   1560
      Width           =   975
   End
   Begin VB.TextBox hs 
      Height          =   285
      Left            =   3120
      TabIndex        =   12
      Text            =   "payment.ebank.cmbchina.com"
      Top             =   1200
      Width           =   1935
   End
   Begin VB.TextBox pw 
      Height          =   285
      Left            =   1920
      TabIndex        =   11
      Text            =   "888888"
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox co 
      Height          =   285
      Left            =   960
      TabIndex        =   10
      Text            =   "000107"
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox br 
      Height          =   285
      Left            =   120
      TabIndex        =   9
      Text            =   "0755"
      Top             =   1200
      Width           =   615
   End
   Begin VB.TextBox Text1 
      Height          =   3375
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Text            =   "Form1.frx":0000
      Top             =   2280
      Width           =   6975
   End
   Begin VB.CommandButton pt 
      Caption         =   "Paged Transact"
      Height          =   375
      Left            =   5280
      TabIndex        =   7
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton qt 
      Caption         =   "Transact"
      Height          =   375
      Left            =   5280
      TabIndex        =   6
      Top             =   120
      Width           =   1455
   End
   Begin VB.CommandButton ps 
      Caption         =   "Paged Settled"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton pu 
      Caption         =   "Paged Unsettled"
      Height          =   375
      Left            =   1920
      TabIndex        =   4
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton pr 
      Caption         =   "Page Reset"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton qs 
      Caption         =   "Query Settled"
      Height          =   375
      Left            =   3600
      TabIndex        =   2
      Top             =   120
      Width           =   1455
   End
   Begin VB.CommandButton qu 
      Caption         =   "Query Unsettled"
      Height          =   375
      Left            =   1920
      TabIndex        =   1
      Top             =   120
      Width           =   1455
   End
   Begin VB.CommandButton lg 
      Caption         =   "Login"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim o As FirmClient, s As String, bill As String, refno As String

Private Sub getBillRef(ByRef bill As String, ByRef refno As String)
Dim s() As String
s = Split(Text1.SelText, Chr(10))
bill = s(0)
refno = s(1)
End Sub

Private Sub bCancel_Click()
getBillRef bill, refno
r = o.exCancelOrder("000354", bill, refno)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    Exit Sub
End If
End Sub

Private Sub bPart_Click()
Dim newamount As String
newamount = InputBox("«Î ‰»ÎΩ·’ Ω∂Ó")
getBillRef bill, refno
r = o.exSettlePartOrder("000354", bill, refno, newamount)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    Exit Sub
End If
End Sub

Private Sub bsettle_Click()
getBillRef bill, refno
r = o.exSettleOrder("000354", bill, refno)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    Exit Sub
End If
End Sub

Private Sub Form_Activate()
Set o = New FirmClient
End Sub

Private Sub Form_Terminate()
  o.exLogout
End Sub


Private Sub lg_Click()
o.exSetOptions hs.Text, ""
r = o.exLoginC(br.Text, co.Text, pw.Text)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    Exit Sub
End If
End Sub

Private Sub mc_Click()
  Text1.Text = o.exGenMerchantCode("abc", "20031106", "0571", "002692", "000361", "0.01", "md-merchantdata", "http://99.1.101.64/testserver/testserver.dll?MerchantAnswerWithPara", "", "", "", "", "")
End Sub

Private Sub pr_Click()
  o.exPageReset
End Sub

Private Sub ps_Click()
Dim s
r = o.exQuerySettledOrderByPage(st.Text, ed.Text, 102, s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Text1.Text = s
MsgBox "Query OK with nextpage flag=" & Str(o.exHasNextPage())

End Sub

Private Sub pt_Click()
Dim s
r = o.exQueryTransactByPage(st.Text, 204, s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Text1.Text = s
MsgBox "Query OK with nextpage flag=" & Str(o.exHasNextPage())

End Sub

Private Sub pu_Click()
Dim s
r = o.exQueryUnsettledOrderByPage(100, s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Text1.Text = s
MsgBox "Query OK with nextpage flag=" & Str(o.exHasNextPage())
End Sub


Private Sub qs_Click()
Dim s
r = o.exQuerySettledOrder(st.Text, ed.Text, s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Text1.Text = s
End Sub

Private Sub qt_Click()
Dim s
r = o.exQueryTransact(st.Text, s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Text1.Text = s

End Sub

Private Sub qu_Click()
Dim s
r = o.exQueryUnsettledOrder(s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Text1.Text = s
End Sub

Private Sub QuerySingle_Click()
Dim s
r = o.exQuerySingleOrder(SingleDate.Text, SingleBill.Text, s)
If r <> 0 Then
    MsgBox o.exGetLastErr(r)
    o.exLogout
    Exit Sub
End If
Replace s, Chr(13), " "
Text1.Text = s
End Sub
