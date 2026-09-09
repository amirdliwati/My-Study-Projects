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
   Begin VB.TextBox txt 
      Height          =   315
      Left            =   4260
      MaxLength       =   4
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   180
      Width           =   795
   End
   Begin VB.CommandButton cmdRndData 
      Caption         =   "Random"
      Height          =   435
      Left            =   4260
      TabIndex        =   2
      Top             =   540
      Width           =   855
   End
   Begin HighPerformanceCounter.hpCounter hp 
      Left            =   3420
      Top             =   900
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
Dim Char(1 To 128, 1 To 5) As Integer
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
        ReadText
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
    BuildFontMap
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

Private Sub ReadText()
Dim i As Integer
Dim j As Integer
Dim k As Integer
Dim tmpAsc As Integer
Dim tCol As Integer
Dim tRow As Integer
Dim tmpstr As String

    tmpstr = txt.Text & "    "
    flx.Visible = False
    For i = 0 To 3
        tmpAsc = Asc(Mid(tmpstr, i + 1, 1))
        For j = 0 To 4
            flx.Col = (i * 5) + j
            tCol = (i * 5) + j
            For k = 0 To 6
                flx.Row = 6 - k
                tRow = 6 - k
                If (Char(tmpAsc, j + 1) And (2 ^ k)) = (2 ^ k) Then
                    flx.CellBackColor = vbRed
                    flgDot(tCol, tRow) = True
                Else
                    flx.CellBackColor = vbWhite
                    flgDot(tCol, tRow) = False
                End If
            Next k
        Next j
    Next i
    flx.Visible = True
End Sub

