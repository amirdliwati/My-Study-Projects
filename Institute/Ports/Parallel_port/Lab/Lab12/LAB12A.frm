VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "I2C A/D Converter"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3420
   Icon            =   "LAB12A.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   3420
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text4 
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Text            =   "Text4"
      Top             =   1680
      Width           =   2055
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Text            =   "Text3"
      Top             =   1200
      Width           =   2055
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   720
      Width           =   2055
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   1200
      Top             =   2280
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   240
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Timer1_Timer()
    Call I2CStart
    Call Send8BIT(&H90)
    Call Ack
    Call Send8BIT(&H45)
    Call Ack
    Call I2CStop
    Call I2CStart
    Call Send8BIT(&H91)
    Call Ack
    Text1.Text = (Read8Bit * 5) / 256
    Call MAck
    Text2.Text = (Read8Bit * 5) / 256
    Call MAck
    Text3.Text = (Read8Bit * 5) / 256
    Call MAck
    Text4.Text = (Read8Bit * 5) / 256
    Call Ack
    Call I2CStop
End Sub

