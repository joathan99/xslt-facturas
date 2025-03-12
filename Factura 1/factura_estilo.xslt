<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes" encoding="UTF-8"/>

<xsl:template match="/">
<html>
<head>
<title>Factura <xsl:value-of select="FacturaE/Factura/Numero"/></title>
<style>
body { font-family: Arial, sans-serif; margin: 0; padding: 20px; color: #333; }
.factura { max-width: 800px; margin: 0 auto; border: 1px solid #ddd; padding: 30px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
.cabecera { display: flex; justify-content: space-between; border-bottom: 2px solid #eee; padding-bottom: 20px; margin-bottom: 20px; }
.logo { font-size: 24px; font-weight: bold; color: #2c3e50; }
.info-factura { text-align: right; }
.info-factura h2 { margin: 0; color: #2c3e50; }
.detalles { display: flex; justify-content: space-between; margin-bottom: 30px; }
.emisor, .receptor { width: 48%; }
h3 { color: #2c3e50; border-bottom: 1px solid #eee; padding-bottom: 10px; }
table { width: 100%; border-collapse: collapse; margin: 20px 0; }
th { background-color: #f9f9f9; text-align: left; padding: 10px; border-bottom: 2px solid #ddd; }
td { padding: 10px; border-bottom: 1px solid #eee; }
.total-row td { border-top: 2px solid #ddd; font-weight: bold; }
.subtotal { text-align: right; }
.footer { margin-top: 30px; border-top: 1px solid #eee; padding-top: 20px; font-size: 12px; color: #777; text-align: center; }
</style>
</head>
<body>
<div class="factura">
<div class="cabecera">
<div class="logo">
<xsl:value-of select="FacturaE/Emisor/Nombre"/>
</div>
<div class="info-factura">
<h2>FACTURA</h2>
<p><strong>Número:</strong> <xsl:value-of select="FacturaE/Factura/Numero"/></p>
<p><strong>Fecha:</strong> <xsl:value-of select="FacturaE/Factura/Fecha"/></p>
</div>
</div>

<div class="detalles">
<div class="emisor">
<h3>Datos del Emisor</h3>
<p><strong>Empresa:</strong> <xsl:value-of select="FacturaE/Emisor/Nombre"/></p>
<p><strong>CIF:</strong> <xsl:value-of select="FacturaE/Emisor/CIF"/></p>
<p><strong>Dirección:</strong> <xsl:value-of select="FacturaE/Emisor/Direccion/Calle"/></p>
<p><strong>Ciudad:</strong> <xsl:value-of select="FacturaE/Emisor/Direccion/Ciudad"/>, <xsl:value-of select="FacturaE/Emisor/Direccion/CodigoPostal"/></p>
<p><strong>País:</strong> <xsl:value-of select="FacturaE/Emisor/Direccion/Pais"/></p>
</div>

<div class="receptor">
<h3>Datos del Cliente</h3>
<p><strong>Cliente:</strong> <xsl:value-of select="FacturaE/Receptor/Nombre"/></p>
<p><strong>CIF:</strong> <xsl:value-of select="FacturaE/Receptor/CIF"/></p>
<p><strong>Dirección:</strong> <xsl:value-of select="FacturaE/Receptor/Direccion/Calle"/></p>
<p><strong>Ciudad:</strong> <xsl:value-of select="FacturaE/Receptor/Direccion/Ciudad"/>, <xsl:value-of select="FacturaE/Receptor/Direccion/CodigoPostal"/></p>
<p><strong>País:</strong> <xsl:value-of select="FacturaE/Receptor/Direccion/Pais"/></p>
</div>
</div>

<h3>Conceptos Facturados</h3>
<table>
<thead>
<tr>
<th>Descripción</th>
<th>Cantidad</th>
<th>Precio Unit.</th>
<th>IVA</th>
<th>Subtotal</th>
</tr>
</thead>
<tbody>
<xsl:for-each select="FacturaE/Factura/Conceptos/Concepto">
<xsl:variable name="subtotal" select="Cantidad * PrecioUnitario"/>
<tr>
<td><xsl:value-of select="Descripcion"/></td>
<td><xsl:value-of select="Cantidad"/></td>
<td><xsl:value-of select="PrecioUnitario"/> €</td>
<td><xsl:value-of select="IVA"/>%</td>
<td class="subtotal"><xsl:value-of select="$subtotal"/> €</td>
</tr>
</xsl:for-each>

<xsl:variable name="base_imponible" select="sum(FacturaE/Factura/Conceptos/Concepto/Cantidad * FacturaE/Factura/Conceptos/Concepto/PrecioUnitario)"/>
<xsl:variable name="iva_porcentaje" select="FacturaE/Factura/Conceptos/Concepto/IVA"/>
<xsl:variable name="importe_iva" select="$base_imponible * $iva_porcentaje div 100"/>

<tr>
<td colspan="4" style="text-align: right;"><strong>Base imponible</strong></td>
<td class="subtotal"><xsl:value-of select="$base_imponible"/> €</td>
</tr>
<tr>
<td colspan="4" style="text-align: right;"><strong>IVA (<xsl:value-of select="$iva_porcentaje"/>%)</strong></td>
<td class="subtotal"><xsl:value-of select="$importe_iva"/> €</td>
</tr>
<tr class="total-row">
<td colspan="4" style="text-align: right;"><strong>TOTAL</strong></td>
<td class="subtotal"><xsl:value-of select="FacturaE/Factura/Total"/> €</td>
</tr>
</tbody>
</table>

<div class="footer">
<p>Esta factura sirve como comprobante legal de la transacción descrita.</p>
<p><xsl:value-of select="FacturaE/Emisor/Nombre"/> - CIF: <xsl:value-of select="FacturaE/Emisor/CIF"/> - <xsl:value-of select="FacturaE/Emisor/Direccion/Calle"/>, <xsl:value-of select="FacturaE/Emisor/Direccion/Ciudad"/> <xsl:value-of select="FacturaE/Emisor/Direccion/CodigoPostal"/>, <xsl:value-of select="FacturaE/Emisor/Direccion/Pais"/></p>
</div>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>