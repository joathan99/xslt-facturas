<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Factura Electrónica</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <h2>Factura Electrónica</h2>
                <h3>Datos del Emisor</h3>
                <p><strong>Nombre:</strong> <xsl:value-of select="FacturaE/Emisor/Nombre" /></p>
                <p><strong>CIF:</strong> <xsl:value-of select="FacturaE/Emisor/CIF" /></p>
                
                <h3>Datos del Receptor</h3>
                <p><strong>Nombre:</strong> <xsl:value-of select="FacturaE/Receptor/Nombre" /></p>
                <p><strong>CIF:</strong> <xsl:value-of select="FacturaE/Receptor/CIF" /></p>
                
                <h3>Detalles de la Factura</h3>
                <p><strong>Número:</strong> <xsl:value-of select="FacturaE/Factura/Numero" /></p>
                <p><strong>Fecha:</strong> <xsl:value-of select="FacturaE/Factura/Fecha" /></p>
                
                <table>
                    <tr>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario (€)</th>
                        <th>IVA (%)</th>
                    </tr>
                    <xsl:for-each select="FacturaE/Factura/Conceptos/Concepto">
                        <tr>
                            <td><xsl:value-of select="Descripcion" /></td>
                            <td><xsl:value-of select="Cantidad" /></td>
                            <td><xsl:value-of select="PrecioUnitario" /></td>
                            <td><xsl:value-of select="IVA" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h3>Total a Pagar: <xsl:value-of select="FacturaE/Factura/Total" /> €</h3>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
