<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output omit-xml-declaration="yes" indent="yes"/>
  
  <xsl:template match="@* | node()">                  
       <xsl:copy>          
            <xsl:apply-templates select="node() | @*"/>
       </xsl:copy>
  </xsl:template>
  
<xsl:template match="LineItem | Taxes">
    <xsl:element name="{name()}">
        <xsl:for-each select="@*">
        <xsl:element name="{name()}"> <xsl:value-of select="."/> </xsl:element>
        </xsl:for-each>
        <xsl:apply-templates select="node() | @*"/>
    </xsl:element>
</xsl:template>

<xsl:template match="Product | Quantity | Jurisdiction | Imposition | AssistedParameter ">
    <xsl:element name="{name()}"> <xsl:value-of select="."/></xsl:element>
        <xsl:for-each select="@*">
        <xsl:element name="{name()}"> <xsl:value-of select="."/> </xsl:element>
        </xsl:for-each> 
</xsl:template> 
  
</xsl:stylesheet>