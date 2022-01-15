function print($sql, $id) {
    $sql = $sql.Split("`n")

    Write-Host "\begin{tabular}{$(if ($true -eq $id) {"I|"} else {})$("T"*($sql[1].Split("|").Length - 2))}`n$(" "*4)\rowcolor{gray!35}`n$(" "*4)" -NoNewline
    foreach ($column in $sql[1].Split("|")[1..($sql[1].Split("|").Length - 2)]){
        Write-Host "& \multicolumn{1}{T}{$($column.Trim())} " -NoNewline
    }
    Write-Host "\\\hline"
    $i = 0
    $lasti = $i
    foreach ($row in $sql[3..($sql.Length - 2)]){
        $i += 1
        if (!$row.StartsWith(">")){
            continue
        }
        if ($i -ne $lasti + 1){
            Write-Host "$(" "*4)\multicolumn{1}{c|}{\dots} & \multicolumn{$($row.Split("|").Length - 2)}{c}{\dots} \\"
        }
        Write-Host "$(" "*4)$(if ($true -eq $id) {"$i "} else {})" -NoNewline
        $first = $true
        foreach ($column in $row.Split("|")[1..($row.Split("|").Length - 2)]){
            Write-Host "$(if ($true -eq $id -or $false -eq $first) {"& "} else {})$($column.Trim()) " -NoNewline
            $first = $false
        }
        Write-Host "\\"
        $lasti = $i
    }
    Write-Host "\end{tabular}"
}

