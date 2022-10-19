<img src="https://www.overijssel.nl/publish/pages/143537/logo_provincie_overijssel_fc.png" alt="Prov.Overijssel" width="250" style="float: right;display: block;"/>
</br>
</br>
<a name="top"></a>

<!-- omit in toc -->
# Zaaksysteem

Location: [Zaaksysteem]

[Zaaksysteem]: ./README.md
<!-- Markdown Header -->
      Workspace     : Prov.Overijssel
      Path          : Zaaksysteem\README.md
      Author        : John Bontjer
      Created date  : 2022-10-19 


[📁.. Niveau omhoog](../README.md)

<!-- omit in toc -->
# Introduction
 - [ ] Write Introduction Text



<!-- omit in toc -->
# Contents

- [Rx.Enterprise](#rxenterprise)

# Rx.Enterprise 

https://inproces.acceptatie.webbergen.nl/api/document/upload/test.pdf?bronschema=voorstelbehandelen&bronsleutel=2022-000321&contextschema=zaak-document&veldnaam=imageupload1&documenttitel=Test%20van%20Rudy&documenttype=Bijlage 


https://inproces.acceptatie.webbergen.nl/api/document/upload/test.pdf?
  bronschema=voorstelbehandelen
  bronsleutel=2022-000321
  contextschema=zaak-document
  veldnaam=imageupload1
  documenttitel=Test%20van%20Rudy
  documenttype=Bijlage 


https://inproces.acceptatie.webbergen.nl/api/document/upload/@{variables('strBronSleutel')}





    outputs('Get_files_(properties_only)')?['body/value']?['Title']

    outputs('Get_files_(properties_only)')?['body']?['Title']

    outputs('Get_files_(properties_only)')?['body']
    outputs('Get_files_(properties_only)')?['body']?['value']

    outputs('Get_file_content_using_path')?['body']['$content-type']

If you want the first object, you can use the first(…) expression, e.g. to get the first returned item:

    first(outputs('Get_items')?['body']?['value'])

If you want the last one, you can use the last(…) expression, e.g. to get the last returned item:

    last(outputs('Get_items')?['body']?['value'])

Or you can use an index in the array, e.g. to get the 2nd item:

    outputs('Get_items')?['body']?['value'][1]
    
    first(outputs('Get_items')?['body']?['value'])?['ApproverSingle'][0]?['Email']
or
    outputs('Get_items')?['body']?['value'][0]?['ApproverSingle'][0]?['Email']

    first(outputs('Get_file_content_using_path')?['body']['$Name'])

``` 
  "schema": "voorstelbehandelen",
  "docunid": "_XA84287D0183A77419882E397B2AAE71",
  "sleutel": "2022-000321",
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
[Docs]: ../docs/README.md
[Patches]: ../README.md
[Lib]: ../README.md