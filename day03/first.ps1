$size=1000;
$fabric = New-Object 'int[,]' $size,$size
Get-Content .\input.txt | ForEach-Object {
    $res = $_ -match '#.*@.(\d+),(\d+):.(\d+)x(\d+)';
    for ($i=[int]$matches[1]; $i -lt [int]$matches[1]+[int]$matches[3]; $i++)
    {
        for ($j=[int]$matches[2]; $j -lt [int]$matches[2]+[int]$matches[4]; $j++) 
        {
            $fabric[$i,$j] += 1;
        }
    }
} 
$count=0;
for ($k=0; $k -lt $size; $k++) {
    for ($l=0; $l -lt $size; $l++) {
        if ($fabric[$k,$l] -gt 1) {
          $count++;
        }
    }
}
$count;