%macro tq84_locale (locale);
  options locale=%sysfunc(tranwrd(&locale,-,_));
  %put &locale: %sysfunc(datetime(), nldatm.);
%mend  tq84_locale;


data _null_;

  length locale $10;
  input  locale;
  locale = tranwrd(locale, '-', '_');
  call execute(cat('%tq84_locale(', locale, ')'));


%macro tq84_locales;
   %tq84_locale(ar-AE)
   %tq84_locale(ar-BH)
   %tq84_locale(ar-DZ)
   %tq84_locale(ar-EG)
   %tq84_locale(ar-IQ)
   %tq84_locale(ar-JO)
   %tq84_locale(ar-KW)
   %tq84_locale(ar-LB)
   %tq84_locale(ar-LY)
   %tq84_locale(ar-MA)
/* %tq84_locale(arn-CL)         */
   %tq84_locale(ar-OM)
   %tq84_locale(ar-QA)
   %tq84_locale(ar-SA)
   %tq84_locale(ar-SY)
   %tq84_locale(ar-TN)
   %tq84_locale(ar-YE)
/* %tq84_locale(as-IN)          */
/* %tq84_locale(az-Cyrl-AZ)     */
/* %tq84_locale(az-Latn-AZ)     */
/* %tq84_locale(ba-RU)          */
   %tq84_locale(be-BY)
   %tq84_locale(bg-BG)
/* %tq84_locale(bn-BD)          */
   %tq84_locale(bn-IN)
/* %tq84_locale(bo-CN)          */
/* %tq84_locale(br-FR)          */
/* %tq84_locale(bs-Cyrl-BA)     */
/* %tq84_locale(bs-Latn-BA)     */
   %tq84_locale(ca-ES)
/* %tq84_locale(co-FR)          */
   %tq84_locale(cs-CZ)
/* %tq84_locale(cy-GB)          */
   %tq84_locale(da-DK)
   %tq84_locale(de-AT)
   %tq84_locale(de-CH)
   %tq84_locale(de-DE)
   %tq84_locale(de-LI)
   %tq84_locale(de-LU)
/* %tq84_locale(dsb-DE)         */
/* %tq84_locale(dv-MV)          */
   %tq84_locale(el-GR)
/* %tq84_locale(en-029)         */
   %tq84_locale(en-AU)
/* %tq84_locale(en-BZ)          */
   %tq84_locale(en-CA)
   %tq84_locale(en-GB)
   %tq84_locale(en-IE)
   %tq84_locale(en-IN)
   %tq84_locale(en-JM)
/* %tq84_locale(en-MY)          */
   %tq84_locale(en-NZ)
   %tq84_locale(en-PH)
   %tq84_locale(en-SG)
/* %tq84_locale(en-TT)          */
   %tq84_locale(en-US)
   %tq84_locale(en-ZA)
   %tq84_locale(en-ZW)
   %tq84_locale(es-AR)
   %tq84_locale(es-BO)
   %tq84_locale(es-CL)
   %tq84_locale(es-CO)
   %tq84_locale(es-CR)
   %tq84_locale(es-DO)
   %tq84_locale(es-EC)
   %tq84_locale(es-ES)
   %tq84_locale(es-GT)
   %tq84_locale(es-HN)
   %tq84_locale(es-MX)
   %tq84_locale(es-NI)
   %tq84_locale(es-PA)
   %tq84_locale(es-PE)
   %tq84_locale(es-PR)
   %tq84_locale(es-PY)
   %tq84_locale(es-SV)
   %tq84_locale(es-US)
   %tq84_locale(es-UY)
   %tq84_locale(es-VE)
   %tq84_locale(et-EE)
   %tq84_locale(eu-ES)
   %tq84_locale(fa-IR)
   %tq84_locale(fi-FI)
/* %tq84_locale(fil-PH)         */
   %tq84_locale(fo-FO)
   %tq84_locale(fr-BE)
   %tq84_locale(fr-CA)
   %tq84_locale(fr-CH)
   %tq84_locale(fr-FR)
   %tq84_locale(fr-LU)
