# How to get started from scratch

If you stumbled upon TcOpen, you probably already have all the stuff you need. You have Visual Studio and you have installed TwinCAT 3. That's pretty much everything you need.

Your project looks like this. It's probably a bit more complex than this.
![plc visual studio twincat 3](assets/plc_visual_studio.png).


-  Create a new C# project (.NET Standard 2.0 class library) in your solution and name it `PlcProjectConnector`
- Expand your newly created project, right click on `Dependencies` and select `Manage NuGet Packages`.
- Click on `Browse`, search for `TcOpen.TcoCoreConnector` and click on Install
- If you have [Inxton Builder extension](https://marketplace.visualstudio.com/items?itemName=Inxton.InxtonVortexBuilderExtensionPre) just click on the Inxton build icon.
    - If you don't have it expand `Dependencies`-> `Packages` in your Solution Explorer and right click on `TcOpen.TcoCoreConnector` and select `Open folder in File Explorer`. You will get to your NuGet folder (in my case `C:\Users\jozef.chmelar.ml.MTS\.nuget\packages\tcopen.tcocoreconnector\0.4.2-alpha.453` ). There's a directory called `lib` and in it there's TwinCAT library `TcoCore.library` 
-  Install this library as you would a regular TwinCAT library. Tutorial by Beckhoff [here](https://infosys.beckhoff.com/english.php?content=../content/1033/tc3_plc_intro/4189333259.html&id=).


Now that you have TcOpen in your project I recommend to read more about it [here](../application.md).

If you prefer a working template check out [TcOpen.Hammer](https://github.com/TcOpenGroup/TcOpen.Hammer)