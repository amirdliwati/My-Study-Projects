VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2580
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5790
   LinkTopic       =   "Form1"
   ScaleHeight     =   2580
   ScaleWidth      =   5790
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   8
      Left            =   5040
      TabIndex        =   21
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   9
      Left            =   4440
      TabIndex        =   22
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   10
      Left            =   3840
      TabIndex        =   23
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   11
      Left            =   3240
      TabIndex        =   24
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   12
      Left            =   2640
      TabIndex        =   25
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   13
      Left            =   2040
      TabIndex        =   26
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   14
      Left            =   1440
      TabIndex        =   27
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   15
      Left            =   840
      TabIndex        =   28
      Top             =   480
      Width           =   615
   End
   Begin VB.TextBox txtOutH 
      Height          =   315
      Left            =   60
      MaxLength       =   4
      TabIndex        =   20
      Text            =   "0"
      Top             =   540
      Width           =   735
   End
   Begin VB.TextBox txtOutL 
      Height          =   315
      Left            =   60
      MaxLength       =   4
      TabIndex        =   19
      Text            =   "0"
      Top             =   1440
      Width           =   735
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   0
      Left            =   5040
      TabIndex        =   3
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   1
      Left            =   4440
      TabIndex        =   12
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   2
      Left            =   3840
      TabIndex        =   13
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   3
      Left            =   3240
      TabIndex        =   14
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   4
      Left            =   2640
      TabIndex        =   15
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   5
      Left            =   2040
      TabIndex        =   16
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   6
      Left            =   1440
      TabIndex        =   17
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdD 
      Caption         =   "OFF"
      Height          =   435
      Index           =   7
      Left            =   840
      TabIndex        =   18
      Top             =   1380
      Width           =   615
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   435
      Left            =   3000
      TabIndex        =   2
      Top             =   2040
      Width           =   855
   End
   Begin VB.CommandButton cmdOut 
      Caption         =   "Out"
      Height          =   435
      Left            =   1800
      TabIndex        =   0
      Top             =   2040
      Width           =   855
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "OUTH"
      Height          =   210
      Left            =   120
      TabIndex        =   37
      Top             =   240
      Width           =   465
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D8"
      Height          =   210
      Index           =   8
      Left            =   5160
      TabIndex        =   36
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D9"
      Height          =   210
      Index           =   9
      Left            =   4560
      TabIndex        =   35
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D10"
      Height          =   210
      Index           =   10
      Left            =   3945
      TabIndex        =   34
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D11"
      Height          =   210
      Index           =   11
      Left            =   3360
      TabIndex        =   33
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D12"
      Height          =   210
      Index           =   12
      Left            =   2775
      TabIndex        =   32
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D13"
      Height          =   210
      Index           =   13
      Left            =   2190
      TabIndex        =   31
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D14"
      Height          =   210
      Index           =   14
      Left            =   1605
      TabIndex        =   30
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D15"
      Height          =   210
      Index           =   15
      Left            =   1020
      TabIndex        =   29
      Top             =   180
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D7"
      Height          =   210
      Index           =   7
      Left            =   1020
      TabIndex        =   11
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D6"
      Height          =   210
      Index           =   6
      Left            =   1605
      TabIndex        =   10
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D5"
      Height          =   210
      Index           =   5
      Left            =   2190
      TabIndex        =   9
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D4"
      Height          =   210
      Index           =   4
      Left            =   2775
      TabIndex        =   8
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D3"
      Height          =   210
      Index           =   3
      Left            =   3360
      TabIndex        =   7
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D2"
      Height          =   210
      Index           =   2
      Left            =   3945
      TabIndex        =   6
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D1"
      Height          =   210
      Index           =   1
      Left            =   4560
      TabIndex        =   5
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label lblD 
      AutoSize        =   -1  'True
      Caption         =   "D0"
      Height          =   210
      Index           =   0
      Left            =   5160
      TabIndex        =   4
      Top             =   1080
      Width           =   285
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "OUTL"
      Height          =   210
      Left            =   180
      TabIndex        =   1
      Top             =   1140
      Width           =   435
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

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
    Shift8Bit tmp
    
    tmp = 0
    For i = 0 To 7
        If cmdD(i).Caption = "ON" Then tmp = tmp + (2 ^ i)
    Next i
    txtOutL.Text = Hex(tmp)
    Shift8Bit tmp
    LE
End Sub

Private Sub cmdOut_Click()
    Shift8Bit CByte("&H" & txtOutH.Text)
    Shift8Bit CByte("&H" & txtOutL.Text)
    LE
End Sub

Private Sub cmdReset_Click()
    RST
    LE
End Sub

Private Sub Form_Load()
    InitialShiftIn
    RST
    LE
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
