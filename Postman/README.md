<img src="https://www.gasunie.nl/uploads/fckconnector/56f3045d-93d5-5039-8d2f-bb509177eddb/3279663790/attachment.svg" alt="Gasunie N.V. Nederland" width="250" style="float: right;display: block;"/>
<a name="top"></a>

<!-- omit in toc -->
# Postman

Location: [Postman]

[Postman]: ./README.md
<!-- Markdown Header -->
      Workspace     : Prov.Overijssel
      Path          : Postman\README.md
      Author        : John Bontjer - Gasunie N.V. Nederland
      Created date  : 2022-09-07 


[📁.. Niveau omhoog](../README.md)

<!-- omit in toc -->
# Introduction
 - [ ] Write Introduction Text
 - [ ] Write short REST calls for Postman


# Read zaak

OV0756

```
GET
​/api​/zaaktype​/startzaak​/OV20220907001
```

```json
{
    "message": "Geen rechten om zaaktype aan te maken",
    "code": 401,
    "success": false
}
```

# Create Zaak

```
POST
​/api​/zaaktype​/startzaak​/{id}
```

Start een zaak met dit zaaktype. De functie kan worden aangeroepen rechtsreeks op het zaaktype, maar wordt ook vanuit andere content of zaken aangeroepen. Zaak gegevens worden gevuld met gegevens uit dit zaaktype, maar kunnen worden oversch reven door gebruik te maken van zaaktypeafwijking en/of een basis document.



https://inproces.acceptatie.webbergen.nl/api/zaaktype/create/OV20220907001 

## Unauthorized

```
<!doctype html><html lang="en"><head><title>HTTP Status 401 – Unauthorized</title><style type="text/css">body {font-family:Tahoma,Arial,sans-serif;} h1, h2, h3, b {color:white;background-color:#525D76;} h1 {font-size:22px;} h2 {font-size:16px;} h3 {font-size:14px;} p {font-size:12px;} a {color:black;} .line {height:1px;background-color:#525D76;border:none;}</style></head><body><h1>HTTP Status 401 – Unauthorized</h1></body></html>
```


## Example

```
https://inproces.acceptatie.webbergen.nl//api/zaaktype/B0756
```

zie : [GetZaak-output.json](.\Get-Zaak-output.json)

## GET voorstelbehandelen opvragendossier

https://inproces.acceptatie.webbergen.nl/api/voorstelbehandelen/opvragendossier/_XA84287D018318896C3EDCAE5F94CB41