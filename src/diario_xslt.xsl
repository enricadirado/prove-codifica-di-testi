<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
     <xsl:template match="/">
        <html lang="IT">
            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
                <!--css-->
                <link rel="stylesheet" type="text/css" href="diario_css.css" />
                <!--font-->
                <link href="" rel="stylesheet" />
                <!--javascript-->
                <!--<script src="diario_js.js"></script>-->
                <!--JQuery-->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js" integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>
                <script src="js/main.js"></script>
            </head>
            <body>
                <header id="header" class="topnav">
                    <a href="#main_descrizione">Descrizione</a>
                    <a href="#div_giorno_30_11">30 novembre</a>
                    <a href="#div_giorno_1_12">1 dicembre</a>
                    <a href="#div_giorno_2_12">2 dicembre</a>
                    <a href="#bibliografia">Bibliografia</a>
                    <a href="#main_riferimenti">Riferimenti</a>
                </header>
                <main id="main">
                    <!-- Informazioni titolo -->
                    <section id="first">
                        <h1 id="main-title"> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='full']"/></h1>
                        <h2 id="sub-title"> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/></h2>
                        <h2> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></h2>
                    </section>
                    
                    <!-- Caratteristiche -->
                    <section id="main_descrizione">
                        <h2 id="title_descrizione">Descrizione</h2>
                        <section class="descrizione">
                            <div class="descrizione_d">
                                <xsl:apply-templates select="//tei:msDesc" />
                            </div>
                        </section>
                        <!-- Descrizione fisica -->
                        <section class="descrizione">
                            <div class="descrizione_d">
                                <xsl:apply-templates select="//tei:physDesc" />
                            </div>
                        </section>
                        <!-- Storia -->
                        <section class="descrizione">
                            <div class="descrizione_d">
                                <xsl:apply-templates select="//tei:history" />
                            </div>
                        </section>
                    </section>
                    
                   <!--Sezione immagini-->
                   <section id="main_section_img">
                        <div id="div_img">
                            <div id="photos">
                                <xsl:apply-templates select="//tei:facsimile" /> <!--Immagini facsimile-->
                            </div>
                            <div id="photos_description">
                                <p id="desc_pag24" class="desc_img">Pagina 24</p>
                                <p id="desc_pag25" class="desc_img">Pagina 25</p>
                                <p id="desc_pag26" class="desc_img">Pagina 26</p>
                                <p id="desc_pag27" class="desc_img">Pagina 27</p>
                                <p id="desc_pag28" class="desc_img">Pagina 28</p>
                            </div>
                        </div>
                        <div id="div_buttons">
                            <button id="btn_back"><img src="img/back_img.png" alt="back_img" id="back_img"/></button>
                            <button id="btn_next"><img src="img/next_img.png" alt="next_img" id="next_img"/></button>
                        </div>
                    </section>
                    <div class="bottoni_categ">
                            <button id="cancellatura">Cancellature</button>
                            <button id="correzione">Correzioni</button>
                            <button id="abbreviazione">Abbreviazioni</button>
                            <button id="normalizzazione">Normalizzazioni</button>
                            <button id="aggiunta">Aggiunte</button>   
                            <button id="persona">Persone</button>
                            <button id="luogo">Luoghi</button>
                            <button id="organizzazione">Organizzazioni</button>
                            <button id="data">Date</button>
                        </div>
                    
                    <!--Sezione testo-->
                    <section id="main_section_text">
                        <!--Giorno 30 novembre-->
                        <div class="div_giorno" id="div_giorno_30_11">
                            <h1>30 Novembre 1943</h1>
                            <div class="div_text">
                                <xsl:apply-templates select="//tei:ab[@xml:id = 'd30_11']" />
                            </div>
                        </div>
                        <!--Giorno 1 dicembre-->
                        <div class="div_giorno" id="div_giorno_1_12">
                            <h1>1 dicembre 1943</h1>
                            <div class="div_text">
                                <xsl:apply-templates select="//tei:ab[@xml:id = 'd1_12']" />
                            </div>
                        </div>
                        <!--Giorno 2 dicembre-->
                        <div class="div_giorno" id="div_giorno_2_12">
                            <h1>2 dicembre 1943</h1>
                            <div class="div_text">
                                <xsl:apply-templates select="//tei:ab[@xml:id = 'd2_12']" />
                            </div>
                        </div>
                    </section>
                    
                    <!--Liste-->
                    <section id="main_liste">
                        <!-- Persone -->
                        <section id="persone" class="list_flex">
                            <xsl:apply-templates select="//tei:back/tei:div/tei:listPerson" />
                        </section>
                        <!-- Luoghi -->
                        <section id="luoghi" class="list_flex">
                            <xsl:apply-templates select="//tei:back/tei:div/tei:listPlace" />
                        </section>
                        <!-- Organizzazioni -->
                        <section id="organizzazioni" class="list_flex">
                            <xsl:apply-templates select="//tei:back/tei:div/tei:listOrg" />
                        </section>
                    </section>
                    
                    <!-- Bibliografia -->
                    <section id="bibliografia">
                        <div id="main_bibliografia">
                            <h2>Bibliografia</h2>
                            <xsl:apply-templates select="//tei:back/tei:div/tei:listBibl" />
                        </div>
                    </section>
                </main>
                <footer id="footer">
                    <section id="main_riferimenti">
                        <h2>Riferimenti</h2>
                        <xsl:apply-templates select="//tei:editionStmt"/>
                    </section>
                </footer>
            </body>
        </html>
    </xsl:template>
    
        <!-- Caratteristiche-->
    <xsl:template match="tei:msDesc">
        <h2>Caratteristiche</h2>
        <div id="line1" class="line_caratteristiche"> </div>
        <div class="div_inline">
            <h3>Titolo:</h3>
            <p><xsl:value-of select="tei:msContents/tei:msItem/tei:title"/></p>
        </div>
        <div class="div_inline">
            <h3>Autore:</h3>
            <p><xsl:value-of select="tei:msContents/tei:msItem/tei:author"/></p>
        </div>
        <div class="div_inline">
            <h3>Lingua:</h3>
            <p><xsl:value-of select="tei:msContents/tei:msItem/tei:textLang"/></p>
        </div>
        <div class="div_inline">
            <h3>Data:</h3>
            <p><xsl:value-of select="tei:msContents/tei:msItem/tei:docDate"/></p>
        </div>
        <div class="div_inline">
            <h3>Luogo:</h3>
            <p><xsl:value-of select="tei:msIdentifier/tei:settlement"/>, 
                <xsl:value-of select="tei:msIdentifier/tei:country"/></p>
        </div>
        <div class="div_inline">
            <h3>Conservazione:</h3>
            <p><xsl:value-of select="tei:msIdentifier/tei:repository"/>,
                <xsl:value-of select="tei:msIdentifier/tei:collection"/></p>
        </div>
        <div class="div_inline">
            <h3>Codice documento:</h3>
            <p><xsl:value-of select="tei:msIdentifier/tei:idno"/></p>
        </div>
    </xsl:template>

    <!-- Descrizione fisica -->
    <xsl:template match="tei:physDesc">
        <h2>Descrizione fisica del diario</h2>
        <div id="line2" class="line_caratteristiche"> </div>
        <div class="div_inline">
            <h3>Supporto:</h3>
            <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></p>
        </div>
        <div class="div_inline">
            <h3>Pagine:</h3>
            <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent/tei:measure"/></p>
        </div>
        <div class="div_inline">
            <h3>Condizioni:</h3>
            <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        </div>
        <div class="div_inline">
            <h3>Mani:</h3>
            <p><xsl:value-of select="tei:handDesc/tei:handNote/tei:p"/></p>
        </div>
    </xsl:template>

    <!-- Storia -->
    <xsl:template match="tei:history">
        <h2>Storia editoriale</h2>
        <!--<xsl:element name="img">
                <xsl:attribute name="class">img_class_drop</xsl:attribute>
                <xsl:attribute name="id">drop</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                <xsl:attribute name="alt">Pagina <xsl:value-of select="tei:graphic/@n"/></xsl:attribute>
        </xsl:element>-->
        <!--<img src="img/drop.png" alt="drop icon" id="drop"></img>
        <img src="img/drop2.png" alt="drop icon" id="drop2"></img>-->
        <div id="line3" class="line_caratteristiche"> </div>
        <p><xsl:value-of select="tei:origin/tei:p"/></p>
    </xsl:template>
    
    <!--Immagini facsimile-->
    <xsl:template match="tei:facsimile">
        <xsl:for-each select="tei:surface">
            <xsl:element name="img">
                <xsl:attribute name="class">img_class</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                <xsl:attribute name="alt">Pagina <xsl:value-of select="tei:graphic/@n"/></xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!--Testo-->
    <xsl:template match="tei:ab[@xml:id = 'd30_11']">
        <xsl:apply-templates/> <!--???-->
    </xsl:template>

    <xsl:template match="tei:lb">
        <xsl:if test="@rend='double stroke'">
            <span class="aCapo">
                <xsl:text>=</xsl:text>
            </span>
        </xsl:if>
        <xsl:element name="br"></xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">numero_riga</xsl:attribute>
            <xsl:value-of select="@n" />
            <xsl:text>     </xsl:text>
        </xsl:element>
    </xsl:template>
    
     <xsl:template match = "tei:del">
        <span class = "del" hidden = 'hidden'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "tei:del/tei:gap">
        <span class = "del_gap" hidden = 'hidden'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "tei:choice/tei:abbr">
        <span class = 'abbr'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match = "tei:ab/tei:abbr">
        <span class = 'abbr_1'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:expan">
        <span class = "expan" hidden = 'hidden'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
     <xsl:template match = "tei:reg">
        <span class = 'reg'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:orig">
        <span class = "orig" hidden = 'hidden'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:corr">
        <span class = 'corr'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match = "tei:sic">
        <span class = "sic" hidden = 'hidden'>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Bibliografia -->
    <xsl:template match="tei:listBibl">
        <h2>Bibliografia</h2>
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                <xsl:element name="li">  
                    <b><xsl:value-of select="tei:title"/></b>,
                    <xsl:for-each select="tei:author">
                        <xsl:value-of select="." />,
                    </xsl:for-each>
                    <xsl:for-each select="tei:pubPlace/tei:placeName">
                        <xsl:value-of select="."/>,
                    </xsl:for-each>
                    <xsl:value-of select="tei:publisher"/>,
                    <xsl:value-of select="tei:date"/>
                </xsl:element>
                <p>A cura di<xsl:value-of select="tei:editor"/></p>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- Persone -->
    <xsl:template match="tei:listPerson">
        <h2>Persone</h2>
        <xsl:element name="ul">
            <xsl:for-each select="tei:person[position()&lt;=8]">
                <xsl:element name="li"> 
                    <xsl:for-each select="tei:persName">
                        <b><xsl:value-of select="tei:forename" /></b>
                        <xsl:text> </xsl:text>
                        <b><xsl:value-of select="tei:surname" /></b>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- Luoghi -->
    <xsl:template match="tei:listPlace">
        <h2>Luoghi</h2>
        <xsl:element name="ul">
            <xsl:for-each select="tei:place[position()&lt;=3]">
                <xsl:element name="li"> 
                    <b><xsl:value-of select="tei:placeName">
                    </xsl:value-of>, </b>
                    <xsl:value-of select="tei:country">
                    </xsl:value-of>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>  
    </xsl:template>
    
    <!-- Organizzazioni -->
    <xsl:template match="tei:listOrg">
        <h2>Organizzazioni</h2>
        <xsl:element name="ul">
            <xsl:for-each select="tei:org">
                <xsl:element name="li"> 
                    <b><xsl:value-of select="tei:orgName"/></b>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!--Riferimenti-->
    <xsl:template match="//tei:editionStmt">
        <p><xsl:value-of select="tei:edition"/></p>
        <xsl:for-each select="tei:respStmt"> 
            <p>
                <span><xsl:value-of select="tei:resp"/></span>
                <span><xsl:value-of select="tei:name"/></span>
            </p>
        </xsl:for-each>        
    </xsl:template>
</xsl:stylesheet>
