Progetto reazlizzato da Matilde Zanelli per l'esame di Codifica di Testi (a.a. 2022-2023) dell'Università di Pisa. Edizione digitale, luglio 2024. Codifica delle pagine 128, 129 e 150 del dei diari di Emanuele Artom, fruibili online al link  http://digital-library.cdec.it/cdec-web/storico/detail/IT-CDEC-ST0003-000006/diari.html

Comando per la validazione del documento XML: 

java -cp "D:/xerces/xml-apis.jar;D:/xerces/xercesImpl.jar;D:/xerces/xercesSamples.jar" dom.Counter -v D:\xerces\progetto.xml

Comando per generare l'output HTML:

java -jar D:\codifica\COD_progetto\saxon-he-10.3.jar -s:D:\codifica\COD_progetto\progetto.xml -xsl:D:\codifica\COD_progetto\style.xsl -o:D:\codifica\COD_progetto\output.html



