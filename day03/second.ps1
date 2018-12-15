$size=1000;
$fabric = New-Object 'int[,]' $size,$size
$overblijvers = New-Object 'int[,]' $size,$size
$all = @()
$dubbele = @()
$gevonden = @()
Get-Content .\input.txt | ForEach-Object {
    $res = $_ -match '#(\d+).@.(\d+),(\d+):.(\d+)x(\d+)';
    $all += [int]$matches[1];
    $unique=$true;
    for ($i=[int]$matches[2]; $i -lt [int]$matches[2]+[int]$matches[4]; $i++)
    {
        for ($j=[int]$matches[3]; $j -lt [int]$matches[3]+[int]$matches[5]; $j++) 
        {
            if ([int]$fabric[$i,$j] -gt 0) {
                $unique=$false;
                if ($dubbele -notcontains [int]$matches[1]) {
                    $dubbele += [int]$matches[1];
                }
                if ($dubbele -notcontains [int]$fabric[$i,$j]) {
                    $dubbele += [int]$fabric[$i,$j];
                }
            }
            [int]$fabric[$i,$j] = [int]$matches[1];
        }
    }
    if ($unique -eq $true){
        $gevonden += [int]$matches[1];
    }
} 
$over = $gevonden | ? { $dubbele -notcontains $_}
$over
