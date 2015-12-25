alter table msalecardinfo
add beautyManager varchar(20) null,
    beautyManagerinid  varchar(20) null,
	consultant varchar(20) null,
	consultantinid varchar(20) null,
	beautyPerf float null,
	consultantPerf float null,
	consultant1Perf float null,
	consultant1 varchar(20) null,
	consultant1inid varchar(20) null
--mgx20140904 start
alter table mcardrechargeinfo
add beautyManager varchar(20) null,
    beautyManagerinid  varchar(20) null,
	consultant varchar(20) null,
	consultantinid varchar(20) null,
	beautyPerf float null,
	consultantPerf float null,
		consultant1Perf float null,
	consultant1 varchar(20) null,
	consultant1inid varchar(20) null

alter table mcardchangeinfo
add beautyManager varchar(20) null,
    beautyManagerinid  varchar(20) null,
	consultant varchar(20) null,
	consultantinid varchar(20) null,
	beautyPerf float null,
	consultantPerf float null,
		consultant1Perf float null,
	consultant1 varchar(20) null,
	consultant1inid varchar(20) null

alter table msalecardinfolog
add beautyManager varchar(20) null,
    beautyManagerinid  varchar(20) null,
	consultant varchar(20) null,
	consultantinid varchar(20) null,
	beautyPerf float null,
	consultantPerf float null,
		consultant1Perf float null,
	consultant1 varchar(20) null,
	consultant1inid varchar(20) null

alter table mcardrechargeinfolog
add beautyManager varchar(20) null,
    beautyManagerinid  varchar(20) null,
	consultant varchar(20) null,
	consultantinid varchar(20) null,
	beautyPerf float null,
	consultantPerf float null,
		consultant1Perf float null,
	consultant1 varchar(20) null,
	consultant1inid varchar(20) null
	
alter table mcardchangeinfolog
add beautyManager varchar(20) null,
    beautyManagerinid  varchar(20) null,
	consultant varchar(20) null,
	consultantinid varchar(20) null,
	beautyPerf float null,
	consultantPerf float null,
		consultant1Perf float null,
	consultant1 varchar(20) null,
	consultant1inid varchar(20) null
	
alter procedure upg_handrechargecardbill_card      
@compid   varchar(10), --续卡公司            
@billid   varchar(20), --续卡单号       
@cardtype  varchar(20) --卡种      
as            
begin       
 --更新内部工号      
 update mcardrechargeinfo set firstsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and firstsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set secondsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and secondsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set thirdsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and thirdsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set fourthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and fourthsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set fifthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and fifthsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set sixthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and sixthsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set seventhsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and seventhsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set eighthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and eighthsalerid=staffno and compno=@compid
 update mcardrechargeinfo set beautyManagerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and beautyManager=staffno and compno=@compid
 update mcardrechargeinfo set consultantinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and consultant=staffno and compno=@compid
 update mcardrechargeinfo set consultant1inid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and consultant1=staffno and compno=@compid
     
 declare @salecardno    varchar(20)  --续卡卡号      
 declare @saledate    varchar(8)  --续卡日期      
 declare @saletime    varchar(9)  --续卡时间      
       
 declare @rechargetype   int    --续费方式( 0充值 ,6还款)        
 declare @rechargekeepamt  float   --充值金额      
 declare @rechargedebtamt  float   --欠款金额      
 declare @curcardamt    float   --异动前余额      
 declare @curcarddebtamt   float   --异动前欠款      
 declare @rechargeaccounttype varchar(10)  --充值账户      
 declare @acc4totalamt  float   --疗程总额      
 declare @carduselife float     
 declare @sendamtflag  int  
    
 select @carduselife=carduselife from cardtypeinfo where cardtypeno=@cardtype and cardtypemodeid='SCM'      
 declare @cutoffdate varchar(10)      
 select @cutoffdate=convert(varchar(10),dateadd(day,@carduselife,cast(@saledate as datetime)),120)      
       
 select @salecardno=rechargecardno,@saledate=rechargedate,@saletime=rechargetime,@rechargetype=rechargetype,      
        @rechargekeepamt=rechargekeepamt,@rechargedebtamt=rechargedebtamt,@curcardamt=curcardamt,@curcarddebtamt=curcarddebtamt,@rechargeaccounttype=rechargeaccounttype ,@sendamtflag=ISNULL(sendamtflag,0)       
 from mcardrechargeinfo with(nolock) where rechargecompid=@compid and rechargebillid=@billid      
       
 select @cutoffdate=substring(@cutoffdate,1,4)+substring(@cutoffdate,6,2)+substring(@cutoffdate,9,2)      
 select @acc4totalamt=sum(ISNULL(saleproamt,0)) from dsalecardproinfo with(nolock) where salecompid=@compid and salebillid=@billid and salebilltype=2      
       
 --更新账户金额      
 if(@rechargetype=0)--充值      
 begin      
  if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=CAST(@rechargeaccounttype as int))      
  begin      
    update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@rechargekeepamt,0),accountdebts=isnull(accountdebts,0)+ISNULL(@rechargedebtamt,0) where cardno=@salecardno and accounttype=CAST(@rechargeaccounttype as int)      
  end      
  else      
  begin      
   insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
   values(@compid,@salecardno,CAST(@rechargeaccounttype as int),ISNULL(@rechargekeepamt,0),ISNULL(@rechargedebtamt,0),@saledate,@cutoffdate,'')   
  end      
 end      
 else --还款      
 begin      
   update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@rechargekeepamt,0),accountdebts=isnull(accountdebts,0)-ISNULL(@rechargekeepamt,0) where cardno=@salecardno and accounttype=CAST(@rechargeaccounttype as int)      
 end      
 --新增账户历史      
  declare @costaccountseqno  float      
  select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@salecardno       
  insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)      
  values(@compid,@salecardno,CAST(@rechargeaccounttype as int),isnull(@costaccountseqno,0),0,@rechargekeepamt,'CZ',@billid,@saledate,@curcardamt)      
  set @costaccountseqno=isnull(@costaccountseqno,0)+1      
        
       
 --生成疗程信息      
  declare @proseqno float      
  select @proseqno=MAX(proseqno)+1 from cardproaccount with(nolock) where cardno=@salecardno       
  insert cardproaccount(cardvesting,cardno,projectno,proseqno,propricetype,salecount,costcount,lastcount,saleamt,costamt,lastamt,saledate,cutoffdate,proremark,createbilltype,createbillno)      
  select @compid,@salecardno,saleproid,ISNULL(@proseqno,0)+ISNULL(seleproseqno,0),saleprotype,ISNULL(saleprocount,0)+ISNULL(sendprocount,0),0,ISNULL(saleprocount,0)+ISNULL(sendprocount,0),      
  ISNULL(saleproamt,0),0,ISNULL(saleproamt,0),@saledate,procutoffdate,saleproremark,'CZ',@billid       
  from dsalecardproinfo where salecompid=@compid and salebillid=@billid and salebilltype=2      
        
  if(ISNULL(@acc4totalamt,0)>0)      
  begin      
 if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=4)      
  update cardaccount set accountbalance=isnull(accountbalance,0)+@acc4totalamt where cardno=@salecardno and accounttype=4      
 else      
 begin      
  insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
  values(@compid,@salecardno,4,@acc4totalamt,0,@saledate,@cutoffdate,'')      
 end      
 declare @costaccount4lastamt float       
 select top 1 @costaccount4lastamt=(case when changetype in (0,6) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@salecardno  and changeaccountt
ype=4 order by chagedate desc,changeseqno desc       
 insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)      
 values(@compid,@salecardno,4,isnull(@costaccountseqno,0),0,@acc4totalamt,'CZ',@billid,@saledate,isnull(@costaccount4lastamt,0))      
  end   
  declare @SP106 varchar(2)  
  select @SP106=paramvalue from sysparaminfo where compid=@compid and paramid='SP106'  
   -- 充值金额2W上送5%的卡金  账户编号 7  
  if(ISNULL(@rechargekeepamt,0)>=20000 and ISNULL(@SP106,'')='1' and ISNULL(@sendamtflag,0)=1)  
  begin  
 if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=6)    
   update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@rechargekeepamt,0)*0.05,accountdatefrom=@saledate,accountdateend=@cutoffdate where cardno=@salecardno and accounttype=6    
 else    
 begin    
  insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)    
  values(@compid,@salecardno,6,ISNULL(@rechargekeepamt,0)*0.05,0,@saledate,@cutoffdate,'')    
 end    
 insert sendpointcard(sendcompid,sendbillid,sendtype,senddate,sourcebillid,sourcecardno,sourcedate,sourceamt,sendamt,sendpicflag)  
 values(@compid,@billid+'ZS',1,@saledate,@billid,@salecardno,@saledate,@rechargekeepamt,ISNULL(@rechargekeepamt,0)*0.05,3)  
  end     
