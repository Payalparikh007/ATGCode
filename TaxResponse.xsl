<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:urn="urn:vertexinc:o-series:tps:6:0">
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
    <xsl:template match="urn:LineItem | urn:Taxes">
        <xsl:element name="{name()}">
            <xsl:for-each select="@*">
                <xsl:element name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="urn:FlexibleFields">
        <xsl:for-each select="*">
            <xsl:element name="FlexibleFields">
                <xsl:call-template name="set"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name ="set" match="urn:Product| urn:Quantity | urn:Jurisdiction | urn:Imposition | urn:AssistedParameter">
        <xsl:element name="{name()}">
            <xsl:value-of select="."/>
        </xsl:element>
        <xsl:for-each select="@*">
            <xsl:element name="{name()}">
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>