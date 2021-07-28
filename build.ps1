rm -r _site/ -erroraction silentlycontinue 
rm -r bin/ -erroraction silentlycontinue 
rm -r obj/ -erroraction silentlycontinue 
dotnet build -v m
Start-Process .\docs\index.html