end 


alter procedure upg_Confirm_CardChangeCard                  
(                  
 @compid   varchar(10),  --门店号               
 @billid   varchar(20),  --单号              
 @changedate  varchar(8),   --日期              
 @oldcardno   varchar(20),  --老卡号              
 @newcardno   varchar(20),  --新卡号                
 @changetype  varchar(20)   --卡变更类型 0 折扣转卡 1 收购转卡 2竞争转卡 3换卡 4挂失卡 5补卡 6老卡并老卡 7老卡并新卡              
)                  
as                 
begin              
 declare @saleaccountseqno  float              
 declare @curfillamt    float  --充值金额              
 declare @curdebtamt    float  --欠款金额              
 declare @membername    varchar(20) --会员姓名                
 declare @membertphone   varchar(20) --会员手机                
 declare @oldaccfillamt   float  --原卡账户金额              
 declare @oldaccdebtamt   float  --原卡账户欠款金额              
 declare @oldprofillamt   float  --原卡疗程账户金额              
 declare @oldprodebtamt   float  --原卡疗程账户欠款金额              
 declare @prodetialseqno   float  --疗程明细序号              
 declare @costaccountseqno   float  --账户历史序号              
 declare @costaccount2lastamt float  --账户历史最后余额              
 declare @costaccount4lastamt float  --账户历史最后余额          
 declare @oldcardpointamt float              
 declare @SP042     varchar(2) --是否启用卡变更欠款累加 0:禁用 1:启用      
 declare @sendamtflag  int            
 select @SP042=paramvalue from sysparaminfo where compid=@compid and paramid='SP042'     
     
  declare @SP106 varchar(2)    
  select @SP106=paramvalue from sysparaminfo where compid=@compid and paramid='SP106'    
               
 select @curfillamt=ISNULL(changefillamt,0),@curdebtamt=ISNULL(changdebtamt,0),              
   @oldaccfillamt=isnull(curaccountkeepamt,0),@oldaccdebtamt=isnull(curaccountdebtamt,0),              
   @membername=ISNULL(membername,''),@membertphone=ISNULL(memberphone,''),@sendamtflag=ISNULL(sendamtflag,0)   from  mcardchangeinfo where changecompid=@compid and changebillid=@billid              
               
 if(@changetype=5)              
 begin              
  update  cardinfo set cardstate=11 where cardno=@oldcardno  --已补卡状态              
  --新增异动历史              
            
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@newcardno               
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  values(@compid,@newcardno,isnull(@saleaccountseqno,0),7,@billid,3,4,@changedate,@oldcardno)              
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@oldcardno               
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  values(@compid,@oldcardno,isnull(@saleaccountseqno,0),7,@billid,9,11,@changedate,@newcardno)              
 end              
 else if(@changetype=3)              
 begin              
  update  cardinfo set cardstate=13 where cardno=@oldcardno  --已换卡状态              
  --新增异动历史              
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@newcardno               
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  values(@compid,@newcardno,isnull(@saleaccountseqno,0),13,@billid,3,4,@changedate,@oldcardno)              
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@oldcardno               
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  values(@compid,@oldcardno,isnull(@saleaccountseqno,0),13,@billid,9,13,@changedate,@newcardno)              
 end              
 else if(@changetype in (0,1))              
 begin              
 update  cardinfo set cardstate=6 where cardno=@oldcardno   --已转卡状态              
 --新增异动历史              
 select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@newcardno               
 insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
 values(@compid,@newcardno,isnull(@saleaccountseqno,0),11,@billid,1,4,@changedate,@oldcardno)              
 select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@oldcardno               
 insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
 values(@compid,@oldcardno,isnull(@saleaccountseqno,0),11,@billid,4,6,@changedate,@newcardno)              
 end            
 else if(@changetype=8)              
 begin              
  update mcardchangeinfo set firstsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and firstsalerid=staffno and compno=@compid              
  update mcardchangeinfo set secondsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and secondsalerid=staffno and compno=@compid              
  update mcardchangeinfo set thirdsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and thirdsalerid=staffno and compno=@compid              
  update mcardchangeinfo set fourthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and fourthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set fifthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and fifthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set sixthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and sixthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set seventhsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and seventhsalerid=staffno and compno=@compid              
  update mcardchangeinfo set eighthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and eighthsalerid=staffno and compno=@compid  
  update mcardchangeinfo set beautyManagerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and beautyManager=staffno and compno=@compid              
  update mcardchangeinfo set consultantinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and consultant=staffno and compno=@compid  
  update mcardchangeinfo set consultant1inid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and consultant1=staffno and compno=@compid  
          
               
               
  update  cardinfo set cardstate=7 where cardno=@oldcardno   --已退卡状态              
  --新增异动历史              
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@oldcardno               
   insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  values(@compid,@oldcardno,isnull(@saleaccountseqno,0),8,@billid,4,7,@changedate,'')              
                
  --清空账户              
  update   cardaccount set accountbalance=0,accountdebts=0 where cardno=@oldcardno               
  --增加账户历史              
  select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@oldcardno               
  select top 1 @costaccount2lastamt=(case when changetype in (0,6,7,8,9,10) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@oldcardno  and changeaccounttype=2 order by chagedate desc,changeseqno desc               
  select top 1 @costaccount4lastamt=(case when changetype in (0,6,7,8,9,10,11) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@oldcardno  and changeaccounttype=4 order by chagedate desc,changeseqno desc               
                
  insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
  values(@compid,@oldcardno,2,isnull(@costaccountseqno,0),1,@oldaccfillamt,'TK',@billid,@changedate,@costaccount2lastamt)              
  set @costaccountseqno=isnull(@costaccountseqno,0)+1              
  insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
  values(@compid,@oldcardno,4,isnull(@costaccountseqno,0),1,@oldprofillamt,'TK',@billid,@changedate,@costaccount4lastamt)              
  --清空疗程明细              
  update  cardproaccount set lastcount=0,lastamt=0 where cardno=@oldcardno              
                 
 end              
 if(@changetype in (0,1,2,3,5,6,7))              
 begin               
  update mcardchangeinfo set firstsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and firstsalerid=staffno and compno=@compid              
  update mcardchangeinfo set secondsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and secondsalerid=staffno and compno=@compid              
  update mcardchangeinfo set thirdsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and thirdsalerid=staffno and compno=@compid              
  update mcardchangeinfo set fourthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and fourthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set fifthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and fifthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set sixthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and sixthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set seventhsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and seventhsalerid=staffno and compno=@compid              
  update mcardchangeinfo set eighthsalerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and eighthsalerid=staffno and compno=@compid              
  update mcardchangeinfo set beautyManagerinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and beautyManager=staffno and compno=@compid              
  update mcardchangeinfo set consultantinid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and consultant=staffno and compno=@compid   
  update mcardchangeinfo set consultant1inid=manageno from mcardchangeinfo,staffinfo where changecompid=@compid and changebillid=@billid and consultant1=staffno and compno=@compid                           
  if(@changetype in (0,1,2,3,5))  --转卡换卡补卡 变更卡信息              
  begin              
   update  cardinfo set cardstate=4 where cardno=@newcardno  --正常开卡状态              
   update cardsoninfo set parentcardno=@newcardno where parentcardno=@oldcardno              
   if(@changetype=2) --竞争转卡              
   begin              
    --更新新卡储值账户              
    if not exists(select 1 from cardaccount where   cardno = @newcardno and accounttype=2)                    
    begin                    
     insert into cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts)                     
     values(@compid,@newcardno,2,ISNULL(@oldaccfillamt,0)+ISNULL(@curfillamt,0),ISNULL(@oldaccdebtamt,0))                    
    end                  
    else              
    begin              
     update cardaccount set accountbalance=ISNULL(accountbalance,0)+ISNULL(@oldaccfillamt,0)+ISNULL(@curfillamt,0),accountdebts=ISNULL(accountdebts,0)+ISNULL(@oldaccdebtamt,0) where cardno=@newcardno and accounttype=2              
    end              
                 
    insert memberinfo(membervesting,memberno,membername,membertphone,cardnotomemberno)              
    values( @compid,@newcardno,@membername,@membertphone,@newcardno)              
    if(ISNULL(@oldaccfillamt,0)>0) --储值账户              
    begin              
     --生成账户历史              
     select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@newcardno               
     select top 1 @costaccount2lastamt=(case when changetype in (0,6,7,8,9,10) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@newcardno  and changeaccounttype=2 order by chagedate desc,changeseqno desc               
     insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
     values(@compid,@newcardno,2,isnull(@costaccountseqno,0),ISNULL(@changetype,0)+7,ISNULL(@oldaccfillamt,0)+ISNULL(@curfillamt,0),'ZK',@billid,@changedate,@costaccount2lastamt)              
     set @costaccountseqno=@costaccountseqno+1              
    end              
   end              
  else              
  begin              
   if(@changetype=1) --收购转卡              
   begin              
    delete cardaccount where  cardno=@oldcardno and accounttype=2              
    update cardaccount set accounttype=2 where cardno=@oldcardno and accounttype=5         
    end              
    --更新原有的操作方式,不直接代替会员信息  
    delete memberinfo where memberno=@newcardno              
    --update memberinfo set memberno=@newcardno,cardnotomemberno=@newcardno where memberno=@oldcardno   
    insert memberinfo(membervesting,memberno,memberCREATEdate,membername,memberaddress,membertphone,membermphone,memberFax,memberemail,memberzip,membersex,memberpaperworkno,memberbirthday,cardnotomemberno,memberqqno,membertype)  
             select membervesting,@newcardno,memberCREATEdate,membername,memberaddress,membertphone,membermphone,memberFax,memberemail,memberzip,membersex,memberpaperworkno,memberbirthday,@newcardno,memberqqno,membertype   
             from memberinfo  where memberno=@oldcardno   
     
    delete cardaccount where cardno=@newcardno  
          
    insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)  
    select cardvesting,@newcardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark  
    from  cardaccount where cardno=@oldcardno    
              
    update cardaccount set accountbalance=0 where cardno=@oldcardno     
           
    update cardaccount set accountbalance=ISNULL(accountbalance,0)+ISNULL(@curfillamt,0),accountdebts=ISNULL(accountdebts,0)+ISNULL(@curdebtamt,0) where cardno=@newcardno and accounttype=2              
    update cardproaccount set cardno=@newcardno where cardno=@oldcardno              
    update cardaccountchangehistory set changecardno=@newcardno where changecardno=@oldcardno              
    update cardtransactionhistory set transactioncardno=@newcardno where transactioncardno=@oldcardno              
    update sendpointcard set sourcecardno=@newcardno where   sourcecardno= @oldcardno              
  if(ISNULL(@curfillamt,0)>0) --储值账户              
  begin      
   --生成账户历史              
   select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@newcardno               
   select top 1 @costaccount2lastamt=(case when changetype in (0,6,7,8,9,10) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@newcardno  and changeaccounttype=2 order by chagedate desc,changeseqno desc               
   if(@changetype=1)              
    set @costaccount2lastamt=ISNULL(@oldaccfillamt,0)              
   insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
   values(@compid,@newcardno,2,isnull(@costaccountseqno,0),ISNULL(@changetype,0)+7,@curfillamt,'ZK',@billid,@changedate,@costaccount2lastamt)              
   set @costaccountseqno=isnull(@costaccountseqno,0)+1       
        
   -- 充值金额2W上送5%的卡金  账户编号 7    
   if(ISNULL(@curfillamt,0)>=20000 and ISNULL(@SP106,'')='1'  and ISNULL(@sendamtflag,0)=1)    
   begin    
    if exists(select 1 from cardaccount where cardno=@newcardno and accounttype=6)      
     update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@curfillamt,0)*0.05,accountdatefrom=@changedate where cardno=@newcardno and accounttype=6      
    else      
    begin      
     insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
     values(@compid,@newcardno,6,ISNULL(@curfillamt,0)*0.05,0,@changedate,'','')      
    end      
    insert sendpointcard(sendcompid,sendbillid,sendtype,senddate,sourcebillid,sourcecardno,sourcedate,sourceamt,sendamt,sendpicflag)    
    values(@compid,@billid+'ZS',3,@changedate,@billid,@newcardno,@changedate,@curfillamt,ISNULL(@curfillamt,0)*0.05,3)    
   end     
               
  end        
  if(@changetype=5) --遗失补卡 收取10块手续费      
  begin      
   if(ISNULL(@oldaccfillamt,0)>10)      
   begin      
    update cardaccount set accountbalance=ISNULL(accountbalance,0)-10 where cardno=@newcardno and accounttype=2              
    select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@newcardno        
    set @costaccountseqno=isnull(@costaccountseqno,0)+1        
    insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
    values(@compid,@newcardno,2,isnull(@costaccountseqno,0),1,10,'ZK',@billid,@changedate,ISNULL(@oldaccfillamt,0))              
           end      
  end       
  select @oldcardpointamt =SUM(isnull(accountbalance,0)) from cardaccount,mcardchangeinfo where changecompid=@compid and changebillid=@billid  and cardno=changebeforcardno  and accounttype=3            
  if(ISNULL(@oldcardpointamt,0)<>0 )              
  begin              
   --更新新卡积分账户              
   if not exists(select 1 from cardaccount where   cardno = @newcardno and accounttype=3)                    
   begin                    
    insert into cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts)                     
    values(@compid,@newcardno,3,ISNULL(@oldcardpointamt,0),0)                    
   end                  
   else              
   begin              
    update cardaccount set accountbalance=ISNULL(accountbalance,0)+ISNULL(@oldcardpointamt,0) where cardno=@newcardno and accounttype=3              
   end              
  end             
 end              
  end              
  else if(@changetype in (6,7))                
  begin              
 if(@changetype =6)--老卡并老卡 @oldcardno 为目标卡              
 begin              
  update  cardinfo set cardstate=12 from dcardchangeinfo,cardinfo where cardno=oldcardno and changecompid=@compid and changebillid=@billid  --已补卡状态              
  --新增异动历史              
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@oldcardno              
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  select @compid,oldcardno,99,12,@billid,4,12,@changedate,@oldcardno from dcardchangeinfo where changecompid=@compid and changebillid=@billid  --已补卡状态              
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  select @compid,@oldcardno ,isnull(@saleaccountseqno,0)+(row_number() over(order by oldcardno desc)),12,@billid,4,12,@changedate,oldcardno from dcardchangeinfo where changecompid=@compid and changebillid=@billid  --已补卡状态              
               
 end              
 else if(@changetype =7)--老卡并新卡 @oldcardno 为目标卡              
 begin              
  update  cardinfo set cardstate=12 from dcardchangeinfo,cardinfo where cardno=oldcardno and changecompid=@compid and changebillid=@billid  --已补卡状态              
  update  cardinfo set cardstate=4 where cardno=@oldcardno  --正常开卡状态              
  --新增异动历史              
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@oldcardno               
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  values(@compid,@oldcardno,isnull(@saleaccountseqno,0),12,@billid,1,4,@changedate,'')              
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)              
  select @compid,oldcardno,99,12,@billid,4,12,@changedate,@oldcardno from dcardchangeinfo where changecompid=@compid and changebillid=@billid  --已补卡状态              
  --更新新卡基础资料      
  insert memberinfo(membervesting,memberno,membercreatedate,membername,membermphone,membersex,memberpaperworkno,memberbirthday,cardnotomemberno)      
  select @compid,@oldcardno,@changedate,membername,membermphone,membersex,memberpaperworkno,memberbirthday,@oldcardno      
  from memberinfo where memberno in ( select top 1 oldcardno from dcardchangeinfo where  changecompid=@compid and changebillid=@billid )      
           
 end              
 --充值金额+老卡列表原有额度              
 select @curfillamt=ISNULL(@curfillamt,0)+SUM(ISNULL(curaccountkeepamt,0)) from  dcardchangeinfo where changecompid=@compid and changebillid=@billid               
 --充值欠款  / 老卡列表原有欠款 @SP042              
 if(ISNULL(@SP042,'0')='0') --不累加欠款              
 begin              
  select @curdebtamt=ISNULL(@curdebtamt,0)+SUM(ISNULL(curaccountdebtamt,0)) from  dcardchangeinfo where changecompid=@compid and changebillid=@billid               
 end              
 --老卡列表疗程账户欠款              
 select @oldprofillamt=SUM(ISNULL(proaccountkeepamt,0)) from  dcardchangeinfo where changecompid=@compid and changebillid=@billid               
 select @oldprodebtamt=SUM(ISNULL(proaccountdebtamt,0)) from  dcardchangeinfo where changecompid=@compid and changebillid=@billid               
            
               
 select @oldcardpointamt =SUM(isnull(accountbalance,0)) from cardaccount,dcardchangeinfo where changecompid=@compid and changebillid=@billid  and cardno=oldcardno  and accounttype=3            
   ----------------------------------------更新账户 Start-----------------------------------------------              
   --清空老卡账户              
   update cardaccount set accountbalance=0,accountdebts=0 from cardaccount,dcardchangeinfo where changecompid=@compid and changebillid=@billid  and cardno=oldcardno              
   --更新新卡储值账户              
   if not exists(select 1 from cardaccount where   cardno = @oldcardno and accounttype=2)                    
   begin                    
     insert into cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts)                     
     values(@compid,@oldcardno,2,ISNULL(@curfillamt,0),ISNULL(@curdebtamt,0))                    
   end                  
   else              
   begin              
    update cardaccount set accountbalance=ISNULL(accountbalance,0)+ISNULL(@curfillamt,0),accountdebts=ISNULL(accountdebts,0)+ISNULL(@curdebtamt,0) where cardno=@oldcardno and accounttype=2              
   end              
   if(ISNULL(@oldprofillamt,0)<>0 or ISNULL(@oldprodebtamt,0)<>0)              
   begin              
    --更新新卡疗程账户              
    if not exists(select 1 from cardaccount where   cardno = @oldcardno and accounttype=4)                    
    begin                    
     insert into cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts)                     
     values(@compid,@oldcardno,4,ISNULL(@oldprofillamt,0),ISNULL(@oldprodebtamt,0))                    
    end                  
    else              
    begin              
     update cardaccount set accountbalance=ISNULL(accountbalance,0)+ISNULL(@oldprofillamt,0),accountdebts=ISNULL(accountdebts,0)+ISNULL(@oldprodebtamt,0) where cardno=@oldcardno and accounttype=4              
    end              
   end              
               
   if(ISNULL(@oldcardpointamt,0)<>0 )              
   begin              
    --更新新卡积分账户              
    if not exists(select 1 from cardaccount where   cardno = @oldcardno and accounttype=3)                    
    begin                    
     insert into cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts)                     
     values(@compid,@oldcardno,3,ISNULL(@oldcardpointamt,0),0)                    
    end                  
    else              
    begin              
     update cardaccount set accountbalance=ISNULL(accountbalance,0)+ISNULL(@oldcardpointamt,0) where cardno=@oldcardno and accounttype=3              
    end              
   end             
   ----------------------------------------更新账户 end-----------------------------------------------              
   select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@oldcardno               
   ----------------------------------------更新账户历史 Start-----------------------------------------------         
   if(ISNULL(@curfillamt,0)>0) --储值账户              
   begin              
  --生成账户历史              
  select top 1 @costaccount2lastamt=(case when changetype in (0,6,7,8,9,10) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@oldcardno  and changeaccounttype=2 order by chagedate desc,changeseqno desc               
  insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
  values(@compid,@oldcardno,2,isnull(@costaccountseqno,0),10,@curfillamt,'ZK',@billid,@changedate,@costaccount2lastamt)              
  set @costaccountseqno=isnull(@costaccountseqno,0)+1        
      
  -- 充值金额2W上送5%的卡金  账户编号 7    
  if(ISNULL(@curfillamt,0)>=20000 and ISNULL(@SP106,'')='1'  and ISNULL(@sendamtflag,0)=1)    
  begin    
   if exists(select 1 from cardaccount where cardno=@oldcardno and accounttype=6)      
      update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@curfillamt,0)*0.05,accountdatefrom=@changedate where cardno=@oldcardno and accounttype=6      
   else      
   begin      
     insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
     values(@compid,@oldcardno,6,ISNULL(@curfillamt,0)*0.05,0,@changedate,'','')      
   end      
   insert sendpointcard(sendcompid,sendbillid,sendtype,senddate,sourcebillid,sourcecardno,sourcedate,sourceamt,sendamt,sendpicflag)    
   values(@compid,@billid+'ZS',5,@changedate,@billid,@oldcardno,@changedate,@curfillamt,ISNULL(@curfillamt,0)*0.05,3)    
  end    
               
   end              
   if(ISNULL(@oldprofillamt,0)>0) --疗程账户              
   begin              
  select top 1 @costaccount2lastamt=(case when changetype in (0,6,7,8,9,10,11) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@oldcardno  and changeaccounttype=4 order by chagedate desc,changeseqno desc               
  insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)              
  values(@compid,@oldcardno,4,isnull(@costaccountseqno,0),10,@oldprofillamt,'ZK',@billid,@changedate,@costaccount2lastamt)              
  set @costaccountseqno=isnull(@costaccountseqno,0)+1              
   end              
   ----------------------------------------更新账户历史 end-----------------------------------------------              
   ----------------------------------------合并疗程明细 Start---------------------------------------------              
   select @prodetialseqno=MAX(proseqno) from cardproaccount where cardno=@oldcardno              
   insert cardproaccount(cardvesting,cardno,projectno,proseqno,propricetype,salecount,costcount,lastcount,saleamt,costamt,lastamt,saledate,cutoffdate,proremark,prostopeflag,exchangeseqno)              
   select cardvesting,@oldcardno,projectno,isnull(@prodetialseqno,0)+1+row_number() over(order by proseqno desc),propricetype,salecount,costcount,lastcount,saleamt,costamt,lastamt,saledate,cutoffdate,proremark,prostopeflag,exchangeseqno             
   from cardproaccount a,dcardchangeinfo b where b.changecompid=@compid and b.changebillid=@billid  and cardno=oldcardno              
   delete a from cardproaccount a,dcardchangeinfo b where b.changecompid=@compid and b.changebillid=@billid  and cardno=oldcardno              
   ----------------------------------------合并疗程明细 end-----------------------------------------------              
   ----------------------------------------合并交易明细 Start---------------------------------------------              
   update cardtransactionhistory set transactioncardno=@oldcardno              
   from cardtransactionhistory a,dcardchangeinfo b where b.changecompid=@compid and b.changebillid=@billid  and transactioncardno=oldcardno              
                 
   ----------------------------------------合并交易明细 end---------------------------------------------              
  end         
  end              
