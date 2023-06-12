$effektivitaetsliste = (Get-Content .\pokemon.sql).Split([Environment]::NewLine) | Where-Object {$_.StartsWith("INSERT INTO ``typ_effektivitaet`` VALUES ")}
$effektivitaetsliste = $effektivitaetsliste.Replace("INSERT INTO ``typ_effektivitaet`` VALUES ", "),")
$effektivitaetsliste = $effektivitaetsliste -split '\),\('

$list = @()
foreach ($val in $effektivitaetsliste){
    $list += $val.Split(",", 2)[0]
}

$order = @(12,5,17,13,3,2,11,9,0,6,14,10,8,7,1,16,15,4)
$types = @("Boden","Drache","Eis","Elektro","Fee","Feuer","Flug","Geist","Gestein","Gift","Kaefer","Kampf","Normal", "Pflanze", "Psycho","Stahl","Unlicht","Wasser")

Write-Host ("".PadRight(7) + " | ") -NoNewline
foreach ($i in $order){
    Write-Host ($types[$i].PadRight(7) + " | ") -NoNewline
}
Write-Host
foreach ($i in $order){
    Write-Host ("-" * 8) -NoNewline
    foreach ($j in $order){
        Write-Host ("+" + "-" * 9) -NoNewline
    }
    Write-Host "+"
    Write-Host ($types[$i].PadRight(7) + " | ") -NoNewline
    foreach ($j in $order){
        Write-Host (("x" + $list[$j+$i*18]).PadRight(3).PadLeft(6) + "  | ") -NoNewline
    }
    Write-Host
}