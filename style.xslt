<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

<xsl:template match="/">
<html>
<head>
<style type="text/css">
	body{
		-webkit-box-sizing: border-box;
		box-sizing: border-box;

	}
	table{	
		border-collapse:collapse;
		border-left: thick solid #C6E4F7;
		width:100% !important;
		padding: 5px;
	}
	table.attribute_table{
		border-left: thin solid #C6E4F7;
	}
	tr{
		border-top:thin solid #EDF4F7;
		border-right:thin solid #EDF4F7;
		
	}
	tr.attribute{
		font-style:italic;
	}
	td{
		vertical-align:top;
		text-align:left;
	}
	td.node{
		width: 100px;
		font-size:12px;	
		color: #325F7A;
	}	
</style>
</head>
<body>
<table>    	
      <xsl:apply-templates />
</table>
</body>
</html>

  </xsl:template>

  <xsl:template match="node()[name()]">
	<tr>
	    <td class="node">
	      <xsl:value-of select="name()" />
	    </td>
	    <td class="value">
	      <table>
		<xsl:apply-templates select="@* | node()"/>
	      </table>
	    </td>
	</tr>
  </xsl:template>
  <xsl:template match="*[not(*)]">
	<tr>
	    <td class="node">
	      <xsl:value-of select="name()" />
	    </td>
	    <td class="leaf_value">
	      <xsl:value-of select="." />
	    </td>
	</tr>
	<tr>
		<td></td>
		<td>
			<table class="attribute_table">
				<xsl:apply-templates select="@*"/>
			</table>
		</td>
	</tr>
  </xsl:template>

  <xsl:template match="@*">
    	<tr class="attribute">
	    <td class="node">
	      <xsl:value-of select="name()" />
	    </td>
	    <td class="leaf_value">
	      <xsl:value-of select="." />
	    </td>
	</tr>
  </xsl:template>
</xsl:stylesheet>
