Progetto svolto per l'esame di Codifica di Testi dell'Università di Pisa
Comando per validazione documento XML 
java -cp "D:/xerces/xml-apis.jar;D:/xerces/xercesImpl.jar;D:/xerces/xercesSamples.jar" dom.Counter -v D:\xerces\progetto.xml
Comando per generare output HTML 
java -jar D:\codifica\COD_progetto\saxon-he-10.3.jar -s:D:\codifica\COD_progetto\progetto.xml -xsl:D:\codifica\COD_progetto\style.xsl -o:D:\codifica\COD_progetto\output.html