end 





alter procedure upg_handrechargecardbill_card      
@compid   varchar(10), --续卡公司            
@billid   varchar(20), --续卡单号       
@cardtype  varchar(20) --卡种      
as            
begin       
 --更新内部工号      
 update mcardrechargeinfo set firstsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and firstsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set secondsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and secondsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set thirdsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and thirdsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set fourthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and fourthsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set fifthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and fifthsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set sixthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and sixthsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set seventhsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and seventhsalerid=staffno and compno=@compid      
 update mcardrechargeinfo set eighthsalerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and eighthsalerid=staffno and compno=@compid  
 update mcardrechargeinfo set beautyManagerinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and beautyManager=staffno and compno=@compid      
 update mcardrechargeinfo set consultantinid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and consultant=staffno and compno=@compid        
 update mcardrechargeinfo set consultant1inid=manageno from mcardrechargeinfo,staffinfo where rechargecompid=@compid and rechargebillid=@billid and consultant1=staffno and compno=@compid        

 declare @salecardno    varchar(20)  --续卡卡号      
 declare @saledate    varchar(8)  --续卡日期      
 declare @saletime    varchar(9)  --续卡时间      
       
 declare @rechargetype   int    --续费方式( 0充值 ,6还款)        
 declare @rechargekeepamt  float   --充值金额      
 declare @rechargedebtamt  float   --欠款金额      
 declare @curcardamt    float   --异动前余额      
 declare @curcarddebtamt   float   --异动前欠款      
 declare @rechargeaccounttype varchar(10)  --充值账户      
 declare @acc4totalamt  float   --疗程总额      
 declare @carduselife float     
 declare @sendamtflag  int  
    
 select @carduselife=carduselife from cardtypeinfo where cardtypeno=@cardtype and cardtypemodeid='SCM'      
 declare @cutoffdate varchar(10)      
 select @cutoffdate=convert(varchar(10),dateadd(day,@carduselife,cast(@saledate as datetime)),120)      
       
 select @salecardno=rechargecardno,@saledate=rechargedate,@saletime=rechargetime,@rechargetype=rechargetype,      
        @rechargekeepamt=rechargekeepamt,@rechargedebtamt=rechargedebtamt,@curcardamt=curcardamt,@curcarddebtamt=curcarddebtamt,@rechargeaccounttype=rechargeaccounttype ,@sendamtflag=ISNULL(sendamtflag,0)       
 from mcardrechargeinfo with(nolock) where rechargecompid=@compid and rechargebillid=@billid      
       
 select @cutoffdate=substring(@cutoffdate,1,4)+substring(@cutoffdate,6,2)+substring(@cutoffdate,9,2)      
 select @acc4totalamt=sum(ISNULL(saleproamt,0)) from dsalecardproinfo with(nolock) where salecompid=@compid and salebillid=@billid and salebilltype=2      
       
 --更新账户金额      
 if(@rechargetype=0)--充值      
 begin      
  if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=CAST(@rechargeaccounttype as int))      
  begin      
    update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@rechargekeepamt,0),accountdebts=isnull(accountdebts,0)+ISNULL(@rechargedebtamt,0) where cardno=@salecardno and accounttype=CAST(@rechargeaccounttype as int)      
  end      
  else      
  begin      
   insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
   values(@compid,@salecardno,CAST(@rechargeaccounttype as int),ISNULL(@rechargekeepamt,0),ISNULL(@rechargedebtamt,0),@saledate,@cutoffdate,'')   
  end      
 end      
 else --还款      
 begin      
   update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@rechargekeepamt,0),accountdebts=isnull(accountdebts,0)-ISNULL(@rechargekeepamt,0) where cardno=@salecardno and accounttype=CAST(@rechargeaccounttype as int)      
 end      
 --新增账户历史      
  declare @costaccountseqno  float      
  select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@salecardno       
  insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)      
  values(@compid,@salecardno,CAST(@rechargeaccounttype as int),isnull(@costaccountseqno,0),0,@rechargekeepamt,'CZ',@billid,@saledate,@curcardamt)      
  set @costaccountseqno=isnull(@costaccountseqno,0)+1      
        
       
 --生成疗程信息      
  declare @proseqno float      
  select @proseqno=MAX(proseqno)+1 from cardproaccount with(nolock) where cardno=@salecardno       
  insert cardproaccount(cardvesting,cardno,projectno,proseqno,propricetype,salecount,costcount,lastcount,saleamt,costamt,lastamt,saledate,cutoffdate,proremark,createbilltype,createbillno)      
  select @compid,@salecardno,saleproid,ISNULL(@proseqno,0)+ISNULL(seleproseqno,0),saleprotype,ISNULL(saleprocount,0)+ISNULL(sendprocount,0),0,ISNULL(saleprocount,0)+ISNULL(sendprocount,0),      
  ISNULL(saleproamt,0),0,ISNULL(saleproamt,0),@saledate,procutoffdate,saleproremark,'CZ',@billid       
  from dsalecardproinfo where salecompid=@compid and salebillid=@billid and salebilltype=2      
        
  if(ISNULL(@acc4totalamt,0)>0)      
  begin      
 if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=4)      
  update cardaccount set accountbalance=isnull(accountbalance,0)+@acc4totalamt where cardno=@salecardno and accounttype=4      
 else      
 begin      
  insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
  values(@compid,@salecardno,4,@acc4totalamt,0,@saledate,@cutoffdate,'')      
 end      
 declare @costaccount4lastamt float       
 select top 1 @costaccount4lastamt=(case when changetype in (0,6) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@salecardno  and changeaccountt
ype=4 order by chagedate desc,changeseqno desc       
 insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)      
 values(@compid,@salecardno,4,isnull(@costaccountseqno,0),0,@acc4totalamt,'CZ',@billid,@saledate,isnull(@costaccount4lastamt,0))      
  end   
  declare @SP106 varchar(2)  
  select @SP106=paramvalue from sysparaminfo where compid=@compid and paramid='SP106'  
   -- 充值金额2W上送5%的卡金  账户编号 7  
  if(ISNULL(@rechargekeepamt,0)>=20000 and ISNULL(@SP106,'')='1' and ISNULL(@sendamtflag,0)=1)  
  begin  
 if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=6)    
   update cardaccount set accountbalance=isnull(accountbalance,0)+ISNULL(@rechargekeepamt,0)*0.05,accountdatefrom=@saledate,accountdateend=@cutoffdate where cardno=@salecardno and accounttype=6    
 else    
 begin    
  insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)    
  values(@compid,@salecardno,6,ISNULL(@rechargekeepamt,0)*0.05,0,@saledate,@cutoffdate,'')    
 end    
 insert sendpointcard(sendcompid,sendbillid,sendtype,senddate,sourcebillid,sourcecardno,sourcedate,sourceamt,sendamt,sendpicflag)  
 values(@compid,@billid+'ZS',1,@saledate,@billid,@salecardno,@saledate,@rechargekeepamt,ISNULL(@rechargekeepamt,0)*0.05,3)  
  end     
