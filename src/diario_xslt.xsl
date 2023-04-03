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
                        <h1 id="main-title"> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                        <h2> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></h2>
                    </section>
                     <!-- Descrizione fisica -->
                    <section class="descrizione">
                        <div class="descrizione_d" id="or_2">
                            <xsl:apply-templates select="//tei:physDesc" />
                        </div>
                    </section>
                    <!-- Storia -->
                    <section class="descrizione">
                        <div class="descrizione_d">
                            <xsl:apply-templates select="//tei:history" />
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
            <xsl:for-each select="tei:person">
                <xsl:element name="li"> 
                    <xsl:for-each select="tei:persName">
                        <b><xsl:value-of select="." />,</b>
                    </xsl:for-each>
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
                    <b><xsl:value-of select="tei:orgName"/>:</b>
                    <xsl:value-of select="tei:desc"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
