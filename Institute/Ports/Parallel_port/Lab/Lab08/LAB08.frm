VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "7 Segment Driver"
   ClientHeight    =   2805
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4200
   Icon            =   "LAB08.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2805
   ScaleWidth      =   4200
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   960
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim index As Integer
Dim Number(0 To 9) As Integer

Private Sub Command1_Click()
    If index < 10 Then
        Out &H378, Number(index)
        index = index + 1
    Else
        index = 0
    End If
    Out &H37A, &H5
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

