<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:urn="urn:vertexinc:oseries:taxdata:certificate:6:0">
<xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/* | /*/*">
        <xsl:element name="S:{local-name()}" namespace="http://schemas.xmlsoap.org/soap/envelope/">
            <xsl:apply-templates select="node()|@*" />
        </xsl:element>
    </xsl:template>
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
 
</xsl:stylesheet>