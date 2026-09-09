VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Stepper Motor Control"
   ClientHeight    =   1710
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3750
   LinkTopic       =   "Form1"
   ScaleHeight     =   1710
   ScaleWidth      =   3750
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdFree 
      Caption         =   "Free"
      Height          =   375
      Left            =   2640
      TabIndex        =   6
      Top             =   240
      Width           =   975
   End
   Begin VB.CommandButton cmdBreak 
      Caption         =   "Break"
      Height          =   375
      Left            =   2640
      TabIndex        =   5
      Top             =   720
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "1 Phase"
      Height          =   915
      Left            =   120
      TabIndex        =   2
      Top             =   240
      Width           =   2355
      Begin VB.CommandButton cmdRight 
         Caption         =   "Right"
         Height          =   375
         Left            =   1200
         TabIndex        =   4
         Top             =   360
         Width           =   975
      End
      Begin VB.CommandButton cmdLeft 
         Caption         =   "Left"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Run"
      Height          =   375
      Left            =   2640
      TabIndex        =   0
      Top             =   1200
      Width           =   975
   End
   Begin VB.HScrollBar hsc 
      Height          =   255
      LargeChange     =   5
      Left            =   120
      Max             =   100
      Min             =   1
      TabIndex        =   1
      Top             =   1320
      Value           =   10
      Width           =   2415
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
            Shift16Bit 0, 8
            Delay
            Shift16Bit 0, 4
            Delay
            Shift16Bit 0, 2
            Delay
            Shift16Bit 0, 1
            Delay
        ElseIf flgRight Then
            Shift16Bit 0, 1
            Delay
            Shift16Bit 0, 2
            Delay
            Shift16Bit 0, 4
            Delay
            Shift16Bit 0, 8
            Delay
        ElseIf flgBreak Then
            Shift16Bit 0, 3
            Delay
        ElseIf flgFree Then
            Shift16Bit 0, 0
            Delay
        End If
    Loop
End Sub

Private Sub Form_Load()
    InitialShiftIn
    RST
    LE
    flgLeft = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Shift16Bit 0, 0                 ' Release Motor
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
