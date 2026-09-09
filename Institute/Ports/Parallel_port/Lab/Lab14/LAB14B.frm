VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2145
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9330
   LinkTopic       =   "Form1"
   ScaleHeight     =   2145
   ScaleWidth      =   9330
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "OutL Port"
      Height          =   1935
      Left            =   5400
      TabIndex        =   20
      Top             =   120
      Width           =   3855
      Begin VB.HScrollBar hsc 
         Height          =   255
         LargeChange     =   5
         Left            =   120
         Max             =   100
         Min             =   1
         TabIndex        =   27
         Top             =   1440
         Value           =   10
         Width           =   2415
      End
      Begin VB.CommandButton cmdRun 
         Caption         =   "Run"
         Height          =   375
         Left            =   2640
         TabIndex        =   26
         Top             =   1320
         Width           =   975
      End
      Begin VB.Frame Frame1 
         Caption         =   "1 Phase"
         Height          =   915
         Left            =   120
         TabIndex        =   23
         Top             =   360
         Width           =   2355
         Begin VB.CommandButton cmdLeft 
            Caption         =   "Left"
            Height          =   375
            Left            =   120
            TabIndex        =   25
            Top             =   360
            Width           =   975
         End
         Begin VB.CommandButton cmdRight 
            Caption         =   "Right"
            Height          =   375
            Left            =   1200
            TabIndex        =   24
            Top             =   360
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdBreak 
         Caption         =   "Break"
         Height          =   375
         Left            =   2640
         TabIndex        =   22
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton cmdFree 
         Caption         =   "Free"
         Height          =   375
         Left            =   2640
         TabIndex        =   21
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "OutH Port"
      Height          =   1935
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5175
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   8
         Left            =   4380
         TabIndex        =   1
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   9
         Left            =   3780
         TabIndex        =   2
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   10
         Left            =   3180
         TabIndex        =   3
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   11
         Left            =   2580
         TabIndex        =   4
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   12
         Left            =   1980
         TabIndex        =   5
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   13
         Left            =   1380
         TabIndex        =   6
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   14
         Left            =   780
         TabIndex        =   7
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "OFF"
         Height          =   435
         Index           =   15
         Left            =   180
         TabIndex        =   8
         Top             =   660
         Width           =   615
      End
      Begin VB.CommandButton cmdReset 
         Caption         =   "Reset"
         Height          =   435
         Left            =   2880
         TabIndex        =   19
         Top             =   1320
         Width           =   855
      End
      Begin VB.TextBox txtOutH 
         Height          =   375
         Left            =   1320
         MaxLength       =   4
         TabIndex        =   9
         Text            =   "0"
         Top             =   1320
         Width           =   735
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D15"
         Height          =   210
         Index           =   15
         Left            =   360
         TabIndex        =   18
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D14"
         Height          =   210
         Index           =   14
         Left            =   945
         TabIndex        =   17
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D13"
         Height          =   210
         Index           =   13
         Left            =   1530
         TabIndex        =   16
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D12"
         Height          =   210
         Index           =   12
         Left            =   2115
         TabIndex        =   15
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D11"
         Height          =   210
         Index           =   11
         Left            =   2700
         TabIndex        =   14
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D10"
         Height          =   210
         Index           =   10
         Left            =   3285
         TabIndex        =   13
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D9"
         Height          =   210
         Index           =   9
         Left            =   3870
         TabIndex        =   12
         Top             =   360
         Width           =   285
      End
      Begin VB.Label lblD 
         AutoSize        =   -1  'True
         Caption         =   "D8"
         Height          =   210
         Index           =   8
         Left            =   4455
         TabIndex        =   11
         Top             =   360
         Width           =   285
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "OUTH"
         Height          =   210
         Left            =   720
         TabIndex        =   10
         Top             =   1320
         Width           =   465
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim flgRun As Boolean
Dim flgLeft As Boolean, flgRight As Boolean
Dim flgFree As Boolean, flgBreak As Boolean
Dim OutH As Byte, OutL As Byte

Private Sub cmdD_Click(Index As Integer)
Dim i As Integer
Dim tmp As Byte
    If cmdD(Index).Caption = "OFF" Then
        cmdD(Index).Caption = "ON"
    Else
        cmdD(Index).Caption = "OFF"
    End If
    
    tmp = 0
    For i = 0 To 7
        If cmdD(i + 8).Caption = "ON" Then tmp = tmp + (2 ^ i)
    Next i
    txtOutH.Text = Hex(tmp)
    OutH = tmp
    Shift16Bit OutH, OutL
End Sub

Private Sub cmdReset_Click()
Dim i As Byte
    For i = 8 To 15
        cmdD(i).Caption = "OFF"
    Next i
    txtOutH.Text = 0
    OutH = 0
    Shift16Bit OutH, OutL
End Sub

Private Sub cmdBreak_Click()
    flgLeft = False
    flgRight = False
    flgBreak = True
    flgFree = False
End Sub

Private Sub cmdFree_Click()
    flgLeft = False
    flgRight = False
    flgBreak = False
    flgFree = True
End Sub

Private Sub cmdLeft_Click()
    flgLeft = True
    flgRight = False
    flgBreak = False
    flgFree = False
End Sub

Private Sub cmdRight_Click()
    flgLeft = False
    flgRight = True
    flgBreak = False
    flgFree = False
End Sub

Private Sub Delay()
Dim a As Single
    a = Timer
    Do While Timer < a + (hsc.Value / 100)
        DoEvents
    Loop
End Sub

Private Sub cmdRun_Click()
    If flgRun Then
        flgRun = False
        cmdRun.Caption = "Run"
        Exit Sub
    Else
        flgRun = True
        cmdRun.Caption = "Stop"
    End If
    Do While flgRun
        If flgLeft Then
            Shift16Bit OutH, 1
            OutL = 1
            Delay
            Shift16Bit OutH, 2
            OutL = 2
            Delay
            Shift16Bit OutH, 4
            OutL = 4
            Delay
            Shift16Bit OutH, 8
            OutL = 8
            Delay
        ElseIf flgRight Then
            Shift16Bit OutH, 8
            OutL = 8
            Delay
            Shift16Bit OutH, 4
            OutL = 4
            Delay
            Shift16Bit OutH, 2
            OutL = 2
            Delay
            Shift16Bit OutH, 1
            OutL = 1
            Delay
        ElseIf flgBreak Then
            Shift16Bit OutH, 3
            OutL = 0
            Delay
        ElseIf flgFree Then
            Shift16Bit OutH, 0
            OutL = 3
            Delay
        End If
    Loop
End Sub

Private Sub Form_Load()
    InitialShiftIn
    RST
    LE
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
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

Private Sub Shift16Bit(Optional ByVal OutH As Byte = 0, Optional ByVal OutL As Byte = 0)
    Shift8Bit OutH
    Shift8Bit OutL
    LE
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
