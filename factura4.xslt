<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Factura de Abono</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 40px; color: #333; }
                    .container { max-width: 800px; margin: auto; padding: 20px; border: 1px solid #ddd; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); }
                    h2 { color: #0056b3; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid #ddd; padding: 10px; text-align: right; }
                    th { background-color: #e9f2ff; color: #0056b3; text-align: center; }
                    .left { text-align: left; }
                    .total { font-weight: bold; font-size: 1.2em; text-align: right; color: #0056b3; }
                    .highlight { color: #0056b3; font-weight: bold; }
                    .payment-info { margin-top: 20px; }
                </style>
            </head>
            <body>
                <div class="container">
                    <h2>Factura de Abono</h2>
                    <p><span class="highlight">Número de Factura:</span> <xsl:value-of select="FacturaAbono/Factura/Numero" /></p>
                    <p><span class="highlight">Fecha:</span> <xsl:value-of select="FacturaAbono/Factura/Fecha" /></p>
                    
                    <h3 class="highlight">Datos del Emisor</h3>
                    <p><strong>Nombre:</strong> <xsl:value-of select="FacturaAbono/Emisor/Nombre" /></p>
                    <p><strong>CIF:</strong> <xsl:value-of select="FacturaAbono/Emisor/CIF" /></p>
                    <p><strong>Dirección:</strong> <xsl:value-of select="FacturaAbono/Emisor/Direccion" />, <xsl:value-of select="FacturaAbono/Emisor/CP" />, <xsl:value-of select="FacturaAbono/Emisor/Ciudad" /></p>
                    
                    <h3 class="highlight">Datos del Cliente</h3>
                    <p><strong>Nombre:</strong> <xsl:value-of select="FacturaAbono/Receptor/Nombre" /></p>
                    <p><strong>CIF:</strong> <xsl:value-of select="FacturaAbono/Receptor/CIF" /></p>
                    <p><strong>Dirección:</strong> <xsl:value-of select="FacturaAbono/Receptor/Direccion" />, <xsl:value-of select="FacturaAbono/Receptor/CP" />, <xsl:value-of select="FacturaAbono/Receptor/Ciudad" /></p>
                    
                    <table>
                        <tr>
                            <th class="left">Descripción</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario (€)</th>
                            <th>Descuento (%)</th>
                            <th>Total (€)</th>
                        </tr>
                        <xsl:for-each select="FacturaAbono/Factura/Conceptos/Concepto">
                            <tr>
                                <td class="left"><xsl:value-of select="Descripcion" /></td>
                                <td><xsl:value-of select="Cantidad" /></td>
                                <td><xsl:value-of select="format-number(PrecioUnitario, '#,##0.00')" /></td>
                                <td><xsl:value-of select="Descuento" /></td>
                                <td><xsl:value-of select="format-number(Total, '#,##0.00')" /></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    
                    <p class="total">BASE IMPONIBLE: <xsl:value-of select="format-number(FacturaAbono/Factura/BaseImponible, '#,##0.00')" /> €</p>
                    <p class="total">IVA: <xsl:value-of select="format-number(FacturaAbono/Factura/IVA, '#,##0.00')" /> €</p>
                    <p class="total">IRPF: <xsl:value-of select="format-number(FacturaAbono/Factura/IRPF, '#,##0.00')" /> €</p>
                    <p class="total">TOTAL FACTURA: <xsl:value-of select="format-number(FacturaAbono/Factura/TotalFactura, '#,##0.00')" /> €</p>
                    
                    <div class="payment-info">
                        <h3>Condiciones de Pago</h3>
                        <p><strong>Forma de pago:</strong> <xsl:value-of select="FacturaAbono/Factura/FormaPago" /></p>
                        <p><strong>Cuenta:</strong> <xsl:value-of select="FacturaAbono/Factura/CuentaPago" /></p>
                        <p><strong>Vencimiento:</strong> <xsl:value-of select="FacturaAbono/Factura/Vencimiento" /></p>
                        <p><strong>Plazo de pago:</strong> <xsl:value-of select="FacturaAbono/Factura/PlazoPago" /></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
