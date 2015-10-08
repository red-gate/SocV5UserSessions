## Enable the migrations alpha

1. Turn on [Frequent Updates](http://documentation.red-gate.com/display/SOC4/Turning+on+Frequent+Updates)
- Update to the latest SQL Source Control version.
- Go to the SQL Source Control config files folder. By default, this is `%LocalAppData%\Red Gate\SQL Source Control 4`
- Open `RedGate_SQLSourceControl_Engine_EngineOptions.xml` in a text editor.
- Inside the `<EngineOptions>` tags, add: `<UseMigrationBlocks>True</UseMigrationBlocks>`
- Ignoring any comments (or other lines you may have added), the final file should look like this:
```xml
<EngineOptions version="3" type="EngineOptions">
  <UseMigrationBlocks>True</UseMigrationBlocks>
</EngineOptions>
```
Restart SQL Server Management Studio.
