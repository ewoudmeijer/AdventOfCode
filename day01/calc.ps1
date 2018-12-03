[int]$total = 0;
Get-Content .\input.txt | ForEach-Object {
    $total += [int]$_;
}
echo $total;