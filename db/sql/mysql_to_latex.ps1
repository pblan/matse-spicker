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

print "+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
>| ID           | int          | NO   | PRI | NULL    |       |
>| Name         | varchar(255) | NO   |     | NULL    |       |
>| Groesse      | float        | NO   |     | NULL    |       |
>| Gewicht      | float        | NO   |     | NULL    |       |
>| Generation   | int          | NO   | MUL | NULL    |       |
>| PrimaerTyp   | varchar(255) | YES  | MUL | NULL    |       |
>| SekundaerTyp | varchar(255) | YES  | MUL | NULL    |       |
+--------------+--------------+------+-----+---------+-------+" $true