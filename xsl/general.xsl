<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="SERVER">
        <xsl:value-of select="/pg/params/server-name" />
    </xsl:variable>

<!-- NEW TEMPLATE FOR INCLUDING ONE ARTICLE ELEMENT eg. TABLE HARDCODED SEPARATELY -->
    <xsl:template match="includeArticle">
        <xsl:variable name="FROM" select="from" />
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <xsl:if test="document( string(concat('../../../xml/',$FROM,'.xml')) )">
                    <xsl:apply-templates select="document( string(concat('../../../xml/',$FROM,'.xml')) )/pg/page-0/article" />
                </xsl:if>

            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="document( string(concat('../TEAMSITE/',$FROM,'.xml')) )">
                    <xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FROM,'.xml')))/pg/page-0/article" />
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- COMPILES SET OF FILES ON WIDE PAGE WITHOUT RIGHT NAV -->
    <xsl:template match="includeFiles">
        <xsl:choose>
        <xsl:when test="parent::article" />
        <xsl:when test="parent::sec" />
            <xsl:when test="$TS = 'true'">
                        <xsl:choose>
                    		<xsl:when test="contains ($PGID, 'patient') and not(contains ($AREA, 't4')) and not(contains ($PGID, 'faq'))">
                     			<xsl:choose>
						<xsl:when test="contains ($PGID, 'hav')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Hepatitis A for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hbv')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Hepatitis B for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hcv')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Hepatitis C for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'cirrhosis/')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Cirrhosis for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-cancer')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Liver Cancer for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-transplant')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Liver Transplant for Patients</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl') and not(contains ($PGID, 'index'))">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Alcoholic Liver Disease for Patients</span></h1>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
 					</xsl:choose>
                    		</xsl:when>
                    		<xsl:when test="not(contains ($PGID, 'patient')) and not(contains ($AREA, 't4')) and not(contains ($AREA, 't1')) and not(contains ($AREA, 't6')) and not(contains ($PGID, 'faq'))">
					<xsl:choose>
 						<xsl:when test="contains ($PGID, 'hav')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Hepatitis A</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hbv')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Hepatitis B</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hcv')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Hepatitis C</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'cirrhosis/')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Cirrhosis</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-cancer')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Liver Cancer</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-transplant')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Liver Transplant</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Alcoholic Liver Disease</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'basics')">
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /><span>Liver Basics</span></h1>
 						</xsl:when>
 						<xsl:otherwise>
 							<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /></h1>
 						</xsl:otherwise>
					</xsl:choose>	
				</xsl:when>
				<xsl:when test="contains ($AREA, 't1')">
					<h1 class="pgtitle"><xsl:value-of select="/pg/@title" /></h1>
				</xsl:when>
				<xsl:when test="contains ($PGID, 'faq')">
					<h1 class="pgtitle">Frequently Asked Questions<span><xsl:value-of select="/pg/@title" /><xsl:if test="contains ($PGID, 'patient')"><xsl:text> for Patients</xsl:text></xsl:if></span></h1>
				</xsl:when>
				<xsl:otherwise>
					<!--<xsl:value-of select="@title" />-->
				</xsl:otherwise>	
                    	</xsl:choose>  
                <!--<h1 class="pgtitle">
                    <xsl:value-of select="/pg/@title" />
                </h1>-->
                <xsl:apply-templates select="/pg/page-0/byline" mode="byline" />
            </xsl:when>
            <xsl:otherwise>
                <!--<h1 class="pgtitle">
                    <xsl:value-of select="document($TSXML)/pg/@title" />
                </h1>-->
                        <xsl:choose>
                    		<xsl:when test="contains ($PGID, 'patient') and not(contains ($AREA, 't4')) and not(contains ($PGID, 'faq'))">
                     			<xsl:choose>
						<xsl:when test="contains ($PGID, 'hav')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Hepatitis A for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hbv')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Hepatitis B for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hcv')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Hepatitis C for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'cirrhosis/')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Cirrhosis for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-cancer')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Liver Cancer for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-transplant')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Liver Transplant for Patients</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl') and not(contains ($PGID, 'index'))">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Alcoholic Liver Disease for Patients</span></h1>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
 					</xsl:choose>
                    		</xsl:when>
                    		<xsl:when test="not(contains ($PGID, 'patient')) and not(contains ($AREA, 't4')) and not(contains ($AREA, 't1')) and not(contains ($AREA, 't6')) and not(contains ($PGID, 'faq'))">
					<xsl:choose>
 						<xsl:when test="contains ($PGID, 'hav')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Hepatitis A</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hbv')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Hepatitis B</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hcv')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Hepatitis C</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'cirrhosis/')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Cirrhosis</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-cancer')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Liver Cancer</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-transplant')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Liver Transplant</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Alcoholic Liver Disease</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'basics')">
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /><span>Liver Basics</span></h1>
 						</xsl:when>
 						<xsl:otherwise>
 							<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /></h1>
 						</xsl:otherwise>
					</xsl:choose>	
				</xsl:when>
				<xsl:when test="contains ($AREA, 't1')">
					<h1 class="pgtitle"><xsl:value-of select="document($TSXML)/pg/@title" /></h1>
				</xsl:when>
				<xsl:when test="contains ($PGID, 'faq')">
					<h1 class="pgtitle">Frequently Asked Questions<span><xsl:value-of select="document($TSXML)/pg/@title" /><xsl:if test="contains ($PGID, 'patient')"><xsl:text> for Patients</xsl:text></xsl:if></span></h1>
				</xsl:when>
				<xsl:otherwise>
					<!--<xsl:value-of select="@title" />-->
				</xsl:otherwise>	
                    	</xsl:choose>  
                <xsl:apply-templates select="document($TSXML)/pg/page-0/byline" mode="byline" />
            </xsl:otherwise>
        </xsl:choose>

        <xsl:apply-templates mode="include">
            <xsl:with-param name="FROM" select="@from" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="files/file-name" mode="include">
        <xsl:param name="FROM" />
        <xsl:variable name="FILENAME" select="." />
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
				<xsl:if test="document( string(concat('../../../xml/',$FILENAME,'.xml')) )">
                    <xsl:apply-templates select="document( string(concat('../../../xml/',$FILENAME,'.xml')) )/pg/page-0/article" mode="includeHeader"/>
                    <xsl:apply-templates select="document( string(concat('../../../xml/',$FILENAME,'.xml')) )/pg/page-0/article/*[not(self::menu)]" />
                </xsl:if>

            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')) )">
                    <xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')))/pg/page-0/article" mode="includeHeader" />
                    <xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')))/pg/page-0/article/*[not(self::menu)]" />
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="includeTable">
        <div class="includeTable">
            <xsl:if test="@no">
                <a name="t-{@no}">
                    <xsl:text> </xsl:text>
                </a>
            </xsl:if>
            <!--<xsl:if test="@title">
                <h3><xsl:value-of select="@title" /></h3>
            </xsl:if>-->
            <xsl:apply-templates mode="includeTable" />
        </div>
    </xsl:template>

    <xsl:template match="files/file-name" mode="includeTable">
        <xsl:variable name="FILENAME" select="." />
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <xsl:if test="document( string(concat('../../../xml/',$FILENAME,'.xml')) )">
                    <xsl:choose>
                        <xsl:when test="@includeAll">
                            <xsl:apply-templates select="document( string(concat('../../../xml/',$FILENAME,'.xml')) )/pg/page-0/article/includeAll"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="document( string(concat('../../../xml/',$FILENAME,'.xml')) )/pg/page-0/article/table"/>
                            <!--<xsl:apply-templates select="document( string(concat('../../../xml/',$FILENAME,'.xml')) )/pg/page-0/article/*[not(self::menu)]" />-->
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:if>

            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')) )">
                    <xsl:choose>
                        <xsl:when test="@includeAll">
                            <xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')))/pg/page-0/article/includeAll" />
                            <!--<xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')))/pg/page-0/article/*[not(self::menu)]" />-->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')))/pg/page-0/article/table" />
                            <!--<xsl:apply-templates select="document( string(concat('../TEAMSITE/',$FILENAME,'.xml')))/pg/page-0/article/*[not(self::menu)]" />-->
                        </xsl:otherwise>
                    </xsl:choose>



                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="includeAll">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="includeTableFooter" mode="includeTable">
        <p style="font-size: 12px; margin-top: -12px; margin-bottom: 25px; padding-top: 0;"><xsl:apply-templates /></p>
    </xsl:template>

    <xsl:template match="includeTable" mode="toctable">
        <xsl:if test="@toc">
            <li>
                <a href="#t-{@no}">
                    <xsl:value-of select="@title" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="includeTable" mode="tool">
        <xsl:if test="@tool">
            <li>
                <a href="#t-{@no}">
                    <xsl:value-of select="@title" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>


<!-- NEW TEMPLATES TO CONVERT LINKS TO TS VERSIONS -->
    <xsl:template name="convertREF">
        <xsl:param name="FILE" />
        <xsl:choose>
            <!-- TEST FOR NEW MOBILE PARAM IN URL, AND PROPOGATE IT -->
            <xsl:when test="$MOBILE = 'y' and $TS = 'true'"><xsl:value-of select="$LINKPATH" /><xsl:value-of select="$FILE" />.asp?m=y</xsl:when>

            <xsl:when test="$TS = 'true'"><xsl:value-of select="$LINKPATH" /><xsl:value-of select="$FILE" />.asp</xsl:when>

            <xsl:otherwise>va?page=we-teamsite&#38;TS=<xsl:value-of select="$FILE" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="convertPost">
        <xsl:param name="FILE" />
        <xsl:choose>
            <!-- TEST FOR NEW MOBILE PARAM IN URL, AND PROPOGATE IT -->
            <xsl:when test="$MOBILE = 'y' and $TS = 'true'"><xsl:value-of select="$LINKPATH" /><xsl:value-of select="$FILE" />.asp?m=y&#38;</xsl:when>

            <xsl:when test="$TS = 'true'"><xsl:value-of select="$LINKPATH" /><xsl:value-of select="$FILE" />.asp?</xsl:when>

            <xsl:otherwise>va?page=we-teamsite&#38;TS=<xsl:value-of select="$FILE" />&#38;</xsl:otherwise>
        </xsl:choose>
    </xsl:template>


<!-- NEW CAROUSEL TEMPLATE FOR HOMEPAGE ONLY based on VA homepage carousel -->
    <xsl:template match="carousel">
        <!-- DEPENDS ON JAVASCRIPT: /va_files/2009/scripts/rotating-pics-temp-d.js
             MAY NEED TO BE ADDED TO TEAMSITE XSL -->

<!-- CHECK THIS : MODIFIED TO FIX POSITION() VALUE ON LOCALHOST -->
        <div id="slideshow-wrapper">
            <xsl:for-each select="pony">
                <xsl:apply-templates select=".">
                    <xsl:with-param name="POSITION" select="position()" />
                </xsl:apply-templates>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="pony">
        <xsl:param name="POSITION" />

        <xsl:variable name="ID">slide<xsl:value-of select="$POSITION" /></xsl:variable>
        <xsl:variable name="learnLink">slideNav<xsl:value-of select="position()" />Link</xsl:variable>

        <xsl:variable name="newREF">
            <xsl:choose>
                <xsl:when test="pony-link/@pdfref">
                    <xsl:call-template name="pony-link">
                        <xsl:with-param name="PDFREF" select="pony-link/@pdfref" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="pony-link/@xref">
                    <xsl:call-template name="pony-link">
                        <xsl:with-param name="XREF" select="pony-link/@xref" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="pony-link">
                        <xsl:with-param name="REF" select="pony-link/@ref" />
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <div id="{$ID}" class="slide">
            <xsl:if test="$POSITION != '1'"><xsl:attribute name="class">hide slide</xsl:attribute></xsl:if>

            <div class="slideImage-container">
                <div class="slideImage">
                    <a href="{$newREF}"><xsl:apply-templates select="image" /></a>
                </div>
            </div>

            <div class="slideText">
                <div class="slideshow-content">
                    <xsl:apply-templates select="pony-text" />
                    <p class="learnmore">
                    <a href="{$newREF}"><xsl:value-of select="pony-link" /> &gt;</a>
                    </p>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pony-text">
        <xsl:if test="title">
            <h3><xsl:apply-templates select="title"/></h3>
        </xsl:if>
        <xsl:apply-templates select="*[not(self::title)]" />
    </xsl:template>

<xsl:template name="pony-link">
    <xsl:param name="PDFREF" />
    <xsl:param name="XREF" />
    <xsl:param name="REF" />
    <xsl:choose>
        <xsl:when test="$PDFREF != ''">
            <xsl:value-of select="$TSP" />pdf/<xsl:value-of select="$PDFREF" />.pdf   </xsl:when>
        <xsl:when test="$XREF != ''">https://<xsl:value-of select="$XREF" /></xsl:when>
        <xsl:otherwise>
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="$REF" /></xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- SLIDE TEMPLATES FOR HOT TOPICS, WHERE ALL SLIDES DISPLAY ON MAIN PAGE -->
<xsl:template match="slides[@type='all']">
    <div class="allslides">
         <xsl:for-each select="slide">
            <div class="oneofallslides">
                <h3>
                    <xsl:value-of select="@title" />
                </h3>
                <p class="oneslide">
                    <img src="{$TSP}{@src}" width="{@width}" height="{@height}" border="1" alt="{@alt}" />
                </p>
                <p class="normal">
                    <xsl:apply-templates select="sl-text" mode="allslides" />
                </p>
            </div>
         </xsl:for-each>
    </div>
</xsl:template>
<xsl:template match="sl-text" mode="allslides">
   <xsl:apply-templates />
</xsl:template>

<!-- SLIDE TEMPLATES BASED ON VA-ART.XSL -->
<xsl:template match="sec-slide">
    <xsl:variable name="SLX" select="$SLIDE" />
    <xsl:variable name="SLN" select="slide[@no=$SLX]" />
    <xsl:variable name="XFIRST" select="1" />

    <xsl:variable name="XLAST">
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <xsl:value-of select="/pg/page-1/sec-slide/slide[last()]/@no" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="document($TSXML)/pg/page-1/sec-slide/slide[last()]/@no" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <div class="secslide">
        <xsl:choose>
            <xsl:when test="not($SLX) or $SLX = '1'">
                <xsl:apply-templates select="slide[@no='1']" mode="slide" />
                <xsl:if test="slide[@no='1']/sl-text">
                    <div class="slidetext"><xsl:apply-templates select="slide[@no='1']/sl-text" /></div>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="slide[@no='1']/@next">
                        <xsl:apply-templates select="slide[@no='1']" mode="first" />
                    </xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
            </xsl:when>

            <xsl:otherwise>
                <xsl:apply-templates select="$SLN" mode="slide" />
                <xsl:apply-templates select="$SLN/sl-text" />
                <xsl:choose>
                    <xsl:when test="$SLX=$XFIRST">
                        <xsl:apply-templates select="$SLN" mode="first" />
                    </xsl:when>
                    <xsl:when test="$SLX=$XLAST">
                        <xsl:choose>
                            <xsl:when test="count(slide) > 1">
                                <xsl:apply-templates select="$SLN" mode="last" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="$SLN" mode="only" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="$SLN" mode="both" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="about" />
    </div>
</xsl:template>

<xsl:template match="slide" mode="slide">
    <p class="center">
       <img src="{$TSP}{@src}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}"/>
    </p>
</xsl:template>
<xsl:template match="sl-text">
        <xsl:apply-templates />
</xsl:template>
<xsl:template match="about">
    <xsl:choose>
        <xsl:when test="../slide[@no='1']">
            <xsl:apply-templates select="project" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="project" /> | <xsl:apply-templates select="artist" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="project">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="artist">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="slide" mode="first">
    <xsl:variable name="newREF">
        <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="$XMLFILE" /></xsl:call-template>
    </xsl:variable>
    <p class="smslide">
        <a href="{$newREF}post=1&#38;slide={@next}">NEXT</a> &#62;&#62;
    </p>
</xsl:template>

<xsl:template match="slide" mode="last">
    <xsl:variable name="newREF">
        <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="$XMLFILE" /></xsl:call-template>
    </xsl:variable>
    <p class="smslide">
        <a href="{$newREF}post=1&#38;slide={@prev}">&#60;&#60; BACK</a>
    </p>
</xsl:template>

<xsl:template match="slide" mode="both">
    <xsl:variable name="newREF">
        <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="$XMLFILE" /></xsl:call-template>
    </xsl:variable>
    <xsl:choose>
        <xsl:when test="@no='2'">
            <p class="smslide">
            <a href="{$newREF}slide={@prev}">&#60;&#60; BACK</a> | <a href="{$newREF}post=1&#38;slide={@next}">NEXT &#62;&#62;</a>

            </p>
        </xsl:when>
        <xsl:otherwise>
            <p class="smslide">
            <a href="{$newREF}post=1&#38;slide={@prev}">&#60;&#60; BACK</a> | <a href="{$newREF}post=1&#38;slide={@next}">NEXT &#62;&#62;</a>

            </p>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="slide" mode="only">
    <xsl:variable name="newREF">
        <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="$XMLFILE" /></xsl:call-template>
    </xsl:variable>
    <p class="smslide">
        <a href="{$newREF}slide={@prev}">&#60;&#60; BACK</a> |
    </p>
</xsl:template>
<!-- END SLIDE TEMPLATES -->

<!-- IMAGE LIBRARY TEMPLATES with XML CHANGES -->
<xsl:template match="pr-img-header" mode="header">
    <div class="ptheader">
        <h3><xsl:value-of select="@title" /></h3>
        <img src="{$TSP}images/{image-1/@src}" width="45" height="45" border="0" alt="{image-1/@alt}" />
        <img src="{$TSP}images/{image-2/@src}" width="45" height="45" border="0" alt="{image-2/@alt}" />
        <img src="{$TSP}images/{image-3/@src}" width="45" height="45" border="0" alt="{image-3/@alt}" />
    </div>
</xsl:template>

<xsl:template match="sec-imglib-slides">
    <xsl:variable name="SLX" select="$SLIDE" />
    <xsl:variable name="SLN" select="slide[@no=$SLX]" />

    <xsl:if test="slide/@no = $SLX">
        <xsl:choose>
            <xsl:when test="$SLN/sl-title">
                <h3><xsl:apply-templates select="$SLN/sl-title" /></h3>
            </xsl:when>
            <xsl:otherwise>
                <h3><xsl:apply-templates select="$SLN/@title" /></h3>
            </xsl:otherwise>
        </xsl:choose>

        <a name="S{@no}X"><xsl:text> </xsl:text></a>
       <xsl:apply-templates select="$SLN" mode="imglib" />
    </xsl:if>
    <xsl:apply-templates select="$SLN/sl-text" />

    <p class="bylinedesc">
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <a href="{$LINKPATH}provider/image-library/instructions.asp" title="How to download this image">Instructions</a> for downloading images.
            </xsl:when>
            <xsl:otherwise>
                <a href="va?page=we-teamsite&#38;TS=provider/image-library/instructions" title="How to download this image">Instructions</a> for downloading images.
            </xsl:otherwise>
        </xsl:choose>
    </p>
</xsl:template>

<xsl:template match="slide" mode="imglib">
    <p class="left">
        <img src="{$TSP}{@src}" width="{@width}" height="{@height}" border="1" alt="image of {sl-title}"/>
    </p>
    <xsl:if test="slide2">
        <xsl:if test="slide2/@title">
            <p>
                <xsl:choose>
                    <xsl:when test="slide2/sl-title">
                        <h3><xsl:apply-templates select="slide2/sl-title" /></h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <h3><xsl:apply-templates select="slide2/@title" /></h3>
                    </xsl:otherwise>
                </xsl:choose>
            </p>
            <img src="{$TSP}images/global/clr_pxl.gif" width="1" height="5" border="0" alt=""/>
        </xsl:if>
    <p>
        <img src="{$TSP}{slide2/@src2}" width="{slide2/@width}" height="{slide2/@height}" border="1" alt="image of {slide2/sl-title}"/>
    </p>
    </xsl:if>
    <xsl:if test="slide3">
        <xsl:if test="slide3/@title">
            <p>
                <xsl:choose>
                    <xsl:when test="slide3/sl-title">
                        <h3><xsl:apply-templates select="slide3/sl-title" /></h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <h3><xsl:apply-templates select="slide3/@title" /></h3>
                    </xsl:otherwise>
                </xsl:choose>
            </p>
            <img src="{$TSP}images/global/clr_pxl.gif" width="1" height="5" border="0" alt=""/>
        </xsl:if>
    <p>
        <img src="{$TSP}{slide3/@src3}" width="{slide3/@width}" height="{slide3/@height}" border="1" alt="image of {slide3/sl-title}"/>
    </p>
    </xsl:if>
</xsl:template>

<xsl:template match="sl-credits">
    <xsl:if test=". != ''">
        <h3>Credits</h3>
        <p><xsl:apply-templates /></p>
    </xsl:if>
</xsl:template>

<xsl:template match="sl-desc">
    <xsl:if test=". != ''">
        <h3>Description</h3>
        <p><xsl:apply-templates /></p>
    </xsl:if>
</xsl:template>
<xsl:template match="sl-link">
    <xsl:if test=". != ''">
         <p>See related article in the HIV InSite Knowledge Base: <br />
            <a href="http://hivinsite.ucsf.edu/InSite?page=kb-00&#38;doc={@ref}"><xsl:value-of select="." /></a></p>
    </xsl:if>
</xsl:template>

<xsl:template match="sec-imglib">
    <xsl:variable name="THUMBCOUNT">
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <xsl:value-of select="count(/pg/page-1/sec-imglib-slides/slide)" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="count(document($TSXML)/pg/page-1/sec-imglib-slides/slide)" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="newREF">
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="/pg/@id" /></xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="document($TSXML)/pg/@id" /></xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:if test="@title">
        <h3><a name="S{@no}X"><xsl:text> </xsl:text></a><xsl:value-of select="@title" /></h3>
    </xsl:if>
    <xsl:apply-templates />

    <xsl:choose>
        <xsl:when test="$TS = 'true'">
            <xsl:for-each select="/pg/page-1/sec-imglib-slides/slide">
                <xsl:sort select="sl-title" />
                <xsl:variable name="THUMBNEXT" select="number($THUMBPAGE) * 20" />
                <xsl:variable name="THUMBPREV" select="(number($THUMBPAGE)-1) * 20" />
                <xsl:choose>
                    <xsl:when test="$THUMBPAGE='999'">
                    <!-- view all slides at once -->
                        <p class="thumbnail"> <a href="{$newREF}post=1&#38;slide={@no}"><xsl:apply-templates select="thumb" /></a>
                            <span>
                                <xsl:choose>
                                    <xsl:when test="thumb/thumb-title">
                                        <xsl:apply-templates select="new" /><xsl:apply-templates select="thumb/thumb-title" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="new" /><xsl:apply-templates select="sl-title" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </span>
                        </p>
                    </xsl:when>
                    <xsl:when test="$THUMBPAGE=''">
                        <xsl:if test="position() &lt;= 20">
                            <p class="thumbnail"> <a href="{$newREF}post=1&#38;slide={@no}"><xsl:apply-templates select="thumb" /></a>
                                <span>
                                    <xsl:choose>
                                        <xsl:when test="thumb/thumb-title">
                                           <xsl:apply-templates select="new" /><xsl:apply-templates select="thumb/thumb-title" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:apply-templates select="new" /><xsl:apply-templates select="sl-title" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </p>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="position() > $THUMBPREV and position() &lt;= $THUMBNEXT">
                            <p class="thumbnail"> <a href="{$newREF}post=1&#38;slide={@no}"><xsl:apply-templates select="thumb" /></a>
                                <span>
                                    <xsl:choose>
                                        <xsl:when test="thumb/thumb-title">
                                           <xsl:apply-templates select="new" /><xsl:apply-templates select="thumb/thumb-title" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:apply-templates select="new" /><xsl:apply-templates select="sl-title" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </p>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
           <xsl:for-each select="document($TSXML)/pg/page-1/sec-imglib-slides/slide">
                <xsl:sort select="sl-title" />
                <xsl:variable name="THUMBNEXT" select="number($THUMBPAGE) * 20" />
                <xsl:variable name="THUMBPREV" select="(number($THUMBPAGE)-1) * 20" />
                <xsl:choose>
                    <xsl:when test="$THUMBPAGE='999'">
                    <!-- view all slides at once -->
                        <p class="thumbnail"> <a href="{$newREF}post=1&#38;slide={@no}"><xsl:apply-templates select="thumb" /></a>
                            <span>
                                <xsl:choose>
                                    <xsl:when test="thumb/thumb-title">
                                        <xsl:apply-templates select="new" /><xsl:apply-templates select="thumb/thumb-title" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="new" /><xsl:apply-templates select="sl-title" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </span>
                        </p>
                    </xsl:when>
                    <xsl:when test="$THUMBPAGE=''">
                        <xsl:if test="position() &lt;= 20">
                            <p class="thumbnail"> <a href="{$newREF}post=1&#38;slide={@no}"><xsl:apply-templates select="thumb" /></a>
                                <span>
                                    <xsl:choose>
                                        <xsl:when test="thumb/thumb-title">
                                           <xsl:apply-templates select="new" /><xsl:apply-templates select="thumb/thumb-title" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:apply-templates select="new" /><xsl:apply-templates select="sl-title" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </p>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="position() > $THUMBPREV and position() &lt;= $THUMBNEXT">
                            <p class="thumbnail"> <a href="{$newREF}post=1&#38;slide={@no}"><xsl:apply-templates select="thumb" /></a>
                                <span>
                                    <xsl:choose>
                                        <xsl:when test="thumb/thumb-title">
                                           <xsl:apply-templates select="new" /><xsl:apply-templates select="thumb/thumb-title" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:apply-templates select="new" /><xsl:apply-templates select="sl-title" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </p>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="thumbpages">
        <xsl:with-param name="THUMBCOUNT" select="$THUMBCOUNT" />
        <xsl:with-param name="newREF" select="$newREF" />
    </xsl:call-template>
</xsl:template>

<xsl:template match="thumb">
    <img src="{$TSP}{@src}" width="50" height="50" border="1" alt="thumbnail image of {../sl-title}" title="thumbnail image of {../sl-title}" />
    <xsl:if test="@src2">
        <img src="{$TSP}{@src2}" width="50" height="50" border="1" alt="thumbnail image of {../slide2/sl-title}" title="thumbnail image of {../slide2/sl-title}" /></xsl:if>
    <xsl:if test="@src3">
        <img src="{$TSP}{@src3}" width="50" height="50" border="1" alt="thumbnail image of {../slide3/sl-title}" title="thumbnail image of {../slide3/sl-title}" /></xsl:if>
</xsl:template>


<xsl:template match="new">
    <xsl:if test="@expires >= $CD">
        <img src="{$TSP}images/global/new.gif" width="30" height="11" border="0" alt="New!" />
    </xsl:if>
</xsl:template>
<xsl:template match="sl-title">
    <xsl:apply-templates />
</xsl:template>
<xsl:template match="thumb-title">
    <xsl:apply-templates />
</xsl:template>

<xsl:template name="thumbpages">
    <xsl:param name="THUMBCOUNT" />
    <xsl:param name="newREF" />

    <xsl:if test="$THUMBCOUNT > 20">
        <ul class="page-menu">
            <li>Pages: </li>
                <xsl:if test="$THUMBCOUNT > 20 and $THUMBPAGE = ''">
                    <li>  <b>1</b> </li>
                </xsl:if>
                <xsl:if test="$THUMBCOUNT > 20 and $THUMBPAGE != ''">
                    <li>  <a href="{$newREF}">1</a> </li>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 20 and $THUMBPAGE = '2'">
                        <li> <b>2</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 20">
                        <li><a href="{$newREF}thumbs=2">2</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 40 and $THUMBPAGE = '3'">
                        <li>  <b>3</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 40">
                        <li>   <a href="{$newREF}thumbs=3">3</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 60 and $THUMBPAGE = '4'">
                        <li>  <b>4</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 60">
                        <li>   <a href="{$newREF}thumbs=4">4</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 80 and $THUMBPAGE = '5'">
                        <li> <b>5</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 80">
                        <li>  <a href="{$newREF}thumbs=5">5</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 100 and $THUMBPAGE = '6'">
                        <li>    <b>6</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 100">
                        <li>  <a href="{$newREF}thumbs=6">6</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 120 and $THUMBPAGE = '7'">
                        <li><b>7</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 120">
                        <li><a href="{$newREF}thumbs=7">7</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 140 and $THUMBPAGE = '8'">
                        <li>  <b>8</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 140">
                        <li><a href="{$newREF}thumbs=8">8</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 160 and $THUMBPAGE = '9'">
                        <li> <b>9</b> </li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 160">
                        <li><a href="{$newREF}thumbs=9">9</a> </li>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="$THUMBCOUNT > 180 and $THUMBPAGE = '10'">
                        <li> <b>10</b></li>
                    </xsl:when>
                    <xsl:when test="$THUMBCOUNT > 180">
                        <li><a href="{$newREF}thumbs=10">10</a></li>
                    </xsl:when>
                </xsl:choose>

                <xsl:if test="$THUMBCOUNT > 20">
                    <li>
                        <xsl:choose>
                            <xsl:when test="$THUMBPAGE = '999'">
                                <b>View all (<xsl:value-of select="$THUMBCOUNT" /> slides)</b>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="{$newREF}thumbs=999">View all</a> (<xsl:value-of select="$THUMBCOUNT" /> slides)
                            </xsl:otherwise>
                        </xsl:choose>
                    </li>
                </xsl:if>
            </ul>
    </xsl:if>
