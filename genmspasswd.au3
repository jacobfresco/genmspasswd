#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Misc.au3>
#include <Process.au3>

Dim $passwd
Dim $sName = "GenPass"
Dim $sVersion = "0.1"
Dim $Menu

; $Menu = $sName & " " & $sVersion & @CRLF & @CRLF & "1 - Generate complex password (32 characters)" @CRLF & @CRLF & "2 - Generate a password in Microsoft-style"
$hoofdletter = 1
$letters = 1
$nummers = 4

Dim $Consonants[21] = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]
Dim $Vowels[5] = ["A", "E", "I", "O", "U"]
Dim $Alphabet[26] = ["A", "E", "I", "O", "U", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]
Dim $Extra[5] = ["!", "#", "$", "@", "%"]
Dim $Extra2[5] = ["-", "_", "^", "&", "*"]

Func _Main()

	_RunDos("cls")

	For $i = 1 To $hoofdletter
		$passwd = StringUpper($Consonants[Random(0, 20, 1)])
	Next

	For $i = 1 To $letters
		$passwd = $passwd & StringLower($Vowels[Random(0, 4, 1)])
	Next

	For $i = 1 To $hoofdletter
		$passwd = $passwd & StringLower($Consonants[Random(0, 20, 1)])
	Next

	For $i = 1 To $letters
		$passwd = $passwd & StringLower($Vowels[Random(0, 4, 1)])
	Next

	For $i = 1 To $nummers
		$passwd = $passwd & Chr(Random(48, 57, 1)) ;0-9
	Next

	For $i = 1 To $letters
		$passwd = $passwd & StringLower($Extra[Random(0, 4, 1)])
	Next

	ClipPut($passwd)

	ConsoleWrite("Your password = " & $passwd & @CRLF & @CRLF & "Het wachtwoord is gekopieerd naar het Klembord. Druk F1 om een nieuw wachtwoord te generen of op de spatiebalk om af te sluiten!")

EndFunc   ;==>_Main

_Main()


While 1

	Select

		Case _IsPressed("70")
			While _IsPressed("70")
				Sleep(250)
			WEnd
			$passwd = Null
			_Main()

		Case _IsPressed("20")
			ExitLoop

	EndSelect

WEnd

