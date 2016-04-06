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
 
   <xsl:template match="VertexEnvelope/InvoiceRequest">
         <xsl:copy>
         <xsl:for-each select="documentDate | documentNumber | postingDate | transactionType">
                   <xsl:attribute name="{name()}"> <xsl:value-of select="text()"/> </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
   </xsl:template>
   <xsl:template match="documentDate | documentNumber | postingDate | transactionType"/>
      
   
    <xsl:template match="VertexEnvelope/InvoiceRequest/LineItem">
         <xsl:copy>
         <xsl:for-each select="transactionType | lineItemId | lineItemNumber | taxDate">
                   <xsl:attribute name="{name()}"> <xsl:value-of select="text()"/> </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
    </xsl:template>
    <xsl:template match="transactionType | lineItemId | lineItemNumber | taxDate"/>
   
    <xsl:template match="VertexEnvelope/InvoiceRequest/LineItem/Product">
         <xsl:copy>
         <xsl:for-each select="productClass">
                   <xsl:attribute name="{name()}"> <xsl:value-of select="text()"/> </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
    </xsl:template>
    <xsl:template match="productClass"/>
        
        
        <xsl:template match="VertexEnvelope/InvoiceRequest/FlexibleFields/FlexibleCodeField">
         <xsl:copy>
         <xsl:for-each select="fieldId">
                   <xsl:attribute name="{name()}"> <xsl:value-of select="text()"/> </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
   </xsl:template>
   <xsl:template match="fieldId"/>
        
        
        
        <xsl:template match="VertexEnvelope/InvoiceRequest/FlexibleFields/FlexibleDateField">
         <xsl:copy>
         <xsl:for-each select="fieldId">
                   <xsl:attribute name="{name()}"> <xsl:value-of select="text()"/> </xsl:attribute>
         </xsl:for-each>
         <xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
   </xsl:template>
   <xsl:template match="fieldId"/>

        
   
   <xsl:template match="Quantity[following-sibling::unitOfMeasure]">
  <xsl:copy>
    <xsl:attribute name="unitOfMeasure">
        <xsl:value-of select="following-sibling::unitOfMeasure"/>
    </xsl:attribute>
     <xsl:value-of select="."/>
  </xsl:copy>
</xsl:template>
<xsl:template match="unitOfMeasure"/>
    
    <xsl:template match="Currency">
    <xsl:copy>
    <xsl:attribute name="isoCurrencyCodeAlpha">
        <xsl:value-of select="text()"/>
    </xsl:attribute>
    </xsl:copy>
    </xsl:template>
   
   <xsl:template match="*">
	<xsl:element name="urn:{name()}" namespace="urn:vertexinc:o-series:tps:6:0">
		<xsl:copy-of select="namespace::*"/>
		<xsl:apply-templates select="node()|@*"/>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>