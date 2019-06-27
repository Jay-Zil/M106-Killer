Const ForReading = 1, ForWriting = 2
Dim FSO, FilePath, Fichier


Set FSO = CreateObject("Scripting.FileSystemObject")

If wscript.arguments.length>0 then '-- Si il y a au moins un argument
	FilePath = FSO.GetFile(wscript.arguments.item(0))
	NouveauNom = split(FilePath,".")
	Monfichier = NouveauNom(0) & "_modified.gcode"
Else
	wscript.echo("Pas de fichier a traiter")
	wscript.quit
End If

If FSO.FileExists(FilePath)then '-- Vérifier si le fichier existe
	UnderL6 = 1
	Set Fichier = Fso.OpenTextFile(FilePath, ForReading)
	Set DestFile = Fso.OpenTextFile(Monfichier, ForWriting, true)
	Do until Fichier.AtEndOfStream '-- Faire jusqu'à ce qu'on arrive à la fin du fichier
		Do While UnderL6 '-- Tant qu'on est en dessous de la 7ème couche
			ligne = Fichier.ReadLine
				If instr(ligne, "M106") <> 0 And instr(OldLine, ";LAYER:6") = 0 Then '-- Si M106 est trouvé et LAYER:6 n'est pas trouvé
				'-- Ne rien faire
				Else
					DestFile.WriteLine(ligne)
				End if
			OldLine = ligne
			If instr(OldLine, ";LAYER:6") <> 0 Then '-- Si LAYER:6 est trouvé mettre UnderL6 à 0 pour sortir de la boucle
				UnderL6=0
			End if
		Loop
		ligne = Fichier.ReadLine
		DestFile.WriteLine(ligne)
	Loop
	Fichier.close
	DestFile.close
End If
wscript.quit