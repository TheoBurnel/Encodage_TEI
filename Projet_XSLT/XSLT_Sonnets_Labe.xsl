<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- 1. INSTRUCTION D'OUTPUT : HTML -->
    <xsl:output method="html" indent="yes"/>
    
    
    <!-- DECLARATION DES VARIABLES -->
    <!-- CHEMINS DES FICHIERS DE SORTIE -->
    
    <xsl:variable name="accueil">
        <xsl:value-of select="concat('accueil','.html')"/>
        <!-- variable pour le contenu de l'accueil -->
    </xsl:variable>
    <xsl:variable name="sonnet1">
        <xsl:value-of select="concat('sonnet1','.html')"/>
        <!-- variable pour le contenu du premier sonnet -->
    </xsl:variable>
    <xsl:variable name="sonnet2">
        <xsl:value-of select="concat('sonnet2','.html')"/>
        <!-- variable pour le contenu du deuxième sonnet -->
    </xsl:variable>
    <xsl:variable name="sonnet3">
        <xsl:value-of select="concat('sonnet3','.html')"/>
        <!-- variable pour le contenu du troisième sonnet -->
    </xsl:variable>
    <xsl:variable name="sonnet4">
        <xsl:value-of select="concat('sonnet4','.html')"/>
        <!-- variable pour le contenu du quatrième sonnet -->
    </xsl:variable>
    <xsl:variable name="index">
        <xsl:value-of select="concat('index','.html')"/>
        <!-- variable pour le contenu de l'index -->
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE HEAD -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="//titleStmt/title"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//editionStmt//persName"/>
                </xsl:attribute>
            </meta>
        </head>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <FOOTER> -->
    <xsl:variable name="footer">
        <footer style="background-color: #dcdcdc; padding: 10px; border-radius: 10px;">
            <p><i><xsl:value-of select="//editionStmt/edition"/>.</i></p>
        </footer>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE CSS DU <BODY> -->
    <xsl:variable name="body_css">
        <xsl:text>margin: 3% auto; background-color: #f2f2f2; text-align: justify; padding: 20px; max-width: 800px;</xsl:text>
    </xsl:variable>
    
    <!-- VARIABLES AVEC LES LIENS DE RETOUR -->
    <xsl:variable name="retour_accueil">
        <i><a href="{$accueil}">Accueil</a></i>
    </xsl:variable>
    
    <xsl:variable name="retour_index">
        <i><a href="{concat('./', $index)}">Index</a></i>
    </xsl:variable>    
    
    <!-- VARIABLE AVEC L'EN-TÊTE DU <BODY> DES PAGES -->
    <xsl:variable name="body_header">
        <div style="text-align: center; margin-bottom: 8%; font-family: Arial, sans-serif; font-size: 16px; background-color: #dcdcdc; padding: 20px; border-radius: 10px;">
            <h2 style="font-size: 1.5em;">Édition en ligne des</h2>
            <h1 style="font-size: 2em; font-style: italic; margin-bottom: 10px;">
                <i><xsl:value-of select="//fileDesc/titleStmt/title"/></i>
            </h1>
            <h3 style="font-size: 1.2em; margin-bottom: 10px;">
                Selon leur version d'origine de la <xsl:value-of select="//sourceDesc//publicationStmt/publisher"/>
            </h3>
            <p style="margin-bottom: 10px;">
                À <xsl:value-of select="//sourceDesc//publicationStmt//settlement"/> en <xsl:value-of select="//sourceDesc//publicationStmt/date"/>
            </p>
        </div>
    </xsl:variable>
    
    <!-- FIN DES DÉCLARATIONS DES VARIABLES -->


    <!-- TEMPLATE MATCH SUR LA RACINE AVEC LES CALL TEMPLATES DES PAGES-->
    <xsl:template match="/">
        <xsl:call-template name="accueil"/>
        <xsl:call-template name="sonnet1"/>
        <xsl:call-template name="sonnet2"/>
        <xsl:call-template name="sonnet3"/>
        <xsl:call-template name="sonnet4"/>
        <xsl:call-template name="index"/>
    </xsl:template>
    
    
    <!-- TEMPLATE DE LA PAGE ACCUEIL -->
    <xsl:template name="accueil">
        <xsl:result-document href="{$accueil}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">  
                        <p><b>Description du projet : </b><xsl:value-of select="//encodingDesc/p"/></p>
                    </div>
                    <div>
                        <p><a href="./{$sonnet1}">Premier sonnet</a> – <a href="./{$sonnet2}">Deuxième sonnet</a> – <a href="./{$sonnet3}">Troisième sonnet</a> – <a href="./{$sonnet4}">Quatrième sonnet</a> – <a href="./{$index}">Index.</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <!-- TEMPLATES DU PREMIER SONNET -->
    <xsl:template name="sonnet1">
        <xsl:result-document href="{$sonnet1}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//text//lg[@type='sonnet' and @n=1]/head"/></h3>
                        <xsl:apply-templates select="//text//lg[@type='sonnet' and @n=1]"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="//text//lg[@type='sonnet' and @n=1]">
        <div style="text-align: justify;">
            <!-- Itérer à travers les lignes de vers -->
            <xsl:for-each select=".//lg[@type='quatrain' or @type='tercet']//l">
                <p><xsl:apply-templates/></p>
                <!-- Vérifier si c'est le dernier l du lg -->
                <xsl:if test="not(following-sibling::l)">
                    <br/>
                </xsl:if>
            </xsl:for-each>
         </div>
                
            <!-- Ajout des liens pour le sonnet suivant, l'accueil et l'index -->
        <div style="position: fixed; top: 50%; right: 10%; transform: translateY(-50%); background-color: #dcdcdc; border-radius: 8px; border: 1px solid #ccc; padding: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); max-width: 25%; margin-right: 20px;">
            <p style="margin-bottom: 5px; font-size: 14px;">> <a href="{$sonnet2}" style="color: #333; text-decoration: none;">Sonnet suivant</a></p>
            <p style="margin-bottom: 5px; font-size: 14px;">
                <xsl:copy-of select="$retour_accueil"/> – <br/><xsl:copy-of select="$retour_index"/>
            </p>
        </div>
    </xsl:template>
    
    <xsl:template match="//note">
        <!-- Suppression des balises 'note' -->
    </xsl:template>
    
    
    <!-- TEMPLATES DU DEUXIÈME SONNET -->
    <xsl:template name="sonnet2">
        <xsl:result-document href="{$sonnet2}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//text//lg[@type='sonnet' and @n=2]/head"/></h3>
                        <xsl:apply-templates select="//text//lg[@type='sonnet' and @n=2]"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//text//lg[@type='sonnet' and @n=2]">
        <div style="text-align: justify;">
            <!-- Itérer à travers les lignes de vers -->
            <xsl:for-each select=".//lg[@type='quatrain' or @type='tercet']//l">
                <p><xsl:apply-templates/></p>
                <!-- Vérifier si c'est le dernier l du lg -->
                <xsl:if test="not(following-sibling::l)">
                    <br/>
                </xsl:if>
            </xsl:for-each>
        </div>
        <!-- Ajout des liens pour le sonnet suivant, l'accueil et l'index -->
        <div style="position: fixed; top: 50%; right: 10%; transform: translateY(-50%); background-color: #dcdcdc; border-radius: 8px; border: 1px solid #ccc; padding: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); max-width: 25%; margin-right: 20px;">
            <p style="margin-bottom: 5px; font-size: 14px;">
                &lt; <a href="{$sonnet1}" style="color: #333; text-decoration: none;">Sonnet précédent</a> – <br/> 
                > <a href="{$sonnet3}" style="color: #333; text-decoration: none;">Sonnet suivant.</a>
            </p>
            <p style="margin-bottom: 5px; font-size: 14px;">
                <xsl:copy-of select="$retour_accueil"/> – <br/><xsl:copy-of select="$retour_index"/>
            </p>
        </div>
        
    </xsl:template>
    
    
    <!-- TEMPLATES DU TROISIÈME SONNET -->
    <xsl:template name="sonnet3">
        <xsl:result-document href="{$sonnet3}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//text//lg[@type='sonnet' and @n=3]/head"/></h3>
                        <xsl:apply-templates select="//text//lg[@type='sonnet' and @n=3]"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//text//lg[@type='sonnet' and @n=3]">
        <div style="text-align: justify;">
            <!-- Itérer à travers les lignes de vers -->
            <xsl:for-each select=".//lg[@type='quatrain' or @type='tercet']//l">
                <p><xsl:apply-templates/></p>
                <!-- Vérifier si c'est le dernier l du lg -->
                <xsl:if test="not(following-sibling::l)">
                    <br/>
                </xsl:if>
            </xsl:for-each>
        </div>
        <!-- Ajout des liens pour le sonnet suivant, l'accueil et l'index -->
        <div style="position: fixed; top: 50%; right: 10%; transform: translateY(-50%); background-color: #dcdcdc; border-radius: 8px; border: 1px solid #ccc; padding: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); max-width: 25%; margin-right: 20px;">
            <p style="margin-bottom: 5px; font-size: 14px;">
                &lt; <a href="{$sonnet2}" style="color: #333; text-decoration: none;">Sonnet précédent</a> – <br/> 
                > <a href="{$sonnet4}" style="color: #333; text-decoration: none;">Sonnet suivant.</a>
            </p>
            <p style="margin-bottom: 5px; font-size: 14px;">
                <xsl:copy-of select="$retour_accueil"/> – <br/><xsl:copy-of select="$retour_index"/>
            </p>
        </div>
    </xsl:template>
    
    
    <!-- TEMPLATES DU QUATRIÈME SONNET -->
    <xsl:template name="sonnet4">
        <xsl:result-document href="{$sonnet4}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3 style="text-align: center; padding-bottom: 2%;"><xsl:value-of select="//text//lg[@type='sonnet' and @n=4]/head"/></h3>
                        <xsl:apply-templates select="//text//lg[@type='sonnet' and @n=4]"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//text//lg[@type='sonnet' and @n=4]">
        <div style="text-align: justify;">
            <!-- Itérer à travers les lignes de vers -->
            <xsl:for-each select=".//lg[@type='quatrain' or @type='tercet']//l">
                <p><xsl:apply-templates/></p>
                <!-- Vérifier si c'est le dernier l du lg -->
                <xsl:if test="not(following-sibling::l)">
                    <br/>
                </xsl:if>
            </xsl:for-each>
        </div>
        <!-- Ajout des liens pour le sonnet suivant, l'accueil et l'index -->
        <div style="position: fixed; top: 50%; right: 10%; transform: translateY(-50%); background-color: #dcdcdc; border-radius: 8px; border: 1px solid #ccc; padding: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); max-width: 25%; margin-right: 20px;">
            <p style="margin-bottom: 5px; font-size: 14px;">
                &lt; <a href="{$sonnet3}" style="color: #333; text-decoration: none;">Sonnet précédent</a>
            </p>
            <p style="margin-bottom: 5px; font-size: 14px;">
                <xsl:copy-of select="$retour_accueil"/> – <br/><xsl:copy-of select="$retour_index"/>
            </p>
        </div>
    </xsl:template>
    
    
    <!-- TEMPLATES DE LA PAGE INDEX -->
    <xsl:template name="index">
        <xsl:result-document href="{$index}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <p>Cet index propose un renvoi des occurences vers les sonnets.
                        Il présente les déclinaisons des thèmes retenus pour l'encodage TEI.
                        Une petite description, issue de l'encodage, complète l'index</p>
                    </div>
                    <!-- Création des index -->
                    <div>
                        <!-- Index des personnes -->
                        <h3>Index des personnes</h3>
                        <!-- Boucle pour les personnes -->
                        <xsl:for-each-group select="//body//persName" group-by="./@xml:id">
                            <div>
                                <xsl:choose>
                                    <xsl:when test="./@xml:id='LL'">
                                        <p><u>Louise Labé :</u></p>
                                        <p><xsl:value-of select="//profileDesc//person[2]/note"/></p>
                                    </xsl:when>
                                    <xsl:when test="./@xml:id='Am'">
                                        <p><u>Amour :</u></p>
                                        <p><xsl:value-of select="//profileDesc//person[3]/note"/></p>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:for-each-group select="current-group()" group-by=".">
                                    <p><i><xsl:value-of select="."/></i> :
                                    <!-- Boucle pour ajouter le numéro du sonnet où apparaissent les entrées d'index -->
                                    <xsl:for-each-group select="current-group()" group-by="ancestor::lg[@type='sonnet']">
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:choose>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='1'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet1"/>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='2'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet2"/>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='3'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet3"/>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='4'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet4"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            <xsl:value-of select="ancestor::lg[@type='sonnet']/@n"/>
                                        </a>
                                        <xsl:if test="position()!= last()">, 
                                        </xsl:if><xsl:if test="position() = last()">.</xsl:if>
                                    </xsl:for-each-group>
                                    </p>
                                </xsl:for-each-group>
                             </div>
                        </xsl:for-each-group>
                    </div>
                    
                    <div>
                        <h2>Index des lieux</h2>
                        <!-- Boucle pour les lieux -->
                        <xsl:for-each-group select="//body//placeName" group-by="./@xml:id">
                            <div>
                                <xsl:choose>
                                    <xsl:when test="./@xml:id='Cr'">
                                        <p><u>Cœur de Louise Labé :</u></p>
                                        <p><xsl:value-of select="//profileDesc//place[@xml:id='Cr']/note"/></p>
                                    </xsl:when>
                                    <xsl:when test="./@xml:id='Yx'">
                                        <p><u>Les yeux et les larmes de Louis Labé :</u></p>
                                        <p><xsl:value-of select="//profileDesc//place[@xml:id='Yx']/note"/></p>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:for-each-group select="current-group()" group-by=".">
                                    <p><i><xsl:value-of select="."/></i> :
                                    <!-- Boucle pour ajouter le numéro du sonnet où apparaissent les entrées d'index -->
                                    <xsl:for-each-group select="current-group()" group-by="ancestor::lg[@type='sonnet']">
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:choose>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='1'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet1"/>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='2'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet2"/>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='3'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet3"/>
                                                    </xsl:when>
                                                    <xsl:when test="ancestor::lg[@type='sonnet']/@n='4'">
                                                        <xsl:text>./</xsl:text><xsl:value-of select="$sonnet4"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            <xsl:value-of select="ancestor::lg[@type='sonnet']/@n"/>
                                        </a>
                                        <xsl:if test="position()!= last()">, 
                                        </xsl:if><xsl:if test="position() = last()">.</xsl:if>
                                    </xsl:for-each-group>
                                    </p>
                                </xsl:for-each-group>
                            </div>
                        </xsl:for-each-group>
                    </div>
                    
                    <div>
                        <p><xsl:copy-of select="$retour_accueil"/> – <a href="./{$sonnet1}">Premier sonnet</a> – <a href="./{$sonnet2}">Deuxième sonnet</a> – <a href="./{$sonnet3}">Troisième sonnet</a> – <a href="./{$sonnet4}">Quatrième sonnet</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
</xsl:stylesheet>