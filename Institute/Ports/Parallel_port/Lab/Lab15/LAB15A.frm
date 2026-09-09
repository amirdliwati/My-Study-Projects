VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1050
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   ScaleHeight     =   1050
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Convert"
      Height          =   855
      Left            =   2520
      TabIndex        =   3
      Top             =   120
      Width           =   2655
      Begin VB.CommandButton cmdStopConvert 
         Caption         =   "Stop Convert"
         Height          =   375
         Left            =   1380
         TabIndex        =   5
         Top             =   360
         Width           =   1155
      End
      Begin VB.CommandButton cmdStartConvert 
         Caption         =   "Start Convert"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   1155
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Temperature"
      Height          =   855
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   2415
      Begin VB.CommandButton cmdRdTemp 
         Caption         =   "Read Temp"
         Height          =   375
         Left            =   1080
         TabIndex        =   2
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtTemp 
         Height          =   375
         Left            =   180
         TabIndex        =   1
         Top             =   360
         Width           =   735
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdRdTemp_Click()
Dim tmp As Double
Dim datH As Integer
Dim datL As Integer
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HAA           'Read Temperature Register Command
    Ack
    I2CStart
    Send8BIT &H91
    Ack
    datH = Read8Bit         'Read MSB Temperature Register
    MAck
    datL = Read8Bit         'Read LSB Temperature Register
    MNAck
    I2CStop
    
    If (datL And &H80) = &H80 Then
        tmp = datH + 0.5
    Else
        tmp = datH
    End If
    
    txtTemp.Text = tmp
End Sub

Private Sub cmdStartConvert_Click()
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HEE           'Start Convert Temperature Command
    Ack
    I2CStop
End Sub

Private Sub cmdStopConvert_Click()
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &H22           'Stop Convert Temperature Command
    Ack
    I2CStop
End Sub
