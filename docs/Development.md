# Development

# Install

```powershell
choco install au
```

# Build

```powershell
choco pack .\manual\artify\artify.nuspec
```

# Local Install

```powershell
# Run as admini
choco install artify --pre --version="0.0.1-alpha3" --source="C:\Users\ying\workspace\insco-inc\chocolatey-packages"
```

# Push

```powershell
choco push .\artify.0.0.1-alpha3.nupkg --api-key=<api key> --source https://push.chocolatey.org/ -d
```
