<img src="./Assets/MyLogo.png" alt="Prov.Overijssel" width="350" style="float: right"/>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<a name="top"></a>

<!-- omit in toc -->
# Sequence diagram

Location: [ScriDocspts]
<!-- Markdown Header -->
      Workspace     : Prov.Overijssel
      Path          : docs\sequenceDiagram.md
      Author        : John Bontjer - ilionx - Management Consulting Noord 
      Created date  : 2022-07-20 


[📁.. Niveau omhoog](../README.md)

```mermaid
sequenceDiagram
participant SharePoint
participant Koppeling
participant Roxit

SharePoint-->>+Koppeling: Start upload
Koppeling-->>+Roxit: Maak nieuwe Zaak aan
Roxit -->>+Koppeling: Zaak aangemaaakt, dit is het nummer <ZaakNummer>
Koppeling-->>+SharePoint: Onthoud dit nummer <ZaakNummer>
SharePoint-->>+Koppeling:Besluitstukken
Koppeling -->>Roxit: Deze bestanden koppelen
Koppeling-->>+Roxit: Deze bestanden horen bij <ZaakNummer>
Roxit -->>+Koppeling: Geupload
Koppeling-->>+SharePoint: Klaar + URL naar zaak
```

-----
[Top]

<!-- Hieronder staan de hidden referenties  --> 
<!-- ----------------------------- -->
[📁.. Niveau omhoog]

[Niveau omhoog]: ../README.md
[📁.. Niveau omhoog]: ../README.md
[Top]: #top

[Scripts]: ../README.md
[Docs]: ../README.md
[Patches]: ../README.md
[Lib]: ../README.md