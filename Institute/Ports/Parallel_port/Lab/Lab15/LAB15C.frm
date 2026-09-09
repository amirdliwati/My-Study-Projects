VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2820
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   ScaleHeight     =   2820
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame5 
      Caption         =   "TL"
      Height          =   855
      Left            =   2640
      TabIndex        =   14
      Top             =   1920
      Width           =   2535
      Begin VB.TextBox txtTL 
         Height          =   375
         Left            =   900
         TabIndex        =   17
         Top             =   360
         Width           =   735
      End
      Begin VB.CommandButton cmdRdTL 
         Caption         =   "Read"
         Height          =   375
         Left            =   120
         TabIndex        =   16
         Top             =   360
         Width           =   735
      End
      Begin VB.CommandButton cmdWrTL 
         Caption         =   "Write"
         Height          =   375
         Left            =   1680
         TabIndex        =   15
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "TH"
      Height          =   855
      Left            =   60
      TabIndex        =   10
      Top             =   1920
      Width           =   2535
      Begin VB.CommandButton cmdWrTH 
         Caption         =   "Write"
         Height          =   375
         Left            =   1680
         TabIndex        =   13
         Top             =   360
         Width           =   735
      End
      Begin VB.CommandButton cmdRdTH 
         Caption         =   "Read"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox txtTH 
         Height          =   375
         Left            =   900
         TabIndex        =   11
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Config"
      Height          =   855
      Left            =   60
      TabIndex        =   6
      Top             =   1020
      Width           =   3615
      Begin VB.CommandButton cmdWrConfig 
         Caption         =   "Write Config"
         Height          =   375
         Left            =   2280
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdRdConfig 
         Caption         =   "Read Config"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtConfig 
         Height          =   375
         Left            =   1440
         TabIndex        =   7
         Top             =   360
         Width           =   735
      End
   End
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

Private Sub cmdRdConfig_Click()
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HAC           'Access Config Register Command
    Ack
    I2CStart
    Send8BIT &H91
    Ack
    txtConfig.Text = Hex(Read8Bit)
    MNAck
    I2CStop
End Sub

Private Sub cmdWrConfig_Click()
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HAC           'Access Config Register Command
    Ack
    Send8BIT CByte("&H" & txtConfig.Text)
    Ack
    I2CStop
End Sub

Private Sub cmdRdTH_Click()
Dim tmp As Double
Dim datH As Integer
Dim datL As Integer
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HA1           'Access TH Register Command
    Ack
    I2CStart
    Send8BIT &H91
    Ack
    datH = Read8Bit         'Read MSB TH Register
    MAck
    datL = Read8Bit         'Read LSB TH Register
    MNAck
    I2CStop
    
    If (datL And &H80) = &H80 Then
        tmp = datH + 0.5
    Else
        tmp = datH
    End If
    
    txtTH.Text = tmp
End Sub

Private Sub cmdRdTL_Click()
Dim tmp As Double
Dim datH As Integer
Dim datL As Integer
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HA2           'Access TL Register Command
    Ack
    I2CStart
    Send8BIT &H91
    Ack
    datH = Read8Bit         'Read MSB TL Register
    MAck
    datL = Read8Bit         'Read LSB TL Register
    MNAck
    I2CStop
    
    If (datL And &H80) = &H80 Then
        tmp = datH + 0.5
    Else
        tmp = datH
    End If
    
    txtTL.Text = tmp
End Sub

Private Sub cmdWrTH_Click()
Dim tmp As Double
Dim datH As Byte
Dim datL As Byte
    datH = Fix(txtTH.Text)
    tmp = Val(txtTH.Text) - datH
    If tmp <> 0 Then datL = &H80
    
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HA1           'Access TH Register Command
    Ack
    Send8BIT datH
    Ack
    Send8BIT datL
    Ack
    I2CStop
End Sub

Private Sub cmdWrTL_Click()
Dim tmp As Double
Dim datH As Byte
Dim datL As Byte
    datH = Fix(txtTL.Text)
    tmp = Val(txtTL.Text) - datH
    If tmp <> 0 Then datL = &H80
    
    I2CStart
    Send8BIT &H90
    Ack
    Send8BIT &HA2           'Access TL Register Command
    Ack
    Send8BIT datH
    Ack
    Send8BIT datL
    Ack
    I2CStop
End Sub