</xsl:template>
<xsl:template match="back-tos" mode="header">
    <p class="right">
        Back to:
            <xsl:for-each select="back-to">
                <xsl:choose>
                    <xsl:when test="position() = 1">
                    <xsl:apply-templates /> |
                    </xsl:when>
                    <xsl:when test="position() = last()">
                        <xsl:apply-templates />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates /> |
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </p>
</xsl:template>
<xsl:template match="back-to">
    <xsl:apply-templates />
</xsl:template>
<!-- END IMAGE LIBRARY TEMPLATES -->


<!--NEW FOR LEFTNAV -->
    <xsl:template match="leftnavs/leftnav">
         <xsl:apply-templates />
    </xsl:template>

<!--NEW TEMPLATES FOR CONTENTS BOX eg. for PCM and Image Library -->
    <xsl:template match="contents-box">
        <div class="contentsbox hidden-print">
            <xsl:apply-templates select="boxheader" mode="boxheader" />

            <div class="contentsboxcontent">
               <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <xsl:template match="items[@type='hi-self']">
        <ul class="homeitem">
            <xsl:if test="@class">
                <xsl:attribute name="class">homeitem <xsl:value-of select="@class" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

<!-- NEW 'EXPAND' TEMPLATES -->
    <xsl:template match="item[@type='expand']">
        <li>
            <xsl:attribute name="class"><xsl:value-of select="@class" /> expandmenu</xsl:attribute>

            <xsl:choose>
                <xsl:when test="ilink-vahep">
                    <xsl:apply-templates mode="expand">
                        <xsl:with-param name="PLINK" select="ilink-vahep/@ref" />
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="ilink-vahiv">
                    <xsl:apply-templates mode="expand">
                        <xsl:with-param name="PLINK" select="ilink-vahiv/@ref" />
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates mode="expand">
                        <xsl:with-param name="PLINK" select="ilink-va/@ref" />
                    </xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>

        </li>
    </xsl:template>

    <xsl:template match="items" mode="expand">
        <xsl:param name="PLINK" />
        <ul>
            <xsl:attribute name="class"><xsl:value-of select="@class" /> expandmenu hidden</xsl:attribute>
            <xsl:if test="($PLINK = $PAGENAV or $PLINK = $PAGEID or $PLINK = $XMLFILE) or (item/ilink-vahep[@ref = $PAGEID] or item/ilink-vahep[@ref = $PAGENAV] or item/ilink-vahep[@ref = $XMLFILE]) or (item//item/ilink-vahep[@ref = $PAGEID] or item//item/ilink-vahep[@ref = $PAGENAV] or item//item/ilink-vahep[@ref = $XMLFILE])">
                <xsl:attribute name="class"><xsl:value-of select="@class" /> expandmenu</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="ilink-vahep" mode="expand">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}">
            <!-- FOR CONTENTS BOX HIGHLIGHTING OF LINK TO CURRENT PAGE -->
            <xsl:if test="../../@type='hi-self' and ($PAGEID = @ref or $PAGENAV = @ref or $XMLFILE = @ref)">
                <xsl:attribute name="class">homeitemself</xsl:attribute>
            </xsl:if>
             <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>
    <xsl:template match="ilink-vahiv" mode="expand">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}">
            <!-- FOR CONTENTS BOX HIGHLIGHTING OF LINK TO CURRENT PAGE -->
            <xsl:if test="../../@type='hi-self' and ($PAGEID = @ref or $PAGENAV = @ref or $XMLFILE = @ref)">
                <xsl:attribute name="class">homeitemself</xsl:attribute>
            </xsl:if>
             <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>
<!-- END NEW 'EXPAND' TEMPLATES -->

    <xsl:template match="item[@type='dropdown']">
        <li class="dropdown main">
            <xsl:apply-templates mode="dropdown">
                <xsl:with-param name="num" select="position()" />
            </xsl:apply-templates>
        </li>
    </xsl:template>

    <xsl:template match="items" mode="dropdown">
        <xsl:param name="num" />
        <ul id="submenu-{$num}" class="dropdownmenu hidden">
            <xsl:if test="item/ilink-vahiv[@ref = /pg/@id] or item/ilink-vahiv[@ref = $XMLFILE] or item/ilink-vahiv[@ref = $PAGENAV]">
                <xsl:attribute name="class">dropdownmenu</xsl:attribute>
            </xsl:if>
            <xsl:if test="item/ilink-vahep[@ref = /pg/@id] or item/ilink-vahep[@ref = $XMLFILE] or item/ilink-vahep[@ref = $PAGENAV]">
                <xsl:attribute name="class">dropdownmenu</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="ilink-vahiv[@jump]" mode="dropdown">
        <xsl:param name="num" />
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}{@jump}" query="#submenu-{$num}" class="showDiv hideSelf">
          + <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <a href="{$newREF}{@jump}" query="#submenu-{$num}" class="showDiv hideSelf hidden">
          ^ <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>
    <xsl:template match="ilink-vahiv" mode="dropdown">
        <xsl:param name="num" />
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}" query="#submenu-{$num}" class="showDiv hideSelf">
            + <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <a href="{$newREF}" query="#submenu-{$num}" class="showDiv hideSelf hidden">
            <xsl:if test="@title">
              ^ <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-vahep[@jump]" mode="dropdown">
        <xsl:param name="num" />
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}{@jump}" query="#submenu-{$num}" class="showDiv hideSelf">
            + <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <a href="{$newREF}{@jump}" query="#submenu-{$num}" class="showDiv hideSelf hidden">
           ^ <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>
    <xsl:template match="ilink-vahep" mode="dropdown">
        <xsl:param name="num" />
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}" query="#submenu-{$num}" class="showDiv hideSelf">
            <!-- FOR CONTENTS BOX HIGHLIGHTING OF LINK TO CURRENT PAGE -->
            <xsl:if test="../../@type='hi-self' and (/pg/@id = @ref or $XMLFILE = @ref)">
                <xsl:attribute name="class">homeitemself showDiv hideSelf</xsl:attribute>
            </xsl:if>
             <xsl:if test="@title">
               + <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <a href="{$newREF}" query="#submenu-{$num}" class="showDiv hideSelf hidden">
            <xsl:if test="../../@type='hi-self' and (/pg/@id = @ref or $XMLFILE = @ref)">
                <xsl:attribute name="class">homeitemself showDiv hideSelf hidden</xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
              ^ <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>
<!-- END CONTENT BOX TEMPLATES -->

    <xsl:template match="popquiz">
        <xsl:variable name="qzno" select="@no" />
        <div id="popquiz-{$qzno}" class="popquiz">

            <div class="hidden ifno-quiz">
                <xsl:if test="$PAGEWIDE != ''">
                    <xsl:attribute name="class">hidden no-quiz</xsl:attribute>
                </xsl:if>

                <div class="popquizbutton"><input id="showQuiz-{$qzno}" class="showQuiz hideSelf" type="button" value="{@button}"  /></div>

                <div id="popquestion-{$qzno}" class="hidden">
                    <p class="popquestion">
                        <xsl:value-of select="question" />
                    </p>
                    <p>
                        <xsl:if test="not(@checkbox)">
                        <input type="radio" name="popquiz" value="True" />True
                        <br />
                        <input type="radio" name="popquiz" value="False" />False
						</xsl:if>
						<xsl:for-each select="checkbox">
								<p><input type="checkbox" name="popquiz" value="{@value}"/><xsl:text> </xsl:text><xsl:value-of select="." /></p>
							</xsl:for-each>
                    </p>
                    <p>
                        <input id="showAnswer-{$qzno}" class="showAnswer hideSelf" type="button" value="Submit" />
                    </p>
                </div>
            </div>

            <div id="popanswer-{$qzno}" class="ifno-quiz">
                <xsl:if test="$PAGEWIDE != ''">
                    <xsl:attribute name="class">no-quiz</xsl:attribute>
                </xsl:if>

                <p class="popquestion">
                    <xsl:value-of select="question" />
                </p>
                <p class="answer">
                    Answer: <xsl:value-of select="answer" />
                </p>
            </div>
        </div>
    </xsl:template>


<!-- THIS IS THE SPECIAL CHARACTER TEMPLATE, DEPENDS ON ROB'S SCRIPT -->
    <xsl:template match="character">
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <xsl:text disable-output-escaping="yes">&amp;#</xsl:text><xsl:value-of select="@code" />;</xsl:when>
            <xsl:otherwise>
                <xsl:text>&amp;#</xsl:text><xsl:value-of select="@code" />;</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="article">
        <xsl:apply-templates select="*[not(self::menu)][not(self::title)]" />
    </xsl:template>


    <xsl:template name="va-disclaimer">
        <!--<p class="disclaimer"> Note: As of August 17, 2009, written (signature) consent is no longer required for HIV testing in the VHA. Instead, patients will provide verbal informed consent prior to HIV testing. Furthermore, scripted pre-test and post-test counseling are no longer mandated. Instead, patients will be provided with educational materials before verbal informed consent is obtained, and health care providers will answer any questions patients may have before and after HIV testing. Therefore, some of the information below may be outdated. To learn more about the details of VHA's HIV testing policies, please see <a href="va?page=prtop03-va-01" title="disclaimer">VHA Handbook 1004.01, Informed Consent for Clinical Treatments and Procedures</a>. </p>-->
    </xsl:template>


    <xsl:template match="article" mode="header">
	<xsl:if test="@archive">
	<div class="archive">
		<h2>Archived</h2>

		<p>You are viewing outdated content. This information may no longer be accurate or relevant and is provided for research or recordkeeping purposes only.<!--<img src="{$TSP}images/icons/archive-logo.jpg" alt="Archival Content"/>--></p>
	</div>
	</xsl:if>
                
        <div class="pgtitle">  
            <xsl:if test="@class"><xsl:attribute name="class">pgtitle <xsl:value-of select="@class" /></xsl:attribute></xsl:if>
                <xsl:choose>
                    <xsl:when test="title">
                        <xsl:choose>
                    		<xsl:when test="contains ($PGID, 'patient') and not(contains ($AREA, 't4')) and not(contains ($PGID, 'faq'))">
                     			<xsl:choose>
						<xsl:when test="contains ($PGID, 'hav')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Hepatitis A for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hbv')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Hepatitis B for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hcv')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Hepatitis C for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'cirrhosis/')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Cirrhosis for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-cancer')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Liver Cancer for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-transplant')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Liver Transplant for Patients</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl') and not(contains ($PGID, 'index'))">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Alcoholic Liver Disease for Patients</span></h1>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
 					</xsl:choose>
                    		</xsl:when>
                    		<xsl:when test="not(contains ($PGID, 'patient')) and not(contains ($AREA, 't4')) and not(contains ($AREA, 't1'))  and not(contains ($AREA, 't6')) and not(contains ($PGID, 'faq'))">
					<xsl:choose>
 						<xsl:when test="contains ($PGID, 'hav')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Hepatitis A</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hbv')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Hepatitis B</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hcv')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Hepatitis C</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'cirrhosis/')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Cirrhosis</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-cancer')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Liver Cancer</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-transplant')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Liver Transplant</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Alcoholic Liver Disease</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'basics')">
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /><span>Liver Basics</span></h1>
 						</xsl:when>
 						<xsl:otherwise>
 							<h1 class="pgtitle"><xsl:apply-templates select="title" /></h1>
 						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="contains ($AREA, 't1')">
					<h1 class="pgtitle"><xsl:apply-templates select="title" /></h1>
				</xsl:when>	
				<xsl:when test="contains ($PGID, 'faq')">
					<h1 class="pgtitle">Frequently Asked Questions<span><xsl:apply-templates select="title" /><xsl:if test="contains ($PGID, 'patient')"><xsl:text> for Patients</xsl:text></xsl:if></span></h1>
				</xsl:when>
				<xsl:otherwise>
					<!--<xsl:apply-templates select="title" />-->
				</xsl:otherwise>
                    	</xsl:choose>  
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                    		<xsl:when test="contains ($PGID, 'patient') and not(contains ($AREA, 't4')) and not(contains ($PGID, 'faq'))">
                     			<xsl:choose>
						<xsl:when test="contains ($PGID, 'hav')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Hepatitis A for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hbv')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Hepatitis B for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'hcv')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Hepatitis C for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'cirrhosis/')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Cirrhosis for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-cancer')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Liver Cancer for Patients</span></h1>
						</xsl:when>
						<xsl:when test="contains ($PGID, 'liver-transplant')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Liver Transplant for Patients</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl') and not(contains ($PGID, 'index'))">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Alcoholic Liver Disease for Patients</span></h1>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
 					</xsl:choose>
                    		</xsl:when>
                    		<xsl:when test="not(contains ($PGID, 'patient')) and not(contains ($AREA, 't4')) and not(contains ($AREA, 't1')) and not(contains ($AREA, 't6')) and not(contains ($PGID, 'faq'))">
					<xsl:choose>
 						<xsl:when test="contains ($PGID, 'hav')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Hepatitis A</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hbv')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Hepatitis B</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'hcv')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Hepatitis C</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'cirrhosis/')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Cirrhosis</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-cancer')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Liver Cancer</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'liver-transplant')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Liver Transplant</span></h1>
 						</xsl:when>
 						<xsl:when test="contains ($PGID, 'nafl')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Non-Alcoholic Fatty Liver</span></h1>
 						</xsl:when>
						<xsl:when test="contains ($PGID, 'alcohol')">
							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Alcoholic Liver Disease</span></h1>
						</xsl:when>
 						<xsl:when test="contains ($PGID, 'basics')">
 							<h1 class="pgtitle"><xsl:value-of select="@title" /><span>Liver Basics</span></h1>
 						</xsl:when>
 						<xsl:otherwise>
 							<h1 class="pgtitle"><xsl:value-of select="@title" /></h1>
 						</xsl:otherwise>
					</xsl:choose>	
				</xsl:when>
				<xsl:when test="contains ($AREA, 't1')">
					<h1 class="pgtitle"><xsl:value-of select="@title" /></h1>
				</xsl:when>
				<xsl:when test="contains ($PGID, 'faq')">
					<h1 class="pgtitle">Frequently Asked Questions<span><xsl:value-of select="@title" /><xsl:if test="contains ($PGID, 'patient')"><xsl:text> for Patients</xsl:text></xsl:if></span></h1>
				</xsl:when>
				<xsl:otherwise>
					<!--<xsl:value-of select="@title" />-->
				</xsl:otherwise>	
                    	</xsl:choose>  
                    </xsl:otherwise>
                </xsl:choose>
        </div>
    </xsl:template>

    <xsl:template match="article" mode="includeHeader">
        <div class="pgtitle">
            <h3 class="pgtitle">
                <xsl:value-of select="@title" />
            </h3>
        </div>
    </xsl:template>

<xsl:template match="pt-header" mode="header">
    <div class="ptheader">
        <h2><span class="italic">for</span> Veterans and the Public</h2>
        <!--<xsl:if test="@title"><h3>
            <xsl:value-of select="@title" />
        </h3></xsl:if>-->
        <!--<img src="{$TSP}images/{@img}" border="0" alt="Section Icon" />-->
     </div>
</xsl:template>

<xsl:template match="pt-altheader" mode="header">
    <div class="ptheader">
        <h2><span class="italic">for</span> Veterans and the Public</h2>
        <!--<xsl:if test="@title"><h3>
            <xsl:value-of select="@title" />
        </h3></xsl:if>-->
    </div>
</xsl:template>

<xsl:template match="pr-header" mode="header">
    <xsl:choose>
	<xsl:when test="@img">
	        <div class="ptheader">
		    <h2><span class="italic">for</span> Health Care Providers</h2>
		    <!--<img src="{$TSP}images/{@img}" border="0" alt="Section Icon" />-->
		</div>
	</xsl:when>
	<xsl:otherwise>
	        <div class="ptheader">
		    <h2><span class="italic">for</span> Health Care Providers</h2>
		</div>
	</xsl:otherwise>
    </xsl:choose>
</xsl:template>

    <xsl:template match="gn-header" mode="header">
        <!--<div class="prheader">
            <xsl:if test="@title"><h2><xsl:value-of select="@title"/></h2></xsl:if>
            <xsl:text> </xsl:text>
        </div>-->
    </xsl:template>

   <xsl:template match="flash-video">
        <xsl:variable name="STILL"><xsl:value-of select="@still" /></xsl:variable>
        <xsl:variable name="URI"><xsl:value-of select="uri" /></xsl:variable>
        <xsl:variable name="WIDTH"><xsl:value-of select="@width" /></xsl:variable>
        <xsl:variable name="HEIGHT"><xsl:value-of select="@height" /></xsl:variable>

        <xsl:choose>
            <xsl:when test="contains ($VASERVER, 'www.hiv.va.gov') or contains ($VASERVER, 'www.hepatitis.va.gov')">
                <script type="text/javascript" src="swf/swfobject.js"><xsl:text> </xsl:text></script>
                <div class="flash">
                    <script type="text/javascript">
                        var flashvars = {
                        file: "swf/<xsl:value-of select="$URI" />.flv" ,
                        image: "swf/<xsl:value-of select="$STILL" />"
                        };
                        var params = {};
                        var attributes = {};
                        attributes.id = "myId";
                        swfobject.embedSWF("swf/flvplayer.swf", "myContent", "<xsl:value-of select="$WIDTH" />", "<xsl:value-of select="$HEIGHT" />", "9.0.0", false, flashvars, params, attributes);
                    </script>

                    <div id="myContent">
                      <p>If you do not see a video above, you are either having trouble accessing the network, or do not have the Macromedia Flash Player installed. To download the Flash Player from Adobe's website: <a href="https://www.adobe.com/go/getflashplayer"><img src="https://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <script type="text/javascript" src="{$TSP}swf/swfobject.js"><xsl:text> </xsl:text></script>
                <div class="flash">
                    <script type="text/javascript">
                        var flashvars = {
                        file: "<xsl:value-of select="$TSP" />swf/<xsl:value-of select="$URI" />.flv" ,
                        image: "<xsl:value-of select="$TSP" />swf/<xsl:value-of select="$STILL" />"
                        };
                        var params = {};
                        var attributes = {};
                        attributes.id = "myId";
                        swfobject.embedSWF("<xsl:value-of select="$TSP" />swf/flvplayer.swf", "myContent", "<xsl:value-of select="$WIDTH" />", "<xsl:value-of select="$HEIGHT" />", "9.0.0", false, flashvars, params, attributes);
                    </script>

                    <div id="myContent">
                      <p>If you do not see a video above, you are either having trouble accessing the network, or do not have the Macromedia Flash Player installed. To download the Flash Player from Adobe's website: <a href="https://www.adobe.com/go/getflashplayer"><img src="https://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
                    </div>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="ref">
        <a href="#note{@no}" title="reference"><xsl:value-of select="@no" /></a>
    </xsl:template>

    <xsl:template match="erefs">
        <xsl:choose>
            <!-- INCLUDEFILES PAGE DOES NOT HOTLINK REFERENCES -->
            <xsl:when test="$PAGEINCL != ''">
                <xsl:choose>
                    <xsl:when test="count(eref) = 1">
                        [<xsl:value-of select="eref/@no" />]
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="eref">
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    [<xsl:value-of select="@no" />,
                                </xsl:when>
                                <xsl:when test="position() = last()">
                                    <xsl:value-of select="@no" />]
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@no" />,
                                    </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="count(eref) = 1">
                        <xsl:variable name="newREF">
                            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="eref/@id" /></xsl:call-template>
                        </xsl:variable>
                        (<a href="{$newREF}#note{eref/@no}" title="reference"><xsl:value-of select="eref/@no" /></a>)
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="eref">
                            <xsl:variable name="newREF">
                                <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@id" /></xsl:call-template>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="position() = 1">
                                    (<a href="{$newREF}#note{@no}" title="reference"><xsl:value-of select="@no" /></a>,
                                </xsl:when>
                                <xsl:when test="position() = last()">
                                    <a href="{$newREF}#note{@no}" title="reference"><xsl:value-of select="@no" /></a>)
                                </xsl:when>
                                <xsl:otherwise>
                                    <a href="{$newREF}#note{@no}" title="reference"><xsl:value-of select="@no" /></a>,
                                    </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
           </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--ILINK TAGS-->

    <xsl:template match="ilink-popup">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="javascript:openWindow('{$newREF}')">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink[@selfref]">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@selfref" /></xsl:call-template>
        </xsl:variable>
        <!-- USE FOR CONTENT INCLUDED INTO OTHER SITES, eg. HMQ -->
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-toc">
        <xsl:choose>
            <xsl:when test="$PAGEINCL != ''">
                <xsl:apply-templates />
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">
                    <xsl:if test="@class">
                        <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="link-toc">
        <xsl:choose>
            <xsl:when test="$PAGEINCL != ''">
                <xsl:apply-templates /><br />
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">
                    <xsl:if test="@class">
                        <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
                <br />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ilink-vahiv[@jump]">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}{@jump}">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-vahiv">
        <!-- USE NEW ILINK-TOC above FOR 'SEE ALL' DISPLAY -->
				<xsl:variable name="newREF">
					<xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
				</xsl:variable>
				<a href="{$newREF}">
					<xsl:if test="@class">
						<xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
					</xsl:if>

			<!-- FOR CONTENTS BOX HIGHLIGHTING OF LINK TO CURRENT PAGE -->
                    <xsl:if test="(../../@type='hi-self' or ../../../@type= 'dropdown') and (/pg/@id = @ref or $XMLFILE = @ref or $PAGENAV = @ref)">
                        <xsl:attribute name="class">homeitemself
                        <xsl:value-of select="@class" /></xsl:attribute>
					</xsl:if>

					<xsl:if test="@title">
						<xsl:attribute name="title">
							<xsl:value-of select="@title" />
						</xsl:attribute>
					</xsl:if>
                    <xsl:apply-templates />
				</a>
    </xsl:template>

    <xsl:template match="ilink-vahep[@jump]">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}{@jump}">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>
    <xsl:template match="ilink-vahep">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>

    <!-- FOR CONTENTS BOX HIGHLIGHTING OF LINK TO CURRENT PAGE -->
            <xsl:if test="(../../@type='hi-self' or ../../../@type= 'dropdown') and (/pg/@id = @ref or $XMLFILE = @ref)">
                <xsl:attribute name="class">homeitemself
                <xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>

            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-leftnav">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-backto">
        <xsl:choose>
            <!-- INCLUDEFILES PAGE DO REGULAR LINK, NOT BACKTO -->
            <xsl:when test="$PAGEINCL != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">
                    <xsl:if test="@class">
                        <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
                </xsl:variable>

                <xsl:variable name="BACKTEXT">
                    <xsl:call-template name="encode-backto">
                        <xsl:with-param name="TEXT" select="@backtext" />
                    </xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}backto={@backto}&#38;backtext={$BACKTEXT}">
                    <xsl:if test="@class">
                        <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- ENCODES WHITE SPACES IN URL
     for dynamic back buttons, based on  Stackoverflow url-encode.xsl -->
<xsl:template name="encode-backto">
    <xsl:param name="TEXT" />
    <xsl:if test="$TEXT">
        <xsl:variable name="first-char" select="substring($TEXT,1,1)"/>

        <xsl:choose>
            <xsl:when test="$first-char != ' '">
                <xsl:value-of select="$first-char"/>
            </xsl:when>
            <xsl:otherwise>%20</xsl:otherwise>
        </xsl:choose>

        <xsl:if test="string-length($TEXT) > 1">
            <xsl:call-template name="encode-backto">
                <xsl:with-param name="TEXT" select="substring($TEXT,2)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:if>
</xsl:template>