/* %tq84_locale(fr-MC)          */
/* %tq84_locale(fy-NL)          */
   %tq84_locale(ga-IE)
/* %tq84_locale(gd-GB)          */
/* %tq84_locale(gl-ES)          */
/* %tq84_locale(gsw-FR)         */
/* %tq84_locale(gu-IN)          */
/* %tq84_locale(ha-Latn-NG)     */
   %tq84_locale(he-IL)
   %tq84_locale(hi-IN)
   %tq84_locale(hr-BA)
   %tq84_locale(hr-HR)
/* %tq84_locale(hsb-DE)         */
   %tq84_locale(hu-HU)
/* %tq84_locale(hy-AM)          */
   %tq84_locale(id-ID)
/* %tq84_locale(ig-NG)          */
/* %tq84_locale(ii-CN)          */
   %tq84_locale(is-IS)
   %tq84_locale(it-CH)
   %tq84_locale(it-IT)
/* %tq84_locale(iu-Cans-CA)     */
/* %tq84_locale(iu-Latn-CA)     */
   %tq84_locale(ja-JP)
/* %tq84_locale(ka-GE)          */
   %tq84_locale(kk-KZ)
   %tq84_locale(kl-GL)
/* %tq84_locale(km-KH)          */
/* %tq84_locale(kn-IN)          */
/* %tq84_locale(kok-IN)         */
   %tq84_locale(ko-KR)
/* %tq84_locale(ky-KG)          */
/* %tq84_locale(lb-LU)          */
/* %tq84_locale(lo-LA)          */
   %tq84_locale(lt-LT)
   %tq84_locale(lv-LV)
/* %tq84_locale(mi-NZ)          */
   %tq84_locale(mk-MK)
/* %tq84_locale(ml-IN)          */
/* %tq84_locale(mn-MN)          */
/* %tq84_locale(mn-Mong-CN)     */
/* %tq84_locale(moh-CA)         */
   %tq84_locale(mr-IN)
/* %tq84_locale(ms-BN)          */
   %tq84_locale(ms-MY)
   %tq84_locale(mt-MT)
   %tq84_locale(nb-NO)
/* %tq84_locale(ne-NP)          */
   %tq84_locale(nl-BE)
   %tq84_locale(nl-NL)
   %tq84_locale(nn-NO)
/* %tq84_locale(nso-ZA)         */
/* %tq84_locale(oc-FR)          */
/* %tq84_locale(or-IN)          */
/* %tq84_locale(pa-IN)          */
   %tq84_locale(pl-PL)
/* %tq84_locale(prs-AF)         */
/* %tq84_locale(ps-AF)          */
   %tq84_locale(pt-BR)
   %tq84_locale(pt-PT)
/* %tq84_locale(qut-GT)         */
/* %tq84_locale(quz-BO)         */
/* %tq84_locale(quz-EC)         */
/* %tq84_locale(quz-PE)         */
/* %tq84_locale(rm-CH)
   %tq84_locale(ro-RO)
   %tq84_locale(ru-RU)
/* %tq84_locale(rw-RW)          */
/* %tq84_locale(sah-RU)         */
/* %tq84_locale(sa-IN)          */
/* %tq84_locale(se-FI)
/* %tq84_locale(se-NO)
/* %tq84_locale(se-SE)
/* %tq84_locale(si-LK)
   %tq84_locale(sk-SK)
   %tq84_locale(sl-SI)
/* %tq84_locale(sma-NO)         */
/* %tq84_locale(sma-SE)         */
/* %tq84_locale(smj-NO)         */
/* %tq84_locale(smj-SE)         */
/* %tq84_locale(smn-FI)         */
/* %tq84_locale(sms-FI)         */
   %tq84_locale(sq-AL)
