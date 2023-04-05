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
                    <a href="#descrizione">Descrizione</a>
                    <a href="#30_nov">30 novembre</a>
                    <a href="#1_dic">1 dicembre</a>
                    <a href="#2_dic">2 dicembre</a>
                    <a href="#bibliografia">Bibliografia</a>
                </header>
                <main id="main">
                    <!-- Informazioni titolo -->
                    <section id="first">
                        <h1 id="main-title"> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='full']"/></h1>
                        <h2 id="sub-title"> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/></h2>
                        <h2> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></h2>
                    </section>
                    
                    <h2 id="title_descrizione">Descrizione</h2>
                    
                    <!-- Caratteristiche -->
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
                            <div class="div_text"></div>
                        </div>
                        <!--Giorno 2 dicembre-->
                        <div class="div_giorno" id="div_giorno_2_12">
                            <h1>2 dicembre 1943</h1>
                            <div class="div_text"></div>
                        </div>
                    </section>
                    
                    <!-- Bibliografia -->
                    <section id="bibliografia">
                        <xsl:apply-templates select="//tei:back/tei:div/tei:listBibl" />
                    </section>
                    <!-- Persone -->
                    <section id="persone">
                        <xsl:apply-templates select="//tei:back/tei:div/tei:listPerson" />
                    </section>
                    <!-- Luoghi -->
                    <section id="luoghi">
                        <xsl:apply-templates select="//tei:back/tei:div/tei:listPlace" />
                    </section>
                    <!-- Organizzazioni -->
                    <section id="organizzazioni">
                        <xsl:apply-templates select="//tei:back/tei:div/tei:listOrg" />
                    </section>
                </main>
                <footer id="footer">
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Caratteristiche-->
    <xsl:template match="tei:msDesc">
        <h2>Caratteristiche</h2>
        <div>
            <h3>Titolo:</h3>
            <p><xsl:value-of select="tei:msContents/tei:msItem/tei:title"/></p>
        </div>
        <div>
            <h3>Autore:</h3>
            <p><xsl:value-of select="tei:msContents/tei:msItem/tei:author"/></p>
        </div>
        <h3>Lingua:</h3>
        <p><xsl:value-of select="tei:msContents/tei:msItem/tei:textLang"/></p>
        <h3>Data:</h3>
        <p><xsl:value-of select="tei:msContents/tei:msItem/tei:docDate"/></p>
        <h3>Luogo:</h3>
        <p><xsl:value-of select="tei:msIdentifier/tei:settlement"/>, 
            <xsl:value-of select="tei:msIdentifier/tei:country"/></p>
        <h3>Conservazione:</h3>
        <p><xsl:value-of select="tei:msIdentifier/tei:repository"/>,
            <xsl:value-of select="tei:msIdentifier/tei:collection"/></p>
        <h3>Codice documento:</h3>
        <p><xsl:value-of select="tei:msIdentifier/tei:idno"/></p>
    </xsl:template>
    
    <!-- Descrizione fisica -->
    <xsl:template match="tei:physDesc">
        <h2>Descrizione fisica del diario</h2>
        <h3>Supporto:</h3>
        <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></p>
        <h3>Pagine:</h3>
        <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent/tei:measure"/></p>
        <h3>Condizioni:</h3>
        <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <h3>Mani:</h3>
        <p><xsl:value-of select="tei:handDesc/tei:handNote/tei:p"/></p>
    </xsl:template>
    
    <!-- Storia -->
    <xsl:template match="tei:history">
        <h2>Storia editoriale</h2>
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
</xsl:stylesheet>
