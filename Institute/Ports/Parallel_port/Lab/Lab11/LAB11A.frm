VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Basic I2C"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   Icon            =   "LAB11A.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Send Data to PCF8574"
      Height          =   375
      Left            =   1200
      TabIndex        =   1
      Top             =   1680
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    Sendout (&H55)
End Sub

Private Sub Sendout(B As Byte)
    Call I2CStart
    Call Send8BIT(&H70)
    Call Ack
    Call Send8BIT(B)
    Call Ack
    Call I2CStop
End Sub

