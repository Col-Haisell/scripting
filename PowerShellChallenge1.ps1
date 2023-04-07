for ($num = 0 ; $num -le 9 ; $num++){ "$num" | Out-File -FilePath ".\Pins1.txt" -Append}
    (get-content -Path .\Pins1.txt) -replace '(\d{1})', '000$1'|
        Set-Content -Path '.\Pins1.txt'
for ($num = 10 ; $num -le 99 ; $num++){ "$num" | Out-File -FilePath ".\Pins10.txt"  -Append}
    (get-content -Path .\Pins10.txt) -replace '(\d{2})', '00$1'|
        Set-Content -Path '.\Pins10.txt'
for ($num = 100 ; $num -le 999 ; $num++){ "$num" | Out-File -FilePath ".\Pins100.txt"  -Append}
    (get-content -Path .\Pins100.txt) -replace '(\d{3})', '0$1'|
        Set-Content -Path '.\Pins100.txt'
for ($num = 1000 ; $num -le 1000 ; $num++){ "$num" | Out-File -FilePath ".\Pins1000.txt"  -Append}
Get-Content .\Pins1.txt, .\Pins10.txt, .\Pins100.txt, .\Pins1000.txt | Out-File .\PinNumbers.txt  -Append