/* %tq84_locale(sr-Cyrl-BA)     */
/* %tq84_locale(sr-Cyrl-CS)     */
/* %tq84_locale(sr-Cyrl-ME)     */
/* %tq84_locale(sr-Cyrl-RS)     */
/* %tq84_locale(sr-Latn-BA)     */
/* %tq84_locale(sr-Latn-CS)     */
/* %tq84_locale(sr-Latn-ME)     */
/* %tq84_locale(sr-Latn-RS)     */
/* %tq84_locale(sv-FI)          */
   %tq84_locale(sv-SE)
/* %tq84_locale(sw-KE)          */
/* %tq84_locale(syr-SY)         */
   %tq84_locale(ta-IN)
   %tq84_locale(te-IN)
/* %tq84_locale(tg-Cyrl-TJ)     */
   %tq84_locale(th-TH)
/* %tq84_locale(tk-TM)          */
/* %tq84_locale(tn-ZA)          */
   %tq84_locale(tr-TR)
/* %tq84_locale(tt-RU)          */
/* %tq84_locale(tzm-Latn-DZ)    */
/* %tq84_locale(ug-CN)          */
   %tq84_locale(uk-UA)
/* %tq84_locale(ur-PK)          */
/* %tq84_locale(uz-Cyrl-UZ)     */
/* %tq84_locale(uz-Latn-UZ)     */
   %tq84_locale(vi-VN)
/* %tq84_locale(wo-SN)          */
/* %tq84_locale(xh-ZA)          */
/* %tq84_locale(yo-NG)          */
   %tq84_locale(zh-CN)
   %tq84_locale(zh-HK)
   %tq84_locale(zh-MO)
   %tq84_locale(zh-SG)
   %tq84_locale(zh-TW)
/* %tq84_locale(zu-ZA)          */
%mend tq84_locales;

