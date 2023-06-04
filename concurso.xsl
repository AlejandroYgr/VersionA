<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

                version="1.0">

    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
       <html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <title>Participantes</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <div class="header">
            <h1>Información del concurso</h1>
        </div>

        <main>
            <h2>Listado de Participantes</h2>
            <ol class="participantes">
                <!-- Lista de participantes-->
              <xsl:apply-templates select="//participante">
                <xsl:sort select="apellidos"/>
              </xsl:apply-templates>º
                <li><xsl:value-of select="apellidos"/>, nombre. (código) - X puntos</li>
                <li>Apellidos, nombre. (código) - X puntos</li>
                <li>Apellidos, nombre. (código) - X puntos</li>
            </ol>

            <h2>5 - Mejores participantes con más de 20 puntos</h2>
            <table class="participantes-t ancho">
                <thead>
                    <tr>
                        <th>Posición</th>
                        <th>Participante</th>
                        <th>Puntos</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Tabla de participantes-->
                    
                        <xsl:for-each select="//participante[puntos&gt;=20]">
                        <xsl:if test="position()&lt;=5">
                    <tr>
                        
                        <td><xsl:value-of select="position()"/></td>
                        <td><xsl:value-of select="apellidos"/></td>
                        <td><xsl:value-of select="nombre"/></td>
                        <td><xsl:value-of select="puntos"/></td>
                       
                    </tr>
                    </xsl:if>
                    </xsl:for-each>
                    <tr>
                        <td>2</td>
                        <td>Apellidos, nombre</td>
                        <td>20</td>
                    </tr>
                </tbody>
            </table>
            <div class="estad">
                <h2>Estadísticas</h2>
                <ul>
                    <li><span>Número total de participantes:</span> <span class="stats">1</span></li>
                    <li><span>Puntuación media:</span> <span class="stats">2,5</span></li>
                    <li><span>Participantes de 18 a 35 años:</span> <span class="stats">3 (12,34%)</span></li>
                    <li><span>Participantes de 36 a 55 años:</span> <span class="stats">4 (12,34%)</span></li>
                    <li><span>Participantes de más de 55 años:</span> <span class="stats">6 (12,34%)</span></li>
                </ul>
                <table class="participantes-t">
                    <thead>
                        <tr>
                            <th>Provincia</th>
                            <th>Nº Participantes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Tabla de participantes por provincia -->
                        <tr>
                            <td>Provincia A</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>Provincia B</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
        <footer>
            <p>P.Lluyot - 2023</p>
        </footer>
    </body>
    </html>

    </xsl:template>

    <xsl:template match="participante">
             <li><xsl:value-of select="apellidos"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="nombre"/>
                    <xsl:text>. (</xsl:text>
                    <xsl:value-of select="@codigo"/>
                    ) -
                    <xsl:value-of select="puntos"/>
                    puntos
                    </li>
    </xsl:template>

</xsl:stylesheet>