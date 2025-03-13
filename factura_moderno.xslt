<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Moderna - Moda Elegante</title>
                <style>
                    /* Estilos generales */
                    body {
                        font-family: 'Montserrat', 'Helvetica Neue', sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #f0f2f5;
                        color: #2d3436;
                    }
                    
                    /* Contenedor principal con degradado lateral */
                    .factura {
                        max-width: 800px;
                        margin: 40px auto;
                        background: white;
                        position: relative;
                        overflow: hidden;
                        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                        border-radius: 12px;
                    }
                    
                    /* Franja lateral con degradado */
                    .franja-lateral {
                        position: absolute;
                        left: 0;
                        top: 0;
                        width: 20px;
                        height: 100%;
                        background: linear-gradient(to bottom, #6c5ce7, #fd79a8);
                    }
                    
                    /* Contenido principal */
                    .contenido {
                        padding: 40px 40px 40px 60px;
                    }
                    
                    /* Encabezado */
                    .encabezado {
                        display: flex;
                        justify-content: space-between;
                        align-items: flex-start;
                        margin-bottom: 40px;
                    }
                    
                    .logo-empresa {
                        font-size: 28px;
                        font-weight: 900;
                        color: #6c5ce7;
                        letter-spacing: -1px;
                    }
                    
                    .detalles-factura {
                        text-align: right;
                    }
                    
                    .titulo-factura {
                        font-size: 42px;
                        font-weight: 900;
                        color: #2d3436;
                        margin: 0 0 10px 0;
                        letter-spacing: -2px;
                    }
                    
                    .numero-factura {
                        font-size: 18px;
                        color: #6c5ce7;
                        font-weight: 600;
                    }
                    
                    .fecha-factura {
                        color: #636e72;
                        margin-top: 5px;
                    }
                    
                    /* Sección de partes */
                    .partes {
                        display: flex;
                        gap: 40px;
                        margin-bottom: 40px;
                    }
                    
                    .parte {
                        flex: 1;
                        border-radius: 10px;
                        padding: 20px;
                    }
                    
                    .emisor {
                        background-color: #f8f9fa;
                        border-left: 4px solid #6c5ce7;
                    }
                    
                    .cliente {
                        background-color: #f8f9fa;
                        border-left: 4px solid #fd79a8;
                    }
                    
                    .titulo-parte {
                        font-size: 14px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        color: #636e72;
                        margin-top: 0;
                        margin-bottom: 15px;
                    }
                    
                    .nombre-parte {
                        font-size: 18px;
                        font-weight: 700;
                        color: #2d3436;
                        margin: 0 0 15px 0;
                    }
                    
                    .detalle-parte {
                        margin: 8px 0;
                        color: #636e72;
                    }
                    
                    .etiqueta {
                        font-weight: 600;
                        color: #2d3436;
                        margin-right: 5px;
                    }
                    
                    /* Tabla de productos */
                    .tabla-container {
                        margin: 30px 0;
                        overflow-x: auto;
                    }
                    
                    .tabla-productos {
                        width: 100%;
                        border-collapse: collapse;
                        border-radius: 10px;
                        overflow: hidden;
                    }
                    
                    .tabla-productos th {
                        background: linear-gradient(to right, #6c5ce7, #a29bfe);
                        color: white;
                        font-weight: 600;
                        text-align: center;
                        padding: 15px;
                        letter-spacing: 0.5px;
                    }
                    
                    .tabla-productos th:first-child {
                        text-align: left;
                    }
                    
                    .tabla-productos td {
                        padding: 15px;
                        border-bottom: 1px solid #eee;
                    }
                    
                    .tabla-productos tr:last-child td {
                        border-bottom: none;
                    }
                    
                    .tabla-productos tr:nth-child(even) {
                        background-color: #f8f9fa;
                    }
                    
                    .tabla-productos tr:hover {
                        background-color: #f1f3f5;
                    }
                    
                    .centrado {
                        text-align: center;
                    }
                    
                    .derecha {
                        text-align: right;
                    }
                    
                    /* Totales */
                    .totales {
                        display: flex;
                        justify-content: flex-end;
                    }
                    
                    .resumen-totales {
                        width: 300px;
                        background-color: #f8f9fa;
                        border-radius: 10px;
                        padding: 20px;
                        box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                    }
                    
                    .fila-totales {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 10px;
                        color: #636e72;
                    }
                    
                    .total-final {
                        margin-top: 10px;
                        padding-top: 10px;
                        border-top: 2px solid #dfe6e9;
                        font-size: 20px;
                        font-weight: 700;
                        color: #6c5ce7;
                    }
                    
                    /* Método de pago */
                    .metodo-pago {
                        background-color: #f8f9fa;
                        border-radius: 10px;
                        padding: 20px;
                        margin-top: 30px;
                        border-left: 4px solid #6c5ce7;
                    }
                    
                    .titulo-seccion {
                        font-size: 16px;
                        font-weight: 700;
                        color: #2d3436;
                        margin-top: 0;
                        margin-bottom: 15px;
                    }
                    
                    /* Observaciones */
                    .observaciones {
                        margin-top: 30px;
                        padding: 20px;
                        background-color: #f8f9fa;
                        border-radius: 10px;
                        color: #636e72;
                        font-style: italic;
                        border-left: 4px solid #fd79a8;
                    }
                    
                    /* Pie de página */
                    .pie-pagina {
                        margin-top: 40px;
                        padding-top: 20px;
                        border-top: 1px solid #dfe6e9;
                        text-align: center;
                        color: #b2bec3;
                        font-size: 14px;
                    }
                    
                    /* Optimizaciones para impresión */
                    @media print {
                        body {
                            background-color: white;
                        }
                        
                        .factura {
                            box-shadow: none;
                            margin: 0;
                            max-width: 100%;
                        }
                        
                        .tabla-productos th {
                            background-color: #6c5ce7 !important;
                            -webkit-print-color-adjust: exact;
                            print-color-adjust: exact;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="factura">
                    <div class="franja-lateral"></div>
                    <div class="contenido">
                        <div class="encabezado">
                            <div>
                                <div class="logo-empresa"><xsl:value-of select="/Factura/Emisor/Nombre"/></div>
                            </div>
                            <div class="detalles-factura">
                                <h1 class="titulo-factura">FACTURA</h1>
                                <div class="numero-factura">#<xsl:value-of select="/Factura/DatosFactura/Serie"/>-<xsl:value-of select="/Factura/DatosFactura/Numero"/></div>
                                <div class="fecha-factura">Fecha: <xsl:value-of select="/Factura/DatosFactura/Fecha"/></div>
                            </div>
                        </div>
                        
                        <div class="partes">
                            <div class="parte emisor">
                                <h4 class="titulo-parte">De</h4>
                                <div class="nombre-parte"><xsl:value-of select="/Factura/Emisor/Nombre"/></div>
                                <div class="detalle-parte"><span class="etiqueta">CIF:</span> <xsl:value-of select="/Factura/Emisor/CIF"/></div>
                                <div class="detalle-parte"><span class="etiqueta">Dirección:</span> <xsl:value-of select="/Factura/Emisor/Direccion"/></div>
                                <div class="detalle-parte"><span class="etiqueta">Ciudad:</span> <xsl:value-of select="/Factura/Emisor/Ciudad"/>, <xsl:value-of select="/Factura/Emisor/CodigoPostal"/></div>
                                <div class="detalle-parte"><span class="etiqueta">Teléfono:</span> <xsl:value-of select="/Factura/Emisor/Telefono"/></div>
                            </div>
                            
                            <div class="parte cliente">
                                <h4 class="titulo-parte">Para</h4>
                                <div class="nombre-parte"><xsl:value-of select="/Factura/Cliente/Nombre"/></div>
                                <div class="detalle-parte"><span class="etiqueta">NIF:</span> <xsl:value-of select="/Factura/Cliente/NIF"/></div>
                                <div class="detalle-parte"><span class="etiqueta">Dirección:</span> <xsl:value-of select="/Factura/Cliente/Direccion"/></div>
                                <div class="detalle-parte"><span class="etiqueta">Ciudad:</span> <xsl:value-of select="/Factura/Cliente/Ciudad"/>, <xsl:value-of select="/Factura/Cliente/CodigoPostal"/></div>
                            </div>
                        </div>
                        
                        <div class="tabla-container">
                            <table class="tabla-productos">
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th>Talla</th>
                                        <th>Color</th>
                                        <th>Cantidad</th>
                                        <th>Precio</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
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
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="totales">
                            <div class="resumen-totales">
                                <div class="fila-totales">
                                    <span>Subtotal:</span>
                                    <span><xsl:value-of select="/Factura/DatosFactura/Total"/> €</span>
                                </div>
                                <div class="fila-totales">
                                    <span>IVA (21%):</span>
                                    <span>Incluido</span>
                                </div>
                                <div class="fila-totales total-final">
                                    <span>Total:</span>
                                    <span><xsl:value-of select="/Factura/DatosFactura/Total"/> €</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="metodo-pago">
                            <h3 class="titulo-seccion">Método de Pago</h3>
                            <div class="detalle-parte"><span class="etiqueta">Forma de pago:</span> <xsl:value-of select="/Factura/Pago/Metodo"/></div>
                            <div class="detalle-parte"><span class="etiqueta">Número de tarjeta:</span> <xsl:value-of select="/Factura/Pago/NumeroTarjeta"/></div>
                        </div>
                        
                        <div class="observaciones">
                            <h3 class="titulo-seccion">Notas</h3>
                            <p><xsl:value-of select="/Factura/Observaciones"/></p>
                        </div>
                        
                        <div class="pie-pagina">
                            <p>© <xsl:value-of select="/Factura/Emisor/Nombre"/> - <xsl:value-of select="substring(/Factura/DatosFactura/Fecha, 1, 4)"/></p>
                            <p><xsl:value-of select="/Factura/Emisor/Web"/> | <xsl:value-of select="/Factura/Emisor/Email"/></p>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>