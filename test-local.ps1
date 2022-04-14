New-Item -ItemType Directory test -ErrorAction Ignore

$config = Get-Content ./config.local.json

$config = $config.Replace('{ABSOLUTE_PATH}', $( $(Get-Location).Path.Replace('\','/')))
Set-Content -Path .\test\config.local.json -Value $config


dotnet run --no-restore --project ./../Nota.Site.Generator/Nota.Site.Generator/Nota.Site.Generator.csproj -- --configuration .\test\config.local.json