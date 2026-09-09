VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1155
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4350
   LinkTopic       =   "Form1"
   ScaleHeight     =   1155
   ScaleWidth      =   4350
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   435
      Left            =   3240
      TabIndex        =   5
      Top             =   360
      Width           =   855
   End
   Begin VB.TextBox txtOutH 
      Height          =   315
      Left            =   360
      MaxLength       =   4
      TabIndex        =   2
      Top             =   420
      Width           =   735
   End
   Begin VB.TextBox txtOutL 
      Height          =   315
      Left            =   1260
      MaxLength       =   4
      TabIndex        =   1
      Top             =   420
      Width           =   735
   End
   Begin VB.CommandButton cmdOut 
      Caption         =   "Out"
      Height          =   435
      Left            =   2160
      TabIndex        =   0
      Top             =   360
      Width           =   855
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "OUTL"
      Height          =   210
      Left            =   1440
      TabIndex        =   4
      Top             =   120
      Width           =   435
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "OUTH"
      Height          =   210
      Left            =   480
      TabIndex        =   3
      Top             =   120
      Width           =   465
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOut_Click()
    Shift8Bit CByte("&H" & txtOutH.Text)
    Shift8Bit CByte("&H" & txtOutL.Text)
    LE
End Sub

Private Sub cmdReset_Click()
    RST
    LE
End Sub

Private Sub Form_Load()
    InitialShiftIn
    RST
    LE
End Sub

Private Sub Shift8Bit(ByVal Data As Byte)
Dim i As Integer
    For i = 7 To 0 Step -1
        If (Data And (2 ^ i)) = (2 ^ i) Then
            DI True
        Else
            DI False
        End If
        CLK
    Next i
End Sub

Private Sub InitialShiftIn()
    Out &H378, &H8
End Sub

Private Sub CLK()
    Out &H378, Inp(&H378) Xor &H1               'Toggle Clock
    Out &H378, Inp(&H378) Xor &H1               'Toggle Clock
End Sub

Private Sub RST()
    Out &H378, Inp(&H378) Xor &H8               'Toggle Reset
    Out &H378, Inp(&H378) Xor &H8               'Toggle Reset
End Sub

Private Sub LE()
    Out &H378, Inp(&H378) Xor &H2               'Toggle Latch Enable
    Out &H378, Inp(&H378) Xor &H2               'Toggle Latch Enable
End Sub

Private Sub DI(ByVal Logic As Boolean)
    If Logic Then
        Out &H378, Inp(&H378) Or &H4            'Set bit Data In
    Else
        Out &H378, Inp(&H378) And &HFB          'Clear bit Data In
    End If
End Sub