<!-- NEW ILINK FOR LINKING TO IMAGE LIBRARY SLIDE PAGE; NEED TO SEPARATE THE SLIDE PARAM FOR TS -->
    <xsl:template match="ilink-img">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}post=1&#38;slide={@slide}">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-ref">
        <a href="http://hivinsite.ucsf.edu/InSite?page={@ref}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
		<xsl:if test="not(image)">
			<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
		</xsl:if>
    </xsl:template>

    <xsl:template match="ilink-pgref">
        <a href="http://hivinsite.ucsf.edu/InSite?page={@ref}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
		<xsl:if test="not(image)">
			<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
		</xsl:if>
    </xsl:template>

    <xsl:template match="ilink-pptref">
        <a href="{$TSP}ppt/{@ref}.ppt">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-ppsref">
        <a href="{$TSP}ppt/{@ref}.pps">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-pdfref">
        <a href="{$TSP}pdf/{@ref}.pdf">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
		<!--<xsl:if test="not(image)">
		    <img src="{$TSP}images/icons/link-pdf.gif" alt="PDF Format" title="PDF Format" class="linkicons" />
		</xsl:if>-->
    </xsl:template>

    <xsl:template match="ilink-docref">
        <a href="{$TSP}doc/{@ref}.doc">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <xsl:if test="not(image)">
            <img src="{$TSP}images/icons/word.gif" alt="Word Format" title="Word Format" class="linkicons" />
        </xsl:if>
    </xsl:template>

    <xsl:template match="ilink-mref">
        <a href="mailto:{@ref}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <xsl:choose>
            <xsl:when test="child::image"></xsl:when>
            <xsl:otherwise><img src="{$TSP}images/icons/link-email.gif" alt="Opens your email to send a message" title="Opens your email to send a message" class="linkicons" /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ilink-aetcref">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-oref">
        <a href="{@ref}">
            <xsl:if test="substring(@ref,1,7) = 'images/'">
                <xsl:attribute name="href">
                    <xsl:value-of select="$TSP" /><xsl:value-of select="@ref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="substring(@ref,1,4) = 'ram/'">
                <xsl:attribute name="href">
                    <xsl:value-of select="$TSP" /><xsl:value-of select="@ref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="substring(@ref,1,4) = 'asx/'">
                <xsl:attribute name="href">
                    <xsl:value-of select="$TSP" /><xsl:value-of select="@ref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-wmref">
        <a href="{$TSP}asx/{@ref}.asx">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-im">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-cm">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>


    <xsl:template match="ilink-xref">
        <xsl:choose>
           <xsl:when test="contains (@ref, '.mil') or contains (@ref, '.fed.us')">
                <a href="https://{@ref}">
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
                <xsl:choose>
                    <xsl:when test="child::image"></xsl:when>
                    <xsl:when test="contains (@ref, '.pdf')">
    <!--<img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" />-->
                    </xsl:when>
                    <xsl:otherwise><img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website." title="Link will take you outside the VA website." class="linkicons" /></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains (@ref, '.gov')">
                <xsl:choose>

                    <xsl:when test="contains (@ref, 'www.hepatitis.va.gov') or contains (@ref, 'www.hiv.va.gov')">
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
                        <xsl:choose>
                            <xsl:when test="child::image"></xsl:when>
                            <xsl:when test="contains (@ref, '.pdf')">
            <img src="{$TSP}images/icons/link-pdf.gif" alt="PDF icon" title="PDF document" />
                            </xsl:when>

                          <xsl:when test="contains (@ref, 'www.hiv.va.gov')">
            <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our HIV/AIDS internet site" title="Link will take you to our HIV/AIDS internet site" class="linkicons" />
                            </xsl:when>
                          <xsl:when test="contains (@ref, 'www.hepatitis.va.gov')">
            <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our Viral Hepatitis internet site" title="Link will take you to our Viral Hepatitis internet site" class="linkicons" />
                            </xsl:when>

                            <xsl:otherwise>
            <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our internet site" title="Link will take you to our internet site" class="linkicons" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>

                    <xsl:when test="contains (@ref, 'va.gov')">
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
        <!--<xsl:if test="contains (@ref, '.pdf') and not(image)">
            <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" />
        </xsl:if>-->
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
                        <xsl:choose>
                            <xsl:when test="child::image"></xsl:when>
                            <xsl:when test="contains (@ref, '.pdf')">
                            <!-- <img src="{$TSP}images/icons/link-pdf.gif"
                                style="vertical-align:bottom;" alt="PDF icon" title="PDF document" />-->
                            </xsl:when>
                            <xsl:otherwise><img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website." title="Link will take you outside the VA website." class="linkicons" /></xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <a href="http://{@ref}">
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
                <xsl:choose>
                    <xsl:when test="child::image"></xsl:when>
                    <xsl:when test="contains (@ref, '.pdf')">
    <!-- <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" /> -->
                    </xsl:when>
                    <xsl:otherwise><img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /></xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ilink-kbref">
        <!-- only for linking to HKB content on VAHIV -->
        <xsl:variable name="newREF">
            <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'pr-kb-00'" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}kb={@ref}&#38;sec=00&#38;tp={@topic}&#38;tpage={/pg/@id}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-hkb">
        <!-- for CM linking to HKB content on VAHIV -->
        <xsl:variable name="newREF">
            <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'pr-kb-01'" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}kb={@ref}&#38;sec=00">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <!--LINK TAGS-->

    <xsl:template match="link-popup">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="javascript:openWindow('{$newREF}')">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="link[@selfref]">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@selfref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

        <xsl:template match="link-sref">
            <a href="https://{@ref}">
                <xsl:if test="@title">
                    <xsl:attribute name="title">
                        <xsl:value-of select="@title" />
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates />
            </a> 
        
	<xsl:if test="not(image)">
		    <img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
	</xsl:if>
            <br />
        </xsl:template>
        
      
    
        <xsl:template match="ilink-sref">
            <a href="https://{@ref}">
                <xsl:if test="@title">
                    <xsl:attribute name="title">
                        <xsl:value-of select="@title" />
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates />
            </a>
            
	    <xsl:if test="not(image)">
		<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
	    </xsl:if>
        </xsl:template>


    <xsl:template match="link-kbref">
        <!-- only for linking to HKB content on VAHIV -->
        <xsl:variable name="newREF">
            <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'pr-kb-00'" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}kb={@ref}&#38;sec=00&#38;tp={@topic}&#38;tpage={/pg/@id}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-hkb">
        <!-- for CM linking to HKB content on VAHIV -->
        <xsl:variable name="newREF">
            <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'pr-kb-01'" /></xsl:call-template>
        </xsl:variable>

        <a href="{$newREF}kb={@ref}&#38;sec=00">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-vahiv[@jump]">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}{@jump}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>
    <xsl:template match="link-vahiv">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>
    <xsl:template match="link-vahep[@jump]">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}{@jump}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>
    <xsl:template match="link-vahep">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-ref">
        <a href="http://hivinsite.ucsf.edu/InSite?page={@ref}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
		<xsl:if test="not(image)">
			<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
		</xsl:if>
        <br />
    </xsl:template>

    <xsl:template match="link-pgref">
        <a href="http://hivinsite.ucsf.edu/InSite?page={@ref}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
		<xsl:if test="not(image)">
			<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
		</xsl:if>
        <br />
    </xsl:template>

    <xsl:template match="link-pptref">
        <a href="{$TSP}ppt/{@ref}.ppt">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-ppsref">
        <a href="{$TSP}ppt/{@ref}.pps">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-pdfref">
        <a href="{$TSP}pdf/{@ref}.pdf">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>

        <xsl:choose>
            <xsl:when test="child::image"></xsl:when>
            <xsl:otherwise><!-- <img src="{$TSP}images/icons/link-pdf.gif" alt="PDF Format" title="PDF Format" class="linkicons" /> --></xsl:otherwise>
        </xsl:choose>
        <br />
    </xsl:template>

    <xsl:template match="link-docref">
        <a href="{$TSP}doc/{@ref}.doc">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <xsl:if test="not(image)">
            <img src="{$TSP}images/icons/word.gif" alt="Word Format" title="Word Format" class="linkicons" />
        </xsl:if>
        <br />
    </xsl:template>

    <xsl:template match="link-mref">
        <a href="mailto:{@ref}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-aetcref">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-im">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-cm">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-oref">
        <a href="{@ref}">
            <xsl:if test="substring(@ref,1,7) = 'images/'">
                <xsl:attribute name="href">
                    <xsl:value-of select="$TSP" /><xsl:value-of select="@ref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="substring(@ref,1,4) = 'ram/'">
                <xsl:attribute name="href">
                    <xsl:value-of select="$TSP" /><xsl:value-of select="@ref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="substring(@ref,1,4) = 'asx/'">
                <xsl:attribute name="href">
                    <xsl:value-of select="$TSP" /><xsl:value-of select="@ref" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-wmref">
        <a href="{$TSP}asx/{@ref}.asx">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-xref">
        <xsl:choose>
            <xsl:when test="contains (@ref, '.mil') or contains (@ref, '.fed.us')">
                <a href="https://{@ref}">
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
                <xsl:if test="not(image)">
                    <xsl:choose>
                        <xsl:when test="contains (@ref, '.pdf')">
        <!-- <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" /> -->
                        </xsl:when>
                        <xsl:otherwise>
					<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <br />
            </xsl:when>
            <xsl:when test="contains (@ref, '.gov')">
                <xsl:choose>

                    <xsl:when test="contains (@ref, 'www.hepatitis.va.gov') or contains (@ref, 'www.hiv.va.gov')">
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
                        <xsl:if test="not(image)">
                            <xsl:choose>
                                <xsl:when test="contains (@ref, '.pdf')">
                <!-- <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" /> -->
                                </xsl:when>

                              <xsl:when test="contains (@ref, 'www.hiv.va.gov')">
                <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our HIV/AIDS internet site" title="Link will take you to our HIV/AIDS internet site" class="linkicons" />
                                </xsl:when>
                              <xsl:when test="contains (@ref, 'www.hepatitis.va.gov')">
                <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our Viral Hepatitis internet site" title="Link will take you to our Viral Hepatitis internet site" class="linkicons" />
                                </xsl:when>

                                <xsl:otherwise>
                <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our internet site" title="Link will take you to our internet site" class="linkicons" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <br />
                    </xsl:when>

                    <xsl:when test="contains (@ref, 'va.gov')">
                        <xsl:text />
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
                        <!-- <xsl:if test="contains (@ref, '.pdf') and not(image)">
                            <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" />
                        </xsl:if> -->
                        <br />
                    </xsl:when>

                    <xsl:otherwise>
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
						<xsl:if test="not(image)">
                            <xsl:choose>
                                <xsl:when test="contains (@ref, '.pdf')">
                <!-- <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" /> -->
                                </xsl:when>
                                <xsl:otherwise>
							<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
                                </xsl:otherwise>
                            </xsl:choose>
						</xsl:if>
                        <br />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <a href="http://{@ref}">
                    <xsl:if test="@title">
                        <xsl:attribute name="title">
                            <xsl:value-of select="@title" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </a>
                <xsl:if test="not(image)">
                    <xsl:choose>
                        <xsl:when test="contains (@ref, '.pdf')">
        <!-- <img src="{$TSP}images/icons/link-pdf.gif" style="padding-left:4px; vertical-align:bottom;" alt="PDF icon" title="PDF document" /> -->
                        </xsl:when>
                        <xsl:otherwise>
					<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <br />
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--INTRA ILINK TAGS-->

    <xsl:template match="ilink-vahep-intra">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-vahiv-intra">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="ilink-xref-intra">
        <xsl:choose>
            <xsl:when test="$INTRA =''">
                <xsl:if test="@title">
                    <xsl:value-of select="@title" />
                </xsl:if>
            </xsl:when>
            <xsl:when test="@ref = $PGID and $INTRA ='true'">
                <xsl:apply-templates />
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains (@ref, '.mil') or contains (@ref, '.fed.us')">
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
						<xsl:if test="not(image)">
							<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
						</xsl:if>
                    </xsl:when>
                    <xsl:when test="contains (@ref, '.gov')">
                        <xsl:choose>
                            <xsl:when test="contains (@ref, 'va.gov')">
                                <a href="https://{@ref}">
                                    <xsl:if test="@title">
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="@title" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:apply-templates />
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="https://{@ref}">
                                    <xsl:if test="@title">
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="@title" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:apply-templates />
                                </a>
								<xsl:if test="not(image)">
									<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
								</xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
						<xsl:if test="not(image)">
							<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
						</xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--INTRA LINK TAGS-->

    <xsl:template match="link-vahep-intra">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-vahiv-intra">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <a href="{$newREF}">
            <xsl:if test="@title">
                <xsl:attribute name="title">
                    <xsl:value-of select="@title" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </a>
        <br />
    </xsl:template>

    <xsl:template match="link-xref-intra">
        <xsl:choose>
            <xsl:when test="$INTRA =''">
                <xsl:if test="@title">
                    <xsl:value-of select="@title" />
                </xsl:if>
            </xsl:when>
            <xsl:when test="@ref = $PGID and $INTRA ='true'">
                <xsl:apply-templates />
                <br />
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains (@ref, '.mil') or contains (@ref, '.fed.us')">
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
                        <br />
                    </xsl:when>
                    <xsl:when test="contains (@ref, '.gov')">
                        <xsl:choose>
                            <xsl:when test="contains (@ref, 'va.gov')">
                                <a href="https://{@ref}">
                                    <xsl:if test="@title">
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="@title" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:apply-templates />
                                </a>
                                <br />
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="https://{@ref}">
                                    <xsl:if test="@title">
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="@title" />
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:apply-templates />
                                </a>
								<xsl:if test="not(image)">
									<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
								</xsl:if>
                                <br />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="https://{@ref}">
                            <xsl:if test="@title">
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@title" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates />
                        </a>
						<xsl:if test="not(image)">
							<img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" />
						</xsl:if>
                        <br />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- CRUMBS -->

    <xsl:template match="crumbs" mode="crumb">
        <div class="crumb">
            <xsl:choose>
                <xsl:when test="$TS = 'true'">
                    <a href="{$LINKPATH}index.asp">Home</a> &#62;
                    <xsl:for-each select="crumb">
                        <xsl:choose>
                            <xsl:when test="@link = 'index'"></xsl:when>
                            <xsl:when test="position()=last()">
                                <xsl:value-of select="@name" />
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="{$LINKPATH}{@link}.asp" title="{@name}">
                                    <xsl:value-of select="@name" />
                                </a>  &#62; </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <a href="va?page=we-teamsite&#38;TS=index">Home</a> &#62;
                    <xsl:for-each select="crumb">
                        <xsl:choose>
                            <xsl:when test="@link = 'index'"></xsl:when>
                            <xsl:when test="@link = 'va?page=we-00-00'"></xsl:when>
                            <xsl:when test="@link = 'vahiv?page=we-00-00'"></xsl:when>
                            <xsl:when test="@link = 'vahep?page=we-00-00'"></xsl:when>
                            <xsl:when test="position()=last()">
                                <xsl:value-of select="@name" />
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="va?page=we-teamsite&#38;TS={@link}" title="{@name}">
                                    <xsl:value-of select="@name" />
                                </a>  &#62; </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>


    <!-- BOX -->
    <xsl:template match="box">
        <xsl:if test="@no">
            <a name="b-{@no}">
                <xsl:text> </xsl:text>
            </a>
        </xsl:if>
        <div class="boxes box">
            <xsl:if test="@class">
                <xsl:attribute name="class">boxes <xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="boxheader" mode="boxheader" />
            <div class="boxcontent">

                <xsl:apply-templates />

            </div>
            <xsl:apply-templates select="boxfooter" mode="boxfooter" />
        </div>
    </xsl:template>

    <xsl:template match="boxsection">
        <xsl:if test="@no">
            <a name="S{@no}X">
                <xsl:text> </xsl:text>
            </a>
        </xsl:if>
        <xsl:if test="title">
            <h4>
                <xsl:if test="title/@class">
                    <xsl:attribute name="class">
                        <xsl:value-of select="title/@class" />
                    </xsl:attribute>
                </xsl:if>

                <xsl:apply-templates select="title" />
            </h4>
        </xsl:if>

        <xsl:apply-templates select="*[not(self::title)]" />
    </xsl:template>

    <xsl:template match="boxsection/boxsection">
        <xsl:if test="@no">
            <a name="S{@no}X">
                <xsl:text> </xsl:text>
            </a>
        </xsl:if>
        <xsl:if test="title">
            <h5>
                <xsl:apply-templates select="title" />
            </h5>
        </xsl:if>

        <xsl:apply-templates select="*[not(self::title)]" />
    </xsl:template>

    <xsl:template match="boxsection/boxsection/boxsection">
        <xsl:if test="@no">
            <a name="S{@no}X">
                <xsl:text> </xsl:text>
            </a>
        </xsl:if>
        <xsl:if test="title">
            <h6>
                <xsl:apply-templates select="title" />
            </h6>
        </xsl:if>

        <xsl:apply-templates select="*[not(self::title)]" />
    </xsl:template>

    <xsl:template match="title">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="boxheader" mode="boxheader">
        <h3>
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </h3>
    </xsl:template>

    <xsl:template match="boxfooter" mode="boxfooter">
        <div class="boxfooter">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <!-- items -->
    <xsl:template match="items">
        <xsl:choose>
            <xsl:when test="@type='ol'">
                <ol>
                    <xsl:apply-templates />
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <ul>
                    <xsl:if test="@class">
                        <xsl:attribute name="class">
                            <xsl:value-of select="@class" />
                        </xsl:attribute>
                    </xsl:if>

                    <xsl:apply-templates />
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="item">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">
                    <li>
                        <xsl:apply-templates />
                    </li>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <li>
                    <xsl:if test="@class">
                        <xsl:attribute name="class">
                            <xsl:value-of select="@class" />
                        </xsl:attribute>
                    </xsl:if>

                    <xsl:apply-templates />
                    <!--<xsl:choose>
                        <xsl:when test="csubitem or csubitem-self">
                            tesitng
                            <xsl:apply-templates select="*[not(self::csubitem)]" />

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates />
                        </xsl:otherwise>
                    </xsl:choose>-->
                </li>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="item/item">
        <ul>
            <xsl:choose>
                <xsl:when test="@class= 'intra'">
                    <xsl:if test="$INTRA != ''">
                        <li>
                            <xsl:apply-templates />
                        </li>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <li>
                        <xsl:if test="@class">
                            <xsl:attribute name="class">
                                <xsl:value-of select="@class" />
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates />
                    </li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
    </xsl:template>


    <xsl:template match="fitem">
            <xsl:choose>
                <xsl:when test="@class= 'intra'">
                    <xsl:if test="$INTRA != ''">
                        <li class="intra">
                            <b>
                                <xsl:apply-templates />
                            </b>
                        </li>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <li>
                        <b>
                            <xsl:apply-templates />
                        </b>
                    </li>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>

    <xsl:template match="item/fitem">
        <ul>
            <xsl:choose>
                <xsl:when test="@class= 'intra'">
                    <xsl:if test="$INTRA != ''">
                        <li>
                            <b>
                                <xsl:apply-templates />
                            </b>
                        </li>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <li>
                        <b>
                            <xsl:apply-templates />
                        </b>
                    </li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
    </xsl:template>

    <xsl:template match="fitem/item">
        <ul>
            <xsl:choose>
                <xsl:when test="@class= 'intra'">
                    <xsl:if test="$INTRA != ''">
                        <li>
                            <xsl:apply-templates />
                        </li>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <li>
                        <xsl:apply-templates />
                    </li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
    </xsl:template>

    <xsl:template match="fitem/fitem">
        <ul>
            <xsl:choose>
                <xsl:when test="@class= 'intra'">
                    <xsl:if test="$INTRA != ''">
                        <li>
                            <b>
                                <xsl:apply-templates />
                            </b>
                        </li>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <li>
                        <b>
                            <xsl:apply-templates />
                        </b>
                    </li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
    </xsl:template>
    <!-- end fix for item in item -->


    <xsl:template match="item-text">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="item/item/item-text">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="fitem-text">
            <b>
                <xsl:apply-templates />
            </b>
    </xsl:template>
    <!-- end item tag updates -->

    <!--templates for related resources box-->

    <xsl:template match="related" mode="related">

	<div class="widget">
            <xsl:choose>
                <xsl:when test="@title"><div class="widget-title"><h4 class="prboxtitle"><xsl:value-of select="@title" /></h4></div></xsl:when>
                <xsl:when test="title">
		    <div class="widget-title">
                	<h4 class="prboxtitle">
						<xsl:choose>
							<xsl:when test="title/ilink-vahiv">
								<xsl:apply-templates select="title/ilink-vahiv" />
							</xsl:when>
                            <xsl:when test="title/ilink-vahep">
                                <xsl:apply-templates select="title/ilink-vahep" />
                            </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="title" />
							</xsl:otherwise>
						</xsl:choose>
                	</h4>
		    </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>

            <div class="prboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
	</div>

        <!--<div class="relatedbox">
           <xsl:if test="@title"> <h3>
                <xsl:value-of select="@title" />
           </h3></xsl:if>
            <xsl:if test="title"> <h3>
                <xsl:apply-templates select="title" />
            </h3></xsl:if>

            <div class="rrboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
        </div>-->

    </xsl:template>

    <xsl:template match="related-image" mode="related">

        <div class="related-image">
            <xsl:apply-templates />
        </div>

    </xsl:template>

    <xsl:template match="related-bottom">
		        <div class="widget">
            <xsl:choose>
                <xsl:when test="@title"><div class="widget-title" style="width: 100% !important;"><h4 class="prboxtitle"><xsl:value-of select="@title" /></h4></div></xsl:when>
                <xsl:when test="title">
		    <div class="widget-title" style="width: 100% !important;">
                	<h4 class="prboxtitle">
						<xsl:choose>
							<xsl:when test="title/ilink-vahiv">
								<xsl:apply-templates select="title/ilink-vahiv" />
							</xsl:when>
                            <xsl:when test="title/ilink-vahep">
                                <xsl:apply-templates select="title/ilink-vahep" />
                            </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="title" />
							</xsl:otherwise>
						</xsl:choose>
                	</h4>
		    </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>

            <div class="prboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
	</div>


		<!--<a name="related"><xsl:text> </xsl:text></a>
        <div class="relatedboxbottom">
            <xsl:if test="@title"><h3>
                <xsl:value-of select="@title" />
            </h3></xsl:if>
            <xsl:if test="title"> <h3>
                <xsl:apply-templates select="title" />
            </h3></xsl:if>

            <div class="rrboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
        </div>-->

    </xsl:template>

    <xsl:template match="abbreviations">
        <xsl:apply-templates select="abbreviation">
            <xsl:sort select="term" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="abbreviation">
        <xsl:variable name="SEE" select="related/see" />
        <p class="normal">
            <a name="{term}">
                <xsl:text> </xsl:text>
            </a>
            <b>
                <xsl:value-of select="term" />
            </b>
            <br />
            <xsl:apply-templates select="def" />
            <xsl:if test="related">
                <xsl:choose>
                    <xsl:when test="$TS = 'true'">
                        See <xsl:for-each select="related/see">
                        <a href="{$LINKPATH}abbr-{@ref}#{.}"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">; </xsl:if></xsl:for-each>.
                    </xsl:when>

                    <xsl:otherwise>
                        See <xsl:for-each select="related/see">
                        <a href="va?page=we-teamsite&#38;TS=abbr-{@ref}#{.}"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">; </xsl:if></xsl:for-each>.
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </p>
    </xsl:template>


    <xsl:template match="definitions">
        <xsl:apply-templates select="definition">
            <xsl:sort select="term" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="definition">
        <xsl:variable name="SEE" select="related/see" />
        <div class="normal">
            <a name="{term}">
                <xsl:text> </xsl:text>
            </a>
            <p>
                <b>
                    <xsl:value-of select="term" />
                </b>
            </p>
            <p><xsl:apply-templates select="def" /></p>
            <xsl:if test="related">
                <xsl:choose>
                    <xsl:when test="$TS = 'true'">
                        <p>See <xsl:for-each select="related/see"><a href="{$LINKPATH}provider/glossary/{@ref}.asp#{.}"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">; </xsl:if></xsl:for-each>.</p>
                    </xsl:when>

                    <xsl:otherwise>
                        <p>See <xsl:for-each select="related/see"><a href="va?page=we-teamsite&#38;TS=provider/glossary/{@ref}#{.}"><xsl:value-of select="." /></a><xsl:if test="position()!=last()">; </xsl:if></xsl:for-each>.</p>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="def">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="pg-include">

        <xsl:apply-templates />

    </xsl:template>

    <xsl:template match="sup">
        <sup>
            <xsl:apply-templates />
        </sup>
    </xsl:template>

    <xsl:template match="sub">
        <sub>
            <xsl:apply-templates />
        </sub>
    </xsl:template>

    <xsl:template match="br">

        <br />

    </xsl:template>


    <xsl:template match="i">
        <i>
            <xsl:if test="@class">	
		<xsl:attribute name="class">
			<xsl:value-of select="@class" />
		</xsl:attribute>
	    </xsl:if>	
            <xsl:apply-templates />
        </i>
    </xsl:template>


    <xsl:template match="b">
        <b>
            <xsl:apply-templates />
        </b>
    </xsl:template>

    <xsl:template match="strong">
        <strong>
            <xsl:apply-templates />
        </strong>
    </xsl:template>

    <xsl:template match="hot"> <!-- CAN'T USE RED FONT ON VA SITES, PER PATTY -->
        <em>
            <xsl:apply-templates />
        </em>
    </xsl:template>
    <xsl:template match="em">
        <em>
            <xsl:apply-templates />
        </em>
    </xsl:template>

    <!-- THIS IS FOR DISPLAY ONLY, EG. IN TABLES; SEE PCM DEPRESSION CHAPTER -->
    <xsl:template match="input[@type='checkbox']">
        <xsl:if test="@label"><label for="{@name}" style="position: absolute; left: -9999px;"><xsl:value-of select="@label" /></label></xsl:if>
        <input type="checkbox" id="{@name}" />
    </xsl:template>

    <xsl:template match="p">
        <xsl:choose>
            <xsl:when test="@type = 'next' and $PAGEWIDE = 'yes'">
            </xsl:when>
            <xsl:when test="@class = 'intra'">
                <xsl:if test="$INTRA !=''">
                    <p class="intra">
                        <br />
                        <xsl:apply-templates />
                        <br />
                    </p>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:if test="@class">
                        <xsl:attribute name="class">
                            <xsl:value-of select="@class" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ol">
        <xsl:choose>
            <xsl:when test="@type">
                <ol type="{@type}">
					<xsl:if test="@start">
						<xsl:attribute name="start">
							<xsl:value-of select="@start" />
						</xsl:attribute>
					</xsl:if>
                    <xsl:apply-templates />
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <ol>
					<xsl:if test="@start">
						<xsl:attribute name="start">
							<xsl:value-of select="@start" />
						</xsl:attribute>
					</xsl:if>
                    <xsl:apply-templates />
                </ol>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ol/ol">
        <xsl:choose>
            <xsl:when test="@type">
                <ol type="{@type}">
                    <xsl:apply-templates />
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <ol>
                    <xsl:apply-templates />
                </ol>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ul">
        <ul>
        <xsl:if test="@class">	
			<xsl:attribute name="class">
				<xsl:value-of select="@class" />
			</xsl:attribute>
	    </xsl:if>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="li/ul">
        <ul>
        <xsl:if test="@class">	
			<xsl:attribute name="class">
				<xsl:value-of select="@class" />
			</xsl:attribute>
	    </xsl:if>
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="li/ol">
        <xsl:choose>
            <xsl:when test="@type">
                <ol type="{@type}">
                    <xsl:apply-templates />
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <ol>
                    <xsl:apply-templates />
                </ol>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="li">
        <xsl:choose>
            <xsl:when test="$INTRA !=''">

                <li>

                        <xsl:apply-templates />

                </li>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@intra='yes'"> </xsl:when>
                    <xsl:otherwise>
                        <li>

                                <xsl:apply-templates />

                        </li>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="figure[@type='homepage']">
        <div class="figure featured">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <xsl:template match="figure">
        <div class="figure">
            <xsl:if test="@width">
                <xsl:attribute name="style">width: <xsl:value-of select="@width" />px; <xsl:if test="@align">float: <xsl:value-of select="@align" />; margin: 0 25px 15px 25px;</xsl:if>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@no">
                <a name="f-{@no}">
                    <xsl:text> </xsl:text>
                </a>
            </xsl:if>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="figureheader">
        <h3 class="figureheader">
            <xsl:apply-templates />
        </h3>
    </xsl:template>

    <xsl:template match="image">
        <img src="{$TSP}images/{@src}" border="0" alt="{@alt}">
            <xsl:choose>
                <xsl:when test="@align = 'right'">
                    <xsl:attribute name="class">imageright</xsl:attribute>
                </xsl:when>
                <xsl:when test="@align = 'left'">
                    <xsl:attribute name="class">imageleft</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="@usemap">
                <xsl:attribute name="usemap">
                    <xsl:value-of select="@usemap" />
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@width">
                <xsl:attribute name="width">
                    <xsl:value-of select="@width" />
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@height">
                <xsl:attribute name="height">
                    <xsl:value-of select="@height" />
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@border">
                <xsl:attribute name="border">
                    <xsl:value-of select="@border" />
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@name">
                <xsl:attribute name="name">
                    <xsl:value-of select="@name" />
                </xsl:attribute>
            </xsl:if>
        </img>
    </xsl:template>

    <xsl:template match="figurefooter">
        <div class="figurefooter">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="sec">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">

                    <xsl:if test="@no">
                        <a name="S{@no}X">
                            <xsl:text> </xsl:text>
                        </a>
                    </xsl:if>
                    <xsl:if test="@title">
						<xsl:choose>
                                <xsl:when test="$PAGEINCL != ''">
									<h4>
										<xsl:value-of select="@title" disable-output-escaping="yes" />
										<xsl:if test="@ref">
											(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
										</xsl:if>
									</h4>
								</xsl:when>
                                <xsl:when test="$TSXML != '' and document($TSXML)/pg/@include != ''">
                                    <h4>
                                        <xsl:value-of select="@title" disable-output-escaping="yes" />
                                        <xsl:if test="@ref">
                                            (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
                                        </xsl:if>
                                    </h4>
                                </xsl:when>
								<xsl:otherwise>
									<h3>
										<xsl:value-of select="@title" disable-output-escaping="yes" />
										<xsl:if test="@ref">
											(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
										</xsl:if>
									</h3>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="title">
							<xsl:choose>
                                <xsl:when test="$PAGEINCL != ''">
									<h4>
										<xsl:apply-templates select="title" />
										<xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
										</xsl:if>
									</h4>
								</xsl:when>
                                <xsl:when test="$TSXML != '' and document($TSXML)/pg/@include != ''">
                                    <h4>
                                        <xsl:value-of select="title" disable-output-escaping="yes" />
                                        <xsl:if test="@ref">
                                            (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
                                        </xsl:if>
                                    </h4>
                                </xsl:when>
								<xsl:otherwise>
									<h3>
										<xsl:apply-templates select="title" />
										<xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
										</xsl:if>
									</h3>
								</xsl:otherwise>
							</xsl:choose>
                    	</xsl:if>

                    <xsl:apply-templates select="*[not(self::title)]" />
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="@no">
                    <a name="S{@no}X">
                        <xsl:text> </xsl:text>
                    </a>
                </xsl:if>
                <xsl:choose>
			<xsl:when test="@title">
			<xsl:choose>
				<xsl:when test="$PAGEINCL != ''">
					<h4>
					<xsl:value-of select="@title" disable-output-escaping="yes" />
					<xsl:if test="@ref">
					(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
					</xsl:if>
					</h4>
				</xsl:when>
				<xsl:when test="$TSXML != '' and document($TSXML)/pg/@include != ''">
					<h4>
					<xsl:value-of select="@title" disable-output-escaping="yes" />
					<xsl:if test="@ref">
					(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
					</xsl:if>
					</h4>
                            	</xsl:when>
				<xsl:otherwise>
					<h3>
					<xsl:value-of select="@title" disable-output-escaping="yes" />
					<xsl:if test="@ref">
					(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
					</xsl:if>
					</h3>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:apply-templates />
			</xsl:when>
					<xsl:when test="title">
						<xsl:choose>
                            <xsl:when test="$PAGEINCL != ''">
								<h4>
									<xsl:apply-templates select="title" />
									<xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
									</xsl:if>
								</h4>
							</xsl:when>
                            <xsl:when test="$TSXML != '' and document($TSXML)/pg/@include != ''">
                                <h4>
                                    <xsl:value-of select="title" disable-output-escaping="yes" />
                                    <xsl:if test="@ref">
                                        (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
                                    </xsl:if>
                                </h4>
                            </xsl:when>
							<xsl:otherwise>
								<h3>
									<xsl:apply-templates select="title" />
									<xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
									</xsl:if>
								</h3>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:apply-templates select="*[not(self::title)]" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates />
					</xsl:otherwise>
				</xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sec/sec">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">

                    <h4 class="{$HCLASS}section">
                        <xsl:if test="@no">
                            <a name="S{@no}X">
                                <xsl:text> </xsl:text>
                            </a>
                        </xsl:if>
                        <xsl:if test="@title">
                            <xsl:value-of select="@title" disable-output-escaping="yes" />
                        </xsl:if>
                        <xsl:if test="title">
                            <xsl:apply-templates select="title" />
                        </xsl:if>
                        <xsl:if test="@ref"> (<a href="#note{@ref}">
                                <xsl:value-of select="@ref" />
                            </a>)</xsl:if>
                    </h4>

                    <xsl:apply-templates />
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                    <xsl:if test="@no">
                        <a name="S{@no}X">
                            <xsl:text> </xsl:text>
                        </a>
                    </xsl:if>
                    <xsl:choose>
                    <xsl:when test="@title">
			<xsl:choose>
				<xsl:when test="$PAGEINCL != ''">
					<h5 class="{$HCLASS}section"><xsl:value-of select="@title" disable-output-escaping="yes" /><xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)</xsl:if></h5>
				</xsl:when>
				<xsl:when test="$TSXML != '' and document($TSXML)/pg/@include != ''">
					<h5 class="{$HCLASS}section">
					<xsl:value-of select="@title" disable-output-escaping="yes" />
					<xsl:if test="@ref">
					(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
					</xsl:if>
					</h5>
				</xsl:when>
				<xsl:otherwise>
					<h4 class="{$HCLASS}section"><xsl:value-of select="@title" disable-output-escaping="yes" /><xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)</xsl:if></h4>
					</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates />
				</xsl:when>
				<xsl:when test="title">
					<xsl:choose>
						<xsl:when test="$PAGEINCL != ''">
						<h5 class="{$HCLASS}section"><xsl:apply-templates select="title" /><xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a></xsl:if></h5>
						</xsl:when>

						<xsl:when test="$TSXML != '' and document($TSXML)/pg/@include != ''">
						<h5 class="{$HCLASS}section">
						<xsl:value-of select="title" disable-output-escaping="yes" />
						<xsl:if test="@ref">
						(<a href="#note{@ref}"><xsl:value-of select="@ref" /></a>)
						</xsl:if>
						</h5>
						</xsl:when>

						<xsl:otherwise>
						<h4 class="{$HCLASS}section"><xsl:apply-templates select="title" /><xsl:if test="@ref"> (<a href="#note{@ref}"><xsl:value-of select="@ref" /></a></xsl:if></h4>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="*[not(self::title)]" />
				</xsl:when>
			<xsl:otherwise>
			<xsl:apply-templates />
		</xsl:otherwise>
		</xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sec/sec/sec">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">

                    <h5 class="unisection">
                        <xsl:if test="@no">
                            <a name="S{@no}X">
                                <xsl:text> </xsl:text>
                            </a>
                        </xsl:if>
                        <xsl:if test="@title">
                            <xsl:value-of select="@title" disable-output-escaping="yes" />
                        </xsl:if>
                        <xsl:if test="title">
                            <xsl:apply-templates select="title" />
                        </xsl:if>
                        <xsl:if test="@ref"> (<a href="#note{@ref}">
                                <xsl:value-of select="@ref" />
                            </a>)</xsl:if>
                    </h5>

                    <xsl:apply-templates />

                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <h5 class="unisection">
                    <xsl:if test="@no">
                        <a name="S{@no}X">
                            <xsl:text> </xsl:text>
                        </a>
                    </xsl:if>
                    <xsl:if test="@title">
                        <xsl:value-of select="@title" disable-output-escaping="yes" />
                    </xsl:if>
                    <xsl:if test="title">
                        <xsl:apply-templates select="title" />
                    </xsl:if>
                    <xsl:if test="@ref"> (<a href="#note{@ref}">
                            <xsl:value-of select="@ref" />
                        </a>)</xsl:if>
                </h5>

                <xsl:apply-templates select="*[not(self::title)]" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sec/sec/sec/sec">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">

                    <h6 class="{$HCLASS}section">
                        <xsl:if test="@no">
                            <a name="S{@no}X">
                                <xsl:text> </xsl:text>
                            </a>
                        </xsl:if>
                        <xsl:if test="@title">
                            <xsl:value-of select="@title" disable-output-escaping="yes" />
                        </xsl:if>
                        <xsl:if test="title">
                            <xsl:apply-templates select="title" />
                        </xsl:if>
                        <xsl:if test="@ref"> (<a href="#note{@ref}">
                                <xsl:value-of select="@ref" />
                            </a>)</xsl:if>
                    </h6>

                    <xsl:apply-templates />

                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <h6 class="{$HCLASS}section">
                    <xsl:if test="@no">
                        <a name="S{@no}X">
                            <xsl:text> </xsl:text>
                        </a>
                    </xsl:if>
                    <xsl:if test="@title">
                        <xsl:value-of select="@title" disable-output-escaping="yes" />
                    </xsl:if>
                    <xsl:if test="title">
                        <xsl:apply-templates select="title" />
                    </xsl:if>
                    <xsl:if test="@ref"> (<a href="#note{@ref}">
                            <xsl:value-of select="@ref" />
                        </a>)</xsl:if>
                </h6>

                <xsl:apply-templates />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text/sec">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">
                    <xsl:if test="@title">
                        <xsl:choose>
                            <xsl:when test="@display">
                                <xsl:choose>
                                    <xsl:when test="@display != ''">
                                        <p class="section2">
                                            <xsl:if test="@no">
                                                <a name="S{@no}X">
                                                    <xsl:text> </xsl:text>
                                                </a>
                                            </xsl:if><xsl:value-of select="@display" />.<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:if test="@title">
                                                <xsl:value-of select="@title" disable-output-escaping="yes" />
                                            </xsl:if><xsl:if test="title">
                                                <xsl:apply-templates select="title" />
                                            </xsl:if>
                                            <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                    <xsl:value-of select="@ref" />
                                                </a>)</xsl:if>
                                        </p>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p class="section2">
                                            <xsl:if test="@no">
                                                <a name="S{@no}X">
                                                    <xsl:text> </xsl:text>
                                                </a>
                                            </xsl:if>
                                            <xsl:if test="@title">
                                                <xsl:value-of select="@title" disable-output-escaping="yes" />
                                            </xsl:if>
                                            <xsl:if test="title">
                                                <xsl:apply-templates select="title" />
                                            </xsl:if>
                                            <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                    <xsl:value-of select="@ref" />
                                                </a>)</xsl:if>
                                        </p>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:when>
                            <xsl:when test="@no">
                                <xsl:if test="not(@display)">
                                    <xsl:choose>
                                        <xsl:when test="@no != ''">
                                            <p class="section2">
                                                <xsl:if test="@no">
                                                    <a name="S{@no}X">
                                                        <xsl:text> </xsl:text>
                                                    </a>
                                                </xsl:if>
                                                <xsl:value-of select="@no" />
                                                <xsl:text> </xsl:text>
                                                <xsl:if test="@title">
                                                    <xsl:value-of select="@title" disable-output-escaping="yes" />
                                                </xsl:if>
                                                <xsl:if test="title">
                                                    <xsl:apply-templates select="title" />
                                                </xsl:if>
                                                <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                        <xsl:value-of select="@ref" />
                                                    </a>)</xsl:if>
                                            </p>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <p class="section2">
                                                <xsl:if test="@no">
                                                    <a name="S{@no}X">
                                                        <xsl:text> </xsl:text>
                                                    </a>
                                                </xsl:if>
                                                <xsl:if test="@title">
                                                    <xsl:value-of select="@title" disable-output-escaping="yes" />
                                                </xsl:if>
                                                <xsl:if test="title">
                                                    <xsl:apply-templates select="title" />
                                                </xsl:if>
                                                <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                        <xsl:value-of select="@ref" />
                                                    </a>)</xsl:if>
                                            </p>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>

                    <xsl:apply-templates />
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="@title">
                    <xsl:choose>
                        <xsl:when test="@display">
                            <xsl:choose>
                                <xsl:when test="@display != ''">
                                    <p class="section2">
                                        <xsl:if test="@no">
                                            <a name="S{@no}X">
                                                <xsl:text> </xsl:text>
                                            </a>
                                        </xsl:if><xsl:value-of select="@display" />.<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:if test="@title">
                                            <xsl:value-of select="@title" disable-output-escaping="yes" />
                                        </xsl:if>
                                        <xsl:if test="title">
                                            <xsl:apply-templates select="title" />
                                        </xsl:if>
                                        <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                <xsl:value-of select="@ref" />
                                            </a>)</xsl:if>
                                    </p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p class="section2">
                                        <xsl:if test="@no">
                                            <a name="S{@no}X">
                                                <xsl:text> </xsl:text>
                                            </a>
                                        </xsl:if>
                                        <xsl:if test="@title">
                                            <xsl:value-of select="@title" disable-output-escaping="yes" />
                                        </xsl:if>
                                        <xsl:if test="title">
                                            <xsl:apply-templates select="title" />
                                        </xsl:if>
                                        <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                <xsl:value-of select="@ref" />
                                            </a>)</xsl:if>
                                    </p>
                                </xsl:otherwise>
                            </xsl:choose>

                        </xsl:when>
                        <xsl:when test="@no">
                            <xsl:if test="not(@display)">
                                <xsl:choose>
                                    <xsl:when test="@no != ''">
                                        <p class="section2">
                                            <xsl:if test="@no">
                                                <a name="S{@no}X">
                                                    <xsl:text> </xsl:text>
                                                </a>
                                            </xsl:if>
                                            <xsl:value-of select="@no" />
                                            <xsl:text> </xsl:text>
                                            <xsl:if test="@title">
                                                <xsl:value-of select="@title" disable-output-escaping="yes" />
                                            </xsl:if>
                                            <xsl:if test="title">
                                                <xsl:apply-templates select="title" />
                                            </xsl:if>
                                            <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                    <xsl:value-of select="@ref" />
                                                </a>)</xsl:if>
                                        </p>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p class="section2">
                                            <xsl:if test="@no">
                                                <a name="S{@no}X">
                                                    <xsl:text> </xsl:text>
                                                </a>
                                            </xsl:if>
                                            <xsl:if test="@title">
                                                <xsl:value-of select="@title" disable-output-escaping="yes" />
                                            </xsl:if>
                                            <xsl:if test="title">
                                                <xsl:apply-templates select="title" />
                                            </xsl:if>
                                            <xsl:if test="@ref"> (<a href="#note{@ref}">
                                                    <xsl:value-of select="@ref" />
                                                </a>)</xsl:if>
                                        </p>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>

                <xsl:apply-templates />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="subsec">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">

            <tr>
                <td colspan="2">
                    <img src="{$TSP}images/global/clr_pxl.gif" width="1" height="10" border="0" alt="" />
                </td>
            </tr>

            <xsl:if test="@title">
                <tr>
                    <td valign="top" class="{$HCLASS}section">
                        <h4>
                            <a name="S{@no}X">
                                <xsl:text> </xsl:text>
                            </a>
                            <xsl:if test="@title">
                                <xsl:value-of select="@title" disable-output-escaping="yes" />
                            </xsl:if>
                            <xsl:if test="title">
                                <xsl:apply-templates select="title" />
                            </xsl:if>
                            <xsl:if test="@ref"> (<a href="#note{@ref}">
                                    <xsl:value-of select="@ref" />
                                </a>)</xsl:if>
                        </h4>
                    </td>
                </tr>
            </xsl:if>
            <tr>
                <td>
                    <img src="{$TSP}images/global/clr_pxl.gif" width="350" height="10" border="0" alt="" />
                </td>
            </tr>
            <tr>
                <td class="normal">
                    <xsl:apply-templates />
                </td>
            </tr>
            <tr>
                <td>
                    <img src="{$TSP}images/global/clr_pxl.gif" width="1" height="10" border="0" alt="" />
                </td>
            </tr>

        </table>
    </xsl:template>

    <xsl:template match="dsec">
        <xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">
					<xsl:if test="@no">
						<a name="S{@no}X">
							<xsl:text> </xsl:text>
						</a>
					</xsl:if>
                	<xsl:if test="@title">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="@title" />
							<xsl:if test="@ref"> (<a href="#note{@ref}"> <xsl:value-of select="@ref" /> </a>)</xsl:if>
						</h3>
                    </xsl:if>
                    <xsl:if test="title">
                        <h3>
                            <xsl:apply-templates select="title" />
                            <xsl:if test="@ref"> (<a href="#note{@ref}">
                                    <xsl:value-of select="@ref" />
                                </a>)</xsl:if>
                        </h3>
                    </xsl:if>

					<xsl:apply-templates select="related-desc" />

					<xsl:apply-templates select="dref" />
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
				<xsl:if test="@no">
					<a name="S{@no}X">
						<xsl:text> </xsl:text>
					</a>
				</xsl:if>
				<xsl:if test="@title">
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="@title" />
						<xsl:if test="@ref"> (<a href="#note{@ref}"> <xsl:value-of select="@ref" /> </a>)</xsl:if>
					</h3>
				</xsl:if>
				<xsl:if test="title">
					<h3>
						<xsl:apply-templates select="title" />
						<xsl:if test="@ref"> (<a href="#note{@ref}">
								<xsl:value-of select="@ref" />
							</a>)</xsl:if>
					</h3>
				</xsl:if>

				<xsl:apply-templates select="related-desc" />

				<xsl:apply-templates select="dref" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="dref">

                <p><xsl:apply-templates select="@no" />.<xsl:text> </xsl:text>
                <xsl:if test="@no">
                    <a name="note{@no}">
                        <xsl:text> </xsl:text>
                    </a>
                </xsl:if>
                <xsl:apply-templates />
                </p>
    </xsl:template>


    <xsl:template match="article" mode="toc">
		<xsl:apply-templates mode="toc" />
        <xsl:if test="@table">
           <xsl:choose>
                <xsl:when test="$TS = 'true'">
                    <xsl:apply-templates mode="toctable" select="//*" />
                    <xsl:apply-templates mode="toc" select="//figure" />
                </xsl:when>
                <xsl:otherwise>
                <xsl:apply-templates mode="toctable" select="document($TSXML)//*" />
                <xsl:apply-templates mode="toc" select="document($TSXML)//figure" />
                </xsl:otherwise>
           </xsl:choose>
        </xsl:if>
        <xsl:if test="@tool">
            <h3>Clinician Tools:</h3>
            <ul>
               <xsl:choose>
                    <xsl:when test="$TS = 'true'">
                        <xsl:apply-templates mode="tool" select="//*" />
                    </xsl:when>
                    <xsl:otherwise>
                     <xsl:apply-templates mode="tool" select="document($TSXML)//*" />
                    </xsl:otherwise>
               </xsl:choose>
            </ul>

        </xsl:if>
    </xsl:template>

    <xsl:template match="document" mode="toc">
        <ul>
            <xsl:apply-templates mode="keytoc" />
            <xsl:apply-templates mode="toc" />
           <xsl:choose>
                <xsl:when test="$TS = 'true'">
                    <xsl:apply-templates mode="toctable" select="//*" />
                    <xsl:apply-templates mode="toc" select="//figure" />
                </xsl:when>
                <xsl:otherwise>
                <xsl:apply-templates mode="toctable" select="document($TSXML)//*" />
                <xsl:apply-templates mode="toc" select="document($TSXML)//figure" />
                </xsl:otherwise>
           </xsl:choose>
        </ul>
        <xsl:if test="@tool">

            <h3>Clinician Tools:</h3>
            <ul>
               <xsl:choose>
                    <xsl:when test="$TS = 'true'">
                        <xsl:apply-templates mode="tool" select="//*" />
                    </xsl:when>
                    <xsl:otherwise>
                     <xsl:apply-templates mode="tool" select="document($TSXML)//*" />
                    </xsl:otherwise>
               </xsl:choose>
            </ul>

        </xsl:if>
    </xsl:template>

    <xsl:template match="keypoints" mode="keytoc">
        <li>
            <a href="#S{@no}X">
                <xsl:choose>
                    <xsl:when test="@special = 'yes'">
                        <xsl:value-of select="@title" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of disable-output-escaping="yes" select="@title" />
                    </xsl:otherwise>
                </xsl:choose>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="dsec" mode="toc">
        <li>
            <a href="#S{@no}X">
                <xsl:choose>
                    <xsl:when test="@special = 'yes'">
                        <xsl:value-of select="@title" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of disable-output-escaping="yes" select="@title" />
                    </xsl:otherwise>
                </xsl:choose>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="figure" mode="toc">
        <xsl:if test="figureheader and not(@tool) and not(@table)">
            <li>
                <a href="#f-{@no}">
                    <xsl:value-of select="figureheader" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="figure" mode="toctable">
        <xsl:if test="figureheader and @table">
            <li>
                <a href="#f-{@no}">
                    <xsl:value-of select="figureheader" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="table" mode="toctable">
        <xsl:if test="tableheader and not(@tool)">
            <li>
                <a href="#t-{@no}">
                    <xsl:value-of select="tableheader" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="hitable" mode="toctable">
        <li>
            <a href="#t-{@no}">
                <xsl:value-of select="@title" />
            </a>
        </li>
    </xsl:template>
<xsl:template match="accordions" mode="toc">
	<xsl:apply-templates mode="toc" />
</xsl:template>

    <xsl:template match="sec" mode="toc">
		<xsl:choose>
            <xsl:when test="@class= 'intra'">
                <xsl:if test="$INTRA != ''">
                    <li>
                        <a href="#S{@no}X">
                            <xsl:choose>
                                <xsl:when test="@special = 'yes'">
                                    <xsl:value-of select="@title" />
                                </xsl:when>
								<xsl:when test="title">
									<xsl:apply-templates select="title" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of disable-output-escaping="yes" select="@title" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </li>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <li>
                    <a href="#S{@no}X">
                        <xsl:choose>
                            <xsl:when test="@special = 'yes'">
                                <xsl:value-of select="@title" />
                            </xsl:when>
							<xsl:when test="title">
								<xsl:apply-templates select="title" />
							</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@title" disable-output-escaping="yes" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </a>
                </li>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sec/sec" mode="toc"> </xsl:template>

    <xsl:template match="sec/sec/sec" mode="toc"> </xsl:template>

    <xsl:template match="keypoints" mode="toc">
        <li>
            <a href="#S{@no}X">
                <xsl:choose>
                    <xsl:when test="@special = 'yes'">
                        <xsl:value-of select="@title" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@title" disable-output-escaping="yes" />
                    </xsl:otherwise>
                </xsl:choose>
            </a>

            <xsl:apply-templates select="sec" mode="toc" />
        </li>
    </xsl:template>

    <xsl:template match="related-bottom" mode="toc">
        <xsl:if test="@title">
            <xsl:choose>
                <xsl:when test="@class= 'intra'">
                    <xsl:if test="$INTRA != ''">
                        <li>
                            <a href="#related">
                                <xsl:choose>
                                    <xsl:when test="@special = 'yes'">
                                        <xsl:value-of select="@title" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="title">
                                                <xsl:apply-templates select="title" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of disable-output-escaping="yes" select="@title" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </a>
                        </li>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <li>
                        <a href="#related">
                            <xsl:choose>
                                <xsl:when test="@special = 'yes'">
                                    <xsl:value-of select="@title" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@title" disable-output-escaping="yes" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </a>
                    </li>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="products">
        <div class="PRODUCTSCONTAINER" style="margin-bottom:25px; margin-top:5px; border:2px solid #C0C0C0;border-top:none; border-bottom:3px solid #C0C0C0;">
            <xsl:if test="@no">
                <a name="P{@no}X">
                    <xsl:text> </xsl:text>
                </a>
            </xsl:if>

            <p class="PRODUCTS" style="margin:0; padding:5px; font-weight:bold; color:#000; background-color: #B2C3D3;">
                <xsl:value-of select="@title" />
            </p>

            <xsl:apply-templates mode="product" />

        </div>
    </xsl:template>

    <xsl:template match="product" mode="product">
        <xsl:variable name="PAGE">
            <xsl:choose>
             <!-- LINK IS WHEN XML IS CODED WITH ILINK RATHER THAN ID -->
                <xsl:when test="not(id) and (titles/title/ilink-vahep or titles/title/ilink-vahiv or titles/title/ilink-xref)">LINK</xsl:when>

                <xsl:when test="not(id)">NA</xsl:when>
                <xsl:when test="substring-after(id,'http') != ''">
                    <xsl:value-of select="id" />
                </xsl:when>
                <xsl:when test="substring-after(id,'www') != ''">https://<xsl:value-of select="id" /></xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="id" /></xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <table cellpadding="5" cellspacing="0" width="100%" class="PRODUCTS">
            <tr class="PRODUCT" style="background-color: #ffffff;">
                <td valign="top" style="border:none; border-bottom: 1px solid #B2C3D3;font-size:.9em;">
                    <xsl:if test="not(figure)">
                        <xsl:attribute name="colspan">2</xsl:attribute>
                    </xsl:if>

                    <xsl:choose>
                    <!-- LINK IS WHEN XML IS CODED WITH ILINK RATHER THAN ID -->
                        <xsl:when test="$PAGE = 'LINK'">
                            <xsl:apply-templates select="titles/title" />
                        </xsl:when>

                        <xsl:when test="$PAGE = 'NA'">
                            <span style="color:#660099;">
                                <b>
                                    <xsl:apply-templates select="titles/title" />
                                </b>
                            </span>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="{$PAGE}">
                                <xsl:apply-templates select="titles/title" />
                            </a>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:apply-templates select="description" mode="product" />

                    <xsl:apply-templates select="files" mode="product" />

                </td>
                <xsl:if test="figure">
                    <td style="border:none; border-bottom: 1px solid #B2C3D3;" width="110" valign="top">
                        <xsl:apply-templates select="figure" />
                    </td>
                </xsl:if>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="uri" mode="file">
        <xsl:choose>
            <xsl:when test="../format = 'Word' or ../format = 'word'">
                <a href="{$TSP}doc/{.}.doc">Word</a>
            </xsl:when>
            <xsl:when test="../format = 'PDF' or ../format = 'pdf'">
                <a href="{$TSP}pdf/{.}.pdf">PDF</a>
            </xsl:when>
            <xsl:when test="../format = 'PPT' or ../format = 'ppt'">
                <a href="{$TSP}ppt/{.}.ppt">PPT</a>
            </xsl:when>
            <xsl:when test="../format = 'Online' or ../format = 'online'">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="." /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">Online</a>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <xsl:template match="url" mode="file">
        <xsl:choose>
            <xsl:when test="../format = 'Word' or ../format = 'word'">
                <a href="{.}">Word</a>
            </xsl:when>
            <xsl:when test="../format = 'PDF' or ../format = 'pdf'">
                <a href="{.}">PDF</a>
            </xsl:when>
            <xsl:when test="../format = 'PPT' or ../format = 'ppt'">
                <a href="{.}">PPT</a>
            </xsl:when>
            <xsl:when test="../format = 'Online' or ../format = 'online'">
                <a href="{.}">Online</a>

                <xsl:choose>
                    <xsl:when test="contains(., 'www.hepatitis.va.gov')">
            <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our Viral Hepatitis internet site" title="Link will take you to our Viral Hepatitis internet site" class="linkicons" />
                    </xsl:when>
                    <xsl:when test="contains(. , 'www.hiv.va.gov')">
            <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our HIV/AIDS internet site" title="Link will take you to our HIV/AIDS internet site" class="linkicons" />
                    </xsl:when>
                    <xsl:otherwise>
            <img src="{$TSP}images/icons/link-internal.gif" alt="Link will take you to our internet site" title="Link will take you to our internet site" class="linkicons" />
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <xsl:template match="desc[@class='inline']" mode="file">
        <span class="product-description" style="padding-left:5px;">
            <xsl:apply-templates />
        </span>
    </xsl:template>
    <xsl:template match="desc" mode="file">
        <div class="product-description">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="order" mode="file-order">
        <br />
        <xsl:apply-templates />
        <br />
    </xsl:template>

    <xsl:template match="description" mode="product">
        <div style="margin-top:5px;">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="description[@class='inline']" mode="file">
        <span class="product-description">
            <xsl:apply-templates />
        </span>
    </xsl:template>
    <xsl:template match="description" mode="file">
        <div class="product-description">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="order">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="avail[not(.='yes')]">
        <em>
            <xsl:apply-templates />
        </em>
    </xsl:template>

    <xsl:template match="figure[@type='product']">
        <div class="product">
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" /> product </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="figure[@type='product']" mode="file-figure">
        <div class="product">
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" /> product </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="files" mode="product">
        <xsl:variable name="ROWS" select="count(file)" />
        <table border="0" width="100%" class="ORDER" cellpadding="0" cellspacing="1" style="margin:0;padding:0;margin-top:5px;">
            <xsl:for-each select="file">
                <tr>
                    <td width="70" valign="top">
                        <xsl:if test="(position() = 1 or figure)">
                            <xsl:choose>
                                <xsl:when test="@class= 'intra'">
                                    <xsl:if test="$INTRA != ''">
                                        <span style="padding:5px;">
                                            <em>Available: </em>
                                        </span>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="format = 'print'">
                                    <xsl:if test="$INTRA != ''">
                                        <span style="padding:5px;">
                                            <em>Available: </em>
                                        </span>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span style="padding:5px;">
                                        <em>Available: </em>
                                    </span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>

                    </td>

                    <td valign="top">
                        <xsl:apply-templates select="." mode="product" />
                    </td>

                    <xsl:if test="../figure and position() = 1">
                        <td rowspan="{$ROWS}">
                            <xsl:apply-templates select="../figure" mode="file-figure" />
                        </td>
                    </xsl:if>

                </tr>
            </xsl:for-each>

        </table>
    </xsl:template>

    <!-- PRINT ORDERS -->
    <xsl:template match="file[format='print']" mode="product">
        <xsl:apply-templates select="figure" mode="file-figure" />

        <xsl:apply-templates mode="file" />

        <xsl:choose>
            <xsl:when test="uri">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="uri" /></xsl:call-template>
                </xsl:variable>

                <p style="padding:0;margin-bottom:0;margin-top:10px;">
                    <a href="{$newREF}">To order print copies</a>
                    <br />
                    <xsl:apply-templates select="order" />
                </p>
            </xsl:when>
            <xsl:when test="url">
                <p style="padding:0;margin-bottom:0;margin-top:10px;">
                    <a href="{url}">To order print copies</a>
                    <br />
                    <xsl:apply-templates select="order" />
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="order" mode="file-order" />
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="avail" />
    </xsl:template>

    <!-- ONLINE VERSIONS, incl. PDF, PPT, WORD, WEB -->
    <xsl:template match="file" mode="product">
        <xsl:choose>
            <xsl:when test="uri/@class= 'intra' or @class= 'intra'">
                <xsl:if test="$INTRA != ''">
                    <xsl:apply-templates select="figure" mode="file-figure" />
                    <xsl:apply-templates mode="file" />
                    <xsl:if test="avail">
                        <br />
                        <xsl:apply-templates select="avail" />
                    </xsl:if>
                </xsl:if>
            </xsl:when>
            <xsl:when test="url/@class= 'intra' or @class= 'intra'">
                <xsl:if test="$INTRA != ''">
                    <xsl:apply-templates select="figure" mode="file-figure" />
                    <xsl:apply-templates mode="file" />
                    <xsl:if test="avail">
                        <br />
                        <xsl:apply-templates select="avail" />
                    </xsl:if>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="figure" mode="file-figure" />
                <xsl:apply-templates mode="file" />
                <xsl:if test="avail">
                    <br />
                    <xsl:apply-templates select="avail" />
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="products" mode="toc">
        <xsl:choose>
            <xsl:when test="product[not(@class= 'intra')]">
                <li>
                    <a href="#P{@no}X">
                        <xsl:value-of select="@title" disable-output-escaping="yes" />
                    </a>
                </li>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$INTRA != '' and product">
                    <li>
                        <a href="#P{@no}X">
                            <xsl:value-of select="@title" disable-output-escaping="yes" />
                        </a>
                    </li>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- FOR LATER -->
    <xsl:template name="order">
        <xsl:param name="ID" />
        <div class="selectorder" style="margin-top:5px;">
            <p style="display:inline;margin-right:10px;">
                <em>Order print copies:</em>
            </p>
            <select name="order">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
            <input type="button" value="Add to Order List" style="margin-left:40px;" />
        </div>
    </xsl:template>

    <!--templates for contents box-->
    <xsl:template match="contents" mode="contents">

        <div class="contentsbox">
            <h3>
                <xsl:value-of select="@title" />
            </h3>

            <div class="contentsboxcontent"><xsl:apply-templates /></div>
        </div>
    </xsl:template>

    <xsl:template match="item-self">
        <li class="homeitemself">
            <xsl:apply-templates />
        </li>
    </xsl:template>

    <!-- reusable replace-string function -->
    <xsl:template name="replace-string">
        <xsl:param name="text" />
        <xsl:param name="from" />
        <xsl:param name="to" />

        <xsl:choose>
            <xsl:when test="contains($text, $from)">

                <xsl:variable name="before" select="substring-before($text, $from)" />
                <xsl:variable name="after" select="substring-after($text, $from)" />
                <xsl:variable name="prefix" select="concat($before, $to)" />

                <xsl:value-of select="$before" />
                <xsl:value-of select="$to" />
                <xsl:call-template name="replace-string">
                    <xsl:with-param name="text" select="$after" />
                    <xsl:with-param name="from" select="$from" />
                    <xsl:with-param name="to" select="$to" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
        </xsl:template>

    <xsl:template match="callout">
        <table width="100%" border="0" cellspacing="5" cellpadding="0">
            <tr>
                <td class="normal" valign="top">
                    <xsl:choose>
                        <xsl:when test="@image = 'left'">
                            <xsl:choose>
                                <xsl:when test="./img">
                                    <xsl:apply-templates select="./img" />
                                </xsl:when>
                                <xsl:when test="./rollimg">
                                    <xsl:apply-templates select="./rollimg" />
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="text" />
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td class="normal" valign="top">
                    <xsl:choose>
                        <xsl:when test="@image = 'right'">
                            <xsl:choose>
                                <xsl:when test="./img">
                                    <xsl:apply-templates select="./img" />
                                </xsl:when>
                                <xsl:when test="./rollimg">
                                    <xsl:apply-templates select="./rollimg" />
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="text" />
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="table">
        <xsl:choose>
            <xsl:when test="$INTRA !=''">
                <div class="tablecontainer">
                    <xsl:if test="@no">
                        <a name="t-{@no}">
                            <xsl:text> </xsl:text>
                        </a>
                    </xsl:if>

                    <table width="100%" cellpadding="0" cellspacing="0" class="datatable">
                        <xsl:if test="@summary">
                            <xsl:attribute name="summary">
                                <xsl:value-of select="@summary" />
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@class">
                            <xsl:attribute name="class">datatable <xsl:value-of select="@class" /></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@width">
                            <xsl:attribute name="width">
                                <xsl:value-of select="@width" />
                            </xsl:attribute>
                        </xsl:if>

                        <xsl:apply-templates select="tableheader" mode="data-table" />
                        <xsl:apply-templates select="colgroup" mode="data-table" />
                        <thead>
                            <xsl:apply-templates select="rowheader" mode="data-table" />
                        </thead>
                        <xsl:apply-templates select="tablefooter" mode="data-table" />

                        <tbody>
                            <xsl:choose>
                                <xsl:when test="@class = 'colorno'">
                                    <xsl:apply-templates select="row" mode="data-table" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="row">
                                        <tr>
                                            <xsl:if test="position() mod 2 = 0">
                                                <xsl:attribute name="class">colorrow</xsl:attribute>
                                            </xsl:if>
                                            <xsl:if test="@class">
                                                <xsl:attribute name="class">
                                                    <xsl:value-of select="@class" />
                                                </xsl:attribute>
                                            </xsl:if>

                                            <xsl:apply-templates mode="data-table" />
                                        </tr>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tbody>
                    </table>

                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@class = 'intra'"> </xsl:when>
                    <xsl:otherwise>
                        <div class="tablecontainer">
                            <xsl:if test="@no">
                                <a name="t-{@no}">
                                    <xsl:text> </xsl:text>
                                </a>
                            </xsl:if>

                            <table width="100%" cellpadding="0" cellspacing="0" class="datatable">
                                <xsl:if test="@summary">
                                    <xsl:attribute name="summary">
                                        <xsl:value-of select="@summary" />
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@class">
                                    <xsl:attribute name="class">datatable <xsl:value-of select="@class" /></xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@width">
                                    <xsl:attribute name="width">
                                        <xsl:value-of select="@width" />
                                    </xsl:attribute>
                                </xsl:if>

                                <xsl:apply-templates select="tableheader" mode="data-table" />
                                <xsl:apply-templates select="colgroup" mode="data-table" />

                        <thead>
                            <xsl:apply-templates select="rowheader" mode="data-table" />
                        </thead>

                                <xsl:apply-templates select="tablefooter" mode="data-table" />

                                <tbody>
                                    <xsl:choose>
                                        <xsl:when test="@class = 'colorno'">
                                            <xsl:apply-templates select="row" mode="data-table" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:for-each select="row">
                                                <tr>
                                                    <xsl:if test="position() mod 2 = 0">
                                                        <xsl:attribute name="class">colorrow</xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:if test="@class">
                                                        <xsl:attribute name="class">
                                                            <xsl:value-of select="@class" />
                                                        </xsl:attribute>
                                                    </xsl:if>

                                                    <xsl:apply-templates mode="data-table" />
                                                </tr>
                                            </xsl:for-each>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </tbody>
                            </table>

                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="tableheader" mode="data-table">
        <xsl:choose>
            <xsl:when test="string-length($BACKTO) != 0" />
            <xsl:otherwise><caption> <xsl:apply-templates /></caption></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="colgroup" mode="data-table">
        <colgroup>
            <xsl:apply-templates mode="data-table" />
        </colgroup>
    </xsl:template>

    <xsl:template match="col" mode="data-table">
        <col>
            <xsl:if test="@span">
                <xsl:attribute name="span">
                    <xsl:value-of select="@span" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@width">
                <xsl:attribute name="width">
                    <xsl:value-of select="@width" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" />
                </xsl:attribute>
            </xsl:if>
        </col>
    </xsl:template>

    <xsl:template match="rowheader" mode="data-table">
        <tr>
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates mode="data-table" />
        </tr>
    </xsl:template>

    <xsl:template match="row" mode="data-table">
        <tr>
            <xsl:if test="@class">
                <xsl:attribute name="class">
                    <xsl:value-of select="@class" />
                </xsl:attribute>
            </xsl:if>

            <xsl:apply-templates mode="data-table" />
        </tr>
    </xsl:template>

    <xsl:template match="headercell" mode="data-table">
        <xsl:variable name="CLASS">
            <xsl:if test="@class">
                <xsl:value-of select="@class" />
            </xsl:if>
            <xsl:if test="@align"> cell<xsl:value-of select="@align" /></xsl:if>
        </xsl:variable>
        <th>
            <xsl:if test="$CLASS != ''">
                <xsl:attribute name="class">
                    <xsl:value-of select="$CLASS" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@colspan">
                <xsl:attribute name="colspan">
                    <xsl:value-of select="@colspan" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="rowspan">
                    <xsl:value-of select="@rowspan" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@width">
                <xsl:attribute name="width">
                    <xsl:value-of select="@width" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@id" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@scope">
                <xsl:attribute name="scope">
                    <xsl:value-of select="@scope" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@headers">
                <xsl:attribute name="headers">
                    <xsl:value-of select="@headers" />
                </xsl:attribute>
            </xsl:if>

            <xsl:choose>
                <xsl:when test="@empty='yes'">
                   <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates />
                </xsl:otherwise>
            </xsl:choose>
        </th>
    </xsl:template>

    <xsl:template match="cell" mode="data-table">
        <xsl:variable name="CLASS">
            <xsl:if test="@class">
                <xsl:value-of select="@class" />
            </xsl:if>
            <xsl:if test="@align"> cell<xsl:value-of select="@align" /></xsl:if>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="parent::rowheader">
                <th>
                    <xsl:if test="$CLASS != ''">
                        <xsl:attribute name="class">
                            <xsl:value-of select="$CLASS" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@colspan">
                        <xsl:attribute name="colspan">
                            <xsl:value-of select="@colspan" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@rowspan">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="@rowspan" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@width">
                        <xsl:attribute name="width">
                            <xsl:value-of select="@width" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@id">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@scope">
                        <xsl:attribute name="scope">
                            <xsl:value-of select="@scope" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@headers">
                        <xsl:attribute name="headers">
                            <xsl:value-of select="@headers" />
                        </xsl:attribute>
                    </xsl:if>

                    <xsl:choose>
                        <xsl:when test="@empty='yes'">
                           <xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates />
                        </xsl:otherwise>
                    </xsl:choose>
                </th>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:if test="$CLASS != ''">
                        <xsl:attribute name="class">
                            <xsl:value-of select="$CLASS" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@colspan">
                        <xsl:attribute name="colspan">
                            <xsl:value-of select="@colspan" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@rowspan">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="@rowspan" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@width">
                        <xsl:attribute name="width">
                            <xsl:value-of select="@width" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@id">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@scope">
                        <xsl:attribute name="scope">
                            <xsl:value-of select="@scope" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@headers">
                        <xsl:attribute name="headers">
                            <xsl:value-of select="@headers" />
                        </xsl:attribute>
                    </xsl:if>

                    <xsl:choose>
                        <xsl:when test="@empty='yes'">
                           <xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates />
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tablefooter" mode="data-table">
        <tfoot>
            <tr>
                <td>
                    <xsl:if test="@colspan">
                        <xsl:attribute name="colspan">
                            <xsl:value-of select="@colspan" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@rowspan">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="@rowspan" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="class">
                        <xsl:attribute name="class">
                            <xsl:value-of select="class" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@align">
                        <xsl:attribute name="class">cell<xsl:value-of select="@align" /></xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </td>
            </tr>
        </tfoot>
    </xsl:template>

    <xsl:template match="rel-item-text">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="badge-wad">
        <xsl:variable name="SITE">
            <xsl:choose>
                <xsl:when test="@site = 'intranet'">http://vaww.hiv.va.gov/campaigns/World-AIDS-Day.asp</xsl:when>
                <xsl:otherwise>https://www.hiv.va.gov/provider/World-AIDS-Day.asp</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="IMG">
            <xsl:choose>
                <xsl:when test="@site = 'intranet'">http://vaww.hiv.va.gov/images/promo/VA_WorldAIDSday_WebBadge-intra.png</xsl:when>
                <xsl:otherwise>https://www.hiv.va.gov/images/promo/VA_WorldAIDSday_WebBadge.png</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <textarea rows="3" cols="45">&lt;div&gt;&lt;a href="<xsl:value-of select="$SITE" />"&gt;&lt;img src="<xsl:value-of select="$IMG" />" width="160" height="160" alt="World AIDS Day" /&gt;&lt;/a&gt;&lt;/div&gt;</textarea>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="badge">
        <xsl:variable name="SITE">
            <xsl:choose>
                <xsl:when test="@site = 'intranet'">http://vaww.hiv.va.gov/campaigns/HIVtesting.asp</xsl:when>
                <xsl:otherwise>https://www.hiv.va.gov/provider/campaigns-HIVtesting.asp</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="IMG">
            <xsl:choose>
                <xsl:when test="@site = 'intranet'">http://vaww.hiv.va.gov/images/promo/GetChecked-badge-intranet.jpg</xsl:when>
                <xsl:otherwise>https://www.hiv.va.gov/images/promo/GetChecked-badge-internet.jpg</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <textarea rows="3" cols="45">&lt;div&gt;&lt;a href="<xsl:value-of select="$SITE" />"&gt;&lt;img src="<xsl:value-of select="$IMG" />" width="160" height="160" alt="Get Checked Campaign: Say yes to the test!" /&gt;&lt;/a&gt;&lt;/div&gt;</textarea>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="featured-sec" mode="sections">
        <div class="section-home">
            <xsl:apply-templates mode="sections" />
        </div>
    </xsl:template>

    <xsl:template match="browse" mode="browse">
        <div class="browse" onmouseover="javascript:this.className+=' sfhover'" onmouseout="javascript:this.className=' browse'">
            <h3>
                <xsl:value-of select="title" />
            </h3>
            <xsl:apply-templates select="items" />
        </div>
    </xsl:template>

    <xsl:template match="columns">
        <div class="{@no}-column">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@no" />-column <xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </div>
        <div class="clear" style="marin: 0; padding: 0;">
            <xsl:text> </xsl:text>
        </div>
    </xsl:template>
    <xsl:template match="column">
        <div class="column">
            <xsl:if test="@width">
                <xsl:attribute name="style">width:<xsl:value-of select="@width" />%;</xsl:attribute>
            </xsl:if>
            <xsl:if test="@class">
                <xsl:attribute name="class">column <xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="columns" mode="sections">
        <div class="{@no}-column">
            <xsl:if test="@class">
                <xsl:attribute name="class"><xsl:value-of select="@no" />-column <xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates mode="sections" />
        </div>
        <div class="clear" style="marin: 0; padding: 0;">
            <xsl:text> </xsl:text>
        </div>
    </xsl:template>
    <xsl:template match="column" mode="sections">
        <div class="column">
            <xsl:if test="@width">
                <xsl:attribute name="style">width:<xsl:value-of select="@width" />%;</xsl:attribute>
            </xsl:if>
            <xsl:if test="@class">
                <xsl:attribute name="class">column <xsl:value-of select="@class" /></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates mode="sections" />
        </div>
    </xsl:template>

    <xsl:template name="search">
    <!--PTSD's SEARCH BOX-->
    <div class="searchbox hidden-print" id="searchbox">
	<xsl:choose>
		<xsl:when test="$TS = 'true'">
			<xsl:variable name="SECT">
				<xsl:choose>
					<xsl:when test="$HCLASS = 'pt'">1</xsl:when>
					<xsl:when test="$HCLASS = 'pr'">2</xsl:when>
					<xsl:otherwise>3</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

            <form method="get" action="{$LINKPATH}{$SEARCHSITE}" name="SearchBoxForm">
    	<label for="QTLabel">
    		<h4>Search <xsl:value-of select="$SITENAME" /></h4>
    	</label>

			<input type="hidden" name="RPP" value="10" />
			<input type="hidden" name="SECT" value="3" />
			<p>
				<label for="QTLabel" style="position:absolute; left:-10000px;">Search this website</label>

				<input class="searchfield" type="text" id="QTLabel" name="QT" value="" title="Enter search term here" />

				<label for="QTSubmit" style="position:absolute; left:-10000px;">Submit</label>

				<input class="searchbutton" type="Submit" id="QTsubmit" value="Search" title="Search button" />
			</p>

			<!-- <p class="searchtips">
				<a href="https://www.index.va.gov/search/va/search_tips.jsp">Search tips &#62;</a>
			</p> -->

		</form>

	</xsl:when>
	<xsl:otherwise>
		<xsl:variable name="SECT">
			<xsl:choose>
				<xsl:when test="$HCLASS = 'gn'"></xsl:when>
				<xsl:otherwise><xsl:value-of select="$HCLASS" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<form method="get" action="va">
    	<label for="QTLabel">
    		<h4>Search <xsl:value-of select="$SITENAME" /></h4>
    	</label>
			<input type="hidden" name="page" value="sr-pr-00" />
			<input type="hidden" name="post" value="9" />
			<input type="hidden" name="area" value="3" />
			<p>
			   <label for="QTLabel" style="position:absolute; left:-10000px;">Search this website</label>
			   <input class="searchfield" id="QTLabel" type="text" name="query" value="" title="Enter search term here" />
			   <label for="QTSubmit" style="position:absolute; left:-10000px;">Submit</label>
			   <input class="searchbutton" type="Submit" id="QTsubmit" value="Search" title="Search button" />
			</p>
			<!-- <p class="searchtips"><a href="https://www.index.va.gov/search/va/search_tips.jsp">Search tips &#62;</a></p> -->

		</form>

	</xsl:otherwise>
</xsl:choose>

</div>


    </xsl:template>


    <xsl:template name="share">
	<xsl:choose>
	    <xsl:when test="$TS = 'true'">
	     <xsl:apply-templates select="/pg/page-0/tools" mode="tools" />
	    </xsl:when>
	    <xsl:otherwise>
	     <xsl:apply-templates select="document($TSXML)/pg/page-0/tools" mode="tools" />
	    </xsl:otherwise>
	</xsl:choose>

	<!--<li><a href="https://www.addthis.com/bookmark.php?v=250&amp;username=ucsfchi" class="addthis_button"><img src="{$TSP}images/tools/share.gif" width="20" height="20" border="0" alt="share icon" /> Share this page</a>
	<script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#username=ucsfchi"> </script>
	<script type="text/javascript">
	    var addthis_config = {
	    ui_click: true
	    }
	</script></li>-->
 

    </xsl:template>

<xsl:template name="browse">
    <xsl:param name="PP" />
    <xsl:if test="$PP = 'pr'">
        <div class="browse main">
           <xsl:choose>
                <xsl:when test="$TS = 'true'">
                   <h3>
                       <a href="{$LINKPATH}provider/topics/index.asp" query="#topicMenu" class="showDiv hideSelf">Browse <span class="italic" query="#topicMenu">by</span> Topic   +</a>
                       <a href="{$LINKPATH}provider/topics/index.asp" query="#topicMenu" class="showDiv hideSelf hidden">Browse <span class="italic" query="#topicMenu">by</span> Topic   ^</a>
                   </h3>

                    <ul id="topicMenu" class="browsetopics hidden">

<xsl:if test="document('../../../xml/topic-browse.xml')">
    <xsl:apply-templates select="document('../../../xml/topic-browse.xml')/topics/items/item" />
</xsl:if>

                    </ul>
                </xsl:when>

                <xsl:otherwise>
                   <h3>
                       <a href="va?page=we-teamsite&#38;TS=provider/topics/index" query="#topicMenu" class="showDiv hideSelf">Browse <span class="italic" query="#topicMenu">by</span> Topic   +</a>
                       <a href="va?page=we-teamsite&#38;TS=provider/topics/index" query="#topicMenu" class="showDiv hideSelf hidden">Browse <span class="italic" query="#topicMenu">by</span> Topic   ^</a>
                   </h3>

                    <ul id="topicMenu" class="browsetopics hidden">
<xsl:if test="document('../TEAMSITE/topic-browse.xml')">
    <xsl:apply-templates select="document('../TEAMSITE/topic-browse.xml')/topics/items/item" />
</xsl:if>
                    </ul>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:if>
</xsl:template>

    <!-- based on AETC 'Clinical Manual' tags -->
    <xsl:template match="chapters">

                    <h3>
                        <xsl:value-of select="@title" />
                    </h3>

                    <xsl:apply-templates />

    </xsl:template>

    <xsl:template match="sub-contents">
        <div style="clear: left">
            <xsl:if test="@title"><h3 class="pgtitle">
                <xsl:value-of select="@title" />
            </h3></xsl:if>

            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="sections">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="section">
        <h3>
            <a name="S{secno}X"><xsl:text> </xsl:text></a>
            Section <xsl:value-of select="secno" />: <xsl:value-of select="sec-title" />
        </h3>

        <xsl:apply-templates />

    </xsl:template>

    <xsl:template match="sub-section">
        <h4>
            <xsl:value-of select="subsec-title" />
        </h4>

        <xsl:apply-templates />

    </xsl:template>


    <xsl:template match="chapters">

       <ul> <xsl:apply-templates /></ul>

    </xsl:template>

    <xsl:template match="chapter">
       <li> <xsl:choose>
            <xsl:when test="pgref">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="pgref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">
                    <xsl:apply-templates select="chap-title" />
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="chap-title" />
            </xsl:otherwise>
        </xsl:choose></li>
    </xsl:template>

    <xsl:template match="chap-title">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template name="disclaimer">
        <!--<p vahiv="vahiv" class="disclaimer">* Indicates a link that will take you outside the Department of Veterans Affairs website.<br /> ** Indicates a non-U.S. government website; VA does not endorse and is not responsible for the content of the linked site.</p>-->
    </xsl:template>

    <!-- Tool Templates -->
    <xsl:template match="tools" mode="tools">
    	<xsl:if test="items/*">
        <div class="toolbox hidden-print">
            <ul>
                <xsl:apply-templates mode="tools" />
            </ul>
        </div>  
        </xsl:if>
    </xsl:template>

    <xsl:template match="items" mode="tools">
           <xsl:apply-templates mode="tools" />
    </xsl:template>

    <xsl:template match="item" mode="tools">
        <li><img src="{$TSP}images/tools/{@type}.gif" width="20" height="20" border="0" alt="{@type} icon" /><xsl:apply-templates /></li>
    </xsl:template>

    <xsl:template match="item-email" mode="tools">
        <!--<xsl:variable name="TT">
            <xsl:call-template name="replace-string">
                <xsl:with-param name="text" select="/pg/@title" />
                <xsl:with-param name="from" select="'&#38;'" />
                <xsl:with-param name="to" select="'and'" />
            </xsl:call-template>
        </xsl:variable>

                <li><a href="mailto:?Subject=VA%20National%20HIV%2FAIDS%20 Program&#38;Body=This%20web%20page%20may%20interest%20you.%20{$TT}%20{$URL}"> <img src="{$TSP}images/tools/email.gif" width="20" height="20" border="0" alt="{@type} icon" /> Email this page</a>
            </li>-->
    </xsl:template>

    <xsl:template match="item-print" mode="tools">
<!--<li>
                <xsl:choose>
                    <xsl:when test="@pf">
                        <a href="va?page={/pg/@id}&#38;pf={@pf}&#38;pp=pf"><img src="{$TSP}images/tools/print.gif" width="20" height="20" border="0" alt="{@type} icon" /> Print this page</a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="va?page={/pg/@id}&#38;pf=doc-pf&#38;pp=pf"><img src="{$TSP}images/tools/print.gif" width="20" height="20" border="0" alt="{@type} icon" /> Print this page</a>
                    </xsl:otherwise>
                </xsl:choose>
            </li>-->
    </xsl:template>

    <xsl:template match="item-printall" mode="tools">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <xsl:choose>
        	<xsl:when test="@title">
				<li>
					<a href="{$newREF}"><img src="{$TSP}images/tools/printall.gif" width="20" height="20" border="0" alt="{@type} icon" /><xsl:text> </xsl:text><xsl:value-of select="@title" /></a>
				</li>
			</xsl:when>
        	<xsl:otherwise>
				<li>
					<a href="{$newREF}"><img src="{$TSP}images/tools/printall.gif" width="20" height="20" border="0" alt="{@type} icon" /> See entire lesson</a>
				</li>
        	</xsl:otherwise>
		</xsl:choose>
    </xsl:template>

    <xsl:template match="item-word" mode="tools">
        <li>
            <a href="{$TSP}doc/{@ref}.doc">
                <img src="{$TSP}images/tools/word.gif" width="20" height="20" border="0" alt="Word icon" /> Word document</a>
        </li>
    </xsl:template>

    <xsl:template match="item-pdf" mode="tools">
        <li>
            <a href="{$TSP}pdf/{@ref}.pdf">
                <img src="{$TSP}images/tools/pdf.gif" width="20" height="20" border="0" alt="PDF icon" /> PDF version</a>
           </li>
    </xsl:template>

    <xsl:template match="item-ppt" mode="tools">
        <li>
            <a href="{$TSP}ppt/{@ref}.ppt">
                <img src="{$TSP}images/tools/powerpoint.gif" width="20" height="20" border="0" alt="PowerPoint icon" /> PowerPoint slides</a>
           </li>
    </xsl:template>

    <xsl:template match="menu">
    	<xsl:if test="not(/pg/@include)">
        <div class="module-nav">
	    <xsl:apply-templates select="backto" />
            <xsl:apply-templates select="prev" />
            <xsl:apply-templates select="toc-menu" />
            <xsl:apply-templates select="next" />
            <xsl:apply-templates select="last" />
	    <xsl:apply-templates select="start" />
        </div>
        </xsl:if>
    </xsl:template>

    <xsl:template match="prev">
        <xsl:choose>
            <xsl:when test="@vahivref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahivref" /></xsl:call-template>
                </xsl:variable>

                <a href="{$newREF}">&#60; Previous</a>
                <xsl:text>   </xsl:text>
                <xsl:if test="string-length(../toc-menu) = 0">
                    <xsl:variable name="AnewREF">
                        <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="/pg/page-0/contents/items/item/ilink-vahiv/@ref" /></xsl:call-template>
                    </xsl:variable>
                    <a href="{$AnewREF}">Table of Contents</a>
                    <xsl:text>   </xsl:text>
                </xsl:if>
            </xsl:when>

            <xsl:when test="@vahepref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahepref" /></xsl:call-template>
                </xsl:variable>

                <a href="{$newREF}">&#60; Previous</a>
                <xsl:text>   </xsl:text>
                <xsl:if test="string-length(../toc-menu) = 0">
                    <xsl:variable name="AnewREF">
                        <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="/pg/page-0/contents/items/item/ilink-vahep/@ref" /></xsl:call-template>
                    </xsl:variable>
                    <a href="{$AnewREF}">Table of Contents</a>
                    <xsl:text>   </xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="toc-menu">
        <xsl:choose>
            <xsl:when test="@vahivref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahivref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}"><xsl:apply-templates /></a>
                <xsl:text>   </xsl:text>
            </xsl:when>

            <xsl:when test="@vahepref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahepref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}"><xsl:apply-templates /></a>
                <xsl:text>   </xsl:text>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

        <xsl:template match="start">
        <xsl:choose>
            <xsl:when test="@vahivref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahivref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">Start Course &#62;</a>
            </xsl:when>

            <xsl:when test="@vahepref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahepref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">Start Course &#62;</a>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="next">
        <xsl:choose>
            <xsl:when test="@vahivref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahivref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">Next &#62;</a>
            </xsl:when>

            <xsl:when test="@vahepref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahepref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">Next &#62;</a>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="last">
        <xsl:choose>
            <xsl:when test="@vahivref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahivref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">
                    <xsl:value-of select="." />
                </a>
            </xsl:when>
            <xsl:when test="@vahepref != ''">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahepref" /></xsl:call-template>
                </xsl:variable>
                <a href="{$newREF}">
                    <xsl:value-of select="." />
                </a>
            </xsl:when>
            <xsl:otherwise> </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="title-info" mode="page">
        <div class="pgtitle">
            <h1 class="pgtitle">
                <xsl:apply-templates select="chapter/title" />
            </h1>
            <p class="byline">From <xsl:value-of select="manual" />, <xsl:apply-templates select="../display" mode="page" /></p>
        </div>
    </xsl:template>

    <xsl:template match="chapter/title">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="source">
        <p><xsl:apply-templates /></p>
    </xsl:template>

    <xsl:template match="glossary-toc">
        <ul class="page-menu">
            <xsl:apply-templates select="item" mode="toc" />
        </ul>
    </xsl:template>

    <xsl:template match="item" mode="toc">
        <xsl:variable name="PGALPHA" select="@ref" />
        <xsl:choose>
            <xsl:when test="substring($PGALPHA,1,1) = '#'">
                <li>
                    <a href="{$PGALPHA}">
                        <xsl:apply-templates />
                    </a>
                </li>
            </xsl:when>
            <xsl:when test="$PGID != $PGALPHA">
                <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="$PGALPHA" /></xsl:call-template>
                </xsl:variable>
                <li>
                    <a href="{$newREF}">
                        <xsl:apply-templates />
                    </a>
                </li>
            </xsl:when>
            <xsl:otherwise>
                <li><xsl:apply-templates /></li>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!-- media box -->
<xsl:template match="media">

        <table align="center" border="0" width="100%" cellpadding="5" cellspacing="1" class="mediatable">

            <xsl:apply-templates mode="mediaheader" />

            <xsl:apply-templates mode="media" />
        </table>

        <xsl:apply-templates mode="textonly" />
        <p><xsl:text> </xsl:text></p>
</xsl:template>

<xsl:template match="video" mode="mediaheader">
        <tr>
        <td width="100%" class="rowheader" colspan="2">
        <img src="{$TSP}images/global/clr_pxl.gif" width="1" height="1" border="0" alt="" /><xsl:value-of select="../@title" />
        </td>
            <xsl:if test="videoitem/flash">
                <td bgcolor="#ffffff" class="center"><img src="{$TSP}images/media/flash.gif" width="72" height="25" border="0" alt="Flash Player" /></td>
            </xsl:if>
            <xsl:if test="videoitem/wm">
                <td bgcolor="#ffffff"><img src="{$TSP}images/media/windows.gif" width="72" height="25" border="0" alt="Windows Media Player" /></td>
            </xsl:if>
            <xsl:if test="videoitem/rm">
                <td bgcolor="#ffffff"><img src="{$TSP}images/media/real.gif" width="72" height="25" border="0" alt="Real Media Player" /></td>
            </xsl:if>
            <xsl:if test="videoitem/qt">
                <td bgcolor="#ffffff"><img src="{$TSP}images/media/quicktime.gif" width="72" height="25" border="0" alt="Quicktime Player" /></td>
            </xsl:if>
            <xsl:if test="videoitem/download">
                <td bgcolor="#ffffff" align="center">
					<xsl:choose>
						<xsl:when test="videoitem/download/@img">
							<img src="{$TSP}images/media/{videoitem/download/@img}" border="0" alt="{videoitem/download/@alt}" />
						</xsl:when>
						<xsl:otherwise>
							<img src="{$TSP}images/media/download.gif" width="25" height="25" border="0" alt="Download Media" />
						</xsl:otherwise>
					</xsl:choose>
                </td>
           </xsl:if>
        </tr>
</xsl:template>

<xsl:template match="video" mode="media">
    <xsl:apply-templates  mode="media" />
</xsl:template>

<xsl:template match="videoitem" mode="media">

    <tr bgcolor="#ffffff">
        <td align="top" class="mediatext" width="23"><img src="{$TSP}images/media/video.gif" width="20" height="25" border="0" alt="Video Clip" /></td><td align="top" class="mediatext"><xsl:value-of select="@title" /><xsl:apply-templates mode="text" />
        </td>
        <xsl:apply-templates mode="media" />
    </tr>

</xsl:template>

<xsl:template match="flash" mode="media">

        <td class="mediatextcenter">
            <xsl:apply-templates />
        </td>

</xsl:template>

<xsl:template match="wm" mode="media">

        <td class="mediatextcenter">
            <xsl:apply-templates />
        </td>

</xsl:template>

<xsl:template match="rm" mode="media">
        <td class="mediatextcenter" bgcolor="#ffffff">
            <xsl:apply-templates />
        </td>
</xsl:template>

<xsl:template match="qt" mode="media">
        <td class="mediatextcenter" bgcolor="#ffffff">
            <xsl:apply-templates />
        </td>
</xsl:template>

<xsl:template match="download" mode="media">
        <td class="mediatextcenter" bgcolor="#ffffff">
            <xsl:apply-templates />
        </td>
</xsl:template>

<xsl:template match="transcript" mode="text">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@vahivref" /></xsl:call-template>
        </xsl:variable>
        <br /><a href="{$newREF}" class="small">Transcript</a>
</xsl:template>

<xsl:template match="audio" mode="mediaheader">
        <tr>
        <td width="100%" class="rowheader" colspan="2">
        <img src="{$TSP}images/global/clr_pxl.gif" width="1" height="1" border="0" alt="" /><xsl:value-of select="../@title" />
        </td>
            <xsl:if test="audioitem/wm">
                <td bgcolor="#ffffff"><img src="{$TSP}images/media/windows.gif" width="72" height="25" border="0" alt="Windows Media Player" /></td>
            </xsl:if>
            <xsl:if test="audioitem/rm">
                <td bgcolor="#ffffff"><img src="{$TSP}images/media/real.gif" width="72" height="25" border="0" alt="Real Media Player" /></td>
            </xsl:if>
            <xsl:if test="audioitem/qt">
                <td bgcolor="#ffffff"><img src="{$TSP}images/media/quicktime.gif" width="72" height="25" border="0" alt="Quicktime Player" /></td>
            </xsl:if>
            <xsl:if test="audioitem/download">
                <td bgcolor="#ffffff" align="center">
					<xsl:choose>
						<xsl:when test="audioitem/download/@img">
							<img src="{$TSP}images/media/{audioitem/download/@img}" border="0" alt="{audioitem/download/@alt}" />
						</xsl:when>
						<xsl:otherwise>
							<img src="{$TSP}images/media/download.gif" width="25" height="25" border="0" alt="Download Media" />
						</xsl:otherwise>
					</xsl:choose>
                </td>
           </xsl:if>
        </tr>
</xsl:template>

<xsl:template match="audio" mode="media">
	<xsl:apply-templates mode="media" />
</xsl:template>

<xsl:template match="audioitem" mode="media">
    <tr bgcolor="#ffffff">
        <td align="top" class="mediatext" width="23">
            <img src="{$TSP}images/global/clr_pxl.gif" width="3" height="1" border="0" alt="" /><img src="{$TSP}images/media/audio.gif" width="20" height="25" border="0" alt="Audio Clip" /></td><td align="top" class="mediatext"><xsl:value-of select="@title" /><xsl:apply-templates mode="text" />
        </td>
        <xsl:apply-templates mode="media" />
    </tr>

</xsl:template>

<xsl:template match="youtube-video">

	<div class="video-container"><iframe src="https://www.youtube.com/embed/{@id}" frameborder="0" allowfullscreen="y"><xsl:text> </xsl:text></iframe></div>

</xsl:template>


<xsl:template match="textonly" mode="textonly">
    <xsl:apply-templates  mode="media" />
</xsl:template>

<xsl:template match="textitem" mode="media">

        <p class="mediatext" colspan="2">
            <xsl:apply-templates />
        </p>

</xsl:template>


<xsl:template match="mediaimage" mode="media">
<xsl:choose>
<xsl:when test="@name">
    <xsl:choose>
    <xsl:when test="@ref">
        <a href="{@ref}"><img src="{$TSP}images/{@src}" name="{@name}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}" /></a>
    </xsl:when>
    <xsl:otherwise>
        <img src="{$TSP}images/{@src}" name="{@name}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}" />
    </xsl:otherwise>
    </xsl:choose>
</xsl:when>
    <xsl:otherwise>
        <xsl:choose>
        <xsl:when test="@ref">
            <a href="{@ref}"><img src="{$TSP}images/{@src}" name="{@name}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}" /></a>
        </xsl:when>
        <xsl:otherwise>
            <img src="{$TSP}images/{@src}" name="{@name}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}" />
        </xsl:otherwise>
        </xsl:choose>
    </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="mediaimage">

</xsl:template>

<!--Links from InSite-->

<xsl:template match="page-class">
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="links">

  <xsl:apply-templates />

</xsl:template>

<xsl:template match="sec-first">
  <ul>  <!-- since Insite links don't come wrapped in <ul> tag -->
      <xsl:apply-templates />
  </ul>
</xsl:template>

<xsl:template match="links/sec">

<h3><xsl:value-of select="@title" disable-output-escaping="yes" /></h3>

           <ul>  <!-- since Insite links don't come wrapped in <ul> tag -->
               <xsl:apply-templates />
  </ul>

</xsl:template>



<xsl:template match="sec[@type='reveal']">
    <ul class="accordion-list"> 
    <li>
                <div class="main"> 
           <div class="secReveal hidden" id="reveal1">
                                <a class="showDiv" query="#reveal1" href=""> <xsl:apply-templates /></a>

                    </div>

                    <div class="hideSelf"> 
                                <a class="showDiv" query="#reveal1" href=""><xsl:apply-templates /></a> 
                    </div>                  
                </div>
    </li>
    </ul>
</xsl:template>


<xsl:template match="sec-reveal">
                <div class="secReveal hidden" id="reveal1">
                                <a class="showDiv" query="#reveal1" href="">
                                <xsl:apply-templates /></a>

                    </div>
                <div class="hideSelf"> 
                                                <a class="showDiv" query="#reveal1" href=""> <xsl:apply-templates /></a> 
                    </div>
</xsl:template>







<!-- end fix for item in item -->

<xsl:template match="subitem">
<ul>
<xsl:choose>
    <xsl:when test="@class= 'intra'">
        <xsl:if test="$INTRA != ''">
            <li class="intra">
                <xsl:apply-templates /> <span class="intratext"> (VA Intranet-only content)</span>
            </li>
        </xsl:if>
    </xsl:when>
    <xsl:otherwise>
            <li>
                <xsl:apply-templates />
            </li>
    </xsl:otherwise>
</xsl:choose>
</ul>
</xsl:template>

<!-- elements from va-topics-new-->

<xsl:template match="document">
    <xsl:choose>
        <xsl:when test="@class = 'intra'">
            <xsl:if test="$INTRA != ''">
                    <xsl:apply-templates />
            </xsl:if>
        </xsl:when>
		<xsl:when test="contains ($PGID, 'pcm')">
			<xsl:apply-templates mode="key" />
			<xsl:apply-templates />
			<xsl:apply-templates select="/pg/page-0/title-info/source" />
		</xsl:when>
        <xsl:otherwise>
                <xsl:apply-templates />
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="files">

     <xsl:apply-templates />

</xsl:template>

<xsl:template match="file">
    <xsl:variable name="REF" select="."/>
    <xsl:choose>
        <xsl:when test="$INTRA !=''">
            <xsl:choose>
                <xsl:when test="fref">
                    <xsl:choose>
                        <xsl:when test="contains ($REF, '.mil') or contains ($REF, '.fed.us')">
                            <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                            <!-- <xsl:if test="fformat"> <xsl:text> [</xsl:text><xsl:value-of select="fformat" /><xsl:text>  </xsl:text><xsl:value-of select="fsize" /><xsl:text>]</xsl:text>
                            </xsl:if>--><xsl:if test="not(image)"> <img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /> </xsl:if><br />
                        </xsl:when>
                        <xsl:when test="contains ($REF, '.gov')">
                            <xsl:choose>
                                <xsl:when test="contains ($REF, 'va.gov')">
                                    <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a> <!-- <xsl:if test="fformat"> <xsl:text> [</xsl:text><xsl:value-of select="fformat" /><xsl:text>  </xsl:text><xsl:value-of select="fsize" /><xsl:text>]</xsl:text> </xsl:if>--><br />
                                </xsl:when>
                                <xsl:otherwise>
                                    <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a> <!-- <xsl:if test="fformat"> <xsl:text> [</xsl:text><xsl:value-of select="fformat" /><xsl:text>  </xsl:text><xsl:value-of select="fsize" /><xsl:text>]</xsl:text> </xsl:if>--><xsl:if test="not(image)"> <img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /> </xsl:if><br />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a><xsl:if test="not(image)"><xsl:if test="not(image)"> <img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /> </xsl:if></xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>

                <xsl:when test="fkbref"> <!-- only for linking to HKB content on VAHIV -->
                    <xsl:variable name="newREF">
                        <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'pr-kb-00'" /></xsl:call-template>
                    </xsl:variable>
                     <a href="{$newREF}kb={fkbref}&#38;sec=00&#38;tp={ftopic}&#38;tpage={/pg/@id}" title="{fname}"><xsl:value-of select="fname"/></a>
                     <br />
                </xsl:when>

                <xsl:when test="fpgref">
                    <xsl:variable name="newREF">
                        <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="fpgref" /></xsl:call-template>
                    </xsl:variable>
                     <a href="{$newREF}" title="{fname}"><xsl:value-of select="fname"/></a>
                     <br />
                </xsl:when>
                <xsl:when test="fpdfref">
                     <a href="{$TSP}pdf/{fpdfref}.pdf" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                     <br />
                </xsl:when>
                <xsl:when test="fpptref">
                     <a href="{$TSP}ppt/{fpptref}.ppt" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                     <br />
                </xsl:when>
                <xsl:when test="fppsref">
                     <a href="{$TSP}ppt/{fppsref}.pps" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                     <br />
                </xsl:when>
                <xsl:when test="fdocref">
                     <a href="{$TSP}doc/{fdocref}.doc" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                     <br />
                </xsl:when>
                <xsl:when test="fpubref">
                    <xsl:variable name="newREF">
                        <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'home-pubmed'" /></xsl:call-template>
                    </xsl:variable>
                    <a href="{$newREF}uid={fpubref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                    <br />
                </xsl:when>
                <xsl:when test="fepsref">
                    <a href="{$TSP}images/{fepsref}.eps" title="{fname}"><xsl:value-of select="fname"/></a>
                    <br />
                </xsl:when>
                <xsl:when test="fwmref">
                    <a href="{$WM}{fwmref}.wmv" title="{fname}"><xsl:value-of select="fname"/></a>
                    <br />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="fname" />
                    <br />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>

        <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="@class = 'intra'">

                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="fref">
                            <xsl:choose>
                                <xsl:when test="contains ($REF, '.mil') or contains ($REF, '.fed.us')">
                                    <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a> <xsl:if test="not(image)"><img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /> </xsl:if><br />
                                </xsl:when>
                                <xsl:when test="contains ($REF, '.gov')">
                                    <xsl:choose>
                                        <xsl:when test="contains ($REF, 'va.gov')">
                                            <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                                            <br />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a> <xsl:if test="not(image)"><img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /> </xsl:if><br />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a href="https://{fref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a><xsl:if test="not(image)"><img src="{$TSP}images/icons/link-external.gif" alt="Link will take you outside the VA website. VA is not responsible for the content of the linked site." title="Link will take you outside the VA website. VA is not responsible for the content of the linked site." class="linkicons" /></xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>

                        <xsl:when test="fkbref"> <!-- only for linking to HKB content on VAHIV -->
                            <xsl:variable name="newREF">
                                <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'pr-kb-00'" /></xsl:call-template>
                            </xsl:variable>
                             <a href="{$newREF}kb={fkbref}&#38;sec=00&#38;tp={ftopic}&#38;tpage={/pg/@id}" title="{fname}"><xsl:value-of select="fname"/></a>
                             <br />
                        </xsl:when>

                        <xsl:when test="fpgref">
                            <xsl:variable name="newREF">
                                <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="fpgref" /></xsl:call-template>
                            </xsl:variable>
                             <a href="{$newREF}" title="{fname}"><xsl:value-of select="fname"/></a>
                             <br />
                        </xsl:when>
                        <xsl:when test="fpdfref">
                             <a href="{$TSP}pdf/{fpdfref}.pdf" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                             <br />
                        </xsl:when>
                        <xsl:when test="fpptref">
                             <a href="{$TSP}ppt/{fpptref}.ppt" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                             <br />
                        </xsl:when>
                        <xsl:when test="fppsref">
                             <a href="{$TSP}ppt/{fppsref}.pps" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                             <br />
                        </xsl:when>
                        <xsl:when test="fdocref">
                             <a href="{$TSP}doc/{fdocref}.doc" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                             <br />
                        </xsl:when>
                        <xsl:when test="fpubref">
                            <xsl:variable name="newREF">
                                <xsl:call-template name="convertPost"><xsl:with-param name="FILE" select="'home-pubmed'" /></xsl:call-template>
                            </xsl:variable>
                            <a href="{$newREF}uid={fpubref}" target="OffSite" title="{fname}"><xsl:value-of select="fname"/></a>
                            <br />
                        </xsl:when>
                        <xsl:when test="fepsref">
                            <a href="{$TSP}images/{fepsref}.eps" title="{fname}"><xsl:value-of select="fname"/></a>
                            <br />
                        </xsl:when>
                        <xsl:when test="fwmref">
                            <a href="{$WM}{fwmref}.wmv" title="{fname}"><xsl:value-of select="fname"/></a>
                            <br />
                        </xsl:when>
                         <xsl:otherwise>
                         <xsl:value-of select="fname" />
                         <br />
                         </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise>

    </xsl:choose>
</xsl:template>

<xsl:template match="desc">

     <xsl:apply-templates /><br />

</xsl:template>


    <xsl:template match="span">
                <span>
                    <xsl:if test="@class">
                        <xsl:attribute name="class">
                            <xsl:value-of select="@class" />
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates />
                </span>
    </xsl:template>

    <xsl:template match="welcome">
        <div class="welcome">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="banner-top">
        <!-- check on display:none -->
        <div class="provider"><span class="splashcontent"><xsl:apply-templates /></span>
            <!-- <img src="{$TSP}va_files/images/{@name}" border="0" width="660" height="45" alt="{@alt}" /> -->
        </div>
    </xsl:template>

    <xsl:template match="banner-bottom">
        <div class="care"><span class="splashcontent"><xsl:apply-templates /></span>
            <!-- <img src="{$TSP}va_files/images/{@name}" border="0" width="660" height="65" alt="{@alt}" /> -->
        </div>
    </xsl:template>

    <xsl:template match="face-image">
        <div class="vet"><xsl:text> </xsl:text>
            <!-- <img src="{$TSP}va_files/images/{@name}" border="0" width="180" height="125" alt="{@alt}" /> -->
        </div>
    </xsl:template>



    <xsl:template match="nav-buttons">
        <div class="nav-buttons">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="left-nav-button">
        <div class="left-nav-button">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="right-nav-button">
        <div class="right-nav-button">
           <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="button-title">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <h2 class="nav-title">
            <a href="{$newREF}"><xsl:apply-templates /></a>
        </h2>
    </xsl:template>

    <xsl:template match="button">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <p class="button">
            <a href="{$newREF}">
                <xsl:apply-templates />
            </a>
        </p>
    </xsl:template>

    <xsl:template match="home-sec">
        <div class="section-home">
			<xsl:choose>
				<xsl:when test="@title"><h3 class="homesec"><xsl:value-of select="@title" /></h3></xsl:when>
				<xsl:when test="title">
					<h3 class="homesec">
						<xsl:choose>
							<xsl:when test="title/ilink-vahiv">
								<xsl:apply-templates select="title/ilink-vahiv" />
							</xsl:when>
                            <xsl:when test="title/ilink-vahep">
                                <xsl:apply-templates select="title/ilink-vahep" />
                            </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="title" />
							</xsl:otherwise>
						</xsl:choose>
					</h3>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

            <xsl:apply-templates select="*[not(self::title)]" />
        </div>
    </xsl:template>

    <xsl:template match="secimg">
		<xsl:variable name="newREF">
			<xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <div class="section-home">
            <xsl:if test="@title">
                <h3 class="homesec">
                	<span class="homesectitle"><xsl:choose>
                		<xsl:when test="@ref">
                			<a href="{$newREF}"><xsl:value-of select="@title" /></a>
                		</xsl:when>
                		<xsl:otherwise>
                			<xsl:value-of select="@title" />
                		</xsl:otherwise>
                	</xsl:choose></span>
                    <xsl:if test="@src"><img src="{$TSP}images/icons/{@src}" width="55" height="60" border="0" alt="{@title}" /></xsl:if>
                </h3>
            </xsl:if>

            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="homefeatured">
        <div class="homefeatured">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="pr-box" mode="boxes">
        <div class="widget">
            <xsl:choose>
                <xsl:when test="@title"><div class="widget-title"><h4 class="prboxtitle"><xsl:value-of select="@title" /></h4></div></xsl:when>
                <xsl:when test="title">
		    <div class="widget-title">
                	<h4 class="prboxtitle">
						<xsl:choose>
							<xsl:when test="title/ilink-vahiv">
								<xsl:apply-templates select="title/ilink-vahiv" />
							</xsl:when>
                            <xsl:when test="title/ilink-vahep">
                                <xsl:apply-templates select="title/ilink-vahep" />
                            </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="title" />
							</xsl:otherwise>
						</xsl:choose>
                	</h4>
		    </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>

            <div class="prboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
	</div>



	 <!--<div class="prbox">
            <xsl:choose>
                <xsl:when test="@title"><h3 class="prboxtitle"><xsl:value-of select="@title" /></h3></xsl:when>
                <xsl:when test="title">
                	<h3 class="prboxtitle">
						<xsl:choose>
							<xsl:when test="title/ilink-vahiv">
								<xsl:apply-templates select="title/ilink-vahiv" />
							</xsl:when>
                            <xsl:when test="title/ilink-vahep">
                                <xsl:apply-templates select="title/ilink-vahep" />
                            </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="title" />
							</xsl:otherwise>
						</xsl:choose>
                	</h3>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>

            <div class="prboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
	</div>-->
    </xsl:template>

    <xsl:template match="pr-box/sec">
        <h5>
            <xsl:choose>
                <xsl:when test="@title"><xsl:value-of select="@title" /></xsl:when>
                <xsl:otherwise><xsl:apply-templates select="title" /></xsl:otherwise>
            </xsl:choose>
        </h5>

        <xsl:apply-templates select="*[not(self::title)]" />
    </xsl:template>

    <xsl:template match="about-box" mode="boxes">
	        <div class="widget">
            <xsl:choose>
                <xsl:when test="@title"><div class="widget-title"><h4 class="prboxtitle"><xsl:value-of select="@title" /></h4></div></xsl:when>
                <xsl:when test="title">
		    <div class="widget-title">
                	<h4 class="prboxtitle">
						<xsl:choose>
							<xsl:when test="title/ilink-vahiv">
								<xsl:apply-templates select="title/ilink-vahiv" />
							</xsl:when>
                            <xsl:when test="title/ilink-vahep">
                                <xsl:apply-templates select="title/ilink-vahep" />
                            </xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="title" />
							</xsl:otherwise>
						</xsl:choose>
                	</h4>
		    </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>

            <div class="prboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div>
	</div>



        <!--<div class="prbox">
            <xsl:choose>
                <xsl:when test="@title"><h3 class="aboutboxtitle"><xsl:value-of select="@title" /></h3></xsl:when>
                <xsl:when test="title"><h3 class="aboutboxtitle"><xsl:apply-templates /></h3></xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>


            <div class="prboxcontent">
                <xsl:apply-templates select="*[not(self::title)]" />
            </div></div>-->

    </xsl:template>

    <xsl:template match="about-box/sec">
        <h5>
            <xsl:choose>
                <xsl:when test="@title"><xsl:value-of select="@title" /></xsl:when>
                <xsl:otherwise><xsl:apply-templates select="title" /></xsl:otherwise>
            </xsl:choose>
        </h5>

        <xsl:apply-templates select="*[not(self::title)]" />
    </xsl:template>

    <xsl:template match="promo" mode="boxes">
        <div class="promo">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="promo-home">
        <div class="promo-home">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <!-- TOC SECTIONS -->
    <xsl:template match="keypoints" mode="key">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">

            <tr>
                <td>
                    <table border="0" cellpadding="1" cellspacing="1" width="100%">

                        <tr>
                            <td bgcolor="#848280">
                                <table border="0" cellpadding="5" cellspacing="1" width="100%">

                                    <tr>
                                        <td bgcolor="#faf3ce" class="normal">
                                            <b>
                                                <xsl:value-of disable-output-escaping="yes" select="@title" />
                                            </b>
                                        </td>
                                    </tr>
                                    <xsl:apply-templates mode="keypoints" />

                                </table>
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <img alt="" border="0" height="20" src="{$TSP}images/global/clr_pxl.gif" width="1" />
                </td>
            </tr>

        </table>
    </xsl:template>

    <xsl:template match="sec" mode="tool">
        <xsl:if test="@tool">
            <li>
                <a href="#S{@no}X">
                    <xsl:choose>
                        <xsl:when test="@special = 'yes'">
                            <xsl:value-of select="@title" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="title">
                                    <xsl:apply-templates select="title" mode="sec" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of disable-output-escaping="yes" select="@title" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </a>
            </li>

        </xsl:if>
    </xsl:template>

    <xsl:template match="table" mode="tool">
        <xsl:if test="@tool">
            <li>
                <a href="#t-{@no}">
                    <xsl:value-of select="tableheader" />
                </a>
            </li>

        </xsl:if>
    </xsl:template>

    <xsl:template match="figure" mode="tool">
        <xsl:if test="@tool">
            <li>
                <a href="#f-{@no}">
                    <xsl:value-of select="figureheader" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template match="box" mode="tool">
        <xsl:if test="@tool">
            <li>
                <a href="#b-{@no}">
                    <xsl:value-of select="boxheader" />
                </a>
            </li>
        </xsl:if>
    </xsl:template>


    <xsl:template match="a">
        <a name="note{@name}"><xsl:text> </xsl:text></a>
    </xsl:template>

    <xsl:template match="jlink">
        <xsl:choose>
            <xsl:when test="$PAGEINCL != ''">[<xsl:value-of select="." />]</xsl:when>
            <xsl:otherwise>
                <a href="#{@ref}">
                    <xsl:value-of select="." />
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="j">
        <a name="{@name}"><xsl:text> </xsl:text></a>
    </xsl:template>

<xsl:template match="drug" mode="header">
    <h1 class="pgtitle">
        <xsl:apply-templates mode="drug-name" />
    </h1>

    <dl class="drug-class" onMouseOver="javascript:this.className+=' sfhover'" onMouseOut="javascript:this.className='drug-class'">
        <dt>Type of Drug: <xsl:value-of select="drug-class/class-name" /></dt>
        <dd id="class-def"><xsl:call-template name="drug-class"><xsl:with-param name="CLASS" select="drug-class/class-name/@id" /></xsl:call-template></dd>
    </dl>
</xsl:template>

<xsl:template name="drug-class">
    <xsl:param name="CLASS" />
<xsl:choose>
                <xsl:when test="$CLASS='II'">
            Integrase inhibitors work by blocking an enzyme (HIV integrase) that the virus needs in order to make more virus.
        </xsl:when>
        <xsl:when test="$CLASS='PI'">
            Once HIV has infected a cell and made copies of itself, it uses an enzyme called protease to process itself correctly so it can be released from the cell to infect other cells. Protease inhibitors work by blocking that enzyme.
        </xsl:when>
        <xsl:when test="$CLASS='FDC'">
            Fixed-dose combinations combine the most commonly prescribed doses of 2 or more medications into a single pill.
        </xsl:when>
        <xsl:when test="$CLASS='NRTI'">
            <p>Nucleoside reverse transcriptase inhibitors were the first type of drug available to treat HIV. They are also known as NRTIs, nucleoside analogues, or "nukes."
            </p>
            <p>When the HIV virus enters a healthy cell, it attempts to make copies of itself. It does this by using an enzyme called reverse transcriptase. NRTIs block that enzyme, so HIV cannot make new copies of itself.</p>
        </xsl:when>

        <xsl:when test="$CLASS='NtRTI'">
            <p>Nucleotide reverse transcriptase inhibitors are also known as NRTIs, nucleotide analogues, or "nukes."
            </p>
            <p>When the HIV virus enters a healthy cell, it attempts to make copies of itself. It does this by using an enzyme called reverse transcriptase. NRTIs block that enzyme, so HIV cannot make new copies of itself.</p>
        </xsl:when>

        <xsl:when test="$CLASS='NNRTI'">
            Nonnucleoside reverse transcriptase inhibitors prevent HIV from using an enzyme called reverse transcriptase to make copies of itself.  These drugs are also known as NNRTIs, nonnucleosides or "nonnukes."
        </xsl:when>
        <xsl:when test="$CLASS='CoNRTI'">

	    <p>Fixed-dose combinations include several medications in 1 pill</p>
            <!--<p>Fixed-dose combinations combine the most commonly prescribed doses of more than 1 medication into a single pill.</p>-->
   <!-- updated fixed-dose, per Patty, 10/18/12
            <p>Fixed-dose combinations combine the most commonly prescribed doses of several medications into 1 pill. This pill is a combination of drugs known as nucleoside reverse transcriptase inhibitors, also called NRTIs, nucleoside analogues, or "nukes."  These were the first type of drug available to treat HIV.
            </p>
            <p>
            When the HIV virus enters a healthy cell, it attempts to make copies of itself. It does this by using an enzyme called reverse transcriptase. NRTIs block that enzyme, so HIV cannot make new copies of itself.
            </p>
   -->
        </xsl:when>
        <xsl:when test="$CLASS='FI'">
            Fusion inhibitors work by stopping the HIV virus from getting into your body's healthy cells in the first place.
        </xsl:when>
        <xsl:when test="$CLASS='CoPI'">
            <p>Fixed-dose combinations combine the most commonly prescribed doses of several medications into 1 pill. This pill is a combination of two drugs known as protease inhibitors.
            </p>
            <p>Once HIV has infected a cell and made copies of itself, it uses an enzyme called protease to process itself correctly so it can be released from the cell to infect other cells. Protease inhibitors work by blocking protease.
            </p>
        </xsl:when>
        <xsl:when test="$CLASS='CCR5'">
            <p>To infect a cell, HIV must bind to two types of molecules on the cell's surface.
            </p>
            <p>One of these is called a chemokine coreceptor. Drugs known as chemokine coreceptor antagonists block the virus from binding to the coreceptor.
            </p>
        </xsl:when>
        <xsl:when test="$CLASS='PE'">
            <p>This medication does not act against HIV itself. Instead, it boosts the blood levels of certain HIV medications.</p>
        </xsl:when>
        
        <xsl:when test="$CLASS='PKE'">
            <p>A pharmacokinetic enhancer &#34;boosts&#34; certain other drugs by increasing their levels in the body and slowing their elimination.</p>
        </xsl:when>

        <xsl:otherwise>
            This is the 'type of drug' blurb that could show up on mouse-over.  We would code all these blurbs in a separate file, and pull the specific one in using the remote-include tag, based on the drug-class @id
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="drug-name" mode="drug-name">
    <xsl:apply-templates select="brand-name" />
    <xsl:if test="combo-name or generic-name or abbreviations or other-names">
        (<xsl:value-of select="@append" /><xsl:apply-templates select="combo-name" /> <xsl:apply-templates select="other-names" /><xsl:apply-templates select="generic-name" /><xsl:apply-templates select="abbreviations" />)
    </xsl:if>
</xsl:template>

<xsl:template match="brand-name">
    <xsl:apply-templates />
</xsl:template>
<xsl:template match="combo-name">
        <xsl:for-each select="drug">
            <xsl:apply-templates />
                <xsl:if test="position()!=last()"> + </xsl:if>
        </xsl:for-each>
        <xsl:if test="../abbreviations or ../generic-name or ../other-names">, </xsl:if>
</xsl:template>
<xsl:template match="other-names">
        <xsl:for-each select="other-name">
            <xsl:apply-templates />
                <xsl:if test="position()!=last()">, </xsl:if>
        </xsl:for-each>
        <xsl:if test="../generic-name or ../abbreviations">, </xsl:if>
</xsl:template>
<xsl:template match="generic-name">
    <xsl:apply-templates />
        <xsl:if test="../abbreviations">, </xsl:if>
</xsl:template>
<xsl:template match="abbreviations">
        <xsl:for-each select="abbrev">
            <xsl:apply-templates />
                <xsl:if test="position()!=last()">, </xsl:if>
        </xsl:for-each>
</xsl:template>

<xsl:template match="drug" mode="page">
    <div class="drug">
    <xsl:apply-templates />
    </div>
</xsl:template>

<xsl:template match="drug-note">
    <p class="drug-note"><xsl:apply-templates /></p>
</xsl:template>

<xsl:template match="formulations">
		<div class="drug-print">
		<p>Bring a printout of this page to discuss with your doctor during your next visit. List your questions at the bottom of the page.</p>
		<form>
		<input type="button" value="Print" onClick="window.print()" />
		</form>
		
		</div>

    <div class="formulations">
        <h3>Approved adult dosing</h3>
    <xsl:apply-templates />
    </div>
</xsl:template>
<xsl:template match="formulations[@type='unapproved']">
    <div class="formulations">
    <xsl:apply-templates />
    </div>
</xsl:template>

<xsl:template match="formulation">
    <xsl:if test="form-note"><p class="form-note"><xsl:value-of select="form-note" /></p></xsl:if>
    <div class="formulation">
    <!--<h3><xsl:value-of select="strength" /><xsl:text> </xsl:text><xsl:value-of select="form" /></h3>-->
        <xsl:apply-templates mode="formulation" />
    </div>
</xsl:template>

<xsl:template match="form[@type='combo']">
    <h4 style="margin:0;padding:3px;"><xsl:apply-templates /></h4>
</xsl:template>

<xsl:template match="dosages" mode="formulation">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="dosage">
    <div class="dosage">

        <xsl:apply-templates select="../../form[@type='combo']" />
       <p>
       <xsl:choose>
       		<xsl:when test="$TS = 'true'">
       		<xsl:value-of select="amount" /><xsl:text> </xsl:text><b><xsl:value-of select="/pg/page-0/drug/drug-name/brand-name" /></b><xsl:text> </xsl:text>
       		</xsl:when>
       		<xsl:otherwise>
        	<xsl:value-of select="amount" /><xsl:text> </xsl:text><b><xsl:value-of select="document($TSXML)/pg/page-0/drug/drug-name/brand-name" /><xsl:text> </xsl:text></b>
        	</xsl:otherwise>
        </xsl:choose>
        <xsl:if test="with-drug">
            <xsl:apply-templates select="with-drug" />
        </xsl:if>
         <xsl:if test="with-drug-or">
	<xsl:apply-templates select="with-drug-or" />
        </xsl:if>
        <xsl:if test="interval"><xsl:value-of select="interval" /></xsl:if>
       </p>
        <xsl:apply-templates select="doses" />
        <xsl:apply-templates select="dosage-note" />
    </div>
</xsl:template>
<xsl:template match="with-drug">
    <xsl:text> + </xsl:text>
    <xsl:value-of select="with-formulation/amount" /><xsl:text> </xsl:text>
    <xsl:apply-templates mode="with" />
</xsl:template>

<xsl:template match="with-drug-or">
    <xsl:text> or </xsl:text>
    <xsl:value-of select="with-formulation-or/amount-or" /><xsl:text> </xsl:text>
    <xsl:apply-templates mode="with" />
</xsl:template>

<xsl:template match="drug" mode="with">
    <b><xsl:apply-templates /></b>&#32;
</xsl:template>

<xsl:template match="dosage-note">
    <p class="dosage-note">Note: <xsl:apply-templates /></p>
</xsl:template>


<xsl:template match="doses">
    <ul>
        <xsl:apply-templates />
    </ul>
</xsl:template>
<xsl:template match="dose">
    <li>
        <xsl:apply-templates mode="dose-images" />
    </li>
</xsl:template>
<xsl:template match="header" mode="dose-images">
    <h5><xsl:apply-templates /></h5>
</xsl:template>

<xsl:template match="dose-image" mode="dose-images">
     <div class="dose">
     <xsl:if test="../../../../../form-image">
         <xsl:call-template name="pills">
        <xsl:with-param name="COUNT" select="number(@count)" />
        <xsl:with-param name="SRC" select="../../../../../form-image/@src" />
        <xsl:with-param name="WD" select="../../../../../form-image/@width" />
        <xsl:with-param name="HT" select="../../../../../form-image/@height" />
        <xsl:with-param name="ALT" select="../../../../../form-image/@alt" />
         </xsl:call-template>
     </xsl:if>

     <xsl:choose>
        <xsl:when test=". = ''">
         <p><xsl:value-of select="/pg/page-0/drug/drug-name/brand-name" /><xsl:text> </xsl:text><xsl:value-of select="../../../../../strength" /></p>
        </xsl:when>
        <xsl:otherwise>
         <p><xsl:apply-templates /></p>
        </xsl:otherwise>
     </xsl:choose>
     </div>
</xsl:template>

<xsl:template match="with-image" mode="dose-images">
     <span class="plus">+</span>
     <div class="dose">
     <xsl:call-template name="pills">
        <xsl:with-param name="COUNT" select="number(@count)" />
        <xsl:with-param name="SRC" select="../../../with-drug/with-formulation/with-image/@src" />
        <xsl:with-param name="WD" select="../../../with-drug/with-formulation/with-image/@width" />
        <xsl:with-param name="HT" select="../../../with-drug/with-formulation/with-image/@height" />
        <xsl:with-param name="ALT" select="../../../with-drug/with-formulation/with-image/@alt" />
     </xsl:call-template>

     <p><xsl:apply-templates /></p>
     </div>
</xsl:template>

<xsl:template match="with-image-or" mode="dose-images">
     <span class="plus">or</span>
     <div class="dose">
     <xsl:call-template name="pills">
        <xsl:with-param name="COUNT" select="number(@count)" />
        <xsl:with-param name="SRC" select="../../../with-drug-or/with-formulation-or/with-image-or/@src" />
        <xsl:with-param name="WD" select="../../../with-drug-or/with-formulation-or/with-image-or/@width" />
        <xsl:with-param name="HT" select="../../../with-drug-or/with-formulation-or/with-image-or/@height" />
        <xsl:with-param name="ALT" select="../../../with-drug-or/with-formulation-or/with-image-or/@alt" />
     </xsl:call-template>

     <p><xsl:apply-templates /></p>
     </div>
</xsl:template>

<xsl:template name="pills">
     <xsl:param name="COUNT" />
     <xsl:param name="SRC" />
     <xsl:param name="WD" />
     <xsl:param name="HT" />
     <xsl:param name="ALT" />

     <xsl:if test="$COUNT > 0">
         <xsl:call-template name="display-pill">
            <xsl:with-param name="COUNT" select="$COUNT - 1" />
        <xsl:with-param name="SRC" select="$SRC" />
        <xsl:with-param name="WD" select="$WD" />
        <xsl:with-param name="HT" select="$HT" />
        <xsl:with-param name="ALT" select="$ALT" />
         </xsl:call-template>
     </xsl:if>
</xsl:template>

<xsl:template name="display-pill">
     <xsl:param name="COUNT" />
     <xsl:param name="SRC" />
     <xsl:param name="WD" />
     <xsl:param name="HT" />
     <xsl:param name="ALT" />

    <img src="{$TSP}images/va02-pt/drugdosing/{$SRC}" width="{$WD}" height="{$HT}" border="0" alt="{$ALT}" title="{$ALT}" />

     <xsl:if test="$COUNT > 0">
         <xsl:call-template name="pills">
            <xsl:with-param name="COUNT" select="$COUNT" />
        <xsl:with-param name="SRC" select="$SRC" />
        <xsl:with-param name="WD" select="$WD" />
        <xsl:with-param name="HT" select="$HT" />
        <xsl:with-param name="ALT" select="$ALT" />
         </xsl:call-template>
     </xsl:if>
</xsl:template>

<xsl:template match="drug-notes">
    <h3>Notes on taking this medication</h3>
    <ul><xsl:apply-templates mode="drug-notes" /></ul>
</xsl:template>
<xsl:template match="restrictions" mode="drug-notes">
    <xsl:apply-templates />
</xsl:template>
<xsl:template match="interactions" mode="drug-notes">
    <xsl:apply-templates />
</xsl:template>
<xsl:template match="interaction">
    <li class="interaction"><xsl:apply-templates /></li>
</xsl:template>
<xsl:template match="restriction">
    <li class="restriction"><xsl:apply-templates /></li>
</xsl:template>

<xsl:template match="side-effects">
    <h3>Side effects</h3>
    <ul><xsl:apply-templates /></ul>
    <xsl:apply-templates mode="caution" />
    <xsl:choose>
        <xsl:when test="../same-effects"><!-- only display link to chart once -->
        </xsl:when>
        <xsl:when test="$TS = 'true'">
            <p>See accompanying chart: <a href="{$LINKPATH}patient/drug-dosing-toolkit/side-effects-tips.asp">Tips for Common Side Effects</a></p>
        </xsl:when>
        <xsl:otherwise>
            <p>See accompanying chart: <a href="va?page=we-teamsite&#38;TS=patient/drug-dosing-toolkit/side-effects-tips">Tips for Common Side Effects</a></p>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="same-effects">
    <h3>Same side effects as</h3>
    <xsl:apply-templates mode="same-effects" />
    <xsl:choose>
        <xsl:when test="$TS = 'true'">
            <p>See accompanying chart: <a href="{$LINKPATH}patient/drug-dosing-toolkit/side-effects-tips.asp">Tips for Common Side Effects</a></p>
        </xsl:when>
        <xsl:otherwise>
            <p>See accompanying chart: <a href="va?page=we-teamsite&#38;TS=patient/drug-dosing-toolkit/side-effects-tips">Tips for Common Side Effects</a></p>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>


<xsl:template match="drug" mode="same-effects">
    <xsl:apply-templates select="drug-name" mode="same-effects" />
    <ul><xsl:apply-templates  /></ul>
    <xsl:apply-templates mode="caution" />
</xsl:template>
<xsl:template match="drug-name" mode="same-effects">
    <h4><xsl:apply-templates /></h4>
</xsl:template>

<xsl:template match="side-effect">
    <xsl:apply-templates />
</xsl:template>
<xsl:template match="side-effect-caution" mode="caution">
    <div class="caution">
    <xsl:apply-templates mode="caution" />
    </div>
</xsl:template>
<xsl:template match="effect" mode="caution">
    <p><strong><xsl:apply-templates /></strong></p>
</xsl:template>
<xsl:template match="effect-note" mode="caution">
    <p><strong><xsl:apply-templates /></strong></p>
</xsl:template>
<xsl:template match="effect">
    <li><xsl:apply-templates /></li>
</xsl:template>

<xsl:template match="instructions">
   <div class="instructions">
        <h3>Notes</h3>
    </div>
</xsl:template>

<xsl:template match="instructions-right">
    <div class="instructions">
        <h3>Notes</h3>
    </div>
</xsl:template>

<xsl:template match="disclaimer">
    <!--
    <div class="disclaimer">
    <h2>Disclaimer:</h2>
        <p>This information is not meant to substitute for advice from your medical provider or pharmacist.  If you have any questions about your medication dosing, talk to your medical provider or pharmacist.</p>
    </div>
    -->
    <p class="disclaimer">
    <span class="h2">Disclaimer: </span>
    This information is not meant to substitute for advice from your medical provider or pharmacist.  If you have any questions about your medication dosing, talk to your medical provider or pharmacist.
    </p>
</xsl:template>

<xsl:template name="credit">
    <p class="photo-credit">Image of <xsl:value-of select="/pg/page-0/drug/drug-name/brand-name" /> is courtesy of <xsl:value-of select="/pg/page-0/drug/formulations/formulation/form-image/@credit" />
    </p>
</xsl:template>


<!--
     <xsl:template match="ctimg">
        <div style="width:{@width + 100}px;height:100%; margin:1em; padding-right:1em;">
            <a href="va?page={$HCLASS}-imglib&#38;pp={$HCLASS}&#38;title={/pg/@title}&#38;src={ctimg2/@src}&#38;width={ctimg2/@width}&#38;height={ctimg2/@height}&#38;border={ctimg2/@border}&#38;alt={ctimg2/@alt}&#38;caption={ctimg2/@caption}" target="OffSite">
                <img src="images/{@src}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}" />
            </a>
            <xsl:if test="@caption">
                <div>
                    <xsl:value-of select="@caption" />
                </div>
            </xsl:if>
        </div>
    </xsl:template>
-->

    <xsl:template match="backto">
        <xsl:if test="$BACKTO != ''">
            <xsl:variable name="newREF">
                    <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="$BACKTO" /></xsl:call-template>
            </xsl:variable>
            <p class="backto"><a href="{$newREF}"><xsl:value-of select="$BACKTEXT" /></a></p>
        </xsl:if>
    </xsl:template>

<!-- TEMPLATE FOR DISPLAYING TEAMSITE VARIABLES FOR DEBUGGING -->
    <xsl:template match="checkVars">
        VASERVER = <xsl:value-of select="$VASERVER" /><br />
        FULLPATH = <xsl:value-of select="$FULLPATH" /><br />
        LINKPATH = <xsl:value-of select="$LINKPATH" /><br />
        <br />
        AREA = <xsl:value-of select="$AREA" /><br />
        BACKTO = <xsl:value-of select="$BACKTO" /><br />
        HCLASS = <xsl:value-of select="$HCLASS" /><br />
        INTRA = <xsl:value-of select="$INTRA" /><br />
        PGID = <xsl:value-of select="$PGID" /><br />
        POST = <xsl:value-of select="$POST" /><br />
        QUERY = <xsl:value-of select="$QUERY" /><br />
        SLIDE = <xsl:value-of select="$SLIDE" /><br />
        THUMBPAGE = <xsl:value-of select="$THUMBPAGE" /><br />
        TS = <xsl:value-of select="$TS" /><br />
    </xsl:template>

    <!-- New Byline Template -->
    <xsl:template match="byline" mode="byline">
        <div class="byline bylinetop">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="byline-bottom" mode="byline-bottom">
        <div class="byline bylinebottom">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="doc-source">
        <p class="bylinedocsource"><xsl:apply-templates /></p>
    </xsl:template>

    <xsl:template match="section-title">
            <p class="bylinesectiontitle"><xsl:apply-templates /></p>
    </xsl:template>

    <xsl:template match="doctype">
        <p class="bylinetype">
                <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="docedition">
        <p class="bylinetype">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="display">
        <p class="bylinedate"><xsl:apply-templates /></p>
    </xsl:template>

    <xsl:template match="date">
            <!-- set up variables -->
            <xsl:variable name="DATE" select="." />
            <xsl:variable name="MONTH" select="substring($DATE, 6, 2)" />
            <xsl:variable name="YEAR" select="substring($DATE, 1, 4)" />
            <xsl:variable name="DAY" select="substring($DATE, 9, 2)" />
            <!-- convert month in digits to month in letters -->
            <xsl:variable name="LONGMONTH">
                <xsl:choose>
                    <xsl:when test="$MONTH = '00'" />
                    <xsl:when test="$MONTH = '01'">January</xsl:when>
                    <xsl:when test="$MONTH = '02'">February</xsl:when>
                    <xsl:when test="$MONTH = '03'">March</xsl:when>
                    <xsl:when test="$MONTH = '04'">April</xsl:when>
                    <xsl:when test="$MONTH = '05'">May</xsl:when>
                    <xsl:when test="$MONTH = '06'">June</xsl:when>
                    <xsl:when test="$MONTH = '07'">July</xsl:when>
                    <xsl:when test="$MONTH = '08'">August</xsl:when>
                    <xsl:when test="$MONTH = '09'">September</xsl:when>
                    <xsl:when test="$MONTH = '10'">October</xsl:when>
                    <xsl:when test="$MONTH = '11'">November</xsl:when>
                    <xsl:when test="$MONTH = '12'">December</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <!-- display date in letters -->
            <xsl:variable name="LONGDATE">
                <xsl:if test="$DATE != '0000-00-00' and $DATE != ''">
                    <xsl:choose>
                        <xsl:when test="$DAY != '00' and $DAY != ''">
                            <xsl:value-of select="$LONGMONTH" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="$DAY" />
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="$YEAR" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$LONGMONTH" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="$YEAR" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:variable>
        <xsl:value-of select="$LONGDATE" /><xsl:if test="../reviewed">;</xsl:if>
    </xsl:template>

    <xsl:template match="reviewed">
        Last reviewed/updated:<xsl:text> </xsl:text>
            <!-- set up variables -->
            <xsl:variable name="DATE" select="date" />
            <xsl:variable name="MONTH" select="substring($DATE, 6, 2)" />
            <xsl:variable name="YEAR" select="substring($DATE, 1, 4)" />
            <xsl:variable name="DAY" select="substring($DATE, 9, 2)" />
            <!-- convert month in digits to month in letters -->
            <xsl:variable name="LONGMONTH">
                <xsl:choose>
                    <xsl:when test="$MONTH = '00'" />
                    <xsl:when test="$MONTH = '01'">January</xsl:when>
                    <xsl:when test="$MONTH = '02'">February</xsl:when>
                    <xsl:when test="$MONTH = '03'">March</xsl:when>
                    <xsl:when test="$MONTH = '04'">April</xsl:when>
                    <xsl:when test="$MONTH = '05'">May</xsl:when>
                    <xsl:when test="$MONTH = '06'">June</xsl:when>
                    <xsl:when test="$MONTH = '07'">July</xsl:when>
                    <xsl:when test="$MONTH = '08'">August</xsl:when>
                    <xsl:when test="$MONTH = '09'">September</xsl:when>
                    <xsl:when test="$MONTH = '10'">October</xsl:when>
                    <xsl:when test="$MONTH = '11'">November</xsl:when>
                    <xsl:when test="$MONTH = '12'">December</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <!-- display date in letters -->
            <xsl:variable name="LONGDATE">
                <xsl:if test="$DATE != '0000-00-00' and $DATE != ''">
                    <xsl:choose>
                        <xsl:when test="$DAY != '00' and $DAY != ''">
                            <xsl:value-of select="$LONGMONTH" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="$DAY" />
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="$YEAR" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$LONGMONTH" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="$YEAR" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:variable>
            <xsl:value-of select="$LONGDATE" />
            <xsl:if test="by">, by <xsl:apply-templates select="by" />
            </xsl:if>


    </xsl:template>

    <xsl:template match="by">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="display" mode="page">

		<xsl:apply-templates select="posted" />
		<xsl:apply-templates select="updated" />
		<xsl:apply-templates select="reviewed" />

	</xsl:template>

	<xsl:template match="display" mode="date">

		<p class="bylinetype">
				<!-- set up variables -->
			  <xsl:variable name="DATE"> <xsl:choose>
				   <xsl:when test="@date"><xsl:value-of select="@date" /></xsl:when>
				   <xsl:otherwise><xsl:value-of select="posted"/></xsl:otherwise>
			   </xsl:choose></xsl:variable>

				<xsl:variable name="MONTH" select="substring($DATE, 6, 2)"/>
				<xsl:variable name="YEAR" select="substring($DATE, 1, 4)"/>
				<xsl:variable name="DAY" select="substring($DATE, 9, 2)"/>
				<xsl:variable name="DAY1" select="substring($DATE, 9, 1)"/>
				<xsl:variable name="DAY2" select="substring($DATE, 10, 1)"/>

				<!-- convert month in digits to month in letters -->

				<xsl:variable name="LONGMONTH">
					<xsl:choose>
						<xsl:when test="$MONTH = '00'"></xsl:when>
						<xsl:when test="$MONTH = '01'">January</xsl:when>
						<xsl:when test="$MONTH = '02'">February</xsl:when>
						<xsl:when test="$MONTH = '03'">March</xsl:when>
						<xsl:when test="$MONTH = '04'">April</xsl:when>
						<xsl:when test="$MONTH = '05'">May</xsl:when>
						<xsl:when test="$MONTH = '06'">June</xsl:when>
						<xsl:when test="$MONTH = '07'">July</xsl:when>
						<xsl:when test="$MONTH = '08'">August</xsl:when>
						<xsl:when test="$MONTH = '09'">September</xsl:when>
						<xsl:when test="$MONTH = '10'">October</xsl:when>
						<xsl:when test="$MONTH = '11'">November</xsl:when>
						<xsl:when test="$MONTH = '12'">December</xsl:when>
					</xsl:choose>
				</xsl:variable>

				<!-- display date in letters -->

				<xsl:variable name="LONGDATE">
					<xsl:if test="$DATE != '0000-00-00' and $DATE != ''">
						<xsl:choose>
							<xsl:when test="$DAY != '00' and $DAY != ''">
								<xsl:value-of select="$LONGMONTH"/><xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="$DAY1 != '0'">
										<xsl:value-of select="$DAY1"/><xsl:value-of select="$DAY2"/><xsl:text>, </xsl:text>
										<xsl:value-of select="$YEAR"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$DAY2"/><xsl:text>, </xsl:text>
										<xsl:value-of select="$YEAR"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$LONGMONTH"/><xsl:text> </xsl:text>
								<xsl:value-of select="$YEAR"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:variable>

				<!--<xsl:if test=". != ''"><xsl:value-of select="." /><xsl:text> </xsl:text></xsl:if>-->
					<xsl:value-of select="$LONGDATE" />
				<xsl:if test="../display-updated"><xsl:apply-templates select="../display-updated" mode="date" /></xsl:if>
			</p>
    </xsl:template>

    <xsl:template match="display-updated" mode="date">
        <!-- set up variables again -->
        <xsl:variable name="DATE" select="@date" />

        <xsl:variable name="MONTH" select="substring($DATE, 6, 2)" />
        <xsl:variable name="YEAR" select="substring($DATE, 1, 4)" />
        <xsl:variable name="DAY" select="substring($DATE, 9, 2)" />

        <!-- convert month in digits to month in letters -->

        <xsl:variable name="LONGMONTH">
            <xsl:choose>
                <xsl:when test="$MONTH = '00'"></xsl:when>
                <xsl:when test="$MONTH = '01'">January</xsl:when>
                <xsl:when test="$MONTH = '02'">February</xsl:when>
                <xsl:when test="$MONTH = '03'">March</xsl:when>
                <xsl:when test="$MONTH = '04'">April</xsl:when>
                <xsl:when test="$MONTH = '05'">May</xsl:when>
                <xsl:when test="$MONTH = '06'">June</xsl:when>
                <xsl:when test="$MONTH = '07'">July</xsl:when>
                <xsl:when test="$MONTH = '08'">August</xsl:when>
                <xsl:when test="$MONTH = '09'">September</xsl:when>
                <xsl:when test="$MONTH = '10'">October</xsl:when>
                <xsl:when test="$MONTH = '11'">November</xsl:when>
                <xsl:when test="$MONTH = '12'">December</xsl:when>
            </xsl:choose>
        </xsl:variable>

        <!-- display date in letters -->

        <xsl:variable name="LONGDATE">
            <xsl:if test="$DATE != '0000-00-00' and $DATE != ''">
                <xsl:choose>
                    <xsl:when test="$DAY != '00' and $DAY != ''">
                        <xsl:value-of select="$LONGMONTH" /><xsl:text> </xsl:text>
                        <xsl:value-of select="$DAY" /><xsl:text>, </xsl:text>
                        <xsl:value-of select="$YEAR" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$LONGMONTH" /><xsl:text> </xsl:text>
                        <xsl:value-of select="$YEAR" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>

        <b>; Updated <xsl:value-of select="$LONGDATE" /></b>
    </xsl:template>

    <xsl:template match="posted">
        <!-- set up variables -->
        <xsl:variable name="DATE" select="." />
        <xsl:variable name="MONTH" select="substring($DATE, 6, 2)" />
        <xsl:variable name="YEAR" select="substring($DATE, 1, 4)" />
        <xsl:variable name="DAY" select="substring($DATE, 9, 2)" />
        <!-- convert month in digits to month in letters -->
        <xsl:variable name="LONGMONTH">
            <xsl:choose>
                <xsl:when test="$MONTH = '00'" />
                <xsl:when test="$MONTH = '01'">January</xsl:when>
                <xsl:when test="$MONTH = '02'">February</xsl:when>
                <xsl:when test="$MONTH = '03'">March</xsl:when>
                <xsl:when test="$MONTH = '04'">April</xsl:when>
                <xsl:when test="$MONTH = '05'">May</xsl:when>
                <xsl:when test="$MONTH = '06'">June</xsl:when>
                <xsl:when test="$MONTH = '07'">July</xsl:when>
                <xsl:when test="$MONTH = '08'">August</xsl:when>
                <xsl:when test="$MONTH = '09'">September</xsl:when>
                <xsl:when test="$MONTH = '10'">October</xsl:when>
                <xsl:when test="$MONTH = '11'">November</xsl:when>
                <xsl:when test="$MONTH = '12'">December</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- display date in letters -->
        <xsl:variable name="LONGDATE">
            <xsl:if test="$DATE != '0000-00-00' and $DATE != ''">
                <xsl:choose>
                    <xsl:when test="$DAY != '00' and $DAY != ''">
                        <xsl:value-of select="$LONGMONTH" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$DAY" />
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$YEAR" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$LONGMONTH" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$YEAR" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="$LONGDATE" />
        <xsl:if test="../updated !=''">; updated <xsl:apply-templates select="../updated" mode="date" /></xsl:if>
        <xsl:if test="../reviewed !=''">; reviewed <xsl:apply-templates select="../reviewed" mode="date" /></xsl:if>
    </xsl:template>

    <xsl:template match="updated">
        <!-- set up variables -->
        <xsl:variable name="DATE" select="." />
        <xsl:variable name="MONTH" select="substring($DATE, 6, 2)" />
        <xsl:variable name="YEAR" select="substring($DATE, 1, 4)" />
        <xsl:variable name="DAY" select="substring($DATE, 9, 2)" />
        <!-- convert month in digits to month in letters -->
        <xsl:variable name="LONGMONTH">
            <xsl:choose>
                <xsl:when test="$MONTH = '00'" />
                <xsl:when test="$MONTH = '01'">January</xsl:when>
                <xsl:when test="$MONTH = '02'">February</xsl:when>
                <xsl:when test="$MONTH = '03'">March</xsl:when>
                <xsl:when test="$MONTH = '04'">April</xsl:when>
                <xsl:when test="$MONTH = '05'">May</xsl:when>
                <xsl:when test="$MONTH = '06'">June</xsl:when>
                <xsl:when test="$MONTH = '07'">July</xsl:when>
                <xsl:when test="$MONTH = '08'">August</xsl:when>
                <xsl:when test="$MONTH = '09'">September</xsl:when>
                <xsl:when test="$MONTH = '10'">October</xsl:when>
                <xsl:when test="$MONTH = '11'">November</xsl:when>
                <xsl:when test="$MONTH = '12'">December</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- display date in letters -->
        <xsl:variable name="LONGDATE">
            <xsl:if test="$DATE != '0000-00-00' and $DATE != ''">
                <xsl:choose>
                    <xsl:when test="$DAY != '00' and $DAY != ''">
                        <xsl:value-of select="$LONGMONTH" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$DAY" />
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$YEAR" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$LONGMONTH" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$YEAR" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="$LONGDATE" />
    </xsl:template>

    <xsl:template match="page-descs">
            <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="page-desc">
        <div class="bylinedesc">
                <xsl:apply-templates />
            </div>

    </xsl:template>

    <!--AUTHOR TEMPLATES -->

    <xsl:template match="authors">
        <p class="bylineauthor">
            <xsl:apply-templates />
        </p>
    </xsl:template>

    <xsl:template match="author">

                    <xsl:apply-templates select="name" />
                    <xsl:if test="authororgs">
                        <xsl:apply-templates select="authororgs" />
                    </xsl:if>
                    <xsl:if test="authorinsts">
                        <xsl:apply-templates select="authorinsts" />
                    </xsl:if>
<br />
    </xsl:template>

    <xsl:template match="authororgs">
        <xsl:apply-templates select="authororg" />
    </xsl:template>

    <xsl:template match="authororg">, <xsl:apply-templates />

    </xsl:template>

    <xsl:template match="authorinsts">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="authorinst">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="instname">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="name">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="fname">
        <xsl:apply-templates /><xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="mname">
        <xsl:apply-templates /><xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="lname">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="degree">, <xsl:text> </xsl:text><xsl:apply-templates />
    </xsl:template>

    <!-- End New Byline Template -->
    <xsl:template match="site-parent">
        <h2 class="siteparent"><xsl:apply-templates /></h2>
    </xsl:template>

    <xsl:template match="site-title">
        <h1 class="sitetitle"><xsl:apply-templates /></h1>
    </xsl:template>

	<xsl:template match="rollimg">
            <xsl:choose>
                <xsl:when test="@align = 'right'">
                    <xsl:attribute name="class">imageright</xsl:attribute>
                </xsl:when>
                <xsl:when test="@align = 'left'">
                    <xsl:attribute name="class">imageleft</xsl:attribute>
                </xsl:when>
            </xsl:choose>
	<xsl:choose>
		<xsl:when test="@starter">
			<a onmouseover="javascript:document.{@name}.src='{$TSP}images/{@rollover}'" onmouseout="javascript:document.{@name}.src='{$TSP}images/{@src}'" onmouseup="javascript:document.{@name}.src='{$TSP}images/{@mouseup}'" ><img src="{$TSP}images/{@starter}" name="{@name}" width="{@width}" height="{@height}" style="border:0;" alt="{@alt}" /></a>
				<xsl:if test="@caption"><p class="caption"><xsl:value-of select="@caption" /></p></xsl:if>
		</xsl:when>
		<xsl:otherwise>
			<a onmouseover="javascript:document.{@name}.src='{$TSP}images/{@rollover}'"><img src="{$TSP}images/{@src}" name="{@name}" width="{@width}" height="{@height}" alt="{@alt}" /></a><br />
				<xsl:if test="@caption"><p class="caption"><xsl:value-of select="@caption" /></p></xsl:if>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	<xsl:template match="items-img">
	    <form>
	    <fieldset style="border: none;">
		<legend style="position:absolute; left:-10000px;">The checkboxes below will not be submitted</legend>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="Layout Table">

			<tr>
				<td valign="top"><img src="{$TSP}images/{@src}" name="{@name}" width="{@width}" height="{@height}" border="{@border}" alt="{@alt}" /></td>
				<td>
					<table width="100%" border="0" cellpadding="3" cellspacing="2">
						<xsl:apply-templates />
					</table>
				</td>
			</tr>

		</table>
		</fieldset>
	    </form>
	</xsl:template>

	<xsl:template match="item-img">
		<tr>
			<td valign="top"><input type="checkbox" name="" value="{@value}" id="{@value}" /></td>
			<td><label for="{@value}"><xsl:apply-templates /></label></td>
		</tr>
	</xsl:template>

    <!--algorithm templates -->

	<xsl:template match="algorithm-yale">
	     <script type="text/javascript" src="{$TSP}styles/livertests.js"><xsl:text> </xsl:text></script>
		<table width="719" border="0" cellpadding="0" cellspacing="0" class="algorithm-yale">
			<tbody>
				<tr>
					<xsl:apply-templates />
				</tr>
			</tbody>
 	 	</table>
	</xsl:template>

	<xsl:template match="td">
		<td width="{@width}" sytle="vertical-align: top;">
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="div">
		<div id="{@id}" style="@style">
			<xsl:apply-templates />
		</div>
	</xsl:template>




    <xsl:template match="algorithm">

        <script type="text/javascript" src="{$TSP}{@script}"></script>

        <div class="crumb return-button">
			<xsl:choose>
				<xsl:when test="$TS = 'true'">
					<a href="{$TSP}provider/index.asp" title="Viral Hepatitis Provider's Home">
						Back to Provider's Home
					</a>
				</xsl:when>
				<xsl:otherwise>
					<a href="va?page=we-teamsite&#38;TS=provider/index" title="Viral Hepatitis Provider's Home">
						Back to Provider's Home
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	<div class="algorithm">
        <xsl:apply-templates />
	</div>
    </xsl:template>


    <xsl:template match="map">
        <map name="{@name}">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
			</xsl:if>
            <xsl:apply-templates />
        </map>
    </xsl:template>

    <xsl:template match="area">
        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@jump">
                <area alt="{@alt}" shape="{@shape}" coords="{@coords}" href="{$newREF}{@jump}"> </area>
            </xsl:when>
            <xsl:otherwise>
                <area alt="{@alt}" shape="{@shape}" coords="{@coords}">
					<xsl:choose>
						<xsl:when test="@href">
							<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="href"><xsl:value-of select="$newREF" /></xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
                </area>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- This template would need to be revised for an HIV algorighm-->

    <xsl:template match="algorithm-nav">

        <xsl:variable name="newREF">
            <xsl:call-template name="convertREF"><xsl:with-param name="FILE" select="@ref" /></xsl:call-template>
        </xsl:variable>

        <!--<p id="version" class="center">Navigation</p>-->

        <p><xsl:choose>
            <xsl:when test="$TS = 'true' or contains ($VASERVER, 'www.hiv.va.gov') or contains ($VASERVER, 'www.hepatitis.va.gov')">
                <a onClick="history.go(-1)" onMouseOver="image1.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_previous_on.png';" onMouseOut="image1.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_previous.png';"><img name="image1" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_previous.png" alt="Previous" border="0" /></a><a href="/HEPATITIS/provider/tools/algorithm-hcc/start.asp" onMouseOver="image2.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_start_on.png';" onMouseOut="image2.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_start.png';"><img name="image2" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_start.png" alt="Start" border="0" /></a><a onMouseOver="image3.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_diagnostic_on.png';" href="/HEPATITIS/provider/tools/algorithm-hcc/diagnosis_start.asp" onMouseOut="image3.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_diagnostic.png';"><img name="image3" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_diagnostic.png" alt="Diagnostic Algorithm" border="0" /></a><a href="/HEPATITIS/provider/tools/algorithm-hcc/tx_start.asp" onMouseOver="image4.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_on.png';" onMouseOut="image4.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment.png';"><img name="image4" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment.png" alt="Treatment Algorithm" border="0" /></a><a href="/HEPATITIS/provider/tools/algorithm-hcc/child_pugh_chart.asp" onMouseOver="image5.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_childpugh_on.png';" onMouseOut="image5.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_childpugh.png';"><img name="image5" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_childpugh.png" alt="Child-Pugh Chart" border="0" /></a><a href="/HEPATITIS/provider/tools/algorithm-hcc/hcc_guide.asp" onMouseOver="image6.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_guidelines_on.png';" onMouseOut="image6.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_guidelines.png';"><img name="image6" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_guidelines.png" alt="Treatment Guidelines" border="0" /></a><a href="/HEPATITIS/provider/tools/algorithm-hcc/hcc_contacts.asp" onMouseOver="image7.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_contact_info_on.png';" onMouseOut="image7.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_contact_info.png';"><img name="image7" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_contact_info.png" alt="Contact Info" border="0" /></a><a href="/HEPATITIS/provider/tools/algorithm-hcc/hcc_help.asp" onMouseOver="image8.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_help_on.png';" onMouseOut="image8.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_help.png';"><img name="image8" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_help.png" alt="Help" border="0" /></a>
            </xsl:when>

            <xsl:otherwise>

                <a onClick="history.go(-1)" onMouseOver="image1.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_previous_on.png';" onMouseOut="image1.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_previous.png';"><img name="image1" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_previous.png"  alt="Previous" border="0" /></a><a href="{$newREF}provider/tools/algorithm-hcc/start" onMouseOver="image2.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_start_on.png';" onMouseOut="image2.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_start.png';"><img name="image2" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_start.png" alt="Start" border="0" /></a><a onMouseOver="image3.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_diagnostic_on.png';" href="{$newREF}provider/tools/algorithm-hcc/diagnosis_start" onMouseOut="image3.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_diagnostic.png';"><img name="image3" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_diagnostic.png" alt="Diagnostic Algorithm" border="0" /></a><a href="{$newREF}provider/tools/algorithm-hcc/tx_start" onMouseOver="image4.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_on.png';" onMouseOut="image4.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment.png';"><img name="image4" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment.png" alt="Treatment Algorithm" border="0" /></a><a href="{$newREF}provider/tools/algorithm-hcc/child_pugh_chart" onMouseOver="image5.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_childpugh_on.png';" onMouseOut="image5.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_childpugh.png';"><img name="image5" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_childpugh.png" alt="Child-Pugh Chart" border="0" /></a><a href="{$newREF}provider/tools/algorithm-hcc/hcc_guide" onMouseOver="image6.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_guidelines_on.png';" onMouseOut="image6.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_guidelines.png';"><img name="image6" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_treatment_guidelines.png" alt="Treatment Guidelines" border="0" /></a><a href="{$newREF}provider/tools/algorithm-hcc/hcc_contacts" onMouseOver="image7.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_contact_info_on.png';" onMouseOut="image7.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_contact_info.png';"><img name="image7" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_contact_info.png" border="0" /></a><a href="{$newREF}provider/tools/algorithm-hcc/hcc_help" onMouseOver="image8.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_help_on.png';" onMouseOut="image8.src='{$TSP}images/provider/tools/algorithm-hcc/hccimages_help.png';"><img name="image8" src="{$TSP}images/provider/tools/algorithm-hcc/hccimages_help.png" alt="Help" border="0" /></a>
            </xsl:otherwise>
        </xsl:choose></p>


    </xsl:template>

    <xsl:template match="algorithm-backto">
        <p class="backto"><a onClick="history.go(-1)">Back to Previous Page</a></p>
    </xsl:template>

    <!-- NEW SUBSCRIBE WIDGET; HEPC CODE IS USVHA_5; HIV CODE IS USVHA_6 -->
    <xsl:template match="subscribe-widget" mode="subscribe">
    <div class="widget">

    	<div class="widget-title"><h4>Get Updates</h4></div>

    	<p class="widget-email-desc">Subscribe to Receive <xsl:value-of select="$SITENAME" /> Email Updates</p>

              <div id="widget-email">

                 <form id="vamc_govDeliveryForm" action="https://public.govdelivery.com/accounts/USVHA/subscribers/qualify">
                     <input type="hidden" value="USVHA_5" name="topic_id" id="topic_id">
		                          <xsl:if test="@site = 'hiv'">
		                              <xsl:attribute name="value">USVHA_6</xsl:attribute>
		                          </xsl:if>
                     </input>

                    <label for="email">Input email address to subscribe</label>

                    <input type="text" title="enter email here" onfocus="this.value=''" value="Email Address" size="10" class="inputstyle" id="email" name="email" />

                    <div id="widget-email-Button">
                    <label for="vamc_govDeliverySubmit">Button to subscribe to email</label>

                    <input type="image" title="Click here to submit" value="Subscribe" alt="subscribe" src="/va_files/2012/images/button-footer-email.png" class="form-submit" name="commit" id="vamc_govDeliverySubmit" />
                    </div>
                 </form>

    	     </div>

     </div>

       <!-- <div class="subscribebox">
            <form id="vamc_govDeliveryForm" action="https://public.govdelivery.com/accounts/USVHA/subscribers/qualify">

                <input type="hidden" value="USVHA_5" name="topic_id" id="topic_id">
                    <xsl:if test="@site = 'hiv'">
                        <xsl:attribute name="value">USVHA_6</xsl:attribute>
                    </xsl:if>
                </input>

                <label for="email">For Content Updates</label>

                <input type="text" onfocus="this.value=''" value="Email Address" size="20" id="email" name="email" title="Enter email address here" />

				<label for="vamc_govDeliverySubmit" style="position:absolute; left:-10000px;">Subscribe</label>

                <input type="submit" value="Subscribe" name="commit" id="vamc_govDeliverySubmit" class="form_button" title="Subscribe button" />

            </form>
        </div>-->
    </xsl:template>

    <xsl:template match="knowmore-widget">
			<a href="https://www.cdc.gov/hepatitis/riskassessment/?s_cid=bb-dvh-hra_008" title="VIRAL HEPATITIS. ARE YOU AT RISK? Take this online assessment to see if you're at risk. https://www.cdc.gov/hepatitis/riskassessment/"><img src="https://www.cdc.gov/images/campaigns/hepatitis/ratbadgev1-180x150.jpg" style="width:180px; height:150px; border:0px;" alt="VIRAL HEPATITIS. ARE YOU AT RISK? Take this online assessment to see if you're at risk. https://www.cdc.gov/hepatitis/riskassessment/" /></a>
    </xsl:template>

    <xsl:template match="testingday-widget">
    	<div class="related-image">
			<a href="https://hivtest.cdc.gov/press_files/Default.aspx?s_cid=hivtesting_011" title="Take the Test, Take Control. National HIV Testing Day � 6/27/2010"><img src="https://www.cdc.gov/images/campaigns/hivtesting/2010/TakeTheTest_100x120.gif" style="width:100px; height:120px; border:0px;" alt="Take the Test, Take Control. National HIV Testing Day � 6/27/2010" /></a>
		</div>
    </xsl:template>
    
    <xsl:template match="tabs">
        <div id="tabContent">
            <div id="tab-accord" class="tab-accord">
               <xsl:apply-templates />
            </div>
    </div>
    </xsl:template>
    <xsl:template match="tab">
	<xsl:apply-templates />
    </xsl:template>
    <xsl:template match="tab-title">
	<h3 class="tab"><a role="button" class="m" href="#"><xsl:apply-templates /></a></h3>
    </xsl:template>
    <xsl:template match="tab-content">
	<div class="pane" style="display: none;">
		<xsl:apply-templates />
	</div>
    </xsl:template>
    
    <xsl:template match="accordions">
    	<xsl:apply-templates />
	<script type="text/javascript" language="JavaScript">
		var acc = document.getElementsByClassName("accordionnew");
		var i;

		for (i = 0; i <xsl:value-of disable-output-escaping="yes" select="concat('&lt;', ' ')" /> acc.length; i++) {
		  acc[i].onclick = function() {
		    this.classList.toggle("active");
		  }
		}

		var accall = document.getElementsByClassName('accordionall');

		for (var a = 0; a <xsl:value-of disable-output-escaping="yes" select="concat('&lt;', ' ')" /> accall.length; a++) {
		  accall[a].onclick = function(){

		      if(this.classList.contains('accordionexpand')) {
			    this.classList.remove("accordionexpand");
			    this.classList.add("accordionclose");
			    this.parentElement.classList.remove("accordionsexpand");
			    this.parentElement.classList.add("accordionsclose");
		      }
		      else if(this.classList.contains('accordionclose')) {
			    for (i = 0; i <xsl:value-of disable-output-escaping="yes" select="concat('&lt;', ' ')" /> acc.length; i++) {
				    acc[i].classList.remove("active");
			    }
			    this.classList.remove("accordionclose");
			    this.classList.add("accordionexpand");
			    this.parentElement.classList.remove("accordionsclose");
			    this.parentElement.classList.add("accordionsexpand");
		      }
		  }
		}

	</script>
    </xsl:template>
   
    <xsl:template match="accordion">
	<div class="accordionsexpand">
		<xsl:if test="@expand"><button class="accordionall accordionexpand">All</button></xsl:if>
		<xsl:apply-templates />
	</div>
    </xsl:template>
    <xsl:template match="accordion-item">   
	  <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="reveal-link">
		<button class="accordionnew"><xsl:apply-templates /></button>
    </xsl:template>
    <xsl:template match="reveal">
	<xsl:apply-templates />
    </xsl:template>
    <xsl:template match="collapse-link">
   
    </xsl:template>
    <xsl:template match="reveal-text">
    	<div class="accordionpanel">
	    <xsl:apply-templates />
        </div>
    </xsl:template>
    
<!--Re-org 2018-->
	<!--homepage-->
	<xsl:template match="intro-home">
		<div class="intro home-intro">
		      <xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="section-home">
		<section class="home-menu-container">
			<h2 class="visually-hidden">Viral Hepatitis Menu</h2>
			<div class="home-menu">
				<xsl:apply-templates mode="homepage" />
			</div>	
		</section>
	</xsl:template>   

	<xsl:template match="nav" mode="homepage">
		<nav>
		<xsl:apply-templates mode="homepage" />
		<xsl:apply-templates select="*[not(self::title)]" />
		</nav>
	</xsl:template>   

	<xsl:template match="title" mode="homepage">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>       


	<!--t1-->	
	<xsl:template match="accordion-menu">
		<section class="accordion-menu">
			<h2><xsl:apply-templates select="title" /></h2>
			<button class="expand-all">
				<span>+</span> Expand all
                	</button>
			<xsl:apply-templates mode="t1" select="*[not(self::title)]" />
		</section>	
	</xsl:template> 

	<xsl:template match="ul" mode="t1">
                <ul>
                <xsl:apply-templates mode="t1" />
                </ul>
	</xsl:template> 

	<xsl:template match="li" mode="t1">
                <li>
			<xsl:if test="@class"><xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute></xsl:if>
			<xsl:choose>
				<xsl:when test="title/ilink-vahep or title/link-vahep">
					<h3><xsl:apply-templates select="title" /></h3>
					<button aria-expanded="false" class="toggle">Toggle Submenu</button>
					<xsl:if test="ul">
						<nav class="submenu">
							<xsl:apply-templates select="*[not(self::title)]" />
						</nav>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="ul">
							<h3><span><xsl:apply-templates select="title" /></span></h3>
							<button aria-expanded="false" class="toggle">Toggle Submenu</button>
							<nav class="submenu">
								<xsl:apply-templates select="*[not(self::title)]" />
							</nav>					
						</xsl:when>
						<xsl:otherwise>
							<h3><a href="#"><xsl:apply-templates select="title" /></a></h3><button aria-expanded="false" class="toggle">Toggle Submenu</button>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>	

		</li>	
	</xsl:template> 

	<xsl:template match="aside">
		<aside>
			<xsl:if test="@class"><xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute></xsl:if>
			<h2><xsl:apply-templates select="title" /></h2>
			<blockquote>
				<xsl:apply-templates select="*[not(self::title)]" />
			</blockquote>
			<xsl:apply-templates mode="t1" />
		</aside>
	</xsl:template>
	
	<xsl:template match="more" mode="t1">
		<xsl:apply-templates />
	</xsl:template>	
	
	<!--t4-->
	<xsl:template match="section-hero">
              <section class="hero">
                <header class="{@class}">
                  <h1>
                  <xsl:choose>
			<xsl:when test="contains ($PGID, 'hav')">
				<xsl:text>Hepatitis A</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'hbv')">
				<xsl:text>Hepatitis B</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'hcv')">
				<xsl:text>Hepatitis C</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'cirrhosis/')">
				<xsl:text>Cirrhosis</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'liver-cancer')">
				<xsl:text>Liver Cancer</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'liver-transplant')">
				<xsl:text>Liver Transplant</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'nafl')">
				<xsl:text>Non-Alcoholic Fatty Liver</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'alcohol')">
				<xsl:text>Alcoholic Liver Disease</xsl:text><span>for Patients</span>
			</xsl:when>
			<xsl:when test="contains ($PGID, 'basics')">
				Introduction to the Liver<span>Liver Basics</span>
			</xsl:when>			
			<xsl:otherwise>
			</xsl:otherwise>
		  </xsl:choose>	
                  </h1>
                  <xsl:apply-templates select="hero-description" />
                </header>
                <footer>
                  <xsl:choose>
                     <xsl:when test="contains($PGID, 'basics')">
                        <xsl:apply-templates select="start-button" />
                     </xsl:when>
                     <xsl:otherwise>
			  <nav>
			    <xsl:if test="menu/@class"><xsl:attribute name="class"><xsl:value-of select="menu/@class" /></xsl:attribute></xsl:if>
			    <h2>Main Menu</h2>
			    <xsl:apply-templates mode="t4" />
			  </nav>
		     </xsl:otherwise>
		  </xsl:choose>   
                </footer>
              </section>  
	</xsl:template>	

	<xsl:template match="hero-description">		
		<xsl:apply-templates />
	</xsl:template>	

	<xsl:template match="start-button">		
		<xsl:apply-templates />
	</xsl:template>	

	<xsl:template match="menu" mode="t4">		
		<xsl:apply-templates mode="t4" />	
	</xsl:template>	

	<xsl:template match="ul" mode="t4">
	     <ul>
	     	<xsl:if test="@class"><xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute></xsl:if>
		<xsl:apply-templates mode="t4" />
	     </ul>	
	</xsl:template>	

	<xsl:template match="li" mode="t4">
	      <li>
		      <xsl:choose>
		      	<xsl:when test="../../menu[@class='listing']"><xsl:apply-templates /></xsl:when>
		      	<xsl:otherwise>
		      		<xsl:if test="title"><h3><xsl:apply-templates select="title" /></h3></xsl:if>
		      		<xsl:apply-templates select="*[not(self::title)]" />
			</xsl:otherwise>
		      </xsl:choose>	
	      </li>
	</xsl:template>	
	
	<xsl:template match="listing">
	 <nav class="listing">
	      <xsl:choose>
	      	<xsl:when test="title"><h2><xsl:apply-templates select="title" /></h2></xsl:when>
	      	<xsl:otherwise><h2 class="visually-hidden">Lesson Menu</h2></xsl:otherwise>
	      </xsl:choose>	
	      <xsl:apply-templates select="*[not(self::title)]" />
	 </nav>     
	</xsl:template>	

	<!--news-->

	<xsl:template match="news-listings">
	 <ul class="whats-new">
	      <xsl:apply-templates mode="news" />
	 </ul>     
	</xsl:template>	

	<xsl:template match="li" mode="news">
	      <li>
	     	<xsl:if test="@class"><xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute></xsl:if>
		<h2><xsl:apply-templates select="title" /></h2>
		<xsl:apply-templates select="p" />
		<xsl:apply-templates select="ul" mode="news" />	
	      </li>
	</xsl:template>	

	<xsl:template match="ul" mode="news">
	      <ul class="fat-bullets">
		<xsl:if test="title"><h2><xsl:apply-templates select="title" /></h2></xsl:if>
		<xsl:apply-templates select="*[not(self::title)]" />	
	      </ul>
	</xsl:template>	
	
	
	<!--T12 FAQs-->

	<xsl:template match="faq-menu">
		<section class="faq-menu">
			<h2><xsl:apply-templates select="title" /></h2>
			<button class="expand-all">
				<span>+</span> Expand all
                	</button>
			<xsl:apply-templates mode="faq" select="*[not(self::title)]" />
		</section>	
	</xsl:template> 

	<xsl:template match="ul" mode="faq">
                <ul>
                <xsl:apply-templates mode="faq" />
                </ul>
	</xsl:template> 

	<xsl:template match="li" mode="faq">
                <li>
			<xsl:if test="@class"><xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute></xsl:if>
			<button aria-expanded="false" class="toggle"><h3><xsl:apply-templates select="title" /></h3></button>
			<xsl:apply-templates select="answer" mode="faq"/>
		</li>	
	</xsl:template> 
	
	<xsl:template match="answer" mode="faq">
                <div class="answer">
                	<xsl:apply-templates />
                </div>
	</xsl:template> 
	
	
    <xsl:template mode="subscribe" match="*" />
    <xsl:template mode="imglib" match="*" />
    <xsl:template mode="page" match="*" />
    <xsl:template mode="by" match="*" />
    <xsl:template mode="byline" match="*" />
    <xsl:template mode="byline-bottom" match="*" />
    <xsl:template mode="header" match="*" />
    <xsl:template mode="leftnav" match="*" />
    <xsl:template mode="toc" match="*" />
    <xsl:template mode="keytoc" match="*" />
    <xsl:template mode="toctable" match="*" />
    <xsl:template mode="sections" match="*" />
    <xsl:template mode="boxes" match="*" />
    <xsl:template mode="tools" match="*" />
    <xsl:template mode="tool" match="*" />
    <xsl:template mode="related" match="*" />
    <xsl:template mode="crumb" match="*" />
    <xsl:template mode="contents" match="*" />
    <xsl:template mode="file-order" match="*" />
    <xsl:template mode="file" match="*" />
    <xsl:template mode="file-figure" match="*" />
    <xsl:template mode="product" match="*" />
    <xsl:template mode="semantic" match="*" />
    <xsl:template mode="searchbox" match="*" />
    <xsl:template mode="browse" match="*" />
    <xsl:template mode="media" match="*" />
    <xsl:template mode="mediaheader" match="*" />
    <xsl:template mode="text" match="*" />
    <xsl:template mode="textonly" match="*" />
    <xsl:template mode="key" match="*" />
    <xsl:template mode="keypoints" match="*" />
    <xsl:template mode="drug-name" match="*" />
    <xsl:template mode="formulation" match="*" />
    <xsl:template mode="data-table" match="*" />
    <xsl:template mode="sec" match="*" />
    <xsl:template mode="with" match="*" />
    <xsl:template mode="dose-images" match="*" />
    <xsl:template mode="drug-notes" match="*" />
    <xsl:template mode="caution" match="*" />
    <xsl:template mode="same-effects" match="*" />
    <xsl:template mode="date" match="*" />
    <xsl:template mode="includeFiles" match="*" />
    <xsl:template mode="includeHeader" match="*" />
    <xsl:template mode="algorithm" match="*" />
    <xsl:template mode="homepage" match="*" />
    <xsl:template mode="t1" match="*" />
    <xsl:template mode="t4" match="*" />
    <xsl:template mode="news" match="*" />
    <xsl:template match="*" />

</xsl:stylesheet>
