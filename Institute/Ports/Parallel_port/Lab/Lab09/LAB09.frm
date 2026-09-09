VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4155
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5985
   LinkTopic       =   "Form1"
   ScaleHeight     =   4155
   ScaleWidth      =   5985
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1800
      TabIndex        =   4
      Top             =   960
      Width           =   1455
   End
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   4440
      Top             =   1320
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4440
      Top             =   1920
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   495
      Left            =   360
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   375
      LargeChange     =   100
      Left            =   120
      Min             =   1
      SmallChange     =   10
      TabIndex        =   2
      Top             =   3360
      Value           =   250
      Width           =   5655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   3720
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Exits As Boolean
Dim Number(0 To 9) As Integer
Dim Index, Index1, Index2, Index3, Index4 As Integer

Private Sub Command1_Click()
    If Index < 10 Then
        Out &H378, Number(Index)
        Index = Index + 1
    Else
        Index = 0
    End If
    Out &H37A, &H5
End Sub

Private Sub Command3_Click()
    Exits = False
    Do
        Out &H378, Number(Index1)
        Out &H37A, &H5
        Call delay
        Out &H378, Number(Index2)
        Out &H37A, &H6
        Call delay
        Out &H378, Number(Index3)
        Out &H37A, &H0
        Call delay
        Out &H378, Number(Index4)
        Out &H37A, &HC
        Call delay
        Out &H37A, &H4
    Loop Until HScroll1.Value = True
End Sub

Private Sub Form_Load()
    Number(0) = &H3F
    Number(1) = &H6
    Number(2) = &H5B
    Number(3) = &H4F
    Number(4) = &H66
    Number(5) = &H6D
    Number(6) = &H7D
    Number(7) = &H7
    Number(8) = &H7F
    Number(9) = &H6F
End Sub

Private Sub Command2_Click()
    Exits = True
    Unload Me
End Sub

Sub delay()
    For i = 1 To HScroll1.Value
        DoEvents
    Next i
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Exits = True
    Out &H37A, 4
End Sub

Private Sub HScroll2_Change()
    Timer1.Interval = HScroll2.Value
End Sub

Private Sub Timer2_Timer()
    Text1.Text = Format(Now, "hh:mm:ss")
    Index1 = Asc(Right(Text1.Text, 1)) - &H30
    Index2 = Asc(Mid(Text1.Text, 7, 1)) - &H30
    Index3 = Asc(Mid(Text1.Text, 5, 1)) - &H30
    Index4 = Asc(Mid(Text1.Text, 4, 1)) - &H30
End Sub
