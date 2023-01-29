<?xml version="1.0"?>
<!DOCTYPE fnord [<!ENTITY nbsp "&#160;">]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:func="http://exslt.org/functions" xmlns:str="http://exslt.org/strings" version="1.0" exclude-result-prefixes="xhtml" extension-element-prefixes="func str">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes" media-type="application/xhtml+xml"/>

  <xsl:strip-space elements="*"/>

  <xsl:template name="size">
    <!-- transform a size in bytes into a human readable representation -->
    <xsl:param name="bytes"/>

    <xsl:choose>
      <xsl:when test="string(number($bytes)) = 'NaN'">-</xsl:when>
      <xsl:when test="$bytes &lt; 1000"><xsl:value-of select="$bytes"/> B</xsl:when>
      <xsl:when test="$bytes &lt; 1048576"><xsl:value-of select="format-number($bytes div 1024, '0.0')"/> KB</xsl:when>
      <xsl:when test="$bytes &lt; 1073741824"><xsl:value-of select="format-number($bytes div 1048576, '0.0')"/> MB</xsl:when>
      <xsl:otherwise><xsl:value-of select="format-number(($bytes div 1073741824), '0.00')"/> GB</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="substring-after-last">
    <xsl:param name="input"/>
    <xsl:param name="substr"/>

    <xsl:choose>
      <xsl:when test="contains($input, $substr)">
        <xsl:call-template name="substring-after-last">
          <xsl:with-param name="input" select="substring-after($input, $substr)"/>
          <xsl:with-param name="substr" select="$substr"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$input"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="get-file-extension">
    <xsl:param name="path"/>

    <xsl:variable name="basename">
      <xsl:call-template name="substring-after-last">
        <xsl:with-param name="input" select="$path"/>
        <xsl:with-param name="substr" select="'/'"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$basename and contains($basename, '.')">
        <xsl:call-template name="substring-after-last">
          <xsl:with-param name="input" select="$basename"/>
          <xsl:with-param name="substr" select="'.'"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="''"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="get-icon-url">
    <xsl:param name="extension"/>
    <xsl:variable name="icon">
      <xsl:choose>
        <xsl:when test="$extension = '3fr'">3fr.png</xsl:when>
        <xsl:when test="$extension = '3g2'">3g2.png</xsl:when>
        <xsl:when test="$extension = '3gp'">3gp.png</xsl:when>
        <xsl:when test="$extension = '7z'">7z.png</xsl:when>
        <xsl:when test="$extension = 'aac'">aac.png</xsl:when>
        <xsl:when test="$extension = 'ac3'">ac3.png</xsl:when>
        <xsl:when test="$extension = 'acc'">acc.png</xsl:when>
        <xsl:when test="$extension = 'accdb'">accdb.png</xsl:when>
        <xsl:when test="$extension = 'accde'">accde.png</xsl:when>
        <xsl:when test="$extension = 'accdr'">accdr.png</xsl:when>
        <xsl:when test="$extension = 'accdt'">accdt.png</xsl:when>
        <xsl:when test="$extension = 'actproj'">actproj.png</xsl:when>
        <xsl:when test="$extension = 'ad'">ad.png</xsl:when>
        <xsl:when test="$extension = 'ade'">ade.png</xsl:when>
        <xsl:when test="$extension = 'adn'">adn.png</xsl:when>
        <xsl:when test="$extension = 'adp'">adp.png</xsl:when>
        <xsl:when test="$extension = 'ai'">ai.png</xsl:when>
        <xsl:when test="$extension = 'aif'">aif.png</xsl:when>
        <xsl:when test="$extension = 'aiff'">aiff.png</xsl:when>
        <xsl:when test="$extension = 'akp'">akp.png</xsl:when>
        <xsl:when test="$extension = 'amr'">amr.png</xsl:when>
        <xsl:when test="$extension = 'ape'">ape.png</xsl:when>
        <xsl:when test="$extension = 'applescript'">applescript.png</xsl:when>
        <xsl:when test="$extension = 'arw'">arw.png</xsl:when>
        <xsl:when test="$extension = 'as'">as.png</xsl:when>
        <xsl:when test="$extension = 'asax'">asax.png</xsl:when>
        <xsl:when test="$extension = 'asc'">asc.png</xsl:when>
        <xsl:when test="$extension = 'ascx'">ascx.png</xsl:when>
        <xsl:when test="$extension = 'asf'">asf.png</xsl:when>
        <xsl:when test="$extension = 'asm'">asm.png</xsl:when>
        <xsl:when test="$extension = 'asmx'">asmx.png</xsl:when>
        <xsl:when test="$extension = 'asp'">asp.png</xsl:when>
        <xsl:when test="$extension = 'aspx'">aspx.png</xsl:when>
        <xsl:when test="$extension = 'asr'">asr.png</xsl:when>
        <xsl:when test="$extension = 'audio'">audio.png</xsl:when>
        <xsl:when test="$extension = 'avi'">avi.png</xsl:when>
        <xsl:when test="$extension = 'bin'">bin.png</xsl:when>
        <xsl:when test="$extension = 'bkpi'">bkpi.png</xsl:when>
        <xsl:when test="$extension = 'bmp'">bmp.png</xsl:when>
        <xsl:when test="$extension = 'bz2'">bz2.png</xsl:when>
        <xsl:when test="$extension = 'c'">c.png</xsl:when>
        <xsl:when test="$extension = 'cc'">cc.png</xsl:when>
        <xsl:when test="$extension = 'cda'">cda.png</xsl:when>
        <xsl:when test="$extension = 'code'">code.png</xsl:when>
        <xsl:when test="$extension = 'cpp'">cpp.png</xsl:when>
        <xsl:when test="$extension = 'cr2'">cr2.png</xsl:when>
        <xsl:when test="$extension = 'crw'">crw.png</xsl:when>
        <xsl:when test="$extension = 'cs'">cs.png</xsl:when>
        <xsl:when test="$extension = 'css'">css.png</xsl:when>
        <xsl:when test="$extension = 'cxx'">cxx.png</xsl:when>
        <xsl:when test="$extension = 'daa'">daa.png</xsl:when>
        <xsl:when test="$extension = 'dat'">dat.png</xsl:when>
        <xsl:when test="$extension = 'dcr'">dcr.png</xsl:when>
        <xsl:when test="$extension = 'divx'">divx.png</xsl:when>
        <xsl:when test="$extension = 'dng'">dng.png</xsl:when>
        <xsl:when test="$extension = 'doc'">doc.png</xsl:when>
        <xsl:when test="$extension = 'docx'">docx.png</xsl:when>
        <xsl:when test="$extension = 'dts'">dts.png</xsl:when>
        <xsl:when test="$extension = 'dvr-ms'">dvr-ms.png</xsl:when>
        <xsl:when test="$extension = 'erfpng'">erfpng.png</xsl:when>
        <xsl:when test="$extension = 'exe'">exe.png</xsl:when>
        <xsl:when test="$extension = 'f4v'">f4v.png</xsl:when>
        <xsl:when test="$extension = 'fla'">fla.png</xsl:when>
        <xsl:when test="$extension = 'flac'">flac.png</xsl:when>
        <xsl:when test="$extension = 'flv'">flv.png</xsl:when>
        <xsl:when test="$extension = 'gif'">gif.png</xsl:when>
        <xsl:when test="$extension = 'gz'">gz.png</xsl:when>
        <xsl:when test="$extension = 'heic'">heic.png</xsl:when>
        <xsl:when test="$extension = 'heif'">heif.png</xsl:when>
        <xsl:when test="$extension = 'htm'">htm.png</xsl:when>
        <xsl:when test="$extension = 'html'">html.png</xsl:when>
        <xsl:when test="$extension = 'ico'">ico.png</xsl:when>
        <xsl:when test="$extension = 'ifo'">ifo.png</xsl:when>
        <xsl:when test="$extension = 'image'">image.png</xsl:when>
        <xsl:when test="$extension = 'img'">img.png</xsl:when>
        <xsl:when test="$extension = 'indd'">indd.png</xsl:when>
        <xsl:when test="$extension = 'iso'">iso.png</xsl:when>
        <xsl:when test="$extension = 'isomountpoint'">isomountpoint.png</xsl:when>
        <xsl:when test="$extension = 'jpe'">jpe.png</xsl:when>
        <xsl:when test="$extension = 'jpeg'">jpeg.png</xsl:when>
        <xsl:when test="$extension = 'jpg'">jpg.png</xsl:when>
        <xsl:when test="$extension = 'js'">js.png</xsl:when>
        <xsl:when test="$extension = 'jsx'">jsx.png</xsl:when>
        <xsl:when test="$extension = 'k25'">k25.png</xsl:when>
        <xsl:when test="$extension = 'kdc'">kdc.png</xsl:when>
        <xsl:when test="$extension = 'key'">key.png</xsl:when>
        <xsl:when test="$extension = 'm1v'">m1v.png</xsl:when>
        <xsl:when test="$extension = 'm2t'">m2t.png</xsl:when>
        <xsl:when test="$extension = 'm2ts'">m2ts.png</xsl:when>
        <xsl:when test="$extension = 'm2v'">m2v.png</xsl:when>
        <xsl:when test="$extension = 'm3u'">m3u.png</xsl:when>
        <xsl:when test="$extension = 'm4a'">m4a.png</xsl:when>
        <xsl:when test="$extension = 'm4b'">m4b.png</xsl:when>
        <xsl:when test="$extension = 'm4v'">m4v.png</xsl:when>
        <xsl:when test="$extension = 'maf'">maf.png</xsl:when>
        <xsl:when test="$extension = 'mam'">mam.png</xsl:when>
        <xsl:when test="$extension = 'maq'">maq.png</xsl:when>
        <xsl:when test="$extension = 'mar'">mar.png</xsl:when>
        <xsl:when test="$extension = 'mat'">mat.png</xsl:when>
        <xsl:when test="$extension = 'mda'">mda.png</xsl:when>
        <xsl:when test="$extension = 'mdb'">mdb.png</xsl:when>
        <xsl:when test="$extension = 'mde'">mde.png</xsl:when>
        <xsl:when test="$extension = 'mdf'">mdf.png</xsl:when>
        <xsl:when test="$extension = 'mdn'">mdn.png</xsl:when>
        <xsl:when test="$extension = 'mds'">mds.png</xsl:when>
        <xsl:when test="$extension = 'mdt'">mdt.png</xsl:when>
        <xsl:when test="$extension = 'mdw'">mdw.png</xsl:when>
        <xsl:when test="$extension = 'mef'">mef.png</xsl:when>
        <xsl:when test="$extension = 'mhtml'">mhtml.png</xsl:when>
        <xsl:when test="$extension = 'mid'">mid.png</xsl:when>
        <xsl:when test="$extension = 'misc'">misc.png</xsl:when>
        <xsl:when test="$extension = 'mka'">mka.png</xsl:when>
        <xsl:when test="$extension = 'mkv'">mkv.png</xsl:when>
        <xsl:when test="$extension = 'mos'">mos.png</xsl:when>
        <xsl:when test="$extension = 'mov'">mov.png</xsl:when>
        <xsl:when test="$extension = 'mp2'">mp2.png</xsl:when>
        <xsl:when test="$extension = 'mp3'">mp3.png</xsl:when>
        <xsl:when test="$extension = 'mp4'">mp4.png</xsl:when>
        <xsl:when test="$extension = 'mpc'">mpc.png</xsl:when>
        <xsl:when test="$extension = 'mpe'">mpe.png</xsl:when>
        <xsl:when test="$extension = 'mpeg'">mpeg.png</xsl:when>
        <xsl:when test="$extension = 'mpeg1'">mpeg1.png</xsl:when>
        <xsl:when test="$extension = 'mpeg2'">mpeg2.png</xsl:when>
        <xsl:when test="$extension = 'mpeg4'">mpeg4.png</xsl:when>
        <xsl:when test="$extension = 'mpg'">mpg.png</xsl:when>
        <xsl:when test="$extension = 'mrw'">mrw.png</xsl:when>
        <xsl:when test="$extension = 'mts'">mts.png</xsl:when>
        <xsl:when test="$extension = 'nef'">nef.png</xsl:when>
        <xsl:when test="$extension = 'nrg'">nrg.png</xsl:when>
        <xsl:when test="$extension = 'numbers'">numbers.png</xsl:when>
        <xsl:when test="$extension = 'odoc'">odoc.png</xsl:when>
        <xsl:when test="$extension = 'ogg'">ogg.png</xsl:when>
        <xsl:when test="$extension = 'ogv'">ogv.png</xsl:when>
        <xsl:when test="$extension = 'orf'">orf.png</xsl:when>
        <xsl:when test="$extension = 'osheet'">osheet.png</xsl:when>
        <xsl:when test="$extension = 'oslides'">oslides.png</xsl:when>
        <xsl:when test="$extension = 'otf'">otf.png</xsl:when>
        <xsl:when test="$extension = 'pages'">pages.png</xsl:when>
        <xsl:when test="$extension = 'pcm'">pcm.png</xsl:when>
        <xsl:when test="$extension = 'pdf'">pdf.png</xsl:when>
        <xsl:when test="$extension = 'pef'">pef.png</xsl:when>
        <xsl:when test="$extension = 'php'">php.png</xsl:when>
        <xsl:when test="$extension = 'png'">png.png</xsl:when>
        <xsl:when test="$extension = 'pps'">pps.png</xsl:when>
        <xsl:when test="$extension = 'ppsx'">ppsx.png</xsl:when>
        <xsl:when test="$extension = 'ppt'">ppt.png</xsl:when>
        <xsl:when test="$extension = 'pptx'">pptx.png</xsl:when>
        <xsl:when test="$extension = 'psd'">psd.png</xsl:when>
        <xsl:when test="$extension = 'ptx'">ptx.png</xsl:when>
        <xsl:when test="$extension = 'qt'">qt.png</xsl:when>
        <xsl:when test="$extension = 'ra'">ra.png</xsl:when>
        <xsl:when test="$extension = 'raf'">raf.png</xsl:when>
        <xsl:when test="$extension = 'rar'">rar.png</xsl:when>
        <xsl:when test="$extension = 'raw'">raw.png</xsl:when>
        <xsl:when test="$extension = 'recycle_bin'">recycle_bin.png</xsl:when>
        <xsl:when test="$extension = 'remotefailmountpoint'">remotefailmountpoint.png</xsl:when>
        <xsl:when test="$extension = 'remotemountpoint'">remotemountpoint.png</xsl:when>
        <xsl:when test="$extension = 'rm'">rm.png</xsl:when>
        <xsl:when test="$extension = 'rmvb'">rmvb.png</xsl:when>
        <xsl:when test="$extension = 'rtf'">rtf.png</xsl:when>
        <xsl:when test="$extension = 'rw2'">rw2.png</xsl:when>
        <xsl:when test="$extension = 'snapshot'">snapshot.png</xsl:when>
        <xsl:when test="$extension = 'sr2'">sr2.png</xsl:when>
        <xsl:when test="$extension = 'srf'">srf.png</xsl:when>
        <xsl:when test="$extension = 'status_done'">status_done.png</xsl:when>
        <xsl:when test="$extension = 'status_error'">status_error.png</xsl:when>
        <xsl:when test="$extension = 'status_no'">status_no.png</xsl:when>
        <xsl:when test="$extension = 'status_process'">status_process.png</xsl:when>
        <xsl:when test="$extension = 'swf'">swf.png</xsl:when>
        <xsl:when test="$extension = 'tar'">tar.png</xsl:when>
        <xsl:when test="$extension = 'tbz'">tbz.png</xsl:when>
        <xsl:when test="$extension = 'tgz'">tgz.png</xsl:when>
        <xsl:when test="$extension = 'tif'">tif.png</xsl:when>
        <xsl:when test="$extension = 'tiff'">tiff.png</xsl:when>
        <xsl:when test="$extension = 'tp'">tp.png</xsl:when>
        <xsl:when test="$extension = 'trp'">trp.png</xsl:when>
        <xsl:when test="$extension = 'ts'">ts.png</xsl:when>
        <xsl:when test="$extension = 'ttc'">ttc.png</xsl:when>
        <xsl:when test="$extension = 'ttf'">ttf.png</xsl:when>
        <xsl:when test="$extension = 'txt'">txt.png</xsl:when>
        <xsl:when test="$extension = 'ufo'">ufo.png</xsl:when>
        <xsl:when test="$extension = 'video'">video.png</xsl:when>
        <xsl:when test="$extension = 'vob'">vob.png</xsl:when>
        <xsl:when test="$extension = 'wav'">wav.png</xsl:when>
        <xsl:when test="$extension = 'webm'">webm.png</xsl:when>
        <xsl:when test="$extension = 'wma'">wma.png</xsl:when>
        <xsl:when test="$extension = 'wmv'">wmv.png</xsl:when>
        <xsl:when test="$extension = 'wpl'">wpl.png</xsl:when>
        <xsl:when test="$extension = 'wri'">wri.png</xsl:when>
        <xsl:when test="$extension = 'x3f'">x3f.png</xsl:when>
        <xsl:when test="$extension = 'xhtml'">xhtml.png</xsl:when>
        <xsl:when test="$extension = 'xla'">xla.png</xsl:when>
        <xsl:when test="$extension = 'xlam'">xlam.png</xsl:when>
        <xsl:when test="$extension = 'xlb'">xlb.png</xsl:when>
        <xsl:when test="$extension = 'xlc'">xlc.png</xsl:when>
        <xsl:when test="$extension = 'xld'">xld.png</xsl:when>
        <xsl:when test="$extension = 'xlk'">xlk.png</xsl:when>
        <xsl:when test="$extension = 'xll'">xll.png</xsl:when>
        <xsl:when test="$extension = 'xlm'">xlm.png</xsl:when>
        <xsl:when test="$extension = 'xls'">xls.png</xsl:when>
        <xsl:when test="$extension = 'xlsb'">xlsb.png</xsl:when>
        <xsl:when test="$extension = 'xlsm'">xlsm.png</xsl:when>
        <xsl:when test="$extension = 'xlsx'">xlsx.png</xsl:when>
        <xsl:when test="$extension = 'xlt'">xlt.png</xsl:when>
        <xsl:when test="$extension = 'xltm'">xltm.png</xsl:when>
        <xsl:when test="$extension = 'xlv'">xlv.png</xsl:when>
        <xsl:when test="$extension = 'xlw'">xlw.png</xsl:when>
        <xsl:when test="$extension = 'xml'">xml.png</xsl:when>
        <xsl:when test="$extension = 'xvid'">xvid.png</xsl:when>
        <xsl:when test="$extension = 'zip'">zip.png</xsl:when>
        <xsl:otherwise>misc.png</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="concat('/.assets/', $icon)"/>
  </xsl:template>

  <xsl:template name="get-file-type">
    <xsl:param name="extension"/>
    <xsl:choose>
      <xsl:when test="$extension != ''">
        <xsl:value-of select="concat(translate($extension, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), ' File')"/>
      </xsl:when>
     <xsl:otherwise>
        <xsl:value-of select="'File'"/>
     </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="directory">
    <xsl:variable name="name"><xsl:value-of select="."/></xsl:variable>
    <xsl:if test="$name != '@eaDir'">
      <tr data-pos="0">
        <td>
          <div style="background:url('/.assets/folder.png') no-repeat; background-size: 16px 16px;">
            <a href="{str:encode-uri(current(), true())}/">&nbsp;<xsl:value-of select="."/></a>
          </div>
        </td>
        <td>
          <xsl:attribute name="data-value">
            <xsl:value-of select="@mtime"/>
          </xsl:attribute>
        </td>
        <td>-</td>
        <td>Folder</td>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="file">
    <xsl:variable name="extension">
      <xsl:call-template name="get-file-extension">
        <xsl:with-param name="path" select="."/>
      </xsl:call-template>
    </xsl:variable>

    <tr data-pos="1">
      <td>
        <div>
          <xsl:attribute name="style">
            background:url('<xsl:call-template name="get-icon-url"><xsl:with-param name="extension" select="$extension"/></xsl:call-template>') no-repeat; background-size: 16px 16px;
          </xsl:attribute>

          <!-- &nbsp is used only because it also exists in Synology Files Station -->
          <a href="{str:encode-uri(current(),true())}">&nbsp;<xsl:value-of select="."/></a>
        </div>
      </td>
      <td>
        <xsl:attribute name="data-value">
          <xsl:value-of select="@mtime"/>
        </xsl:attribute>
      </td>
      <td>
        <xsl:attribute name="data-value">
          <xsl:value-of select="@size"/>
        </xsl:attribute>
        <xsl:call-template name="size"><xsl:with-param name="bytes" select="@size"/></xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="get-file-type"><xsl:with-param name="extension" select="$extension"/></xsl:call-template>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta charset="UTF-8"/>
        <title>Index of <xsl:value-of select="$path"/></title>
        <style type="text/css">
          /*! normalize.css v8.0.1 | MIT License | github.com/necolas/normalize.css */

          /* Document
            ========================================================================== */

          /**
          * 1. Correct the line height in all browsers.
          * 2. Prevent adjustments of font size after orientation changes in iOS.
          */

          html {
            line-height: 1.15; /* 1 */
            -webkit-text-size-adjust: 100%; /* 2 */
          }

          /* Sections
            ========================================================================== */

          /**
          * Remove the margin in all browsers.
          */

          body {
            margin: 0;
          }

          /**
          * Render the `main` element consistently in IE.
          */

          main {
            display: block;
          }

          /**
          * Correct the font size and margin on `h1` elements within `section` and
          * `article` contexts in Chrome, Firefox, and Safari.
          */

          h1 {
            font-size: 2em;
            margin: 0.67em 0;
          }

          /* Grouping content
            ========================================================================== */

          /**
          * 1. Add the correct box sizing in Firefox.
          * 2. Show the overflow in Edge and IE.
          */

          hr {
            box-sizing: content-box; /* 1 */
            height: 0; /* 1 */
            overflow: visible; /* 2 */
          }

          /**
          * 1. Correct the inheritance and scaling of font size in all browsers.
          * 2. Correct the odd `em` font sizing in all browsers.
          */

          pre {
            font-family: monospace, monospace; /* 1 */
            font-size: 1em; /* 2 */
          }

          /* Text-level semantics
            ========================================================================== */

          /**
          * Remove the gray background on active links in IE 10.
          */

          a {
            background-color: transparent;
          }

          /**
          * 1. Remove the bottom border in Chrome 57-
          * 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.
          */

          abbr[title] {
            border-bottom: none; /* 1 */
            text-decoration: underline; /* 2 */
            text-decoration: underline dotted; /* 2 */
          }

          /**
          * Add the correct font weight in Chrome, Edge, and Safari.
          */

          b,
          strong {
            font-weight: bolder;
          }

          /**
          * 1. Correct the inheritance and scaling of font size in all browsers.
          * 2. Correct the odd `em` font sizing in all browsers.
          */

          code,
          kbd,
          samp {
            font-family: monospace, monospace; /* 1 */
            font-size: 1em; /* 2 */
          }

          /**
          * Add the correct font size in all browsers.
          */

          small {
            font-size: 80%;
          }

          /**
          * Prevent `sub` and `sup` elements from affecting the line height in
          * all browsers.
          */

          sub,
          sup {
            font-size: 75%;
            line-height: 0;
            position: relative;
            vertical-align: baseline;
          }

          sub {
            bottom: -0.25em;
          }

          sup {
            top: -0.5em;
          }

          /* Embedded content
            ========================================================================== */

          /**
          * Remove the border on images inside links in IE 10.
          */

          img {
            border-style: none;
          }

          /* Forms
            ========================================================================== */

          /**
          * 1. Change the font styles in all browsers.
          * 2. Remove the margin in Firefox and Safari.
          */

          button,
          input,
          optgroup,
          select,
          textarea {
            font-family: inherit; /* 1 */
            font-size: 100%; /* 1 */
            line-height: 1.15; /* 1 */
            margin: 0; /* 2 */
          }

          /**
          * Show the overflow in IE.
          * 1. Show the overflow in Edge.
          */

          button,
          input { /* 1 */
            overflow: visible;
          }

          /**
          * Remove the inheritance of text transform in Edge, Firefox, and IE.
          * 1. Remove the inheritance of text transform in Firefox.
          */

          button,
          select { /* 1 */
            text-transform: none;
          }

          /**
          * Correct the inability to style clickable types in iOS and Safari.
          */

          button,
          [type="button"],
          [type="reset"],
          [type="submit"] {
            -webkit-appearance: button;
          }

          /**
          * Remove the inner border and padding in Firefox.
          */

          button::-moz-focus-inner,
          [type="button"]::-moz-focus-inner,
          [type="reset"]::-moz-focus-inner,
          [type="submit"]::-moz-focus-inner {
            border-style: none;
            padding: 0;
          }

          /**
          * Restore the focus styles unset by the previous rule.
          */

          button:-moz-focusring,
          [type="button"]:-moz-focusring,
          [type="reset"]:-moz-focusring,
          [type="submit"]:-moz-focusring {
            outline: 1px dotted ButtonText;
          }

          /**
          * Correct the padding in Firefox.
          */

          fieldset {
            padding: 0.35em 0.75em 0.625em;
          }

          /**
          * 1. Correct the text wrapping in Edge and IE.
          * 2. Correct the color inheritance from `fieldset` elements in IE.
          * 3. Remove the padding so developers are not caught out when they zero out
          *    `fieldset` elements in all browsers.
          */

          legend {
            box-sizing: border-box; /* 1 */
            color: inherit; /* 2 */
            display: table; /* 1 */
            max-width: 100%; /* 1 */
            padding: 0; /* 3 */
            white-space: normal; /* 1 */
          }

          /**
          * Add the correct vertical alignment in Chrome, Firefox, and Opera.
          */

          progress {
            vertical-align: baseline;
          }

          /**
          * Remove the default vertical scrollbar in IE 10+.
          */

          textarea {
            overflow: auto;
          }

          /**
          * 1. Add the correct box sizing in IE 10.
          * 2. Remove the padding in IE 10.
          */

          [type="checkbox"],
          [type="radio"] {
            box-sizing: border-box; /* 1 */
            padding: 0; /* 2 */
          }

          /**
          * Correct the cursor style of increment and decrement buttons in Chrome.
          */

          [type="number"]::-webkit-inner-spin-button,
          [type="number"]::-webkit-outer-spin-button {
            height: auto;
          }

          /**
          * 1. Correct the odd appearance in Chrome and Safari.
          * 2. Correct the outline style in Safari.
          */

          [type="search"] {
            -webkit-appearance: textfield; /* 1 */
            outline-offset: -2px; /* 2 */
          }

          /**
          * Remove the inner padding in Chrome and Safari on macOS.
          */

          [type="search"]::-webkit-search-decoration {
            -webkit-appearance: none;
          }

          /**
          * 1. Correct the inability to style clickable types in iOS and Safari.
          * 2. Change font properties to `inherit` in Safari.
          */

          ::-webkit-file-upload-button {
            -webkit-appearance: button; /* 1 */
            font: inherit; /* 2 */
          }

          /* Interactive
            ========================================================================== */

          /*
          * Add the correct display in Edge, IE 10+, and Firefox.
          */

          details {
            display: block;
          }

          /*
          * Add the correct display in all browsers.
          */

          summary {
            display: list-item;
          }

          /* Misc
            ========================================================================== */

          /**
          * Add the correct display in IE 10+.
          */

          template {
            display: none;
          }

          /**
          * Add the correct display in IE 10.
          */

          [hidden] {
            display: none;
          }

          * {
            font-family: Verdana,Arial,sans-serif;
            font-size: 13px;
          }

          body {
            display: flex;
            flex-direction: column;
            overflow-x: scroll;
          }

          .container {
            display: table;
          }

          table {
            border-spacing: 0;
            color: #414B67;
          }

          th,
          td {
            line-height: 28px;
            padding: 0 8px;
            white-space: nowrap;
          }

          thead th {
            border-top: 1px solid rgba(198, 212, 224, 0.4);
            border-bottom: 1px solid rgba(198, 212, 224, 0.4);
            color: rgba(65, 75, 85, 0.6);
            font-weight: 400;
            text-align: left;

            background: white;
            position: sticky;
            top: 0;
          }

          tbody td {
            border-bottom: 1px solid rgba(198, 212, 224, 0.4);
          }

          tbody tr:hover {
            background-color: rgba(5, 127, 235, 0.04);
          }

          thead th:hover {
            color: #057FEB;
            cursor: pointer;
          }

          a {
            color: #057FEB;
            text-decoration: none;
          }

          .border-right {
            border-right: 1px solid rgba(198, 212, 224, 0.4);
          }

          td div {
            height: 16px;
            line-height: 16px;
            margin: 6px 0;
            padding-left: 21px;
          }
        </style>
      </head>
      <body>
        <table style="display:none">
          <thead>
            <tr>
              <th class="border-right">Name</th>
              <th class="border-right">Modified Date</th>
              <th class="border-right">Size</th>
              <th>File Type</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates/>
          </tbody>
        </table>
        <script>
        <![CDATA[
          const collatorN = new Intl.Collator(undefined, {
            numeric: true,
            sensitivity: 'base',
          });

          function getCellValue(tr, idx) {
            return (tr.children[idx].dataset.value !== undefined)
              ? tr.children[idx]?.dataset?.value
              : (tr.children[idx].innerText || tr.children[idx].textContent);
          }

          function comparer(conf) {
            return (a, b) => {
              // if we compare file and directory
              if (a.dataset.pos !== b.dataset.pos) {
                return conf.asc ? a.dataset.pos - b.dataset.pos : b.dataset.pos - a.dataset.pos;
              }

              if (conf.idx === 0) {
                return conf.asc
                  ? collatorN.compare(getCellValue(a, conf.idx), getCellValue(b, conf.idx))
                  : collatorN.compare(getCellValue(b, conf.idx), getCellValue(a, conf.idx));
              }

              // if we sort by the column other than name we use name value as a second sort parameter
              return conf.asc
                ? (collatorN.compare(getCellValue(a, conf.idx), getCellValue(b, conf.idx)) || collatorN.compare(getCellValue(a, 0), getCellValue(b, 0)))
                : (collatorN.compare(getCellValue(b, conf.idx), getCellValue(a, conf.idx)) || collatorN.compare(getCellValue(b, 0), getCellValue(a, 0)));
            };
          }

          document.addEventListener('DOMContentLoaded', () => {
            const tbody = document.querySelector('tbody');

            const conf = JSON.parse(window.localStorage.getItem('sort')) || {
              idx: 0, // sort column index
              asc: true, // ascending order by default
            };

            Array.from(tbody.querySelectorAll('tr')).sort(comparer(conf)).forEach((tr) => tbody.appendChild(tr));

            const pad = (n) => n.toString().padStart(2, '0');

            document.querySelectorAll('td:nth-child(2)[data-value]').forEach((td) => {
              const date = new Date(td.dataset.value);

              td.innerText = `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ${pad(date.getHours())}:${pad(date.getMinutes())}`;
            })

            const table = document.querySelector('table');

            table.style.display = 'table';

            document.querySelectorAll('th').forEach((th, idx) => th.addEventListener('click', () => {
              if (conf.idx !== idx) {
                conf.idx = idx;
              } else {
                conf.asc = !conf.asc;
              }

              window.localStorage.setItem('sort', JSON.stringify(conf));

              Array.from(tbody.querySelectorAll('tr')).sort(comparer(conf)).forEach((tr) => tbody.appendChild(tr));
            }));
          });

        ]]>
        </script>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
