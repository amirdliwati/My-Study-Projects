VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Relay Control"
   ClientHeight    =   4680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3225
   LinkTopic       =   "Form1"
   ScaleHeight     =   4680
   ScaleWidth      =   3225
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   6
      Left            =   960
      TabIndex        =   6
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   5
      Left            =   960
      TabIndex        =   5
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   4
      Left            =   960
      TabIndex        =   4
      Top             =   2160
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   3
      Left            =   960
      TabIndex        =   3
      Top             =   1680
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   2
      Left            =   960
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   1
      Left            =   960
      TabIndex        =   1
      Top             =   720
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OFF"
      Height          =   375
      Index           =   0
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click(Index As Integer)
    Out &H378, Inp(&H378) Xor 2 ^ Index
    If (Inp(&H378) And 2 ^ Index) = 2 ^ Index Then
        Command1(Index).Caption = "ON"
    Else
        Command1(Index).Caption = "OFF"
    End If
End Sub

Private Sub Form_Load()
    Out &H378, 0
End Sub
