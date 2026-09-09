VERSION 5.00
Object = "{A941101E-3B16-4F7E-9847-021F6ED70ABF}#1.0#0"; "amiTapiPro.ocx"
Object = "{58E14049-685B-4606-AEA7-164D0E872875}#1.0#0"; "amiWavePro.ocx"
Begin VB.Form AMIR 
   Caption         =   "ÃåáÇ Èß ÈÇáÈÑäÇãÌ"
   ClientHeight    =   6975
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8970
   LinkTopic       =   "Form1"
   ScaleHeight     =   6975
   ScaleWidth      =   8970
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame6 
      Caption         =   "ÏÑÇÓÉ ÊÍÑßÇÊ ÇáãÓÊÎÏã"
      Height          =   2895
      Left            =   4680
      TabIndex        =   14
      Top             =   3360
      Width           =   4095
      Begin VB.CommandButton Command1 
         Caption         =   "&ãÓÍ ÇáÊÛíÑÇÊ"
         Height          =   495
         Left            =   1320
         TabIndex        =   16
         Top             =   2160
         Width           =   1575
      End
      Begin VB.TextBox TextCallState 
         Height          =   1695
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Top             =   240
         Width           =   3615
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "ÅØÝÇÁ ÇáÃÌåÒÉ íÏæíÇ"
      Height          =   1455
      Left            =   4680
      TabIndex        =   12
      Top             =   1680
      Width           =   4095
      Begin VB.CommandButton Command5 
         Caption         =   "ÅØÝÇÁ"
         Height          =   855
         Left            =   1200
         TabIndex        =   13
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "ÊÔÛíá ÇáÃÌåÒÉ íÏæíÇ"
      Height          =   1455
      Left            =   4680
      TabIndex        =   9
      Top             =   120
      Width           =   4095
      Begin VB.CommandButton Command4 
         Caption         =   "ÊÔÛíá ÇáÌåÇÒ ÇáËÇäí"
         Height          =   855
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   1335
      End
      Begin VB.CommandButton Command3 
         Caption         =   "ÊÔÛíá ÇáÌåÇÒ ÇáÃæá"
         Height          =   855
         Left            =   2280
         TabIndex        =   10
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "ááÅÌÇÈÉ íÏæíÇ"
      Height          =   1455
      Left            =   120
      TabIndex        =   7
      Top             =   3240
      Width           =   4095
      Begin VB.CommandButton Command2 
         Caption         =   "&ÞØÚ ÇáÎØ"
         Height          =   735
         Left            =   2160
         TabIndex        =   17
         Top             =   360
         Width           =   1575
      End
      Begin VB.CommandButton CommandManualAnswer 
         Caption         =   "&ÃÝÊÍ ÇáÎØ"
         Height          =   735
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "ÃÎÊíÇÑ ÚÏÏ ÇáÑäÇÊ"
      Height          =   1455
      Left            =   120
      TabIndex        =   4
      Top             =   1680
      Width           =   4095
      Begin VB.TextBox TextRingsBeforeAnswer 
         Height          =   285
         Left            =   1560
         TabIndex        =   5
         Text            =   "2"
         Top             =   840
         Width           =   735
      End
      Begin VB.CheckBox CheckAutoAnswer 
         Caption         =   "ÊÝÚíá ÎíÇÑ ÇáÅÌÇÈÉ ÈÚÏ ßã ÑäÉ"
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   2775
      End
      Begin VB.Label Label2 
         Caption         =   "ÃÎÊÑ ÚÏÏ ÇáÑäÇÊ"
         Height          =   255
         Left            =   360
         TabIndex        =   6
         Top             =   840
         Width           =   1335
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "ÊÝÚíá ÇáãæÏíã"
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
      Begin VB.ComboBox ComboLineName 
         Height          =   315
         Left            =   1200
         TabIndex        =   1
         Text            =   "ÃÎÊíÇÑ ÇáãæÏíã"
         Top             =   480
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "ÃÎÊÑ ÇáãæÏíã"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   1695
      End
   End
   Begin AMITAPIPROLibCtl.amTapiPro amTapiPro1 
      Left            =   7920
      Top             =   6360
      Enabled         =   0   'False
      MediaMode       =   16
      CallPrivilege   =   4
   End
   Begin AMIWAVEPROLibCtl.amWavePro amWavePro1 
      Left            =   7080
      Top             =   6360
      _cx             =   847
      _cy             =   847
      PlayFilename    =   ""
      RecordFilename  =   ""
      PlayVolume      =   0
      RecordLevel     =   0
      RecordFormat    =   2
      SilenceLevel    =   25
      SilenceTimer    =   1000
      PlayBufferLength=   2
      RecordBufferLength=   1
      SilenceDeletion =   0   'False
   End
End
Attribute VB_Name = "AMIR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub amTapiPro1_DigitReceived(ByVal Digit As String)
TextCallState.SelText = "Digit received " & Digit & vbCrLf

If Digit = 1 Then
Out &H378, &H9
End If
If Digit = 2 Then
Out &H378, &HA
End If
End Sub

Private Sub amTapiPro1_IncomingCall(ByVal RingNumber As Long)
     CommandManualAnswer.Enabled = True
     TextCallState.SelText = "Ringing " & RingNumber & vbCrLf
    If CheckAutoAnswer.Value = 1 Then
        If RingNumber >= CLng(TextRingsBeforeAnswer.Text) Then amTapiPro1.Answer
    End If
End Sub
Private Sub ComboLineName_Click()
    If amTapiPro1.LineOpen Then amTapiPro1.LineOpen = False
    amTapiPro1.LineName = ComboLineName.Text
    amTapiPro1.LineOpen = True
    
    End Sub

Private Sub Command1_Click()
 TextCallState.Text = ""
End Sub

Private Sub Command2_Click()
amTapiPro1.HangUp
End Sub

Private Sub Command3_Click()
Out &H378, &H9
End Sub
Private Sub Command4_Click()
Out &H378, &HA
End Sub
Private Sub Command5_Click()
Out &H378, 0
End Sub
Private Sub CommandManualAnswer_Click()
  amTapiPro1.Answer
End Sub
Private Sub Form_Load()
    Dim X As Long
    Dim LineName As String
    amTapiPro1.MediaMode = AUTOMATEDVOICE
    amTapiPro1.CallPrivilege = OWNER
    ComboLineName.Text = "íÌÑí ÇáßÔÝ Úä ÇáãäÇÝÐ"
    For X = 0 To amTapiPro1.NumberOfLines - 1
        LineName = amTapiPro1.GetLineName(X)
        If ((amTapiPro1.TapiNegotiatedVersion > 0) And ((amTapiPro1.DevCaps And AUTOMATEDVOICE) > 0)) Then
            ComboLineName.AddItem LineName
        End If
    Next X
End Sub

