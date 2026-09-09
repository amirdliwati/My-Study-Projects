VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Stepper Motor Control"
   ClientHeight    =   2775
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4590
   Icon            =   "LAB06.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2775
   ScaleWidth      =   4590
   StartUpPosition =   3  'Windows Default
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   120
      Max             =   10000
      Min             =   1
      TabIndex        =   6
      Top             =   1800
      Value           =   10000
      Width           =   4095
   End
   Begin VB.CommandButton Command9 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   960
      TabIndex        =   5
      Top             =   1200
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "1 Phase"
      Height          =   975
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   2895
      Begin VB.CommandButton Command2 
         Caption         =   "Right"
         Height          =   375
         Left            =   1680
         TabIndex        =   4
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Left"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Break"
      Height          =   375
      Left            =   3240
      TabIndex        =   1
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Free"
      Height          =   375
      Left            =   3240
      TabIndex        =   0
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i As Integer
Dim Lefts, Rights As Boolean

Private Sub Command1_Click()
    Lefts = False
    Rights = True
    Do
        DoEvents
        Out &H378, 9
        Call delay
        Out &H378, 3
        Call delay
        Out &H378, 6
        Call delay
        Out &H378, 12
        Call delay
    Loop Until Lefts = True
End Sub

Private Sub Command2_Click()
    Lefts = True
    Rights = False
    Do
        DoEvents
        Out &H378, 12
        Call delay
        Out &H378, 6
        Call delay
        Out &H378, 3
        Call delay
        Out &H378, 9
        Call delay
    Loop Until Rights = True
End Sub

Sub delay()
    For i = 1 To HScroll1.Value
        DoEvents
    Next i
End Sub

Private Sub Command3_Click()
    Rights = True
    Lefts = True
    Out &H378, 0
End Sub

Private Sub Command4_Click()
    Rights = True
    Lefts = True
    Out &H378, &H3
End Sub

Private Sub Command9_Click()
    Unload Me
End Sub
