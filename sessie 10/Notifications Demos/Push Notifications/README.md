# Push Notification Demo

Deze map bevat een kleine demo app waarmee je push notificaties kunt versturen en ontvangen. De app bevat geen afhandeling van notificaties. Kijk daarvoor in het voorbeeld van de local notificaties.

De app leunt op CocoaPods. Om dit voorbeeld te kunnen, moet je dit eerst op je systeem installeren. Om dit te installeren, kun je deze post volgen:
http://blog.erikvdwal.nl/blog/2012/10/04/managing-dependencies-with-cocoapods/

De Podfile bestaat al. Je hoeft na installatie van CocoaPods dus enkel 'pod install' uit te voeren.

De backend is een simpele rails app welke devices en tokens registreert en messages kan sturen naar de geregistreerde devices. Je dient echter eerst een geldig provisioning profile en push certificaat te genereren. Google it.