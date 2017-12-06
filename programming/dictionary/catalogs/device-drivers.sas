proc sql;
  select 
      objname  format $8.,
  /*  objtype,  Always 'DEV' ? */
      substr(objdesc, 1, 60)  format $60.
  from
      dictionary.catalogs
  where
      libname = 'SASHELP' and
      memtype = 'CATALOG' and
      memname = 'DEVICES'
  order by
      objname;
quit;
/*
  ACTIVEX    ActiveX enabled GIF Driver
  ACTXIMG    ActiveX enabled Image Driver
  BMP        BMP File Fmt--256 colors
  CGM        CGM generator--binary output
  CGMC       CGM generator w/colors--binary output
  CGMOF93L   CGM for MS landscape w/o hardware lines
  CGMOF93P   CGM for MS portrait w/o hardware lines
  CGMOF97L   CGM for Office 97 landscape mode
  CGMOF97P   CGM for Microsoft Office 97 portrait
  CGMOFML    CGM for MS Office w/ Metric Scaling land
  CGMOFMP    CGM for MS Office w/ Metric Scaling port
  CLJ        HP Color LaserJet Printer--Letter Size
  CLJPS      HP Color LaserJet--PostScript--Letter
  CLJPSA4    HP Color LaserJet--PostScript--A4 size
  DJT2C      DesignJet 2000 Series 24" color HPGL/2
  DJT2CW     DesignJet 2000 Series 36" color HPGL/2
  DJT4       DesignJet 400 Series 24" b/w HPGL/2
  DJT4C      DesignJet 400 Series 24" color HPGL/2
  DJT65024   HP DesignJet 650C - 24 in Roll - Color
  DJT65036   HP DesignJet 650C - 36 in Roll - Color
  DJT650CD   HP DesignJet 650C - D size - Color Exp
  DJT650CE   HP DesignJet 650C - E size - Color Exp
  DJT650D    HP DesignJet 650C - D size - 600 dpi Exp
  DJT650E    HP DesignJet 650C - E size - 600 dpi Exp
  DJTPS24D   DesignJet650C-24 in roll-ArchD
  DJTPS36D   DesignJet650C-36 in roll ArchD
  DJTPS36E   DesignJet650C-36 in roll-ArchE
  EMF        Enhanced Metafile Format Plus Extensions
  EMFDUAL    EMF and EMF Plus format support
  GIF        GIF Universal Printer
  GIFANIM    GIF89A - Animation
  HPGL       Hewlett-Packard Graphics Language
  HPGL2      HP LaserJet III -- HPGL/2
  HTML       HTML/GIF File Formats
  JAVA       Java enabled GIF Driver
  JAVAIMG    Java enabled Image Driver
  JAVAMETA   Java Metagraphics Driver
  JPEG       JPEG/JFIF Format--256 Colors
  JPEG300    JPEG/JFIF Format--256 Colors
  LJ3SIPS    HP LaserJet IIISi--Postscript
  LJ3SIPSL   HP LaserJet IIISi--Postscript thin lines
  LJ3SIPSM   HP IIISi--PostScript--A4 size paper
  LJ4SIPS    HP LaserJet IV -- 600 dpi -- PostScript
  LJ5PS      LaserJet 5P -- 600 dpi -- PostScript
  LJ5SIPS    HP LaserJet 5Si--PostScript--Letter Size
  LJIVPS     HP LaserJet IV -- 600 dpi -- PostScript
  PCL5       PCL5 Universal Printer
  PCL5C      PCL5c Universal Printer
  PCL5E      PCL5e Universal Printer
  PDF        PDF Version 1.3 -- color
  PDFA       Archive PDF - ISO-19005-1/b
  PDFC       PDF Version 1.3 -- color
  PHASER     Tektronix Color Postscript Printer
  PNG        PNG Universal Printer
  PNG300     PNG Universal Printer
  PNGT       PNG Universal Printer with Transparency
  PSCOLOR    PostScript Level 1 (Color)
  PSEPSF     PostScript devices--encapsulated files
  PSL        PostScript Level 1 (Gray Scale)
  PSLCMYK    PostScript CMYK (Color)
  PSLEPSF    PostScript EPS (Gray Scale)
  PSLEPSFC   PostScript EPS (Color)
  SASEMF     Enhanced Metafile Format
  SASMETA    SAS Metagraphics File Format
  SASPRTC    SAS Color Printer
  SASPRTG    SAS Gray Scale Printer
  SASPRTK    SAS CMYK Printer
  SASPRTM    SAS Monochrome Printer
  SVG        SVG Universal Printer
  SVGANIM    SVG Universal Printer - Animation
  SVGT       SVG Transparency Universal Printer
  SVGVIEW    SVG Printer w/ Control Buttons
  SVGZ       SVG Compressed Universal Printer
  TIFF       TIFF RGBA Universal Printer
  TIFFA      TIFF RGBA Universal Printer
  TIFFB      Tag Image File Fmt--B/W--Compressed
  TIFFB300   Tag Image File Fmt--B/W--Compressed
  TIFFK      TIFF CMYK Universal Printer
  TIFFP      Tag Image File Fmt--256 clr--Compressed
  TIFFP300   Tag Image File Fmt--256 clr--Compressed
  WEBFRAME   Frameset HTML Generator
  XBW        Driver for Monochrome X Window
  XCOLOR     Driver for Color X Window
  XGRAY      Driver for Gray Scale X Window
  ZGIF       GIF -- host font rendering
*/