Sub BuildFontMap()
' A to Z
Char(65, 1) = &H3F: Char(65, 2) = &H48: Char(65, 3) = &H48: Char(65, 4) = &H3F: Char(65, 5) = &H0
Char(66, 1) = &H7F: Char(66, 2) = &H49: Char(66, 3) = &H49: Char(66, 4) = &H36: Char(66, 5) = &H0
Char(67, 1) = &H3E: Char(67, 2) = &H41: Char(67, 3) = &H41: Char(67, 4) = &H22: Char(67, 5) = &H0
Char(68, 1) = &H7F: Char(68, 2) = &H41: Char(68, 3) = &H22: Char(68, 4) = &H1C: Char(68, 5) = &H0
Char(69, 1) = &H7F: Char(69, 2) = &H49: Char(69, 3) = &H49: Char(69, 4) = &H49: Char(69, 5) = &H0
Char(70, 1) = &H7F: Char(70, 2) = &H48: Char(70, 3) = &H48: Char(70, 4) = &H40: Char(70, 5) = &H0
Char(71, 1) = &H3E: Char(71, 2) = &H41: Char(71, 3) = &H49: Char(71, 4) = &H2E: Char(71, 5) = &H0
Char(72, 1) = &H7F: Char(72, 2) = &H8: Char(72, 3) = &H8: Char(72, 4) = &H7F: Char(72, 5) = &H0
Char(73, 1) = &H0: Char(73, 2) = &H41: Char(73, 3) = &H7F: Char(73, 4) = &H41: Char(73, 5) = &H0
Char(74, 1) = &H4E: Char(74, 2) = &H41: Char(74, 3) = &H7E: Char(74, 4) = &H40: Char(74, 5) = &H0
Char(75, 1) = &H7F: Char(75, 2) = &H14: Char(75, 3) = &H22: Char(75, 4) = &H41: Char(75, 5) = &H0
Char(76, 1) = &H7F: Char(76, 2) = &H1: Char(76, 3) = &H1: Char(76, 4) = &H1: Char(76, 5) = &H0
Char(77, 1) = &H7F: Char(77, 2) = &H20: Char(77, 3) = &H10: Char(77, 4) = &H20: Char(77, 5) = &H7F
Char(78, 1) = &H7F: Char(78, 2) = &H10: Char(78, 3) = &H4: Char(78, 4) = &H7F: Char(78, 5) = &H0
Char(79, 1) = &H3E: Char(79, 2) = &H41: Char(79, 3) = &H41: Char(79, 4) = &H3E: Char(79, 5) = &H0
Char(80, 1) = &H7F: Char(80, 2) = &H48: Char(80, 3) = &H48: Char(80, 4) = &H30: Char(80, 5) = &H0
Char(81, 1) = &H3E: Char(81, 2) = &H41: Char(81, 3) = &H45: Char(81, 4) = &H3E: Char(81, 5) = &H1
Char(82, 1) = &H7F: Char(82, 2) = &H4C: Char(82, 3) = &H4A: Char(82, 4) = &H31: Char(82, 5) = &H0
Char(83, 1) = &H32: Char(83, 2) = &H49: Char(83, 3) = &H49: Char(83, 4) = &H26: Char(83, 5) = &H0
Char(84, 1) = &H40: Char(84, 2) = &H40: Char(84, 3) = &H7F: Char(84, 4) = &H40: Char(84, 5) = &H40
Char(85, 1) = &H7E: Char(85, 2) = &H1: Char(85, 3) = &H1: Char(85, 4) = &H7E: Char(85, 5) = &H0
Char(86, 1) = &H7C: Char(86, 2) = &H2: Char(86, 3) = &H1: Char(86, 4) = &H2: Char(86, 5) = &H7C
Char(87, 1) = &H7F: Char(87, 2) = &H4: Char(87, 3) = &H18: Char(87, 4) = &H4: Char(87, 5) = &H7F
Char(88, 1) = &H77: Char(88, 2) = &H8: Char(88, 3) = &H8: Char(88, 4) = &H77: Char(88, 5) = &H0
Char(89, 1) = &H70: Char(89, 2) = &H8: Char(89, 3) = &H7: Char(89, 4) = &H8: Char(89, 5) = &H70
Char(90, 1) = &H43: Char(90, 2) = &H45: Char(90, 3) = &H49: Char(90, 4) = &H51: Char(90, 5) = &H61
' a to z
Char(97, 1) = &H17: Char(97, 2) = &H15: Char(97, 3) = &H15: Char(97, 4) = &H1F: Char(97, 5) = &H0
Char(98, 1) = &H7E: Char(98, 2) = &H11: Char(98, 3) = &H11: Char(98, 4) = &HE: Char(98, 5) = &H0
Char(99, 1) = &HE: Char(99, 2) = &H11: Char(99, 3) = &H11: Char(99, 4) = &HA: Char(99, 5) = &H0
Char(100, 1) = &HE: Char(100, 2) = &H11: Char(100, 3) = &H11: Char(100, 4) = &H7E: Char(100, 5) = &H0
Char(101, 1) = &HE: Char(101, 2) = &H15: Char(101, 3) = &H15: Char(101, 4) = &HD: Char(101, 5) = &H0
Char(102, 1) = &H8: Char(102, 2) = &H3F: Char(102, 3) = &H48: Char(102, 4) = &H20: Char(102, 5) = &H0
Char(103, 1) = &H39: Char(103, 2) = &H45: Char(103, 3) = &H45: Char(103, 4) = &H3E: Char(103, 5) = &H0
Char(104, 1) = &H7F: Char(104, 2) = &H10: Char(104, 3) = &H10: Char(104, 4) = &HF: Char(104, 5) = &H0
Char(105, 1) = &H0: Char(105, 2) = &H0: Char(105, 3) = &H5F: Char(105, 4) = &H0: Char(105, 5) = &H0
Char(106, 1) = &H2: Char(106, 2) = &H1: Char(106, 3) = &H1: Char(106, 4) = &H5E: Char(106, 5) = &H0
Char(107, 1) = &H7F: Char(107, 2) = &H4: Char(107, 3) = &HA: Char(107, 4) = &H11: Char(107, 5) = &H0
Char(108, 1) = &H0: Char(108, 2) = &H0: Char(108, 3) = &H7F: Char(108, 4) = &H0: Char(108, 5) = &H0
Char(109, 1) = &HF: Char(109, 2) = &H10: Char(109, 3) = &HF: Char(109, 4) = &H10: Char(109, 5) = &HF
Char(110, 1) = &H1F: Char(110, 2) = &H8: Char(110, 3) = &H10: Char(110, 4) = &H1F: Char(110, 5) = &H0
Char(111, 1) = &HE: Char(111, 2) = &H11: Char(111, 3) = &H11: Char(111, 4) = &HE: Char(111, 5) = &H0
Char(112, 1) = &H7F: Char(112, 2) = &H44: Char(112, 3) = &H44: Char(112, 4) = &H38: Char(112, 5) = &H0
Char(113, 1) = &H38: Char(113, 2) = &H44: Char(113, 3) = &H44: Char(113, 4) = &H7F: Char(113, 5) = &H0
Char(114, 1) = &H10: Char(114, 2) = &HF: Char(114, 3) = &H10: Char(114, 4) = &H8: Char(114, 5) = &H0
Char(115, 1) = &H9: Char(115, 2) = &H15: Char(115, 3) = &H15: Char(115, 4) = &H12: Char(115, 5) = &H0
Char(116, 1) = &H20: Char(116, 2) = &H7E: Char(116, 3) = &H21: Char(116, 4) = &H2: Char(116, 5) = &H0
Char(117, 1) = &H1E: Char(117, 2) = &H1: Char(117, 3) = &H1: Char(117, 4) = &H1E: Char(117, 5) = &H0
Char(118, 1) = &H1F: Char(118, 2) = &H2: Char(118, 3) = &H4: Char(118, 4) = &H18: Char(118, 5) = &H0
Char(119, 1) = &H1F: Char(119, 2) = &H2: Char(119, 3) = &H4: Char(119, 4) = &H2: Char(119, 5) = &H1F
Char(120, 1) = &H1B: Char(120, 2) = &H4: Char(120, 3) = &H4: Char(120, 4) = &H1B: Char(120, 5) = &H0
Char(121, 1) = &H79: Char(121, 2) = &H5: Char(121, 3) = &H5: Char(121, 4) = &H7E: Char(121, 5) = &H0
Char(122, 1) = &H13: Char(122, 2) = &H17: Char(122, 3) = &H1D: Char(122, 4) = &H19: Char(122, 5) = &H0
' 0 to 9
Char(48, 1) = &H3E: Char(48, 2) = &H41: Char(48, 3) = &H41: Char(48, 4) = &H3E: Char(48, 5) = &H0
Char(49, 1) = &H10: Char(49, 2) = &H21: Char(49, 3) = &H7F: Char(49, 4) = &H1: Char(49, 5) = &H0
Char(50, 1) = &H6F: Char(50, 2) = &H49: Char(50, 3) = &H49: Char(50, 4) = &H79: Char(50, 5) = &H0
Char(51, 1) = &H49: Char(51, 2) = &H49: Char(51, 3) = &H49: Char(51, 4) = &H7F: Char(51, 5) = &H0
Char(52, 1) = &H78: Char(52, 2) = &H8: Char(52, 3) = &H8: Char(52, 4) = &H7F: Char(52, 5) = &H0
Char(53, 1) = &H79: Char(53, 2) = &H49: Char(53, 3) = &H49: Char(53, 4) = &H4F: Char(53, 5) = &H0
Char(54, 1) = &H7F: Char(54, 2) = &H49: Char(54, 3) = &H49: Char(54, 4) = &H4F: Char(54, 5) = &H0
Char(55, 1) = &H40: Char(55, 2) = &H47: Char(55, 3) = &H48: Char(55, 4) = &H70: Char(55, 5) = &H0
Char(56, 1) = &H7F: Char(56, 2) = &H49: Char(56, 3) = &H49: Char(56, 4) = &H7F: Char(56, 5) = &H0
Char(57, 1) = &H79: Char(57, 2) = &H49: Char(57, 3) = &H49: Char(57, 4) = &H7F: Char(57, 5) = &H0
' + - *  /
Char(43, 1) = &H8: Char(43, 2) = &H8: Char(43, 3) = &H3E: Char(43, 4) = &H8: Char(43, 5) = &H8
Char(45, 1) = &H8: Char(45, 2) = &H8: Char(45, 3) = &H8: Char(45, 4) = &H8: Char(45, 5) = &H8
Char(42, 1) = &H22: Char(42, 2) = &H14: Char(42, 3) = &H8: Char(42, 4) = &H14: Char(42, 5) = &H22
Char(47, 1) = &H22: Char(47, 2) = &H4: Char(47, 3) = &H8: Char(47, 4) = &H10: Char(47, 5) = &H22
' < > [ ] ( )
Char(60, 1) = &H8: Char(60, 2) = &H14: Char(60, 3) = &H22: Char(60, 4) = &H41: Char(60, 5) = &H0
Char(62, 1) = &H41: Char(62, 2) = &H22: Char(62, 3) = &H14: Char(62, 4) = &H8: Char(62, 5) = &H0
Char(91, 1) = &H0: Char(91, 2) = &H7F: Char(91, 3) = &H41: Char(91, 4) = &H41: Char(91, 5) = &H0
Char(93, 1) = &H0: Char(93, 2) = &H41: Char(93, 3) = &H41: Char(93, 4) = &H7F: Char(93, 5) = &H0
Char(41, 1) = &H0: Char(41, 2) = &H1C: Char(41, 3) = &H22: Char(41, 4) = &H41: Char(41, 5) = &H0
Char(42, 1) = &H0: Char(42, 2) = &H41: Char(42, 3) = &H22: Char(42, 4) = &H1C: Char(42, 5) = &H0
' " : ; = -
Char(35, 1) = &H0: Char(35, 2) = &H60: Char(35, 3) = &H0: Char(35, 4) = &H60: Char(35, 5) = &H0
Char(58, 1) = &H0: Char(58, 2) = &H36: Char(58, 3) = &H36: Char(58, 4) = &H0: Char(58, 5) = &H0
Char(59, 1) = &H0: Char(59, 2) = &H31: Char(59, 3) = &H36: Char(59, 4) = &H0: Char(59, 5) = &H0
Char(61, 1) = &H0: Char(61, 1) = &H14: Char(61, 3) = &H14: Char(61, 4) = &H14: Char(61, 5) = &H0
Char(95, 1) = &H1: Char(95, 2) = &H1: Char(95, 3) = &H1: Char(95, 4) = &H1: Char(95, 5) = &H0
' blank . ,
Char(33, 1) = &H0: Char(33, 2) = &H0: Char(33, 3) = &H0: Char(33, 4) = &H0: Char(33, 5) = &H0
Char(46, 1) = &H0: Char(46, 2) = &H3: Char(46, 3) = &H3: Char(46, 4) = &H0: Char(46, 5) = &H0
Char(44, 1) = &H0: Char(44, 2) = &H1: Char(44, 3) = &H7: Char(44, 4) = &H6: Char(44, 5) = &H0
End Sub