print "+-----+----------------------------+---------+---------+
| ID  | Name                       | Staerke | Typ     |
+-----+----------------------------+---------+---------+
>|   5 | Megahieb                   |      80 | Normal  |
>|   8 | Eishieb                    |      75 | Eis     |
>|  13 | Klingensturm               |      80 | Normal  |
|  19 | Fliegen                    |      90 | Flug    |
|  21 | Slam                       |      80 | Normal  |
|  25 | Megakick                   |     120 | Normal  |
|  26 | Sprungkick                 |     100 | Kampf   |
|  34 | Bodyslam                   |      85 | Normal  |
|  36 | Bodycheck                  |      90 | Normal  |
|  37 | Fuchtler                   |     120 | Normal  |
|  38 | Risikotackle               |     120 | Normal  |
|  56 | Hydropumpe                 |     110 | Wasser  |
|  57 | Surfer                     |      90 | Wasser  |
|  58 | Eisstrahl                  |      90 | Eis     |
|  59 | Blizzard                   |     110 | Eis     |
|  63 | Hyperstrahl                |     150 | Normal  |
|  65 | Bohrschnabel               |      80 | Flug    |
|  66 | �berroller                 |      80 | Kampf   |
|  70 | St�rke                     |      80 | Normal  |
|  76 | Solarstrahl                |     120 | Pflanze |
|  80 | Bl�ttertanz                |     120 | Pflanze |
|  85 | Donnerblitz                |      90 | Elektro |
|  87 | Donner                     |     110 | Elektro |
|  89 | Erdbeben                   |     100 | Boden   |
|  91 | Schaufler                  |      80 | Boden   |
| 120 | Finale                     |     200 | Normal  |
| 121 | Eierbombe                  |     100 | Normal  |
| 124 | Schlammbad                 |      65 | Gift    |
| 126 | Feuersturm                 |     110 | Feuer   |
| 127 | Kaskade                    |      80 | Wasser  |
| 130 | Sch�delwumme               |     130 | Normal  |
| 136 | Turmkick                   |     130 | Kampf   |
| 138 | Traumfresser               |     100 | Psycho  |
| 141 | Blutsauger                 |      80 | K�fer   |
| 143 | Himmelsfeger               |     140 | Flug    |
| 152 | Krabbhammer                |     100 | Wasser  |
| 153 | Explosion                  |     250 | Normal  |
| 158 | Hyperzahn                  |      80 | Normal  |
| 161 | Triplette                  |      80 | Normal  |
| 177 | Luftsto�                   |     100 | Flug    |
| 188 | Matschbombe                |      90 | Gift    |
| 192 | Blitzkanone                |     120 | Elektro |
| 200 | Wutanfall                  |     120 | Drache  |
| 221 | L�uterfeuer                |     100 | Feuer   |
| 223 | Wuchtschlag                |     100 | Kampf   |
| 224 | Vielender                  |     120 | K�fer   |
| 231 | Eisenschweif               |     100 | Stahl   |
| 238 | Kreuzhieb                  |     100 | Kampf   |
| 242 | Knirscher                  |      80 | Unlicht |
| 245 | Turbotempo                 |      80 | Normal  |
| 248 | Seher                      |     120 | Psycho  |
| 253 | Aufruhr                    |      90 | Normal  |
| 264 | Power-Punch                |     150 | Kampf   |
| 276 | Kraftkoloss                |     120 | Kampf   |
| 284 | Eruption                   |     150 | Feuer   |
| 291 | Taucher                    |      80 | Wasser  |
| 304 | Schallwelle                |      90 | Normal  |
| 306 | Zermalmklaue               |      75 | Normal  |
| 307 | Lohekanonade               |     150 | Feuer   |
| 308 | Aquahaubitze               |     150 | Wasser  |
| 309 | Sternenhieb                |      90 | Stahl   |
| 315 | Hitzekoller                |     130 | Feuer   |
| 323 | Fontr�nen                  |     150 | Wasser  |
| 324 | Ampelleuchte               |      75 | K�fer   |
| 327 | Himmelhieb                 |      85 | Kampf   |
| 330 | Lehmbr�he                  |      90 | Wasser  |
| 338 | Flora-Statue               |     150 | Pflanze |
| 340 | Sprungfeder                |      85 | Flug    |
| 344 | Volttackle                 |     120 | Elektro |
| 348 | Laubklinge                 |      90 | Pflanze |
| 353 | Kismetwunsch               |     140 | Stahl   |
| 354 | Psyschub                   |     140 | Psycho  |
| 359 | Hammerarm                  |     100 | Kampf   |
| 369 | Kehrtwende                 |      70 | K�fer   |
| 370 | Nahkampf                   |     120 | Kampf   |
| 387 | Zuflucht                   |     140 | Normal  |
| 394 | Flammenblitz               |     120 | Feuer   |
| 396 | Aurasph�re                 |      80 | Kampf   |
| 398 | Gifthieb                   |      80 | Gift    |
| 399 | Finsteraura                |      80 | Unlicht |
| 401 | Nassschweif                |      90 | Wasser  |
| 402 | Samenbomben                |      80 | Pflanze |
| 404 | Kreuzschere                |      80 | K�fer   |
| 405 | K�fergebrumm               |      90 | K�fer   |
| 407 | Drachensto�                |     100 | Drache  |
| 411 | Fokussto�                  |     120 | Kampf   |
| 412 | Energieball                |      90 | Pflanze |
| 413 | Sturzflug                  |     120 | Flug    |
| 414 | Erdkr�fte                  |      90 | Boden   |
| 416 | Gigasto�                   |     150 | Normal  |
| 431 | Kraxler                    |      90 | Normal  |
| 434 | Draco Meteor               |     130 | Drache  |
| 437 | Bl�ttersturm               |     130 | Pflanze |
| 438 | Blattgei�el                |     120 | Pflanze |
| 439 | Felswerfer                 |     150 | Gestein |
| 440 | Giftstreich                |      70 | Gift    |
| 441 | M�lltreffer                |     120 | Gift    |
| 444 | Steinkante                 |     100 | Gestein |
| 449 | Urteilskraft               |     100 | Normal  |
| 452 | Holzhammer                 |     120 | Pflanze |
| 454 | Schlagbefehl               |      90 | K�fer   |
| 457 | Kopfsto�                   |     150 | Gestein |
| 459 | Zeitenl�rm                 |     150 | Drache  |
| 460 | Raumschlag                 |     100 | Drache  |
| 463 | Lavasturm                  |     100 | Feuer   |
| 465 | Schocksamen                |     120 | Pflanze |
| 467 | Schemenkraft               |     120 | Geist   |
| 474 | Giftschock                 |      65 | Gift    |
| 482 | Schlammwoge                |      95 | Gift    |
| 485 | Synchrol�rm                |     120 | Psycho  |
| 492 | Schmarotzer                |      95 | Unlicht |
| 503 | Siedewasser                |      80 | Wasser  |
| 517 | Inferno                    |     100 | Feuer   |
| 518 | Wassers�ulen               |      80 | Wasser  |
| 520 | Pflanzens�ulen             |      80 | Pflanze |
| 528 | Stromsto�                  |      90 | Elektro |
| 529 | Schlagbohrer               |      80 | Boden   |
| 533 | Sanctoklinge               |      90 | Kampf   |
| 537 | Quetschwalze               |      65 | K�fer   |
| 539 | Nachtflut                  |      85 | Unlicht |
| 540 | Psychosto�                 |     100 | Psycho  |
| 542 | Orkan                      |     110 | Flug    |
| 543 | Steinsch�del               |     120 | Normal  |
| 545 | Flammenball                |     100 | Feuer   |
| 546 | Techblaster                |     120 | Normal  |
| 547 | Urgesang                   |      75 | Normal  |
| 548 | Mystoschwert               |      85 | Kampf   |
| 550 | Blitzschlag                |     130 | Elektro |
| 551 | Blauflammen                |     130 | Feuer   |
| 553 | Frostvolt                  |     140 | Eis     |
| 554 | Frosthauch                 |     140 | Eis     |
| 556 | Eiszapfhagel               |      85 | Eis     |
| 557 | V-Generator                |     180 | Feuer   |
| 558 | Kreuzflamme                |     100 | Feuer   |
| 559 | Kreuzdonner                |     100 | Elektro |
| 560 | Flying Press               |     100 | Kampf   |
| 562 | R�lpser                    |     120 | Gift    |
| 572 | Bl�tenwirbel               |      90 | Pflanze |
| 583 | Knuddler                   |      90 | Fee     |
| 585 | Mondgewalt                 |      95 | Fee     |
| 586 | �berschallknall            |     140 | Normal  |
| 591 | Diamantsturm               |     100 | Gestein |
| 592 | Dampfschwall               |     110 | Wasser  |
| 613 | Unheilsschwingen           |      80 | Flug    |
| 614 | Tausend Pfeile             |      90 | Boden   |
| 615 | Tausend Wellen             |      90 | Boden   |
| 616 | Bodengewalt                |      90 | Boden   |
| 617 | Lux Calamitatis            |     140 | Fee     |
| 618 | Ursprungswoge              |     110 | Wasser  |
| 619 | Abgrundsklinge             |     120 | Boden   |
| 620 | Zenitst�rmer               |     120 | Flug    |
| 621 | Dimensionswahn             |     100 | Unlicht |
| 658 | Perfektes Pika-Projektil   |     210 | Elektro |
| 660 | �berrumpler                |      90 | K�fer   |
| 663 | Dark Lariat                |      85 | Unlicht |
| 664 | Schaumserenade             |      90 | Wasser  |
| 665 | Eishammer                  |     100 | Eis     |
| 667 | Pferdest�rke               |      95 | Boden   |
| 669 | Solarklinge                |     125 | Pflanze |
| 675 | Neck Strike                |      80 | Unlicht |
| 676 | Pollenkn�del               |      90 | K�fer   |
| 679 | Anfallen                   |      80 | K�fer   |
| 682 | Ausbrennen                 |     130 | Feuer   |
| 686 | Wecktanz                   |      90 | Normal  |
| 687 | Sanktionskern              |     100 | Drache  |
| 690 | Schnabelkanone             |     100 | Flug    |
| 691 | Schuppenrasseln            |     110 | Drache  |
| 695 | Schatten-Pfeilregen        |     180 | Geist   |
| 696 | Hyper Dark Crusher         |     180 | Unlicht |
| 697 | Grandiose Meeressymphonie  |     195 | Wasser  |
| 699 | Sternbild des Seelenraubes |     195 | Geist   |
| 700 | Blitz-Wellenritt           |     175 | Elektro |
| 701 | Schluss mit lustig         |     210 | Normal  |
| 703 | Supernova des Ursprungs    |     185 | Psycho  |
| 704 | Panzerfalle                |     150 | Feuer   |
| 705 | Kanonenbouquet             |     130 | Fee     |
| 707 | Fruststampfer              |      75 | Boden   |
| 710 | Aquadurchsto�              |      85 | Wasser  |
| 711 | Prisma-Laser               |     160 | Psycho  |
| 713 | Stahlgestirn               |     100 | Stahl   |
| 714 | Schattenstrahl             |     100 | Geist   |
| 718 | Multi-Angriff              |     120 | Normal  |
| 719 | Tausendfacher Donnerblitz  |     195 | Elektro |
| 720 | Knallkopf                  |     150 | Feuer   |
| 721 | Plasmaf�uste               |     100 | Elektro |
| 722 | Photonen-Geysir            |     100 | Psycho  |
| 723 | Licht des Erl�schens       |     200 | Psycho  |
| 724 | Schmetternde Sonnenwalze   |     200 | Stahl   |
| 725 | Geballter Mondlaser        |     200 | Geist   |
| 726 | Herzliche Knuddelkloppe    |     190 | Fee     |
| 727 | Fataler Steinregen         |     190 | Gestein |
| 728 | Rasselnder Seelentanz      |     185 | Drache  |
| 730 | Pl�tschersurfer            |      90 | Wasser  |
| 731 | Schwebesturz               |      90 | Flug    |
| 737 | Qu�lzone                   |      80 | Unlicht |
| 738 | Sprie�bomben               |     100 | Pflanze |
| 739 | Klirrfrost                 |     100 | Eis     |
| 740 | Glitzersturm               |     120 | Fee     |
| 744 | Dynamax-Kanone             |     100 | Drache  |
| 745 | Pr�zisionsschuss           |      80 | Wasser  |
| 746 | Fesselbiss                 |      80 | Unlicht |
| 755 | Kiemenbiss                 |      85 | Wasser  |
| 757 | Dyna-Brand                 |     100 | Feuer   |
| 776 | Body Press                 |      80 | Kampf   |
| 778 | Trommelschl�ge             |      80 | Pflanze |
| 780 | Feuerball                  |     120 | Feuer   |
| 781 | Gigantenhieb               |     100 | Stahl   |
| 782 | Gigantensto�               |     100 | Stahl   |
| 783 | Aura-Rad                   |     110 | Elektro |
| 787 | Apfels�ure                 |      80 | Pflanze |
| 788 | Gravitation                |      80 | Pflanze |
| 790 | Wunderdampf                |      90 | Fee     |
| 793 | Kniefalltrick              |      80 | Unlicht |
| 794 | Sternensturm               |     150 | Kampf   |
| 795 | Unendynastrahlen           |     160 | Drache  |
| 796 | Stahlstrahl                |     140 | Stahl   |
| 798 | Eisenwalze                 |     130 | Stahl   |
| 800 | Meteorstrahl               |     120 | Gestein |
| 801 | Muschelwaffe               |      90 | Gift    |
| 802 | Nebelexplosion             |     100 | Fee     |
| 806 | Krabbelkracher             |      70 | K�fer   |
| 808 | Frustventil                |      75 | Unlicht |
| 809 | Poltergeist                |     110 | Geist   |
| 815 | Brandsand                  |      70 | Boden   |
| 817 | Finstertreffer             |      80 | Unlicht |
| 820 | Drachenkr�fte              |     150 | Drache  |
| 822 | Brennender Zorn            |      90 | Unlicht |
| 823 | Donnernder Tritt           |      90 | Kampf   |
| 824 | Blizzardlanze              |     130 | Eis     |
>| 825 | Astralfragmente            |     120 | Geist   |
+-----+----------------------------+---------+---------+" $true