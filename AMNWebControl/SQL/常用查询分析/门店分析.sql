
  --2 美发虚业绩  
  set @targetsql='select ddate=SUBSTRING(ddate,1,6),hairyeji=convert(numeric(20,1),SUM(ISNULL(hairyeji,0)))  
  from compclasstraderesult where compid='+@compid+'   
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  2,* from ('+@targetsql+') a pivot (max(hairyeji) for ddate in (' + @sqltitle + ')) b  ')  
   
  --3 美容虚业绩  
  set @targetsql='select ddate=SUBSTRING(ddate,1,6),beautyeji=convert(numeric(20,1),SUM(ISNULL(beautyeji,0)))  
  from compclasstraderesult where compid='+@compid+'   
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  3,* from ('+@targetsql+') a pivot (max(beautyeji) for ddate in (' + @sqltitle + ')) b  ')  
   
  --4 美甲需业绩  
  set @targetsql='select ddate=SUBSTRING(ddate,1,6),fingeryeji=convert(numeric(20,1),SUM(ISNULL(fingeryeji,0)))  
  from compclasstraderesult where compid='+@compid+'   
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  4,* from ('+@targetsql+') a pivot (max(fingeryeji) for ddate in (' + @sqltitle + ')) b  ')  
   
   --5 总实业绩  
  set @targetsql='select ddate=SUBSTRING(ddate,1,6),realtotalyeji=convert(numeric(20,1),SUM(ISNULL(realtotalyeji,0)))  
  from compclasstraderesult where compid='+@compid+'   
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  5,* from ('+@targetsql+') a pivot (max(realtotalyeji) for ddate in (' + @sqltitle + ')) b  ')  
   
    
   
  --6 耗卡率(储值销卡/卡异动)  
  set @targetsql='select ddate=SUBSTRING(dateReport,1,6),realrate=convert(numeric(20,4),SUM(ISNULL(cardsalesservices,1))/ISNULL(sum(ISNULL(totalcardtrans,0)),0))  
  from detial_trade_byday_fromshops where shopId='+@compid+' and ISNULL(totalcardtrans,0)>0  
  group by SUBSTRING(dateReport,1,6)'  
   insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  6,* from ('+@targetsql+') a pivot (max(realrate) for ddate in (' + @sqltitle + ')) b  ')  
   
  --7 美容部消耗占比  
  set @targetsql='select ddate=SUBSTRING(ddate,1,6),realbeautyeji=convert(numeric(20,4),SUM(ISNULL(realbeautyeji,4))/SUM(ISNULL(realtotalyeji,0)))  
  from compclasstraderesult where compid='+@compid+'  and isnull(realtotalyeji,0)>0  
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  7,* from ('+@targetsql+') a pivot (max(realbeautyeji) for ddate in (' + @sqltitle + ')) b  ')  
    
  -- 110 美容营业额占比  
   set @targetsql='select ddate=SUBSTRING(ddate,1,6),realbeautyeji=convert(numeric(20,4),SUM(ISNULL(beautyeji,4))/SUM(ISNULL(totalyeji,0)))  
  from compclasstraderesult where compid='+@compid+'  and isnull(realtotalyeji,0)>0  
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  110,* from ('+@targetsql+') a pivot (max(realbeautyeji) for ddate in (' + @sqltitle + ')) b  ')  
    
  --8美发实业绩  
   set @targetsql='select ddate=SUBSTRING(ddate,1,6),realhairyeji=convert(numeric(20,1),SUM(ISNULL(realhairyeji,0)))  
  from compclasstraderesult where compid='+@compid+'   
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  8,* from ('+@targetsql+') a pivot (max(realhairyeji) for ddate in (' + @sqltitle + ')) b  ')  
   
  --10 洗剪吹消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''01'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  10,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --11 烫发消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''03'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  11,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --12 染发消耗   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''02'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  12,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --13 护理消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''04'',''05'',''07'',''14'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  13,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --14 头皮消耗  
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''06'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  14,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
    
  -- 90 洗剪吹项目数占比 91 烫发项目数占比 92 染发消耗占比 93 护理消耗占比 94 头皮消耗占比  
    set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''01'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
   
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  90,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''03'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  91,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
  
     
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''02'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  92,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''04'',''05'',''07'',''14'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  93,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''06'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  94,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
  -- 95洗剪吹项目数占比 96 烫发项目数占比 97染发项目数占比 98 护理项目数占比 99 头皮项目数占比  
      set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''01'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  95,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''03'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  96,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''02'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  97,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''04'',''05'',''07'',''14'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  98,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''06'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  99,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
     
  -- 15美发总项目数  
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
  and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  15,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  -- 16洗剪吹项目数   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''01'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  16,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --17 烫发项目数   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''03'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  17,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
   
  --18染发项目数   
    set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''02'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  18,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --19 护理项目数   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''04'',''05'',''07'',''14'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  19,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --20 头皮项目数  
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''06'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  20,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
                  
  -- 21美发总均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  21,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
  --22 洗剪吹均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''01'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  22,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
    
  --23 烫发均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''03'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  23,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
  --24染发均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''02'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  24,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
  --25护理均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''04'',''05'',''07'',''14'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  25,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
  --26头皮均价  
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  26,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 -- 27美发总客单数   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=count(distinct b.csbillid)   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  27,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
   
   
 --28美发总客单价   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/count(distinct b.csbillid))   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
   and isnull(c.prjreporttype,'''') in (''01'',''03'',''02'',''04'',''05'',''07'',''14'',''06'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  28,* from ('+@targetsql+') a pivot (max(billprice) for ddate in (' + @sqltitle + ')) b  ')  
   
   
 --29 美发疗程客单数  
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=count(distinct b.csbillid)   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 and isnull(cspaymode,'''')=''9''  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  29,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
 --30 美发疗程客单价   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/count(distinct b.csbillid))   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 and isnull(cspaymode,'''')=''9''  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  30,* from ('+@targetsql+') a pivot (max(billprice) for ddate in (' + @sqltitle + ')) b  ')  
                
  --32美容实业绩  
    set @targetsql='select ddate=SUBSTRING(ddate,1,6),realbeautyeji=convert(numeric(20,1),SUM(ISNULL(realbeautyeji,0)))  
  from compclasstraderesult where compid='+@compid+'   
  group by SUBSTRING(ddate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  32,* from ('+@targetsql+') a pivot (max(realbeautyeji) for ddate in (' + @sqltitle + ')) b  ')  
   
  -- 33养生类SPA总消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  33,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  -- 34面部类消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''10'',''17'')  
  and a.cscompid='+@compid+' and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  34,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --35胸部类消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''18'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  35,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --36 其他类消耗   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''09'',''11'',''13'',''22'',''23'')  
  and a.cscompid='+@compid+' and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  36,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
  --37 老疗程消耗  
 set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemamt=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''15'')  
  and a.cscompid='+@compid+' and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  37,* from ('+@targetsql+') a pivot (max(csitemamt) for ddate in (' + @sqltitle + ')) b  ')  
   
   
  -- 100养生类SPA总消耗 101面部类消耗 102胸部类消耗 103其他类消耗 104 老疗程消耗  
    set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  100,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''10'',''17'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  101,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''18'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  102,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''09'',''11'',''13'',''22'',''23'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  103,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''15'') then ISNULL(b.csitemamt,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemamt,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  104,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
    
  -- 105养生项目数 106面部项目数 107胸部项目数 108其他类项目数 109 老项目项目数  
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
 and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  105,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''10'',''17'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
 and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  106,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''18'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
 and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  107,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''09'',''11'',''13'',''22'',''23'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0))) 
 
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  108,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(sum(case when isnull(c.prjreporttype,'''') in (''15'') then ISNULL(b.csitemcount,0) else 0 end ))*1.0/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
   and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  109,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
    
    
                 
  -- 38美容总项目数   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')   
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  38,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
   
  --39养生项目数   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  39,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --40面部项目数   
    set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in  (''10'',''17'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  40,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --41胸部项目数   
    set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''18'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  41,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --42其他类项目数   
    set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''') in (''09'',''11'',''13'',''22'',''23'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  42,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
   
  --43 老项目项目数  
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemcount=convert(numeric(20,0),SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjreporttype,'''')  in (''15'')  
  and a.cscompid='+@compid+'   and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  43,* from ('+@targetsql+') a pivot (max(csitemcount) for ddate in (' + @sqltitle + ')) b  ')  
                
 -- 44美容均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  44,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 --45养生类均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  45,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 --46面部类均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''10'',''17'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  46,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 --47胸部类均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''18'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  47,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 --48其他类均价   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''09'',''11'',''13'',''22'',''23'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  48,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 --49老项目均价  
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),csitemaprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/SUM(ISNULL(b.csitemcount,0)))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno  and isnull(c.prjreporttype,'''') in (''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  49,* from ('+@targetsql+') a pivot (max(csitemaprice) for ddate in (' + @sqltitle + ')) b  ')  
                
 -- 50美容部客单数   
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=count(distinct b.csbillid)   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  50,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
   
 -- 51美容部客单价   
 set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/count(distinct b.csbillid))   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and isnull(c.prjreporttype,'''') in (''08'',''12'',''19'',''20'',''21'',''10'',''17'',''18'',''09'',''11'',''13'',''22'',''23'',''15'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  51,* from ('+@targetsql+') a pivot (max(billprice) for ddate in (' + @sqltitle + ')) b  ')  
   
 -- 52 美容疗程客单数   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=count(distinct b.csbillid)   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 and isnull(cspaymode,'''')=''9''  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  52,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
 -- 53 美容疗程客单价   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billprice=convert(numeric(20,1),SUM(ISNULL(b.csitemamt,0))/count(distinct b.csbillid))   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0 and isnull(cspaymode,'''')=''9''  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  53,* from ('+@targetsql+') a pivot (max(billprice) for ddate in (' + @sqltitle + ')) b  ')  
       
  --31美发疗程客单数占比   
  set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(count(distinct case when  isnull(cspaymode,'''')=''9'' then b.csbillid else '''' end )-1)*1.0/count(distinct b.csbillid))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''3'',''6'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  31,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
 -- 54 美容疗程客单占比   
 set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=convert(numeric(20,4),(count(distinct case when  isnull(cspaymode,'''')=''9'' then b.csbillid else '''' end )-1)*1.0/count(distinct b.csbillid))  
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and b.csitemno=c.prjno and isnull(c.prjtype,'''') in (''4'')  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0   
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  54,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
    
    
   -- 112 总客单数  
   set @targetsql='select ddate=SUBSTRING(a.financedate,1,6),billcount=count(distinct b.csbillid)   
  from mconsumeinfo a,dconsumeinfo b,projectnameinfo c  
  where a.csbillid=b.csbillid and a.cscompid=b.cscompid and a.financedate between ''20130101'' and ''20131231''  
  and a.cscompid='+@compid+'  and  isnull(backcsbillid,'''')='''' and ISNULL(backcsflag,0)=0  
  group by  SUBSTRING(a.financedate,1,6)'  
  insert #analysisresult(resusttyep,month1r,month2r,month3r,month4r,month5r,month6r,month7r,month8r,month9r,month10r,month11r,month12r)  
  exec (' select  112,* from ('+@targetsql+') a pivot (max(billcount) for ddate in (' + @sqltitle + ')) b  ')  
   
   
      
      
                 