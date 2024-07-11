<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8"/> 
    <xsl:template match="/"> 
      <html lang="IT">
        <head> 
          <link rel="stylesheet" type="text/css" href="style.css"/>
          <script src="galleria.js"></script>
          <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
          <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
          <script src="script.js"></script>
          <title>Diari Artom - Codifica digitale</title>
        </head>
              
        <body> 
          <header>
            <div class="nav">
              <nav class="menu">
                <a href="#info">Il manoscritto</a>
                <a href="#descrizione-fisica">Descrizione fisica</a>
                <a href="#gallery">Galleria</a>
                <a href="#trascrizione">Trascrizione</a>
                <a href="#persone">Persone</a>
                <a href="#footer">About</a>
              </nav>
            </div>

            <div class="title">
              <h1><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='it']"/></h1>
              <h2> Edizione digitale delle pagine 128, 129 e 150 del manoscritto originale </h2>
            </div>
          </header>

          <main id="main">
          
            <!-- Informazioni manoscritto--> 
            <section id="info">
              <div class="wrapper">
                <h2>Il manoscritto</h2> 
                <xsl:apply-templates select="//tei:msIdentifier"/>
              </div>
            </section>
            
            <!--Descrizione fisica-->
            <section id="descrizione-fisica">
              <div class="wrapper">
                <h2>Descrizione fisica</h2>
                <xsl:apply-templates select="//tei:physDesc"/>
              </div>
            </section>

            <!--Informazioni codifica-->
            <section id="informazioni-codifica"> 
              <div class="wrapper"> 
                <h2>Informazioni sulla codifica</h2>
                <xsl:apply-templates select="//tei:encodingDesc"/>
              </div>
            </section>

            <!--Contenitore galleria-->
            <section id="gallery">
              <div class="galleria">
                <xsl:apply-templates select="//tei:facsimile" />
                <a class="prev" onclick="plusSlides(-1)">Indietro</a>
                <a class="next" onclick="plusSlides(1)">Avanti</a>
              </div>
            </section>

            <!--Trascrizione diario-->
            <section id="trascrizione">  
              <h2>Trascrizione</h2>
              <section id="legend-section">
              <div class="edit">
                <h2>Legenda</h2>
                <div class="opzioni">
                  <div class="opzione">
                    <label for="corr">Correzioni</label>
                    <input type="checkbox" id="corr"></input>
                  </div>
                  <div class="opzione">
                    <label for="supplied">Aggiunte</label>
                    <input type="checkbox" id="supplied"></input>
                  </div>
                  <div class="opzione">
                    <label for="abbreviazioni">Abbreviazioni</label>
                    <input type="checkbox" id="abbreviazioni"></input>
                  </div>
                  <div class="opzione">
                    <label for="del">Cancellature</label>
                    <input type="checkbox" id="del"></input>
                  </div>
                </div>
              </div>
            </section>
              <div class="pages">
                <xsl:apply-templates select="//tei:text[@subtype='diario']/tei:body" />   
              </div>                            
            </section>

            <!--Persone citate-->
            <section id="persone">  
              <h2>Persone</h2>
              <div class="person">
                <xsl:apply-templates select="//tei:standOff/tei:listPerson" />   
              </div>                            
            </section>


            <!--Footer about-->
            <section id="footer"> 
              <h2>About</h2>
              <div class="footer-container">
                <xsl:apply-templates select="//tei:editionStmt"/>
                <xsl:apply-templates select="//tei:publicationStmt"/>
              </div>
            </section>

          </main> 
      </body>
    </html> 
    </xsl:template>



    <!--TEMPLATES-->



    <!--Informazioni-->
    <xsl:template match="//tei:teiHeader/tei:fileDesc//tei:msIdentifier">
      <div class="infofonte">
        <table class="table-list"><!--Tabella-->
          <tr class="row-list"> <!--Righe-->
            <td class="cell-list"><!--Celle-->
              <span><strong>Titolo</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msContents/tei:msItem/tei:title"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Autore</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msContents/tei:msItem/tei:author"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Lingua</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msContents/tei:msItem/tei:textLang"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Collezione</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msIdentifier/tei:collection"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Manoscritto</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msIdentifier/tei:idno[@type='inventory']"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Luogo di conservazione</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:teiHeader//tei:msIdentifier/tei:repository"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Storia</strong></span>
            </td>
            <td class="cell-list-value">
              <p><xsl:value-of select="../tei:history/tei:origin/tei:p"/></p>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Acquisizione</strong></span>
            </td>
            <td class="cell-list-value">
              <p><xsl:value-of select="../tei:history/tei:acquisition/tei:p"/></p>
            </td>
          </tr>
        </table>
      </div>
    </xsl:template>

    <!--Descrizione fisica-->
    <xsl:template match="//tei:teiHeader/tei:fileDesc//tei:physDesc">
      <div class="desc">
        <table class="table-list">
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Supporto</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:material"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Pagine</strong></span>
            </td>
            <td class="cell-list-value">
              <xsl:value-of select="//tei:extent"/>. 
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Condizioni</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:condition"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Autore</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:handDesc"/></span>
            </td>
          </tr>
          <tr class="row-spacer">
            <td colspan="2">&#160;</td>
          </tr>
          <tr class="row-list">
            <td class="cell-list">
              <span><strong>Stesura</strong></span>
            </td>
            <td class="cell-list-value">
              <span><xsl:value-of select="//tei:typeDesc"/></span>
            </td>
          </tr>
        </table>
      </div>
    </xsl:template>

  <!-- Contenitore della galleria -->
    <xsl:template match="section[@id='gallery']">
      <div class="galleria">
        <xsl:apply-templates select="//tei:facsimile" />
        <a class="prev" onclick="plusSlides(-1)">Indietro</a>
        <a class="next" onclick="plusSlides(1)">Avanti</a>
      </div>
    </xsl:template>

  <!-- Immagini della galleria -->
    <xsl:template match="tei:facsimile">
      <xsl:for-each select="//tei:surface">
        <div class="slides">
          <img class="slide-image" src="img/{tei:graphic/@url}" />
        </div>
      </xsl:for-each>
    </xsl:template>


    <!-- Pagine -->
    <xsl:template match="tei:pb">
      <xsl:element name="h3">
        <xsl:attribute name="id">pagina-<xsl:value-of select="[@n]"/></xsl:attribute>
        <xsl:attribute name="class">section-title</xsl:attribute>
          Pagina <xsl:value-of select="[@n]"/>
      </xsl:element>
    </xsl:template>
    
    <!-- Righe  -->
    <xsl:template match="tei:lb">
      <xsl:element name="br"></xsl:element>
      <xsl:element name="span">
        <xsl:attribute name="id">
          <xsl:value-of select="@facs"/>
        </xsl:attribute>
        <xsl:attribute name="class">row-number</xsl:attribute>
        <xsl:value-of select="@n" />&#160; 
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <!--Correzioni con <sic> e <corr>-->
    <xsl:template match="tei:choice/tei:corr">
      <corr>
        <xsl:element name="span">
          <xsl:attribute name="class">corr</xsl:attribute>
          <xsl:apply-templates />
        </xsl:element>
      </corr>
    </xsl:template>

    <!-- Aggiunte con <supplied> -->
    <xsl:template match="tei:supplied">
      <supplied>
        <xsl:element name="span">
          <xsl:attribute name="class">supplied</xsl:attribute>
          <xsl:apply-templates />
        </xsl:element>
      </supplied>
    </xsl:template>

    <!-- Abbreviazioni con <abbr> e <expan>-->
    <xsl:template match="tei:abbr">
      <xsl:element name="span">
        <xsl:attribute name="class">abbr</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:expan">
      <xsl:element name="span">
        <xsl:attribute name="class">expan</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:template>    

    <!-- Cancellature con <del> -->
    <xsl:template match="tei:del">
      <del>
        <xsl:apply-templates />
      </del>
    </xsl:template>

    <!--Parti mancanti con <gap>-->
    <xsl:template match="tei:gap">
      <xsl:element name="span">
        <xsl:attribute name="class">gap</xsl:attribute>
          <span class="gap">[GAP]</span>
      </xsl:element>
    </xsl:template>

    <!--Note-->
    <xsl:template match="tei:note">
      <span style="display: none;"></span>
    </xsl:template>

    <!-- Persone citate -->
    <xsl:template match="tei:standOff/tei:listPerson">
        <xsl:for-each select="tei:person">
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:value-of select="tei:persName"/> 
                </xsl:element>
                <xsl:if test="tei:note" > 
                    <xsl:element name="p">
                        <xsl:value-of select="tei:note"/>
                    </xsl:element>
                </xsl:if>
                <xsl:element name="br"></xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!--Footer about-->
    <xsl:template match="tei:editionStmt"> 
      <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        <xsl:for-each select="current()/tei:respStmt">
          <p><xsl:value-of select="."/></p>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
      <div class="footer-container">
        <xsl:for-each select="*">
          <p><xsl:value-of select="."/></p>
        </xsl:for-each>
      </div>
    </xsl:template>

</xsl:stylesheet>

