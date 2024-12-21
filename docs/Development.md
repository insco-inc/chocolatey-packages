# Development

# Build

```powershell
choco pack .\manual\artify\artify.nuspec
```

# Local Install

```powershell
# Run as admini
choco install artify --pre --version="0.0.1-alpha1" --source="C:\Users\ying\workspace\kjxbyz\chocolatey-packages"
```

# Push

```powershell
choco push .\artify.0.0.1-alpha1.nupkg --source https://push.chocolatey.org/ -d
```
