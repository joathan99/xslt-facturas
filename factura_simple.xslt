<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura de Compra - Moda Elegante</title>
                <style>
                    body {
                        font-family: 'Segoe UI', Arial, sans-serif;
                        background-color: #f8f9fa;
                        color: #333;
                        margin: 0;
                        padding: 20px;
                        line-height: 1.6;
                    }
                    .contenedor {
                        max-width: 800px;
                        margin: 0 auto;
                        background: white;
                        padding: 30px;
                        box-shadow: 0 0 15px rgba(0,0,0,0.1);
                        border-radius: 8px;
                    }
                    .titulo-principal {
                        color: #4a69bd;
                        font-size: 28px;
                        text-align: center;
                        font-weight: 600;
                        margin-bottom: 30px;
                    }
                    .info-factura {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 30px;
                    }
                    .info-empresa, .info-cliente {
                        width: 48%;
                        background-color: #f8f9fa;
                        padding: 15px;
                        border-radius: 6px;
                    }
                    .subtitulo {
                        color: #4a69bd;
                        font-size: 20px;
                        margin-top: 5px;
                        margin-bottom: 15px;
                        border-bottom: 1px solid #ddd;
                        padding-bottom: 5px;
                    }
                    .datos-principales {
                        margin-bottom: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 15px 0 25px 0;
                    }
                    th, td {
                        padding: 12px;
                        border-bottom: 1px solid #f0f0f0;
                    }
                    th {
                        background: #4a69bd;
                        color: white;
                        text-align: center;
                    }
                    th:first-child {
                        text-align: left;
                    }
                    tr:nth-child(even) {
                        background-color: #f8f9fa;
                    }
                    .centrado {
                        text-align: center;
                    }
                    .derecha {
                        text-align: right;
                    }
                    .totales {
                        background-color: #f8f9fa;
                        padding: 15px;
                        border-radius: 6px;
                        margin-bottom: 20px;
                    }
                    .total-final {
                        font-weight: bold;
                        font-size: 18px;
                        color: #4a69bd;
                        border-top: 1px solid #ddd;
                        padding-top: 10px;
                        margin-top: 10px;
                    }
                    .seccion {
                        margin-bottom: 25px;
                    }
                    .info-adicional {
                        background-color: #f8f9fa;
                        padding: 15px;
                        border-radius: 6px;
                        border-left: 4px solid #4a69bd;
                        margin-bottom: 20px;
                    }
                    .pie-pagina {
                        margin-top: 30px;
                        text-align: center;
                        font-size: 14px;
                        color: #777;
                        padding-top: 15px;
                        border-top: 1px solid #ddd;
                    }
                </style>
            </head>
            <body>
                <div class="contenedor">
                    <h1 class="titulo-principal">FACTURA DE COMPRA</h1>
                    
                    <div class="info-factura">
                        <div class="info-empresa">
                            <h2 class="subtitulo">Datos del Vendedor</h2>
                            <p><strong>Empresa:</strong> <xsl:value-of select="/Factura/Emisor/Nombre"/></p>
                            <p><strong>CIF:</strong> <xsl:value-of select="/Factura/Emisor/CIF"/></p>
                            <p><strong>Dirección:</strong> <xsl:value-of select="/Factura/Emisor/Direccion"/></p>
                            <p><strong>CP:</strong> <xsl:value-of select="/Factura/Emisor/CodigoPostal"/></p>
                            <p><strong>Ciudad:</strong> <xsl:value-of select="/Factura/Emisor/Ciudad"/></p>
                            <p><strong>Teléfono:</strong> <xsl:value-of select="/Factura/Emisor/Telefono"/></p>
                        </div>
                        
                        <div class="info-cliente">
                            <h2 class="subtitulo">Datos del Cliente</h2>
                            <p><strong>Cliente:</strong> <xsl:value-of select="/Factura/Cliente/Nombre"/></p>
                            <p><strong>NIF:</strong> <xsl:value-of select="/Factura/Cliente/NIF"/></p>
                            <p><strong>Dirección:</strong> <xsl:value-of select="/Factura/Cliente/Direccion"/></p>
                            <p><strong>CP:</strong> <xsl:value-of select="/Factura/Cliente/CodigoPostal"/></p>
                            <p><strong>Ciudad:</strong> <xsl:value-of select="/Factura/Cliente/Ciudad"/></p>
                        </div>
                    </div>
                    
                    <div class="datos-principales">
                        <p><strong>Factura Nº:</strong> <xsl:value-of select="/Factura/DatosFactura/Serie"/>-<xsl:value-of select="/Factura/DatosFactura/Numero"/></p>
                        <p><strong>Fecha:</strong> <xsl:value-of select="/Factura/DatosFactura/Fecha"/></p>
                    </div>

                    <div class="seccion">
                        <h2 class="subtitulo">Artículos Adquiridos</h2>
                        <table>
                            <tr>
                                <th>Descripción</th>
                                <th>Talla</th>
                                <th>Color</th>
                                <th>Cantidad</th>
                                <th>Precio Unit.</th>
                                <th>Total</th>
                            </tr>
                            <xsl:for-each select="/Factura/Articulos/Articulo">
                                <tr>
                                    <td><xsl:value-of select="Descripcion"/></td>
                                    <td class="centrado"><xsl:value-of select="Talla"/></td>
                                    <td class="centrado"><xsl:value-of select="Color"/></td>
                                    <td class="centrado"><xsl:value-of select="Cantidad"/></td>
                                    <td class="derecha"><xsl:value-of select="PrecioUnitario"/> €</td>
                                    <td class="derecha"><xsl:value-of select="Subtotal"/> €</td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>

                    <div class="totales">
                        <p><strong>Subtotal:</strong> <span class="derecha"><xsl:value-of select="/Factura/DatosFactura/Total"/> €</span></p>
                        <p><strong>IVA (21%):</strong> <span class="derecha">Incluido</span></p>
                        <p class="total-final"><strong>TOTAL:</strong> <span class="derecha"><xsl:value-of select="/Factura/DatosFactura/Total"/> €</span></p>
                    </div>

                    <div class="seccion">
                        <h2 class="subtitulo">Información de Pago</h2>
                        <p><strong>Método de pago:</strong> <xsl:value-of select="/Factura/Pago/Metodo"/></p>
                        <p><strong>Número de tarjeta:</strong> <xsl:value-of select="/Factura/Pago/NumeroTarjeta"/></p>
                    </div>

                    <div class="info-adicional">
                        <h2 class="subtitulo">Información Adicional</h2>
                        <p><xsl:value-of select="/Factura/Observaciones"/></p>
                    </div>

                    <div class="pie-pagina">
                        <p>© <xsl:value-of select="/Factura/Emisor/Nombre"/> - <xsl:value-of select="substring(/Factura/DatosFactura/Fecha, 1, 4)"/></p>
                        <p><xsl:value-of select="/Factura/Emisor/Web"/> | <xsl:value-of select="/Factura/Emisor/Email"/></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>