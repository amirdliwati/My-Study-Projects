VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2775
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4110
   LinkTopic       =   "Form1"
   ScaleHeight     =   2775
   ScaleWidth      =   4110
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   495
      Left            =   1200
      TabIndex        =   2
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Right"
      Height          =   375
      Left            =   2640
      TabIndex        =   1
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Left"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   720
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Lefts, Rights As Boolean

Private Sub Command1_Click()
    Lefts = True
    Rights = False
    Do
        DoEvents
        Out &H378, 9
        Call delay
        Out &H378, 1
        Call delay
        Out &H378, 3
        Call delay
        Out &H378, 2
        Call delay
        Out &H378, 6
        Call delay
        Out &H378, 4
        Call delay
        Out &H378, 12
        Call delay
        Out &H378, 8
        Call delay
        Out &H378, 0
    Loop Until Rights = True
End Sub

Private Sub Command2_Click()
    Lefts = False
    Rights = True
    Do
        DoEvents
        Out &H378, 8
        Call delay
        Out &H378, 12
        Call delay
        Out &H378, 4
        Call delay
        Out &H378, 6
        Call delay
        Out &H378, 2
        Call delay
        Out &H378, 3
        Call delay
        Out &H378, 1
        Call delay
        Out &H378, 9
        Call delay
        Out &H378, 0
    Loop Until Lefts = True
End Sub

Sub delay()
    Times = Timer
    Do
        DoEvents
    Loop Until Timer >= Times + 0.01
End Sub

Private Sub Command3_Click()
    Lefts = True
    Rights = True
End Sub
