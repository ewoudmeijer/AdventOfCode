
[int]$total2 = 0;
[int]$total3 = 0;
$File1 = ".\input.txt";
$db1 = Get-Content .\input.txt;
$db2 = Get-Content .\input.txt;
ForEach ($val1 in $db1)  {
    ForEach ($val2 in $db2) {
        if ($val1 -ne $val2) {
            $res = Compare-Object -ReferenceObject ($val1.ToCharArray()) -DifferenceObject ($val2.ToCharArray()) -PassThru;
            if ($res.Count -eq 2) {
                $res;
                $val1;
                $val2;
                exit(0);
            }
        }
    }
}
