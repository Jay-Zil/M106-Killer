# M106-Killer
Je suis passé de Simplify3D 4.1 à Cura 4 et la différence est que l'on peut
configurer Simplify3D comme nous le souhaitons pour le refroidissement mais
Cura fera augmenter de façon proportionnel la vitesse de refroidissement depuis
la couche initiale jusqu'à la couche où vous aurez configurer la vitesse régulière.
Seulement si je mets du refroidissement sur les premières couches ma pièce a tendance à warper,
j'ai donc fait un petit script pour supprimer les premières lignes de refroidissement (commande M106) dans le GCode.
Il y a deux scripts:
  - Le premier supprime le refroidissement sur les 6 premières couches car c'est mon réglage de base.
  - Le second nous permet d'entrer la couche à laquelle votre vitesse régulière est configurée.
  
Il suffira de cliquer/déposer votre GCode sur le fichier M106 Killer.vbs de votre choix pour qu'un
nouveau soit généré à l'emplacement de celui d'origine avec _modified.gcode à la fin, le GCode d'origine
n'étant pas supprimé.
