<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output omit-xml-declaration="yes" indent="yes"/>

<xsl:template match="/">
	<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:vertexinc:o-series:tps:6:0">
		<soapenv:Header/>
		<soapenv:Body>
			<xsl:apply-templates/>
		</soapenv:Body>
	</soapenv:Envelope>
</xsl:template>

<xsl:template match="node()|@*">                  
  <xsl:copy>
  <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
  </xsl:template>
  
    <xsl:template match="VertexEnvelope/FindTaxAreasRequest/TaxAreaLookup ">
         <xsl:copy>
         <xsl:for-each select="asOfDate | lookupId ">
                   <xsl:attribute name="{name()}"> <xsl:value-of select="text()"/> </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
   </xsl:template>
   <xsl:template match="asOfDate | lookupId "/>
   
    <xsl:template match="*">
	<xsl:element name="urn:{name()}" namespace="urn:vertexinc:o-series:tps:6:0">
		<xsl:copy-of select="namespace::*"/>
		<xsl:apply-templates select="node()|@*"/>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>