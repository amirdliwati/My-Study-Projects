VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{8A0E1295-C8A3-11D5-9BA5-00045A4AFDE4}#16.0#0"; "hpCount.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   1575
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   ScaleHeight     =   1575
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRndData 
      Caption         =   "Random"
      Height          =   435
      Left            =   4260
      TabIndex        =   2
      Top             =   540
      Width           =   855
   End
   Begin HighPerformanceCounter.hpCounter hp 
      Left            =   4260
      Top             =   60
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin MSFlexGridLib.MSFlexGrid flx 
      Height          =   1455
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   4000
      _ExtentX        =   7064
      _ExtentY        =   2566
      _Version        =   393216
      Rows            =   7
      Cols            =   20
      FixedRows       =   0
      FixedCols       =   0
      FocusRect       =   0
      HighLight       =   0
      ScrollBars      =   0
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Run"
      Height          =   435
      Left            =   4260
      TabIndex        =   0
      Top             =   1020
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim flgDot(0 To 19, 0 To 6) As Boolean
Dim flgRun As Boolean

Private Sub cmdRun_Click()
Dim i As Integer
Dim j As Integer
    If flgRun Then
        flgRun = False
        cmdRun.Caption = "Run"
        Exit Sub
    Else
        flgRun = True
        cmdRun.Caption = "Stop"
        RowRST                          ' Reset row counter
        ColRST                          ' Reset column data
    End If

    ColOE False                         ' Column data output enable
    Do While flgRun
        For i = 0 To 6
            RowCLK                      ' send row clock
            For j = 19 To 0 Step -1
                DoEvents
                ColDA flgDot(j, i)      ' send data from dot matrix buffer to column data
                ColCLK                  ' send column clock
            Next j
            ColLE                       ' Latch column data
            hp.Delay_ms 1               ' Delay 100 ms
            ColRST                      ' Reset column data
            ColLE                       ' Latch column data
        Next i
        RowRST                          ' Reset row counter
    Loop
    ColOE True                          ' Column data output disable
End Sub

Private Sub cmdRndData_Click()
Dim i As Integer
Dim j As Integer
Dim tmp As Double
    flx.Visible = False
    Randomize
    For i = 0 To 6
        flx.Row = i
        For j = 0 To 19
            flgDot(j, i) = CBool(Round(Rnd))
            flx.Col = j
            If flgDot(j, i) Then
                flx.CellBackColor = vbRed
            Else
                flx.CellBackColor = vbWhite
            End If
        Next j
    Next i
    flx.Visible = True
End Sub

Private Sub flx_Click()
Dim i As Integer
Dim j As Integer
    flx.Visible = False
    If flx.CellBackColor = vbRed Then
        flx.CellBackColor = vbWhite
        flgDot(flx.Col, flx.Row) = False    ' Clear point dot matrix buffer
    Else
        flx.CellBackColor = vbRed
        flgDot(flx.Col, flx.Row) = True     ' Set point dot matrix buffer
    End If
    flx.Visible = True
End Sub

Private Sub InitialFlexGrid()
Dim i As Integer
Dim j As Integer
    flx.Height = 1445
    flx.Width = 3990
    
    flx.FixedCols = 0
    flx.FixedRows = 0
    
    flx.Rows = 7                        ' Set flex grid have 7 rows
    flx.Cols = 20                       ' Set flex grid have 20 column
    
    For i = 0 To 6
        flx.RowHeight(i) = 200          ' Set cell height = 200
    Next i
    For i = 0 To 19
        flx.ColWidth(i) = 200           ' Set cell width = 200
    Next i
End Sub

Private Sub Form_Load()
Dim i As Integer
Dim j As Integer
    InitialFlexGrid
    For i = 0 To 6
        For j = 0 To 19
            flgDot(j, i) = False        ' Clear all dot matrix buffer
        Next j
    Next i
    
    InitialDatabus                      ' Initial databus
    RowRST                              ' Reset row counter
    ColRST                              ' Reset column data
    ColLE                               ' Latch column data
End Sub

Private Sub InitialDatabus()
    Out &H378, &H18                     ' Initial databus
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    flgRun = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
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