%tq84_locales;
/*
ar-AE: 01 ديسمبر, 2017 11:49:29
ar-BH: 01 ديسمبر, 2017 11:49:29
ar-DZ: 01 ديسمبر, 2017 11:49:29
ar-EG: 01 ديسمبر, 2017 11:49:29
ar-IQ: 01 ديسمبر, 2017 11:49:29
ar-JO: 01/12/2017 11:49:29 ص
ar-KW: 01 ديسمبر, 2017 11:49:29
ar-LB: 01/12/2017 11:49:29 ص
ar-LY: 01 ديسمبر, 2017 11:49:29
ar-MA: 01 ديسمبر, 2017 11:49:29
ar-OM: 01 ديسمبر, 2017 11:49:29
ar-QA: 01 ديسمبر, 2017 11:49:29
ar-SA: 01 ديسمبر, 2017 11:49:29
ar-SY: 01/12/2017 11:49:29 ص
ar-TN: 01 ديسمبر, 2017 11:49:29
ar-YE: 01 ديسمبر, 2017 11:49:29
be-BY: 01.12.2017 11.49.29
bg-BG: 01.12.2017 11:49:29
bn-IN: 01/12/2017 11:49:29
ca-ES: 01/12/2017 11:49:29
cs-CZ: 01. prosince 2017 11:49:29
da-DK: 01. december 2017 11:49:29
de-AT: 01. Dezember 2017 11.49 Uhr
de-CH: 01. Dezember 2017 11.49 Uhr
de-DE: 01. Dezember 2017 11.49 Uhr
de-LI: 01. Dezember 2017 11.49 Uhr
de-LU: 01. Dezember 2017 11.49 Uhr
el-GR: 01/12/2017 11:49:29 π.μ.
en-AU: 01 December 2017 11:49:29
en-CA: 2017-12-01 11:49:29 AM
en-GB: 01/12/2017 11:49:29
en-IE: 01/12/2017 11:49:29 a.m.
en-IN: 01 December 2017 11:49:29
en-JM: 01 December 2017 11:49:29
en-NZ: 01 December 2017 11:49:29
en-PH: 01 December, 2017 11:49:29
en-SG: 01,December,2017 11:49:29
en-US: 01Dec2017:11:49:29
en-ZA: 01 December 2017 11:49:29
en-ZW: 01,December,2017 11:49:29
es-AR: 01 de diciembre de 2017 11h49
es-BO: 01/12/2017 11:49:29
es-CL: 01-12-2017 11:49:29
es-CO: 01/12/2017 11:49:29
es-CR: 01/12/2017 11:49:29
es-DO: 01/12/2017 11:49:29
es-EC: 01/12/2017 11:49:29
es-ES: 01 de diciembre de 2017 11H49
es-GT: 01/12/2017 11:49:29
es-HN: 01/12/2017 11:49:29
es-MX: 01/12/2017 11:49:29
es-NI: 01/12/2017 11:49:29
es-PA: 12/01/2017 11:49:29
es-PE: 01/12/2017 11:49:29
es-PR: 12/01/2017 11:49:29
es-PY: 01/12/2017 11:49:29
es-SV: 01/12/2017 11:49:29
es-US: 01 diciembre 2017 11:49:29
es-UY: 01/12/2017 11:49:29
es-VE: 01/12/2017 11:49:29
et-EE: 01, detsember 2017 11:49:29
eu-ES: 2017(e)ko abenduak  1 11:49:29
fa-IR: 01⁄12⁄2017 11:49:29
fi-FI: 01. joulukuuta 2017 11:49:29
fo-FO: 01/desember-2017 11:49:29
fr-BE: 01 décembre 2017 11 h 49
fr-CA: 01 décembre 2017 11 h 49
fr-CH: 01. décembre 2017 11.49. h
fr-FR: 01 décembre 2017 11 h 49
fr-LU: 01 décembre 2017 11 h 49
ga-IE: 01/12/2017 11:49:29
he-IL: 11:49:29 01 דצמבר 2017
hi-IN: 01-12-2017 11:49:29
hr-BA: 2017. prosinca 01 11:49:29
hr-HR: 2017. prosinca 01 11:49:29
hu-HU: 2017. december 01. 11:49:29
id-ID: 01/Desember/2017 11:49:29
is-IS: 01. desember 2017 11:49:29
it-CH: 01. dicembre 2017 11.49 h
it-IT: 01 dicembre 2017 11:49:29
ja-JP: 2017/12/01 11:49:29
kk-KZ: 01/12/2017 11:49:29
kl-GL: 01/decemberi/2017 11:49:29
ko-KR: 2017.12.01. 오전 11:49:29
lt-LT: 2017, gruodis 01 11.49.29
lv-LV: 2017, 01 decembris 11:49:29
mk-MK: 01.12.2017 11:49:29
mr-IN: 01-12-2017 11-49 म.पू.
ms-MY: 01 Dis 2017 11:49:29
mt-MT: 01 ta Diċembru, 2017 11:49:29
nb-NO: 01. desember 2017 kl 11.49
nl-BE: 01 december 2017 11:49:29 uur
nl-NL: 01 december 2017 11:49:29 uur
nn-NO: 01. desember 2017 kl 11.49
pl-PL: 01 grudnia 2017 11:49:29
pt-BR: 01/12/2017 11:49:29
pt-PT: 01 de dezembro de 2017 11H49m
sq-AL: 2017-12-01 11.49.29.
sv-SE: den 01 december 2017 kl 11:49
ta-IN: 01-12-2017 11:49:29
te-IN: 01-12-2017 11:49:29
th-TH: 01/12/2017, 11:49:29
tr-TR: 01 Aralık 2017 11:49:29
uk-UA: 01, грудня 2017 11:49:29
vi-VN: 11:49:29 01/12/2017
zh-CN: 2017-12-01 上午11:49:29
zh-HK: 2017/12/01 11:49:29
zh-MO: 2017/12/01 11:49:29
zh-SG: 01/12/2017 上午11:49:29
zh-TW: 2017/12/01 上午11:49:29
*/
