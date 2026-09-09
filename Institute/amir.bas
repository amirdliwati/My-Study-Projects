Attribute VB_Name = "inpout"
'Declare Inp and Out for port I/O
#If Win32 Then
    Public Declare Sub Out Lib "io.dll" Alias "PortOut" (ByVal Port As Integer, ByVal Data As Byte)
    Public Declare Function Inp Lib "io.dll" Alias "PortIn" (ByVal Port As Integer) As Byte
#Else
    Declare Function Inp Lib "InpOut.DLL" (ByVal Port As Integer) As Byte
    Declare Sub Out Lib "InpOut.DLL" (ByVal Port As Integer, ByVal Value As Byte)
#End If
