VERSION 5.00
Object = "{8A0E1295-C8A3-11D5-9BA5-00045A4AFDE4}#16.0#0"; "hpCount.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1230
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2580
   LinkTopic       =   "Form1"
   ScaleHeight     =   1230
   ScaleWidth      =   2580
   StartUpPosition =   3  'Windows Default
   Begin HighPerformanceCounter.hpCounter hp 
      Left            =   540
      Top             =   480
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Run"
      Height          =   435
      Left            =   1320
      TabIndex        =   0
      Top             =   420
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdRun_Click()
Dim i As Integer
Dim j As Integer
    ColOE False                     ' Column data output enable
    For i = 0 To 6
        RowCLK                      ' send row clock
        For j = 19 To 0 Step -1
            DoEvents
            ColDA True              ' send data 1 to column data
            ColCLK                  ' send column clock
            ColLE                   ' Latch column data
            hp.Delay_ms 100         ' Delay 100 ms
        Next j
        ColRST                      ' Reset column data
        ColLE                       ' Latch column data
    Next i
    RowRST                          ' Reset row counter
    ColOE True                      ' Column data output disable
End Sub

Private Sub Form_Load()
    InitialDatabus                      ' Initial databus
    RowRST                              ' Reset row counter
    ColRST                              ' Reset column data
    ColLE                               ' Latch column data
End Sub

Private Sub InitialDatabus()
    Out &H378, &H18                     ' Initial databus
End Sub

Private Sub ColCLK()
    Out &H378, Inp(&H378) Xor 1         ' Toggle column clock
    Out &H378, Inp(&H378) Xor 1         ' Toggle column clock
End Sub

Private Sub RowCLK()
    Out &H378, Inp(&H378) Xor &H40      ' Toggle row clock
    Out &H378, Inp(&H378) Xor &H40      ' Toggle row clock
End Sub

Private Sub ColRST()
    Out &H378, Inp(&H378) Xor &H8       ' Toggle column reset
    Out &H378, Inp(&H378) Xor &H8       ' Toggle column reset
End Sub

Private Sub RowRST()
    Out &H378, Inp(&H378) Xor &H80      ' Toggle row reset
    Out &H378, Inp(&H378) Xor &H80      ' Toggle row reset
End Sub

Private Sub ColLE()
    Out &H378, Inp(&H378) Xor &H2       ' Toggle column latch
    Out &H378, Inp(&H378) Xor &H2       ' Toggle column latch
End Sub

Private Sub ColDA(ByVal Logic As Boolean)
    If Logic Then
        Out &H378, Inp(&H378) Or &H4    ' Set column data to high
    Else
        Out &H378, Inp(&H378) And &HFB  ' Set column data to low
    End If
End Sub

Private Sub ColOE(ByVal Logic As Boolean)
    If Logic Then
        Out &H378, Inp(&H378) Or &H10   ' Set column output enable to high
    Else
        Out &H378, Inp(&H378) And &HEF  ' Set column output enable to low
    End If
End Sub
