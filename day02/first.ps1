[int]$total2 = 0;
[int]$total3 = 0;
Get-Content .\input.txt | ForEach-Object {
    if (($_.GetEnumerator() | group -NoElement | Where-Object -Property Count -EQ 2).Count -gt 1) {
      $total2++;
    }
    if (($_.GetEnumerator() | group -NoElement | Where-Object -Property Count -EQ 3).Count -gt 1) {
      $total3++;
    }
 }
echo ($total2*$total3);

