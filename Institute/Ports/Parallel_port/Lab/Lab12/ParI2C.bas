Attribute VB_Name = "modParallelI2C"
Option Explicit
Public Declare Sub Out Lib "io.dll" Alias "PortOut" (ByVal Addr As Integer, ByVal Data As Byte)
Public Declare Function Inp Lib "io.dll" Alias "PortIn" (ByVal Addr As Integer) As Byte

Public Sub I2CStart()
    SDA_H
    SCL_H
    SDA_L
    SCL_L
End Sub

Public Sub I2CStop()
    SDA_L
    SCL_H
    SDA_H
End Sub

Public Sub Send0()
    SDA_L
    SCL_H
    SCL_L
End Sub

Public Sub Send1()
    SDA_H
    SCL_H
    SCL_L
End Sub

Public Function Ack() As Boolean
    Ack = Not Rd_SDA
    SCL_H
    SCL_L
End Function

Public Sub MAck()
    SDA_L
    SCL_H
    SCL_L
End Sub

Public Sub MNAck()
    SCL_H
    SCL_L
End Sub

Public Function Read8Bit() As Byte
Dim Dat1 As Integer
Dim i As Integer
    For i = 7 To 0 Step -1
        If Rd_SDA Then    'Read SDA
            Dat1 = (2 ^ i) Or Dat1
        End If
        SCL_H
        SCL_L
    Next i
    Read8Bit = Dat1                           'Data 8 Bit
End Function

Public Sub Send8BIT(Data As Byte)
Dim i As Integer
    For i = 7 To 0 Step -1                ' Loop 7 Cycle
        If (Data And 2 ^ i) = 2 ^ i Then   'Test Bit 0 OR 1
            Call Send1
        Else
            Call Send0
        End If
    Next i
End Sub

Private Sub SDA_L()
    Out &H37A, Inp(&H37A) And &HFE    'SDA=0
End Sub

Private Sub SDA_H()
    Out &H37A, Inp(&H37A) Or 1     'SDA=1
End Sub

Private Sub SCL_L()
    Out &H37A, Inp(&H37A) And &HFD   'SCL=0
End Sub

Private Sub SCL_H()
    Out &H37A, Inp(&H37A) Or 2    'SCL=1
End Sub

Private Function Rd_SDA() As Boolean
    SDA_H
    Rd_SDA = (Inp(&H379) And &H80) <> &H80
End Function