end 






--mgx20140904 end

alter procedure upg_handsalecardbill_card      
@compid   varchar(10), --销售公司            
@billid   varchar(20), --销售单号       
@cardtype  varchar(20) --卡种      
as            
begin       
 --更新内部工号      
 update msalecardinfo set firstsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and firstsalerid=staffno and compno=@compid      
 update msalecardinfo set secondsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and secondsalerid=staffno and compno=@compid      
 update msalecardinfo set thirdsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and thirdsalerid=staffno and compno=@compid      
 update msalecardinfo set fourthsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and fourthsalerid=staffno and compno=@compid      
 update msalecardinfo set fifthsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and fifthsalerid=staffno and compno=@compid      
 update msalecardinfo set sixthsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and sixthsalerid=staffno and compno=@compid      
 update msalecardinfo set seventhsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and seventhsalerid=staffno and compno=@compid      
 update msalecardinfo set eighthsalerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and eighthsalerid=staffno and compno=@compid    
 update msalecardinfo set beautyManagerinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and beautyManager=staffno and compno=@compid        
 update msalecardinfo set consultantinid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and consultant=staffno and compno=@compid        
 update msalecardinfo set consultant1inid=manageno from msalecardinfo,staffinfo where salecompid=@compid and salebillid=@billid and consultant1=staffno and compno=@compid        
 
 declare @salecardno   varchar(20)  --销售卡号      
 declare @saledate   varchar(8)  --销售日期      
 declare @saletime   varchar(9)  --销售时间      
 declare @membername   varchar(30)  --会员姓名      
 declare @memberphone  varchar(20)  --会员手机      
 declare @membersex   int    --会员性别      
 declare @memberpcid   varchar(30)  --会员生分证号      
 declare @memberbirthday  varchar(8)  --会员生日      
 declare @acc2keepamt  float   --储值金额      
 declare @debtamt   float   --储值欠款(AMN不允许欠款)      
 declare @acc2totalamt  float   --储值总额      
 declare @acc4totalamt  float   --疗程总额      
 declare @paykeeptotalamt float   --支付总额      
 declare @paydebttotalamt float   --支付总欠款      
 declare @corpscardno  varchar(20)  --团购号      
 declare @actifycardno  varchar(20)  --活动券号     
 declare @sendamtflag  int    
      
 select @salecardno=salecardno,@saledate=saledate,@saletime=saletime,@membername=membername,@memberphone=memberphone,     
 @membersex=membersex,@memberpcid=memberpcid,@memberbirthday=memberbirthday,@corpscardno=corpscardno ,@sendamtflag=ISNULL(sendamtflag,0),@actifycardno=activtycardno      
 from msalecardinfo with(nolock) where salecompid=@compid and salebillid=@billid      
       
      
 select @paykeeptotalamt=SUM(ISNULL(payamt,0)) from dpayinfo with(nolock)  where paycompid=@compid and paybillid=@billid and paybilltype='SK' and ISNULL(paymode,'')<>'5'      
 select @paydebttotalamt=SUM(ISNULL(payamt,0)) from dpayinfo with(nolock)  where paycompid=@compid and paybillid=@billid and paybilltype='SK' and ISNULL(paymode,'')='5'      
 select @acc4totalamt=sum(ISNULL(saleproamt,0)) from dsalecardproinfo with(nolock) where salecompid=@compid and salebillid=@billid and salebilltype=1      
 set @acc2totalamt=ISNULL(@paykeeptotalamt,0)-ISNULL(@acc4totalamt,0)      
       
 --更新会员卡号      
  --获得该卡种的有效期限      
  declare @carduselife float      
  select @carduselife=carduselife from cardtypeinfo where cardtypeno=@cardtype and cardtypemodeid='SCM'      
  declare @cutoffdate varchar(10)      
  select @cutoffdate=convert(varchar(10),dateadd(day,@carduselife,cast(@saledate as datetime)),120)      
  select @cutoffdate=substring(@cutoffdate,1,4)+substring(@cutoffdate,6,2)+substring(@cutoffdate,9,2)      
  update cardinfo set salecarddate=@saledate,cutoffdate=@cutoffdate,cardstate=4,salebillno=@billid,cardsource=0 where cardno=@salecardno      
 --新增账户金额      
  if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=2)      
   update cardaccount set accountbalance=@acc2totalamt,accountdatefrom=@saledate,accountdateend=@cutoffdate where cardno=@salecardno and accounttype=2      
  else      
  begin      
   insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
   values(@compid,@salecardno,2,@acc2totalamt,0,@saledate,@cutoffdate,'')      
  end      
  if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=4)      
   update cardaccount set accountbalance=@acc4totalamt,accountdatefrom=@saledate,accountdateend=@cutoffdate where cardno=@salecardno and accounttype=4      
  else      
  begin      
   insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
   values(@compid,@salecardno,4,@acc4totalamt,0,@saledate,@cutoffdate,'')      
  end      
 --新增会员基本资料      
  if exists(select 1 from memberinfo where cardnotomemberno=@salecardno )      
   update memberinfo set membervesting=@compid,memberno=@salecardno,membercreatedate=@saledate,      
    membername=@membername,membertphone=@memberphone,membersex=@membersex,memberpaperworkno=@memberpcid,      
    memberbirthday=@memberbirthday where cardnotomemberno=@salecardno      
  else      
  begin      
   insert memberinfo(membervesting,memberno,membercreatedate,membername,membermphone,membersex,memberpaperworkno,memberbirthday,cardnotomemberno)      
   values(@compid,@salecardno,@saledate,@membername,@memberphone,@membersex,@memberpcid,@memberbirthday,@salecardno)      
  end      
 --新增账户历史      
  declare @costaccountseqno  float      
  declare @costaccount2lastamt float  --储值账户前次余额      
  declare @costaccount4lastamt float  --疗程账户前次余额      
      
  select @costaccountseqno=MAX(changeseqno)+1 from cardaccountchangehistory where changecardno=@salecardno       
  if(ISNULL(@acc2totalamt,0)>0) --储值账户      
  begin      
    --生成账户历史      
    select top 1 @costaccount2lastamt=(case when changetype in (0,6,7,8,9,10,11) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@salecardno  and 
 
 changeaccounttype=2 order by chagedate desc,changeseqno desc       
    insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)      
    values(@compid,@salecardno,2,isnull(@costaccountseqno,0),0,@acc2totalamt,'SK',@billid,@saledate,@costaccount2lastamt)      
    set @costaccountseqno=isnull(@costaccountseqno,0)+1      
  end      
       
  if(ISNULL(@acc4totalamt,0)>0) --疗程账户      
  begin       
    --生成账户历史      
    select top 1 @costaccount4lastamt=(case when changetype in (0,6,7,8,9,10,11) then ISNULL(changebeforeamt,0)+isnull(changeamt,0) else ISNULL(changebeforeamt,0)-isnull(changeamt,0) end ) from cardaccountchangehistory where changecardno=@salecardno  and changeaccounttype=4 order by chagedate desc,changeseqno desc       
    insert cardaccountchangehistory(changecompid,changecardno,changeaccounttype,changeseqno,changetype,changeamt,changebilltype,changebillno,chagedate,changebeforeamt)      
    values(@compid,@salecardno,4,isnull(@costaccountseqno,0),0,@acc4totalamt,'SK',@billid,@saledate,@costaccount4lastamt)      
    set @costaccountseqno=isnull(@costaccountseqno,0)+1      
          
  end      
 --新增异动历史      
  declare @saleaccountseqno  float      
  select @saleaccountseqno=MAX(changeseqno)+1 from cardchangehistory where changecardno=@salecardno       
  insert cardchangehistory(changecompid,changecardno,changeseqno,changetype,changebillid,beforestate,afterstate,chagedate,targetcardno)      
  values(@compid,@salecardno,isnull(@saleaccountseqno,0),2,@billid,0,4,@saledate,'')      
       
 --生成疗程信息      
  declare @proseqno float      
  select @proseqno=MAX(proseqno)+1 from cardproaccount with(nolock) where cardno=@salecardno       
  insert cardproaccount(cardvesting,cardno,projectno,proseqno,propricetype,salecount,costcount,lastcount,saleamt,costamt,lastamt,saledate,cutoffdate,proremark,createbilltype,createbillno)      
  select @compid,@salecardno,saleproid,ISNULL(@proseqno,0)+ISNULL(seleproseqno,0),saleprotype,ISNULL(saleprocount,0)+ISNULL(sendprocount,0),0,ISNULL(saleprocount,0)+ISNULL(sendprocount,0),      
  ISNULL(saleproamt,0),0,ISNULL(saleproamt,0),@saledate,procutoffdate,saleproremark,'SK', @billid      
  from dsalecardproinfo where salecompid=@compid and salebillid=@billid and salebilltype=1      
        
 --处理团购信息      
 if(ISNULL(@corpscardno,'')<>'')      
 begin      
  update corpsbuyinfo set corpssate=2,useincompid=@compid,useinbillno=@billid,useindate =@saledate where corpscardno=@corpscardno      
 end      
     
   --处理活动券  
 if(ISNULL(@actifycardno,'')<>'')      
 begin      
 update activitycardinfo set salecardflag=1,salecardcompno=@compid,salecardbillno=@billid where cardno=@actifycardno    
 declare @sendquanflag int --是否赠送电子券  
 declare @sendquanno  varchar(20)--电子券号  
 select @sendquanflag=sendquanflag,@sendquanno=sendquanno from activitycardinfo where cardno=@actifycardno  
 if(ISNULL(@sendquanflag,0)=1 and ISNULL(@sendquanno,'')<>'')--赠送电子券  
 begin  
  declare @dzqcutoffdate varchar(10)      
  select @dzqcutoffdate=convert(varchar(10),dateadd(day,31,cast(@saledate as datetime)),120)      
  select @dzqcutoffdate=substring(@dzqcutoffdate,1,4)+substring(@dzqcutoffdate,6,2)+substring(@dzqcutoffdate,9,2)  
  declare @dzqfaceamt float  
  select @dzqfaceamt=expericeitemprice from activityrandcardinfo where randcode=@sendquanno  
  insert nointernalcardinfo(cardvesting,cardno,cardtype,cardfaceamt,carduseflag,entrytype,cardstate,oldvalidate,lastvalidate,enabledate,uespassward,createtype)  
  values(@compid,@sendquanno,1,@dzqfaceamt,1,1,1,@saledate,@dzqcutoffdate,@saledate,0,0)  
    
  insert dnointernalcardinfo(cardvesting,cardno,seqno,ineritemno,entrycount,usecount,lastcount,entryamt,useamt,lastamt)  
  select @compid,@sendquanno,row_number() over(order by expericeitemno desc) fid,expericeitemno,expericeitemcount,0,expericeitemcount,expericeitemprice,0,expericeitemprice  
  from activityrandcardinfo where randcode=@sendquanno  
 end  
 end      
     
      
  declare @SP106 varchar(2)    
  select @SP106=paramvalue from sysparaminfo where compid=@compid and paramid='SP106'    
  -- 充值金额2W上送5%的卡金  账户编号 7    
  if(ISNULL(@acc2totalamt,0)>=20000  and ISNULL(@SP106,'')='1' and ISNULL(@sendamtflag,0)=1)    
  begin    
 if exists(select 1 from cardaccount where cardno=@salecardno and accounttype=6)      
   update cardaccount set accountbalance=ISNULL(@acc2totalamt,0)*0.05,accountdatefrom=@saledate,accountdateend=@cutoffdate where cardno=@salecardno and accounttype=6      
 else      
 begin      
  insert cardaccount(cardvesting,cardno,accounttype,accountbalance,accountdebts,accountdatefrom,accountdateend,accountremark)      
  values(@compid,@salecardno,6,ISNULL(@acc2totalamt,0)*0.05,0,@saledate,@cutoffdate,'')      
 end      
 insert sendpointcard(sendcompid,sendbillid,sendtype,senddate,sourcebillid,sourcecardno,sourcedate,sourceamt,sendamt,sendpicflag)    
 values(@compid,@billid+'ZS',0,@saledate,@billid,@salecardno,@saledate,@acc2totalamt,ISNULL(@acc2totalamt,0)*0.05,3)    
  end    
end 