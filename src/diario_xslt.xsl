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
                </main>
                <footer id="footer">
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!--Lista Template
    <xsl:template match="">
    </xsl:template>-->

</xsl:stylesheet>
