<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" omit-xml-declaration="yes" encoding="iso-8859-1" />

<!-- LOCALHOST VARIABLES, COMMENT OUT FOR TEAMSITE 
    <xsl:include href="xsl/library/variables.xsl" />
 ** END LOCALHOST VARIABLES -->

<!-- TEAMSITE VARIABLES, COMMENT OUT FOR LOCALHOST -->
    <xsl:param name="VASERVER" />
    <xsl:param name="FULLPATH" />

    <xsl:param name="POST" />
    <xsl:param name="SLIDE" />
    <xsl:param name="THUMBPAGE" />
    <xsl:param name="INTRA" />
    <xsl:param name="QUERY" />
    <xsl:param name="BACKTO" />
    <xsl:param name="BACKTEXT" />
    <xsl:param name="POPUP" />
    <xsl:param name="PAGEF" />

    <xsl:param name="SECT" />
    <xsl:variable name="NAV" select="pg/page-0/@pp" />

    <xsl:param name="CDATE" />
    <xsl:variable name="MON"><xsl:value-of select="substring-before($CDATE,'/')" /></xsl:variable>
    <xsl:variable name="MONTH">
        <xsl:choose>
            <xsl:when test="number($MON) > 9"><xsl:value-of select="$MON" /></xsl:when>
            <xsl:otherwise>0<xsl:value-of select="$MON" /></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="DAYR"><xsl:value-of select="substring-after($CDATE,'/')" /></xsl:variable>
    <xsl:variable name="DY"><xsl:value-of select="substring-before($DAYR,'/')" /></xsl:variable>
    <xsl:variable name="DAY">
        <xsl:choose>
            <xsl:when test="number($DY) > 9"><xsl:value-of select="$DY" /></xsl:when>
            <xsl:otherwise>0<xsl:value-of select="$DY" /></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="YEAR"><xsl:value-of select="substring-after($DAYR,'/')" /></xsl:variable>
    <xsl:variable name="CD"><xsl:value-of select="$YEAR" /><xsl:value-of select="$MONTH" /><xsl:value-of select="$DAY" /></xsl:variable>
    <xsl:variable name="PATH"><xsl:text>http://</xsl:text><xsl:value-of select="$VASERVER" /><xsl:text>/</xsl:text></xsl:variable>
    <xsl:variable name="URL"><xsl:text>http://</xsl:text><xsl:value-of select="$VASERVER" /><xsl:value-of select="$FULLPATH" /><xsl:text>?</xsl:text><xsl:value-of select="$QUERY" /></xsl:variable>
    <xsl:variable name="PGNODE">
        <xsl:choose>
            <xsl:when test="$POST != ''">page-<xsl:value-of select="$POST" /></xsl:when>
            <xsl:otherwise>page-0</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="PGNO" select="$POST" />
    <xsl:variable name="LINKPATH">
        <xsl:choose>
            <xsl:when test="$VASERVER = 'vaww.cms.webdev.va.gov'">
                <xsl:value-of select="substring-before($FULLPATH,'/hepatitis_internet/HEPATITIS/')" />/hepatitis_internet/HEPATITIS/</xsl:when>
            <xsl:otherwise>/HEPATITIS/</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="TS" select="contains($PATH, 'va.gov')" />
    <xsl:variable name="PGID"><xsl:value-of select="/pg/@id" /></xsl:variable>
    <xsl:variable name="INTRAPG"><xsl:value-of select="/pg/*[name()=$PGNODE]/@intrapg" /></xsl:variable>
    <xsl:variable name="HCLASS"><xsl:value-of select="/pg/*[name()=$PGNODE]/@pp" /></xsl:variable>
    <xsl:variable name="AREA" select="/pg/@area" />
    <xsl:variable name="WM">mms://10.174.142.138/</xsl:variable>

    <xsl:variable name="xfile">
        <xsl:choose>
            <xsl:when test="$VASERVER = 'vaww.cms.webdev.va.gov'"> 
                <xsl:value-of select="substring-after($FULLPATH,'/hepatitis_internet/HEPATITIS/')" />
            </xsl:when>
            <xsl:when test="contains($FULLPATH, '/HEPATITIS/')"> 
                <xsl:value-of select="substring-after($FULLPATH,'/HEPATITIS/')" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring-after($FULLPATH,'/')" />
            </xsl:otherwise>                                        
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="XMLFILE" select="substring-before($xfile, '.asp')" />

    <xsl:variable name="PAGEID" select="/pg/@id" />
    <xsl:variable name="PAGEWIDE" select="/pg/@wide" />
    <xsl:variable name="PAGEINCL" select="/pg/@include" />
    <xsl:variable name="PAGENAV" select="/pg/@nav" />

