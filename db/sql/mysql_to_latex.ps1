function print($sql, $id) {
    $sql = $sql.Split("`n")

    Write-Host "\setcounter{rownum}{0}`n\begin{tabular}{$(if ($true -eq $id) {"I|"} else {})$("T"*($sql[1].Split("|").Length - 2))}`n$(" "*4)\rowcolor{gray!35}`n$(" "*4)" -NoNewline
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

print "+-----+------------+---------+---------+------------+------------+--------------+
| ID  | Name       | Groesse | Gewicht | Generation | PrimaerTyp | SekundaerTyp |
+-----+------------+---------+---------+------------+------------+--------------+
>|   4 | Glumanda   |     0.6 |     8.5 |          1 | Feuer      | NULL         |
>|   5 | Glutexo    |     1.1 |      19 |          1 | Feuer      | NULL         |
>|   6 | Glurak     |     1.7 |    90.5 |          1 | Feuer      | Flug         |
|  37 | Vulpix     |     0.6 |     9.9 |          1 | Feuer      | NULL         |
|  38 | Vulnona    |     1.1 |    19.9 |          1 | Feuer      | NULL         |
|  58 | Fukano     |     0.7 |      19 |          1 | Feuer      | NULL         |
|  59 | Arkani     |     1.9 |     155 |          1 | Feuer      | NULL         |
|  77 | Ponita     |       1 |      30 |          1 | Feuer      | NULL         |
|  78 | Gallopa    |     1.7 |      95 |          1 | Feuer      | NULL         |
| 126 | Magmar     |     1.3 |    44.5 |          1 | Feuer      | NULL         |
| 136 | Flamara    |     0.9 |      25 |          1 | Feuer      | NULL         |
| 146 | Lavados    |       2 |      60 |          1 | Feuer      | Flug         |
| 155 | Feurigel   |     0.5 |     7.9 |          2 | Feuer      | NULL         |
| 156 | Igelavar   |     0.9 |      19 |          2 | Feuer      | NULL         |
| 157 | Tornupto   |     1.7 |    79.5 |          2 | Feuer      | NULL         |
| 218 | Schneckmag |     0.7 |      35 |          2 | Feuer      | NULL         |
| 219 | Magcargo   |     0.8 |      55 |          2 | Feuer      | Gestein      |
| 228 | Hunduster  |     0.6 |    10.8 |          2 | Unlicht    | Feuer        |
| 229 | Hundemon   |     1.4 |      35 |          2 | Unlicht    | Feuer        |
| 240 | Magby      |     0.7 |    21.4 |          2 | Feuer      | NULL         |
| 244 | Entei      |     2.1 |     198 |          2 | Feuer      | NULL         |
| 250 | Ho-Oh      |     3.8 |     199 |          2 | Feuer      | Flug         |
| 255 | Flemmli    |     0.4 |     2.5 |          3 | Feuer      | NULL         |
| 256 | Jungglut   |     0.9 |    19.5 |          3 | Feuer      | Kampf        |
| 257 | Lohgock    |     1.9 |      52 |          3 | Feuer      | Kampf        |
| 322 | Camaub     |     0.7 |      24 |          3 | Feuer      | Boden        |
| 323 | Camerupt   |     1.9 |     220 |          3 | Feuer      | Boden        |
| 324 | Qurtel     |     0.5 |    80.4 |          3 | Feuer      | NULL         |
| 390 | Panflam    |     0.5 |     6.2 |          4 | Feuer      | NULL         |
| 391 | Panpyro    |     0.9 |      22 |          4 | Feuer      | Kampf        |
| 392 | Panferno   |     1.2 |      55 |          4 | Feuer      | Kampf        |
| 467 | Magbrant   |     1.6 |      68 |          4 | Feuer      | NULL         |
| 485 | Heatran    |     1.7 |     430 |          4 | Feuer      | Stahl        |
| 494 | Victini    |     0.4 |       4 |          5 | Psycho     | Feuer        |
| 498 | Floink     |     0.5 |     9.9 |          5 | Feuer      | NULL         |
| 499 | Ferkokel   |       1 |    55.5 |          5 | Feuer      | Kampf        |
| 500 | Flambirex  |     1.6 |     150 |          5 | Feuer      | Kampf        |
| 513 | Grillmak   |     0.6 |      11 |          5 | Feuer      | NULL         |
| 514 | Grillchita |       1 |      28 |          5 | Feuer      | NULL         |
| 554 | Flampion   |     0.6 |    37.5 |          5 | Feuer      | NULL         |
| 555 | Flampivian |     1.3 |    92.9 |          5 | Feuer      | NULL         |
| 607 | Lichtel    |     0.3 |     3.1 |          5 | Geist      | Feuer        |
| 608 | Laternecto |     0.6 |      13 |          5 | Geist      | Feuer        |
| 609 | Skelabra   |       1 |    34.3 |          5 | Geist      | Feuer        |
| 631 | Furnifra�  |     1.4 |      58 |          5 | Feuer      | NULL         |
| 636 | Ignivor    |     1.1 |    28.8 |          5 | K�fer      | Feuer        |
| 637 | Ramoth     |     1.6 |      46 |          5 | K�fer      | Feuer        |
| 643 | Reshiram   |     3.2 |     330 |          5 | Drache     | Feuer        |
| 653 | Fynx       |     0.4 |     9.4 |          6 | Feuer      | NULL         |
| 654 | Rutena     |       1 |    14.5 |          6 | Feuer      | NULL         |
| 655 | Fennexis   |     1.5 |      39 |          6 | Feuer      | Psycho       |
| 662 | Dartignis  |     0.7 |      16 |          6 | Feuer      | Flug         |
| 663 | Fiaro      |     1.2 |    24.5 |          6 | Feuer      | Flug         |
| 667 | Leufeo     |     0.6 |    13.5 |          6 | Feuer      | Normal       |
| 668 | Pyroleo    |     1.5 |    81.5 |          6 | Feuer      | Normal       |
| 721 | Volcanion  |     1.7 |     195 |          6 | Feuer      | Wasser       |
| 725 | Flamiau    |     0.4 |     4.3 |          7 | Feuer      | NULL         |
| 726 | Miezunder  |     0.7 |      25 |          7 | Feuer      | NULL         |
| 727 | Fuegro     |     1.8 |      83 |          7 | Feuer      | Unlicht      |
| 741 | Choreogel  |     0.6 |     3.4 |          7 | Feuer      | Flug         |
| 757 | Molunk     |     0.6 |     4.8 |          7 | Gift       | Feuer        |
| 758 | Amfira     |     1.2 |    22.2 |          7 | Gift       | Feuer        |
| 776 | Tortunator |       2 |     212 |          7 | Feuer      | Drache       |
| 806 | Kopplosio  |     1.8 |      13 |          7 | Feuer      | Geist        |
| 813 | Hopplo     |     0.3 |     4.5 |          8 | Feuer      | NULL         |
| 814 | Kickerlo   |     0.6 |       9 |          8 | Feuer      | NULL         |
| 815 | Liberlo    |     1.4 |      33 |          8 | Feuer      | NULL         |
| 838 | Wagong     |     1.1 |      78 |          8 | Gestein    | Feuer        |
| 839 | Montecarbo |     2.8 |   310.5 |          8 | Gestein    | Feuer        |
| 850 | Thermopod  |     0.7 |       1 |          8 | Feuer      | K�fer        |
>| 851 | Infernopod |       3 |     120 |          8 | Feuer      | K�fer        |
+-----+------------+---------+---------+------------+------------+--------------+" $true