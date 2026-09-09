VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "I2C A/D & D/A"
   ClientHeight    =   4185
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2580
   Icon            =   "LAB12B.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4185
   ScaleWidth      =   2580
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Text            =   "Text5"
      Top             =   3120
      Width           =   2055
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Text            =   "Text4"
      Top             =   1800
      Width           =   2055
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Text            =   "Text3"
      Top             =   1200
      Width           =   2055
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   720
      Width           =   2055
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   840
      Top             =   2520
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
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

Private Sub Sendout(B As Byte)
    Call I2CStart              'Start
    Call Send8BIT(&H42)        'Send Control Word
    Call Ack                   'Acknowledge
    Call Send8BIT(B)           'Send Data
    Call Ack                   'Acknowledge
    Call I2CStop               'Stop
End Sub

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
    Text1.Text = (Read8Bit * 5) / 255
    Call MAck
    Text2.Text = (Read8Bit * 5) / 255
    Call MAck
    Text3.Text = (Read8Bit * 5) / 255
    Call MAck
    Text4.Text = (Read8Bit * 5) / 255
    Call Ack
    Call I2CStop
End Sub

Private Sub Text5_Change()
    If Val(Text5.Text) > 5 Then Text5.Text = 5
    Call I2CStart
    Call Send8BIT(&H90)
    Call Ack
    Call Send8BIT(&H44)
    Call Ack
    Call Send8BIT(Val(Text5.Text) * 51.2)
    Call Ack
    Call I2CStop
End Sub