<!-- ** END TEAMSITE VARIABLES -->
 
<!-- NEW FOR MOBILE VIEW -->
<xsl:param name="MOBILE" />

<xsl:variable name="SEARCHSITE">vasite_search.asp</xsl:variable>

<!-- NEW VARIABLE TO CONVERT IMAGE, PPT, and PDF PATHS TO TS VERSIONS -->
    <xsl:variable name="TSP">
        <xsl:choose>
            <xsl:when test="$TS = 'true'">/HEPATITIS/</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>    
    </xsl:variable>

<!-- LOCAL VERSION USING URL PARAM 'TS' AND CONTENT IN /TEAMSITE/ -->
<xsl:variable name="TSXML">
    <xsl:choose>
        <xsl:when test="/pg[@id = 'we-teamsite']/params/TS != ''">
            <xsl:value-of select="concat('../TEAMSITE/',/pg/params/TS,'.xml')" />
        </xsl:when>
        <xsl:otherwise>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<!-- SITE NAME FOR NEW SEARCH WIDGET -->
<xsl:variable name="SITENAME">Hepatitis</xsl:variable>

    <xsl:template match="/">
        <a name="top"> </a>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
        <link href="/HEPATITIS/styles/styles.css" rel="stylesheet" type="text/css"/>
        <xsl:choose>
            <xsl:when test="$TS = 'true'">
                <div>
                	<xsl:choose>
                		<xsl:when test="contains ($PGID, 'patient') or contains ($PGID, 'basics') "><xsl:attribute name="class">outer-container patients</xsl:attribute></xsl:when>
                		<xsl:otherwise><xsl:attribute name="class">outer-container</xsl:attribute></xsl:otherwise>
                	</xsl:choose>	
			<div id="content-main"> 
			    <xsl:apply-templates select="/pg/*[name()=$PGNODE]">
				<xsl:with-param name="AREA" select="/pg/@area" />
			    </xsl:apply-templates>
                	</div>
                </div>

                <script type="text/javascript" language="JavaScript">
                    function openWindow(url,name){
                    newWin = window.open(url,name,'status,toolbar,menubar,resizable,scrollbars,left=20,top=20,width=800,height=600')
                    newWin.focus()
                    }

                    function openXWindow(url,name){
                    newXWin = window.open(url,name)
                    newXWin.focus()
                    }
                    function showDiv (event) {
                        event.preventDefault();
                        var showdiv = $(event.target).attr("query");
                        $(showdiv).toggleClass("hidden");

                        var main = $(event.target).parents(".main")[0];
                        if (main) {
                        $(".hideSelf",main).toggleClass("hidden");
                        }
                    }

                    function showQuiz (event) {
                        var qzno = $($(this).parents(".popquiz")[0]).attr("id").split("popquiz-")[1];
                        var quest = "#popquestion-" + qzno;

                        $(quest).toggleClass("hidden");
                        $(this).toggleClass("hidden");
                    }
                    function showAnswer (event) {
                        var qzno = $($(this).parents(".popquiz")[0]).attr("id").split("popquiz-")[1];
                        var quest = "#popquestion-" + qzno;
                        var ans = "#popanswer-" + qzno;

                        $(quest).toggleClass("hidden");
                        $(ans).toggleClass("hidden");
                        $(this).toggleClass("hidden");
                    }

                    $(document).ready(function() {
                        $(".ifno-quiz",".popquiz").toggleClass("hidden");
                        $(".showDiv").click(showDiv);     
                        $(".showQuiz").click(showQuiz);
                        $(".showAnswer").click(showAnswer);
                    });
                </script>
            </xsl:when>

            <xsl:otherwise>
                <xsl:if test="document($TSXML)">
                    <xsl:apply-templates select="document($TSXML)/pg" mode="local" />
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        <script src="/HEPATITIS/styles/scripts.js"></script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5c7477df651ca90a"></script>
    </xsl:template>

    <xsl:template match="pg" mode="local">
          <xsl:apply-templates select="*[name()=$PGNODE]">
                <xsl:with-param name="INCLUDE" select="@include" />
                <xsl:with-param name="WIDE" select="@wide" />
                <xsl:with-param name="AREA" select="@area" />
          </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="page-0">
        <xsl:param name="INCLUDE" />
        <xsl:param name="WIDE" />
        <xsl:param name="AREA" />

        <!--<xsl:apply-templates mode="crumb" />-->

        <xsl:choose>
            <xsl:when test="related or contains($AREA, 'menu') or tools/items/* or promo/*">
            
		<div class="content-rightcol">
                    <!--<div id="sub-navigation">
                        <xsl:choose>
                            <xsl:when test="$TS = 'true'">
                                <xsl:if test="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                                    <xsl:apply-templates select="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="NAV" select="@pp" />
                                <xsl:if test="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                                    <xsl:apply-templates select="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>-->

                    <div class="content-column" id="main-content-column">
                        <xsl:apply-templates mode="header" />
                        <xsl:apply-templates mode="page" />
                        <xsl:apply-templates select="byline" mode="byline" />
                        <xsl:if test="toc">
                            <div class="toc">
                                <h2>Contents</h2>
                                <ul>
                                    <xsl:apply-templates mode="toc" />
                                </ul>
                            </div>
                        </xsl:if>
                        <!--CCC--><xsl:apply-templates />
                        <xsl:apply-templates mode="byline-bottom" />
                        <xsl:apply-templates select="article/menu" />
                        <xsl:call-template name="disclaimer" />
                    </div>

                    <div class="related-column">
                        <!--<xsl:call-template name="search" />
                        <xsl:call-template name="browse">
                            <xsl:with-param name="PP" select="@pp" />
                        </xsl:call-template>-->


                        
		       <xsl:choose>
			    <xsl:when test="$TS = 'true'">
				<xsl:if test="document('../xml/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]">
				    <xsl:apply-templates select="document('../xml/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]" />
				</xsl:if>
			    </xsl:when>
			    <xsl:otherwise>
				<xsl:if test="document('../TEAMSITE/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]">
				    <xsl:apply-templates select="document('../TEAMSITE/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]" />
				</xsl:if>
			    </xsl:otherwise>
                        </xsl:choose>

                        <xsl:apply-templates mode="subscribe" />

                        <!-- <xsl:apply-templates mode="contents" /> -->
			<xsl:if test="not(@share='no')">
			    <xsl:call-template name="share" />
                        </xsl:if>
                        <xsl:apply-templates mode="boxes" />
                        <xsl:apply-templates mode="related" />

                       <!-- <xsl:variable name="AREA" select="/pg/@area" /> -->

 

                    </div>
                    <!--*********************************************************
		        *************************************************************
		        REPLACE SITEIMPROVE SCRIPT BEFORE PUBLISHING TO LIVESITE
		        You can find the script in app-js/siteimprove.js **************
		        *************************************************************
		        **********************************************************-->
		        
		    <script type="text/javascript">
		    	/*<![CDATA[*/
		    	(function() {
		    	var sz = document.createElement('script'); sz.type = 'text/javascript'; sz.async = true;
		    	sz.src = '//siteimproveanalytics.com/js/siteanalyze_8343.js';
		    	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sz, s);
		    	})();
		    	/*]]>*/
		    </script>
                </div>               	
            </xsl:when>

            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="/pg/@include or $INCLUDE != ''">
                        <div class="content-full" id="main-content-column">

                            <!--<div id="sub-navigation">
                                <xsl:choose>
                                    <xsl:when test="$TS = 'true'">
                                        <xsl:if test="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                                            <xsl:apply-templates select="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="NAV" select="@pp" />
                                        <xsl:if test="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                                            <xsl:apply-templates select="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>-->

                            <div class="content-column">
                            <xsl:apply-templates mode="header" />
                            <xsl:apply-templates mode="page" />
                            <xsl:if test="toc">
                                <div class="toc">
                                    <h2>Contents</h2>
                                    <ul>
                                        <xsl:apply-templates mode="toc" />
                                    </ul>
                                </div>
                            </xsl:if>
                            <!--AAA--><xsl:apply-templates />
                                <xsl:apply-templates mode="byline-bottom" />
                                <xsl:apply-templates select="article/menu" />
                            <xsl:call-template name="disclaimer" />
                            </div>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="content-full" id="main-content-column">

                            <!--<div id="sub-navigation">
                                <xsl:choose>
                                    <xsl:when test="$TS = 'true'">
                                        <xsl:if test="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                                            <xsl:apply-templates select="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="NAV" select="@pp" />
                                        <xsl:if test="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                                            <xsl:apply-templates select="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>-->

                            <div class="content-column">
                            <xsl:apply-templates mode="header" />
                            <xsl:apply-templates mode="page" />
                            <xsl:apply-templates mode="byline" />
                            <xsl:if test="toc">
                                <div class="toc">
                                    <h2>Contents</h2>
                                    <ul>
                                        <xsl:apply-templates mode="toc" />
                                    </ul>
                                </div>
                            </xsl:if>
                            <!--BBB--><xsl:apply-templates />
                                <xsl:apply-templates mode="byline-bottom" />
                                <xsl:apply-templates select="article/menu" />
                            <xsl:call-template name="disclaimer" />
                            </div>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
		 <!--*********************************************************
		        *************************************************************
		        REPLACE SITEIMPROVE SCRIPT BEFORE PUBLISHING TO LIVESITE
		        You can find the script in app-js/siteimprove.js **************
		        *************************************************************
		        **********************************************************-->
		        
		    <script type="text/javascript">
		    	/*<![CDATA[*/
		    	(function() {
		    	var sz = document.createElement('script'); sz.type = 'text/javascript'; sz.async = true;
		    	sz.src = '//siteimproveanalytics.com/js/siteanalyze_8343.js';
		    	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sz, s);
		    	})();
		    	/*]]>*/
		    </script>               
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!--PAGE 1-->
<xsl:template match="page-1">
    <xsl:param name="INCLUDE" />
    <xsl:param name="WIDE" />
    <xsl:param name="AREA" />
    <!--<xsl:apply-templates mode="crumb" />-->
    <div class="content-rightcol">
        <!--<div id="sub-navigation">
            <xsl:choose>
                <xsl:when test="$TS = 'true'">
                    <xsl:if test="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                        <xsl:apply-templates select="document('../xml/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="NAV" select="@pp" />
                    <xsl:if test="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]">
                        <xsl:apply-templates select="document('../TEAMSITE/leftnavs.xml')/leftnavs/leftnav[@type = $NAV]" />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </div>-->

        <div class="content-column" id="main-content-column">
            <xsl:apply-templates mode="header" />
            <xsl:apply-templates mode="page" />
            <xsl:apply-templates select="byline" mode="byline" />
            <xsl:if test="toc">
                <div class="toc">
                    <h2>Contents</h2>
                    <ul>
                        <xsl:apply-templates mode="toc" />
                    </ul>
                </div>
            </xsl:if>
            <xsl:apply-templates />
            <xsl:apply-templates mode="byline-bottom" />
            <xsl:apply-templates select="article/menu" />
            <xsl:call-template name="disclaimer" />
        </div>

        <div class="related-column">
            <!--<xsl:call-template name="search" />
            <xsl:call-template name="browse">
                <xsl:with-param name="PP" select="@pp" />
            </xsl:call-template>-->
            <xsl:if test="not(@share='no')">
                <xsl:call-template name="share" />
            </xsl:if>

           <xsl:apply-templates mode="subscribe" />

            <xsl:apply-templates mode="contents" />
            <xsl:apply-templates mode="boxes" />
            <xsl:apply-templates mode="related" />

            <!-- <xsl:variable name="AREA" select="/pg/@area" /> -->
            
            <xsl:choose>
                <xsl:when test="$TS = 'true'">
                    <xsl:if test="document('../xml/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]">
                        <xsl:apply-templates select="document('../xml/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]" />
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="document('../TEAMSITE/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]">
                        <xsl:apply-templates select="document('../TEAMSITE/contents-box.xml')/contents-boxes/contents-box[@type = $AREA]" />
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>

        </div>
    </div>
    <!--*********************************************************
        *************************************************************
        REPLACE SITEIMPROVE SCRIPT BEFORE PUBLISHING TO LIVESITE
        You can find the script in app-js/siteimprove.js **************
        *************************************************************
        **********************************************************-->
        
    <script type="text/javascript">
    	/*<![CDATA[*/
    	(function() {
    	var sz = document.createElement('script'); sz.type = 'text/javascript'; sz.async = true;
    	sz.src = '//siteimproveanalytics.com/js/siteanalyze_8343.js';
    	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sz, s);
    	})();
    	/*]]>*/
	</script>
</xsl:template>

    <!--PAGE 2-->

    <xsl:template match="/pg/page-2">

        <xsl:apply-templates />
    <!--*********************************************************
        *************************************************************
        REPLACE SITEIMPROVE SCRIPT BEFORE PUBLISHING TO LIVESITE
        You can find the script in app-js/siteimprove.js **************
        *************************************************************
        **********************************************************-->
        
    <script type="text/javascript">
    	/*<![CDATA[*/
    	(function() {
    	var sz = document.createElement('script'); sz.type = 'text/javascript'; sz.async = true;
    	sz.src = '//siteimproveanalytics.com/js/siteanalyze_8343.js';
    	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sz, s);
    	})();
    	/*]]>*/
	</script>

    </xsl:template>

    <xsl:include href="xsl/library/general.xsl" />

</xsl:stylesheet>
