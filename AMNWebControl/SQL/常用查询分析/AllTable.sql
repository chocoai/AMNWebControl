USE [MasterDatabase2014]
GO
/****** Object:  Table [dbo].[ZCTAB]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZCTAB](
	[A] [nvarchar](255) NULL,
	[B] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warehousepurview]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[warehousepurview](
	[compno] [varchar](10) NOT NULL,
	[warehouseno] [varchar](10) NOT NULL,
	[staffno] [varchar](20) NOT NULL,
	[staffname] [varchar](30) NULL,
 CONSTRAINT [PK_warehousepurview] PRIMARY KEY CLUSTERED 
(
	[compno] ASC,
	[warehouseno] ASC,
	[staffno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[useroverall]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[useroverall](
	[userno] [varchar](20) NOT NULL,
	[modetype] [varchar](5) NOT NULL,
	[modevalue] [varchar](20) NOT NULL,
	[descriptions] [varchar](10) NULL,
 CONSTRAINT [PK_useroverall] PRIMARY KEY NONCLUSTERED 
(
	[userno] ASC,
	[modetype] ASC,
	[modevalue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usereditright]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usereditright](
	[userno] [varchar](10) NOT NULL,
	[sysmodeno] [varchar](20) NOT NULL,
	[functionno] [varchar](20) NOT NULL,
	[browsepurview] [varchar](5) NULL,
	[editpurview] [varchar](5) NULL,
	[exportpurview] [varchar](5) NULL,
	[postpurview] [varchar](5) NULL,
	[confirmpurview] [varchar](5) NULL,
	[invalidpurview] [varchar](5) NULL,
	[disabledflag] [int] NULL,
 CONSTRAINT [PK_usereditright] PRIMARY KEY NONCLUSTERED 
(
	[userno] ASC,
	[sysmodeno] ASC,
	[functionno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuserlogininfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysuserlogininfo](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[logindate] [varchar](8) NULL,
	[logintime] [varchar](6) NULL,
	[loginipno] [varchar](50) NULL,
	[loginmacno] [varchar](50) NULL,
	[loginuserid] [varchar](30) NULL,
	[loginusername] [varchar](40) NULL,
	[logincompid] [varchar](10) NULL,
	[logincompname] [varchar](50) NULL,
 CONSTRAINT [PK_sysuserlogininfo] PRIMARY KEY NONCLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuserinfobak]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysuserinfobak](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[userno] [varchar](20) NOT NULL,
	[userpwd] [varchar](100) NULL,
	[enableflag] [int] NULL,
	[userrole] [varchar](5) NULL,
	[frominnerno] [varchar](20) NULL,
	[fromcompno] [varchar](10) NULL,
	[datefrom] [varchar](10) NULL,
	[dateto] [varchar](10) NULL,
	[operationerno] [varchar](20) NULL,
	[operationdate] [varchar](10) NULL,
	[operationtime] [varchar](10) NULL,
 CONSTRAINT [PK_sysuserinfobak] PRIMARY KEY NONCLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysuserinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysuserinfo](
	[userno] [varchar](20) NOT NULL,
	[userpwd] [varchar](100) NULL,
	[enableflag] [int] NULL,
	[userrole] [varchar](5) NULL,
	[frominnerno] [varchar](20) NULL,
	[fromcompno] [varchar](10) NULL,
	[datefrom] [varchar](10) NULL,
	[dateto] [varchar](10) NULL,
	[callcenterqueue] [varchar](30) NULL,
	[callcenterinterface] [varchar](40) NULL,
 CONSTRAINT [PK_sysuserinfo] PRIMARY KEY NONCLUSTERED 
(
	[userno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysrolemode]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysrolemode](
	[roleno] [varchar](5) NOT NULL,
	[sysmodeno] [varchar](20) NOT NULL,
	[functionno] [varchar](20) NOT NULL,
	[browsepurview] [varchar](5) NULL,
	[editpurview] [varchar](5) NULL,
	[exportpurview] [varchar](5) NULL,
	[postpurview] [varchar](5) NULL,
	[confirmpurview] [varchar](5) NULL,
	[invalidpurview] [varchar](5) NULL,
	[disabledflag] [int] NULL,
 CONSTRAINT [PK_sysrolemode] PRIMARY KEY NONCLUSTERED 
(
	[roleno] ASC,
	[sysmodeno] ASC,
	[functionno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysparaminfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysparaminfo](
	[compid] [varchar](10) NOT NULL,
	[paramid] [varchar](10) NOT NULL,
	[paramname] [varchar](100) NULL,
	[paramvalue] [varchar](100) NULL,
	[parammark] [varchar](50) NULL,
 CONSTRAINT [PK_sysparaminfo] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[paramid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysoperationlog]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysoperationlog](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](10) NOT NULL,
	[program] [varchar](10) NOT NULL,
	[operation] [varchar](1) NOT NULL,
	[operationdate] [varchar](8) NOT NULL,
	[operationtime] [varchar](8) NOT NULL,
	[origatedate] [varchar](8) NULL,
	[compid] [varchar](10) NULL,
	[keyvalue1] [varchar](20) NULL,
	[keyvalue2] [varchar](20) NULL,
	[keyvalue3] [varchar](20) NULL,
	[keyvalue4] [varchar](20) NULL,
 CONSTRAINT [PK_sysoperationlog_id] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysmodepurview]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysmodepurview](
	[curRoleno] [varchar](10) NOT NULL,
	[curpurviewno] [varchar](10) NOT NULL,
	[purviewname] [varchar](40) NULL,
	[remark] [varchar](50) NULL,
 CONSTRAINT [PK_sysmodepurview] PRIMARY KEY NONCLUSTERED 
(
	[curpurviewno] ASC,
	[curRoleno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysmodeinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysmodeinfo](
	[sysversion] [varchar](10) NOT NULL,
	[upmoduleno] [varchar](20) NOT NULL,
	[curmoduleno] [varchar](20) NOT NULL,
	[modulename] [varchar](40) NULL,
	[modulevel] [int] NULL,
	[moduletype] [varchar](5) NULL,
	[remark] [varchar](100) NULL,
	[moduletitle] [varchar](20) NULL,
	[moduleurl] [varchar](50) NULL,
	[modulewidth] [int] NULL,
	[moduleheight] [int] NULL,
	[showtype] [int] NULL,
 CONSTRAINT [PK_sysmodeinfo] PRIMARY KEY NONCLUSTERED 
(
	[sysversion] ASC,
	[upmoduleno] ASC,
	[curmoduleno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[syscommoninfomode]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[syscommoninfomode](
	[modeid] [varchar](10) NOT NULL,
	[modetype] [int] NOT NULL,
	[modename] [varchar](40) NULL,
	[modesource] [varchar](20) NULL,
	[parentmodeid] [varchar](10) NULL,
	[CREATEdate] [varchar](10) NULL,
	[CREATEemp] [varchar](20) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_syscommoninfomode] PRIMARY KEY CLUSTERED 
(
	[modeid] ASC,
	[modetype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysaccountforpaymode]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysaccountforpaymode](
	[paymode] [varchar](5) NOT NULL,
	[accounttype] [varchar](5) NULL,
 CONSTRAINT [PK_sysaccountforpaymode] PRIMARY KEY CLUSTERED 
(
	[paymode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[supplierinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[supplierinfo](
	[supplierid] [varchar](20) NOT NULL,
	[suppliername] [varchar](40) NULL,
	[suppliersname] [varchar](30) NULL,
	[supplierphone] [varchar](20) NULL,
	[supplierfex] [varchar](20) NULL,
	[supplieremail] [varchar](20) NULL,
	[supplierurl] [varchar](20) NULL,
	[supplieraddress] [varchar](80) NULL,
	[supplierpos] [varchar](20) NULL,
	[supplierremark] [varchar](40) NULL,
	[miantoucher] [varchar](40) NULL,
	[supplierpassword] [varchar](40) NULL,
	[suppliermobilephone] [varchar](20) NULL,
	[supplierstate] [int] NULL,
 CONSTRAINT [PK_supplierinfo] PRIMARY KEY CLUSTERED 
(
	[supplierid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staffrewardinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffrewardinfo](
	[entrycompid] [varchar](10) NOT NULL,
	[entrybillid] [varchar](20) NOT NULL,
	[entryflag] [int] NULL,
	[handcompid] [varchar](10) NULL,
	[handstaffid] [varchar](20) NULL,
	[handstaffinid] [varchar](20) NULL,
	[entryreason] [varchar](200) NULL,
	[entrydate] [varchar](8) NULL,
	[entrytype] [varchar](8) NULL,
	[billflag] [int] NULL,
	[checkrewardstaff] [varchar](20) NULL,
	[checkrewardstaffname] [varchar](40) NULL,
	[checkrewardremark] [varchar](800) NULL,
	[checkrewardamt] [float] NULL,
	[checkpersonid] [varchar](20) NULL,
	[checkdate] [varchar](8) NULL,
	[checkflag] [int] NULL,
	[checkinheadrewardstaff] [varchar](20) NULL,
	[checkinheadrewardstaffname] [varchar](40) NULL,
	[checkinheadrewardremark] [varchar](800) NULL,
	[checkinheadrewardamt] [float] NULL,
	[checkinheadpersonid] [varchar](20) NULL,
	[checkinheaddate] [varchar](8) NULL,
	[checkinheadflag] [int] NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_staffrewardinfo] PRIMARY KEY CLUSTERED 
(
	[entrycompid] ASC,
	[entrybillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staffkqrecordinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffkqrecordinfo](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[machineid] [varchar](20) NULL,
	[personid] [varchar](10) NULL,
	[stat] [int] NULL,
	[ddate] [varchar](10) NULL,
	[ttime] [varchar](10) NULL,
	[worktype] [int] NULL,
	[operationer] [varchar](20) NULL,
	[operationdate] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_staffkqrecordinfo] PRIMARY KEY NONCLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staffinfodispatch]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffinfodispatch](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[manageno] [varchar](20) NULL,
	[oldcompid] [varchar](10) NULL,
	[newcompid] [varchar](10) NULL,
	[oldempid] [varchar](20) NULL,
	[olddepid] [varchar](10) NULL,
	[oldpostion] [varchar](10) NULL,
	[oldyjtype] [varchar](5) NULL,
	[oldyjrate] [float] NULL,
	[oldyjamt] [float] NULL,
	[effectivedate] [varchar](8) NULL,
 CONSTRAINT [PK_staffinfodispatch] PRIMARY KEY NONCLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staffinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffinfo](
	[compno] [varchar](10) NOT NULL,
	[staffno] [varchar](20) NOT NULL,
	[staffname] [varchar](20) NULL,
	[staffename] [varchar](20) NULL,
	[staffsex] [int] NULL,
	[department] [varchar](10) NULL,
	[position] [varchar](20) NULL,
	[arrivaldate] [varchar](8) NULL,
	[leavedate] [varchar](8) NULL,
	[contractdate] [varchar](8) NULL,
	[pccid] [varchar](20) NULL,
	[educational] [varchar](5) NULL,
	[birthdate] [varchar](8) NULL,
	[height] [float] NULL,
	[bodyweight] [float] NULL,
	[aaddress] [varchar](160) NULL,
	[qqno] [varchar](20) NULL,
	[mobilephone] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[healthno] [varchar](20) NULL,
	[healthdate] [varchar](20) NULL,
	[curstate] [varchar](1) NULL,
	[socialsecurity] [float] NULL,
	[remark] [varchar](200) NULL,
	[searchpassword] [varchar](10) NULL,
	[staffpassword] [varchar](30) NULL,
	[manageno] [varchar](20) NULL,
	[reservecontect] [varchar](30) NULL,
	[reservephone] [varchar](30) NULL,
	[reserveaddress] [varchar](160) NULL,
	[introductioner] [varchar](20) NULL,
	[leveltype] [int] NULL,
	[basesalary] [float] NULL,
	[businessflag] [int] NULL,
	[banktype] [varchar](5) NULL,
	[bankno] [varchar](30) NULL,
	[resulttye] [varchar](5) NULL,
	[resultrate] [float] NULL,
	[baseresult] [float] NULL,
	[salaryflag] [int] NULL,
	[fingerno] [int] NULL,
	[fingernotext] [varchar](500) NULL,
	[positiontitle] [varchar](20) NULL,
 CONSTRAINT [PK_staffinfo] PRIMARY KEY CLUSTERED 
(
	[compno] ASC,
	[staffno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staffhistory]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffhistory](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[manageno] [varchar](20) NULL,
	[changetype] [varchar](20) NULL,
	[oldcompid] [varchar](10) NULL,
	[oldempid] [varchar](20) NULL,
	[olddepid] [varchar](10) NULL,
	[oldpostion] [varchar](10) NULL,
	[oldsalary] [float] NULL,
	[oldyjtype] [varchar](5) NULL,
	[oldyjrate] [float] NULL,
	[oldyjamt] [float] NULL,
	[newcompid] [varchar](10) NULL,
	[newempid] [varchar](20) NULL,
	[newdepid] [varchar](10) NULL,
	[newpostion] [varchar](10) NULL,
	[newsalary] [float] NULL,
	[newyjtype] [varchar](5) NULL,
	[newyjrate] [float] NULL,
	[newyjramt] [float] NULL,
	[effectivedate] [varchar](8) NULL,
	[optionbill] [varchar](20) NULL,
	[changemark] [varchar](300) NULL,
 CONSTRAINT [PK_staffhistory] PRIMARY KEY NONCLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staffchangeinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffchangeinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changebillid] [varchar](20) NOT NULL,
	[changetype] [int] NOT NULL,
	[changestaffno] [varchar](20) NULL,
	[appchangecompid] [varchar](10) NULL,
	[staffpcid] [varchar](20) NULL,
	[staffphone] [varchar](20) NULL,
	[staffmangerno] [varchar](20) NULL,
	[changedate] [varchar](8) NULL,
	[validatestartdate] [varchar](8) NULL,
	[validateenddate] [varchar](8) NULL,
	[beforedepartment] [varchar](20) NULL,
	[beforepostation] [varchar](10) NULL,
	[beforesalary] [float] NULL,
	[beforesalarytype] [int] NULL,
	[beforeyejitype] [varchar](5) NULL,
	[beforeyejirate] [float] NULL,
	[beforeyejiamt] [float] NULL,
	[aftercompid] [varchar](20) NULL,
	[afterstaffno] [varchar](20) NULL,
	[afterdepartment] [varchar](20) NULL,
	[afterpostation] [varchar](10) NULL,
	[aftersalary] [float] NULL,
	[aftersalarytype] [int] NULL,
	[afteryejitype] [varchar](5) NULL,
	[afteryejirate] [float] NULL,
	[afteryejiamt] [float] NULL,
	[leaveltype] [int] NULL,
	[checkcompid] [varchar](10) NULL,
	[checkstaffid] [varchar](20) NULL,
	[checkdate] [varchar](8) NULL,
	[checkflag] [int] NULL,
	[checkinheadcompid] [varchar](10) NULL,
	[checkinheadstaffid] [varchar](20) NULL,
	[checkinheaddate] [varchar](8) NULL,
	[checkinheadflag] [int] NULL,
	[comfirmcompid] [varchar](10) NULL,
	[comfirmstaffid] [varchar](20) NULL,
	[comfirmdate] [varchar](8) NULL,
	[comfirmflag] [int] NULL,
	[billflag] [int] NULL,
	[remark] [varchar](200) NULL,
 CONSTRAINT [PK_staffchangeinfo] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changebillid] ASC,
	[changetype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[staff_work_salary]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staff_work_salary](
	[compid] [varchar](10) NOT NULL,
	[person_inid] [varchar](20) NOT NULL,
	[salary_date] [varchar](10) NOT NULL,
	[oldcostcount] [float] NULL,
	[newcostcount] [float] NULL,
	[trcostcount] [float] NULL,
	[cashbigcost] [float] NULL,
	[cashsmallcost] [float] NULL,
	[cashhulicost] [float] NULL,
	[cardbigcost] [float] NULL,
	[cardsmallcost] [float] NULL,
	[cardhulicost] [float] NULL,
	[cardprocost] [float] NULL,
	[cardsgcost] [float] NULL,
	[cardpointcost] [float] NULL,
	[projectdycost] [float] NULL,
	[cashdycost] [float] NULL,
	[tmcardcost] [float] NULL,
	[salegoodsamt] [float] NULL,
	[salecardsamt] [float] NULL,
	[prochangeamt] [float] NULL,
	[saletmkamt] [float] NULL,
	[qhpayinner] [float] NULL,
	[qhpayouter] [float] NULL,
	[jdpayinner] [float] NULL,
	[smpayinner] [float] NULL,
	[staffyeji] [float] NULL,
	[staffcashyeji] [float] NULL,
	[stafftotalyeji] [float] NULL,
 CONSTRAINT [PK_staff_work_salary] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[person_inid] ASC,
	[salary_date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[smgInfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[smgInfo](
	[sendcompid] [varchar](10) NOT NULL,
	[sendbillid] [varchar](30) NOT NULL,
	[senddate] [varchar](20) NULL,
	[sendtime] [varchar](20) NULL,
	[sendstate] [int] NULL,
	[userid] [varchar](20) NULL,
	[sendcontent] [varchar](500) NULL,
 CONSTRAINT [PK_smgInfo] PRIMARY KEY NONCLUSTERED 
(
	[sendcompid] ASC,
	[sendbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[smgdetails]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[smgdetails](
	[sendcompid] [varchar](30) NOT NULL,
	[sendbillid] [varchar](30) NOT NULL,
	[smgbernme] [varchar](20) NULL,
	[smgphone] [varchar](15) NULL,
	[cardno] [varchar](50) NULL,
	[cardtype] [varchar](20) NULL,
 CONSTRAINT [PK_smgdetails] PRIMARY KEY NONCLUSTERED 
(
	[sendcompid] ASC,
	[sendbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sendpointcard]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sendpointcard](
	[sendcompid] [varchar](10) NOT NULL,
	[sendbillid] [varchar](20) NOT NULL,
	[sendtype] [int] NOT NULL,
	[senddate] [varchar](10) NULL,
	[sendempid] [varchar](20) NULL,
	[sourcebillid] [varchar](20) NULL,
	[sourcecardno] [varchar](20) NULL,
	[sourcedate] [varchar](10) NULL,
	[sourceamt] [float] NULL,
	[sendcardno] [varchar](20) NULL,
	[sendamt] [float] NULL,
	[sendmark] [varchar](100) NULL,
	[operation] [varchar](20) NULL,
	[membername] [varchar](20) NULL,
	[memberphone] [varchar](20) NULL,
	[sendrateflag] [int] NULL,
	[sendpicflag] [int] NULL,
	[picno] [varchar](20) NULL,
	[firstdateno] [varchar](20) NULL,
 CONSTRAINT [PK_sendpointcard] PRIMARY KEY CLUSTERED 
(
	[sendcompid] ASC,
	[sendbillid] ASC,
	[sendtype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[refer]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[refer](
	[referid] [int] IDENTITY(1,1) NOT NULL,
	[callbillid] [varchar](30) NOT NULL,
	[calluserid] [varchar](50) NULL,
	[refertime] [varchar](100) NULL,
	[refercomply] [varchar](1000) NULL,
	[refercards] [varchar](1000) NULL,
	[referproject] [varchar](1000) NULL,
	[referelse] [varchar](100) NULL,
	[referdetails] [varchar](2000) NULL,
	[feferstate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[referid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[purchaseregister]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[purchaseregister](
	[registercompid] [varchar](10) NOT NULL,
	[registercardno] [varchar](20) NOT NULL,
	[registercardtype] [varchar](10) NULL,
	[membername] [varchar](20) NULL,
	[memberphone] [varchar](20) NULL,
	[memberbrithday] [varchar](10) NULL,
	[membersex] [int] NULL,
	[cardbalance] [float] NULL,
	[registerperson] [varchar](20) NULL,
	[registerdate] [varchar](8) NULL,
	[registertime] [varchar](8) NULL,
	[cardvesting] [varchar](10) NULL,
	[registerpcid] [varchar](30) NULL,
 CONSTRAINT [PK_purchaseregister] PRIMARY KEY CLUSTERED 
(
	[registercompid] ASC,
	[registercardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[promotionsinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[promotionsinfo](
	[compid] [varchar](10) NOT NULL,
	[billid] [varchar](20) NOT NULL,
	[promotionstype] [int] NULL,
	[promotionscode] [varchar](20) NULL,
	[promotionsstore] [varchar](10) NULL,
	[promotionsvalue] [float] NULL,
	[startdate] [varchar](10) NULL,
	[enddate] [varchar](10) NULL,
	[promotionsreason] [varchar](200) NULL,
	[promotionsstate] [int] NULL,
	[promotionsempid] [varchar](10) NULL,
	[promotionsdate] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_promotionsinfo] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[billid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[projectnameinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projectnameinfo](
	[prjno] [varchar](20) NOT NULL,
	[prjname] [varchar](50) NULL,
	[prjtype] [varchar](5) NULL,
	[prjpricetype] [int] NULL,
	[prjreporttype] [varchar](10) NULL,
 CONSTRAINT [PK_projectnameinfo] PRIMARY KEY CLUSTERED 
(
	[prjno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[projectinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projectinfo](
	[prjmodeId] [varchar](10) NOT NULL,
	[prjno] [varchar](20) NOT NULL,
	[prjname] [varchar](50) NULL,
	[prjtype] [varchar](5) NULL,
	[prjpricetype] [int] NULL,
	[prjreporttype] [varchar](10) NULL,
	[saleunit] [varchar](5) NULL,
	[saleprice] [float] NULL,
	[msalecount] [float] NULL,
	[msaleprice] [float] NULL,
	[rsalecount] [float] NULL,
	[rsaleprice] [float] NULL,
	[hsalecount] [float] NULL,
	[hsaleprice] [float] NULL,
	[ysalecount] [float] NULL,
	[ysaleprice] [float] NULL,
	[onecountprice] [float] NULL,
	[onepageprice] [float] NULL,
	[memberprice] [float] NULL,
	[salelowprice] [float] NULL,
	[needhairflag] [int] NULL,
	[useflag] [int] NULL,
	[saleflag] [int] NULL,
	[rateflag] [int] NULL,
	[prjsaletype] [int] NULL,
	[editflag] [int] NULL,
	[pointtype] [int] NULL,
	[pointvalue] [float] NULL,
	[costtype] [int] NULL,
	[costprice] [float] NULL,
	[kyjrate] [float] NULL,
	[ktcrate] [float] NULL,
	[lyjrate] [float] NULL,
	[ltcrate] [float] NULL,
	[finaltype] [int] NULL,
	[prisource] [varchar](10) NOT NULL,
	[prjabridge] [varchar](10) NULL,
 CONSTRAINT [PK_projectinfo] PRIMARY KEY CLUSTERED 
(
	[prjmodeId] ASC,
	[prjno] ASC,
	[prisource] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[peiier]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[peiier](
	[peiierid] [int] IDENTITY(1,1) NOT NULL,
	[callbillid] [varchar](30) NOT NULL,
	[calluserid] [varchar](50) NULL,
	[peiiertime] [varchar](100) NULL,
	[peiiercontent] [varchar](1000) NULL,
	[peiierelse] [varchar](100) NULL,
	[peiierdetails] [varchar](2000) NULL,
	[peiierstate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[peiierid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payinfodaybyday]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payinfodaybyday](
	[paycompid] [varchar](10) NOT NULL,
	[paydate] [varchar](10) NOT NULL,
	[paybilltype] [varchar](5) NOT NULL,
	[paymode] [varchar](5) NOT NULL,
	[payamt] [float] NULL,
 CONSTRAINT [PK_payinfodaybyday] PRIMARY KEY CLUSTERED 
(
	[paycompid] ASC,
	[paydate] ASC,
	[paybilltype] ASC,
	[paymode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[ordersid] [int] IDENTITY(1,1) NOT NULL,
	[calluserid] [varchar](50) NULL,
	[callbillid] [varchar](30) NULL,
	[orderphone] [varchar](20) NULL,
	[orderconply] [varchar](100) NULL,
	[orderusermf] [varchar](80) NULL,
	[orderusertrh] [varchar](80) NULL,
	[orderusermr] [varchar](80) NULL,
	[orderproject] [varchar](1000) NULL,
	[ordertime] [varchar](100) NULL,
	[ordertimes] [varchar](100) NULL,
	[orderdetail] [varchar](2000) NULL,
	[complydetail] [varchar](2000) NULL,
	[orderstate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ordersid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oldcardinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oldcardinfo](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[cardtype] [varchar](10) NULL,
	[membernotocard] [varchar](20) NULL,
	[salecarddate] [varchar](8) NULL,
	[cutoffdate] [varchar](8) NULL,
	[cardstate] [int] NULL,
	[salebillno] [varchar](20) NULL,
	[costpassword] [varchar](10) NULL,
	[searchpassword] [varchar](10) NULL,
	[cardremark] [varchar](180) NULL,
	[cardsource] [int] NULL,
	[costcountbydebts] [int] NULL,
	[costamtbydebts] [float] NULL,
	[costamt] [float] NULL,
 CONSTRAINT [PK_oldcardinfo] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[noperformanceemp]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[noperformanceemp](
	[compid] [varchar](10) NULL,
	[empid] [varchar](20) NULL,
	[empinnerno] [varchar](20) NULL,
	[ddate] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nointernalcardinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nointernalcardinfo](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[cardtype] [int] NULL,
	[cardfaceamt] [float] NULL,
	[carduseflag] [int] NULL,
	[entrytype] [int] NULL,
	[cardstate] [int] NULL,
	[usedate] [varchar](10) NULL,
	[useinproject] [varchar](80) NULL,
	[oldvalidate] [varchar](10) NULL,
	[lastvalidate] [varchar](10) NULL,
	[enabledate] [varchar](10) NULL,
 CONSTRAINT [PK_nointernalcardinfo] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[newGoodsTable]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newGoodsTable](
	[goodsmodeid] [nvarchar](255) NULL,
	[goodsno] [nvarchar](255) NULL,
	[goodsname] [nvarchar](255) NULL,
	[createdate] [nvarchar](255) NULL,
	[goodstype] [nvarchar](255) NULL,
	[goodspricetype] [nvarchar](255) NULL,
	[goodsappsource] [float] NULL,
	[goodswarehouse] [nvarchar](255) NULL,
	[costunit] [nvarchar](255) NULL,
	[saleunit] [nvarchar](255) NULL,
	[purchaseunit] [nvarchar](255) NULL,
	[saletocostcount] [float] NULL,
	[purtocostcount] [float] NULL,
	[purchaseprice] [float] NULL,
	[costamtbysale] [float] NULL,
	[standprice] [float] NULL,
	[storesalseprice] [float] NULL,
	[goodssource] [nvarchar](255) NULL,
	[appflag] [float] NULL,
	[useflag] [float] NULL,
	[goodsusetype] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newgoodscount]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newgoodscount](
	[F1] [nvarchar](255) NULL,
	[F2] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msalecardinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[msalecardinfo](
	[salecompid] [varchar](10) NOT NULL,
	[salebillid] [varchar](20) NOT NULL,
	[saledate] [varchar](8) NULL,
	[saletime] [varchar](8) NULL,
	[salecardno] [varchar](20) NULL,
	[salecardtype] [varchar](20) NULL,
	[membername] [varchar](30) NULL,
	[memberphone] [varchar](20) NULL,
	[membersex] [int] NULL,
	[memberpcid] [varchar](30) NULL,
	[memberbirthday] [varchar](8) NULL,
	[salekeepamt] [float] NULL,
	[saledebtamt] [float] NULL,
	[saletotalamt] [float] NULL,
	[firstsalerid] [varchar](20) NULL,
	[firstsalerinid] [varchar](20) NULL,
	[firstsaleamt] [float] NULL,
	[secondsalerid] [varchar](20) NULL,
	[secondsalerinid] [varchar](20) NULL,
	[secondsaleamt] [float] NULL,
	[thirdsalerid] [varchar](20) NULL,
	[thirdsalerinid] [varchar](20) NULL,
	[thirdsaleamt] [float] NULL,
	[fourthsalerid] [varchar](20) NULL,
	[fourthsalerinid] [varchar](20) NULL,
	[fourthsaleamt] [float] NULL,
	[fifthsalerid] [varchar](20) NULL,
	[fifthsalerinid] [varchar](20) NULL,
	[fifthsaleamt] [float] NULL,
	[sixthsalerid] [varchar](20) NULL,
	[sixthsalerinid] [varchar](20) NULL,
	[sixthsaleamt] [float] NULL,
	[seventhsalerid] [varchar](20) NULL,
	[seventhsalerinid] [varchar](20) NULL,
	[seventhsaleamt] [float] NULL,
	[eighthsalerid] [varchar](20) NULL,
	[eighthsalerinid] [varchar](20) NULL,
	[eighthsaleamt] [float] NULL,
	[ninthsalerid] [varchar](20) NULL,
	[ninthsalerinid] [varchar](20) NULL,
	[ninthsaleamt] [float] NULL,
	[tenthsalerid] [varchar](20) NULL,
	[tenthsalerinid] [varchar](20) NULL,
	[tenthsaleamt] [float] NULL,
	[financedate] [varchar](8) NULL,
	[saleroperator] [varchar](20) NULL,
	[saleroperdate] [varchar](8) NULL,
	[cardappbillid] [varchar](20) NULL,
	[corpscardno] [varchar](10) NULL,
	[saleremark] [varchar](160) NULL,
	[backconfirmflag] [varchar](5) NULL,
	[salebakflag] [int] NULL,
	[firstpaymode] [varchar](5) NULL,
	[firstpayamt] [float] NULL,
	[secondpaymode] [varchar](5) NULL,
	[secondpayamt] [float] NULL,
	[thirdpaymode] [varchar](5) NULL,
	[thirdpayamt] [float] NULL,
	[fourthpaymode] [varchar](5) NULL,
	[fourthpayamt] [float] NULL,
	[sendpointflag] [int] NULL,
 CONSTRAINT [PK_INDEX_msalecardinfo] PRIMARY KEY CLUSTERED 
(
	[salecompid] ASC,
	[salebillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[msalebarcodecardinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[msalebarcodecardinfo](
	[salecompid] [varchar](10) NOT NULL,
	[salebillid] [varchar](20) NOT NULL,
	[saledate] [varchar](8) NULL,
	[saletime] [varchar](8) NULL,
	[operationer] [varchar](20) NULL,
	[barcodecardno] [varchar](20) NULL,
	[firstpaymode] [varchar](20) NULL,
	[firstpayamt] [float] NULL,
	[secondpaymode] [varchar](20) NULL,
	[secondpayamt] [float] NULL,
	[saleamt] [float] NULL,
	[firstsaleempid] [varchar](20) NULL,
	[firstsaleempinid] [varchar](20) NULL,
	[firstsaleamt] [float] NULL,
	[secondsaleempid] [varchar](20) NULL,
	[secondsaleempinid] [varchar](20) NULL,
	[secondsaleamt] [float] NULL,
	[thirdsaleempid] [varchar](20) NULL,
	[thirdsaleempinid] [varchar](20) NULL,
	[thirdsaleamt] [float] NULL,
	[salebakflag] [int] NULL,
 CONSTRAINT [PK_msalebarcodecardinfo] PRIMARY KEY CLUSTERED 
(
	[salecompid] ASC,
	[salebillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MRQC]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRQC](
	[goodsno] [nvarchar](255) NULL,
	[goodsprice] [float] NULL,
	[goodscount] [float] NULL,
	[goodsamt] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mreturngoodsinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mreturngoodsinfo](
	[returncompid] [varchar](10) NOT NULL,
	[returnbillid] [varchar](20) NOT NULL,
	[returndate] [varchar](8) NULL,
	[returntime] [varchar](6) NULL,
	[returnwareid] [varchar](10) NULL,
	[returnstaffid] [varchar](10) NULL,
	[returnstate] [int] NULL,
	[returnopationerid] [varchar](20) NULL,
	[returnopationdate] [varchar](10) NULL,
	[confirmopationerid] [varchar](20) NULL,
	[confirmopationdate] [varchar](10) NULL,
	[confirmcompid] [varchar](10) NULL,
 CONSTRAINT [PK_mreturngoodsinfo] PRIMARY KEY CLUSTERED 
(
	[returncompid] ASC,
	[returnbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mproexchangeinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mproexchangeinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changebillid] [varchar](20) NOT NULL,
	[changedate] [varchar](8) NULL,
	[changetime] [varchar](6) NULL,
	[changecardno] [varchar](20) NULL,
	[changeaccounttype] [varchar](10) NULL,
	[curaccountkeepamt] [float] NULL,
	[curaccountdebtamt] [float] NULL,
	[curproaccountamt] [float] NULL,
	[changecardtype] [varchar](10) NULL,
	[membername] [varchar](20) NULL,
	[memberphone] [varchar](20) NULL,
	[changeopationerid] [varchar](20) NULL,
	[changeopationdate] [varchar](10) NULL,
	[financedate] [varchar](8) NULL,
	[backcsflag] [int] NULL,
	[backcsbillid] [varchar](20) NULL,
 CONSTRAINT [PK_mproexchangeinfo] PRIMARY KEY NONCLUSTERED 
(
	[changecompid] ASC,
	[changebillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mpayoutinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mpayoutinfo](
	[payoutcompid] [varchar](10) NOT NULL,
	[payoutbillid] [varchar](20) NOT NULL,
	[payoutdate] [varchar](8) NULL,
	[payouttime] [varchar](6) NULL,
	[payoutopationerid] [varchar](20) NULL,
	[payoutopationdate] [varchar](10) NULL,
	[billstate] [int] NULL,
 CONSTRAINT [PK_mpayoutinfo] PRIMARY KEY CLUSTERED 
(
	[payoutcompid] ASC,
	[payoutbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mpackageinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mpackageinfo](
	[compid] [varchar](10) NOT NULL,
	[packageno] [varchar](20) NOT NULL,
	[packagename] [varchar](30) NULL,
	[packageprice] [float] NULL,
	[paceageremark] [varchar](100) NULL,
 CONSTRAINT [PK_mpackageinfo] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[packageno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[missiontails]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[missiontails](
	[missionbillid] [varchar](30) NOT NULL,
	[missionnames] [varchar](20) NULL,
	[missionphone] [varchar](20) NULL,
 CONSTRAINT [PK_missiontails] PRIMARY KEY NONCLUSTERED 
(
	[missionbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[missioninfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[missioninfo](
	[missionbillid] [varchar](30) NOT NULL,
	[missionname] [varchar](20) NULL,
	[missiontype] [varchar](10) NULL,
	[missionkey] [varchar](30) NULL,
	[missiondetails] [varchar](1000) NULL,
	[templatestate] [int] NULL,
 CONSTRAINT [PK_missioninfo] PRIMARY KEY NONCLUSTERED 
(
	[missionbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodsstockinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodsstockinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changetype] [varchar](2) NOT NULL,
	[changebillno] [varchar](30) NOT NULL,
	[changedate] [varchar](8) NULL,
	[changetime] [varchar](8) NULL,
	[changewareid] [varchar](10) NULL,
	[changeoption] [int] NULL,
	[changestaffid] [varchar](20) NULL,
	[changeflag] [int] NULL,
 CONSTRAINT [PK_mgoodsstockinfo] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changetype] ASC,
	[changebillno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodssendinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodssendinfo](
	[sendcompid] [varchar](10) NOT NULL,
	[sendbillid] [varchar](30) NOT NULL,
	[senddate] [varchar](8) NULL,
	[sendtime] [varchar](8) NULL,
	[sendstaffid] [varchar](20) NULL,
	[sendstate] [int] NULL,
	[storewareid] [varchar](20) NULL,
	[headwareid] [varchar](20) NULL,
	[orderdate] [varchar](8) NULL,
	[ordertime] [varchar](8) NULL,
	[ordercompid] [varchar](10) NULL,
	[orderbill] [varchar](20) NULL,
	[orderbilltype] [int] NULL,
	[storestaffid] [varchar](20) NULL,
	[storeaddress] [varchar](80) NULL,
	[sendopationerid] [varchar](20) NULL,
	[sendopationdate] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mgoodssendinfo] PRIMARY KEY CLUSTERED 
(
	[sendcompid] ASC,
	[sendbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodsreceipt]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodsreceipt](
	[receiptcompid] [varchar](10) NOT NULL,
	[receiptbillid] [varchar](30) NOT NULL,
	[receiptdate] [varchar](8) NULL,
	[receipttime] [varchar](8) NULL,
	[receiptwareid] [varchar](10) NULL,
	[receiptstaffid] [varchar](10) NULL,
	[receiptsendbillid] [varchar](30) NULL,
	[receiptorderbillid] [varchar](30) NULL,
	[orderbilltype] [int] NULL,
	[receiptstate] [int] NULL,
	[receiptopationerid] [varchar](20) NULL,
	[receiptopationdate] [varchar](10) NULL,
 CONSTRAINT [pk_mgoodsreceipt] PRIMARY KEY CLUSTERED 
(
	[receiptcompid] ASC,
	[receiptbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodsouter]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodsouter](
	[outercompid] [varchar](10) NOT NULL,
	[outerbillid] [varchar](30) NOT NULL,
	[outerdate] [varchar](8) NULL,
	[outertime] [varchar](8) NULL,
	[outerwareid] [varchar](10) NULL,
	[outertype] [int] NULL,
	[revicetype] [int] NULL,
	[outerstaffid] [varchar](10) NULL,
	[sendbillid] [varchar](40) NULL,
	[billflag] [int] NULL,
	[outeropationerid] [varchar](20) NULL,
	[outeropationdate] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mgoodsouter] PRIMARY KEY CLUSTERED 
(
	[outercompid] ASC,
	[outerbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodsorderinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodsorderinfo](
	[ordercompid] [varchar](10) NOT NULL,
	[orderbillid] [varchar](30) NOT NULL,
	[orderdate] [varchar](8) NULL,
	[ordertime] [varchar](8) NULL,
	[orderstaffid] [varchar](20) NULL,
	[orderstate] [int] NULL,
	[downordercompid] [varchar](20) NULL,
	[downorderstaffid] [varchar](20) NULL,
	[downorderdate] [varchar](8) NULL,
	[downordertime] [varchar](8) NULL,
	[sendbillno] [varchar](80) NULL,
	[revicebillno] [varchar](80) NULL,
	[ordersource] [int] NULL,
	[storewareid] [varchar](20) NULL,
	[headwareid] [varchar](100) NULL,
	[headwarename] [varchar](100) NULL,
	[orderbilltype] [int] NULL,
	[orderopationerid] [varchar](20) NULL,
	[orderopationdate] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mgoodsorderinfo] PRIMARY KEY CLUSTERED 
(
	[ordercompid] ASC,
	[orderbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodsinventory]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodsinventory](
	[inventcompid] [varchar](10) NOT NULL,
	[inventbillid] [varchar](30) NOT NULL,
	[inventdate] [varchar](8) NULL,
	[inventtime] [varchar](8) NULL,
	[inventwareid] [varchar](10) NULL,
	[inventstaffid] [varchar](10) NULL,
	[inventopationerid] [varchar](20) NULL,
	[inventopationdate] [varchar](10) NULL,
	[inventinserbillid] [varchar](20) NULL,
	[inventouterbillid] [varchar](20) NULL,
	[invalid] [int] NULL,
	[inventflag] [int] NULL,
 CONSTRAINT [PK_mgoodsinventory] PRIMARY KEY CLUSTERED 
(
	[inventcompid] ASC,
	[inventbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mgoodsinsert]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mgoodsinsert](
	[insercompid] [varchar](10) NOT NULL,
	[inserbillid] [varchar](30) NOT NULL,
	[inserdate] [varchar](8) NULL,
	[insertime] [varchar](8) NULL,
	[inserwareid] [varchar](10) NULL,
	[inserstaffid] [varchar](10) NULL,
	[insertype] [int] NULL,
	[checkbillflag] [int] NULL,
	[checkbillno] [varchar](50) NULL,
	[storesendbill] [varchar](30) NULL,
	[exitstoreno] [varchar](20) NULL,
	[exidbillno] [varchar](10) NULL,
	[billflag] [int] NULL,
	[inseropationerid] [varchar](20) NULL,
	[inseropationdate] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mgoodsinsert] PRIMARY KEY CLUSTERED 
(
	[insercompid] ASC,
	[inserbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MFQC]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MFQC](
	[goodsno] [nvarchar](255) NULL,
	[goodsprice] [float] NULL,
	[goodscount] [float] NULL,
	[goodsamt] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberinfoedit]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[memberinfoedit](
	[seqno] [int] IDENTITY(1,1) NOT NULL,
	[memberno] [varchar](20) NOT NULL,
	[membername] [varchar](40) NULL,
	[membermphone] [varchar](20) NULL,
	[memberpaperworkno] [varchar](20) NULL,
	[memberbirthday] [varchar](8) NULL,
	[edituserno] [varchar](20) NULL,
	[editusername] [varchar](30) NULL,
	[editdate] [varchar](10) NULL,
	[edittime] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[memberinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[memberinfo](
	[membervesting] [varchar](10) NOT NULL,
	[memberno] [varchar](20) NOT NULL,
	[membercreatedate] [varchar](8) NULL,
	[membername] [varchar](40) NULL,
	[memberaddress] [varchar](160) NULL,
	[membertphone] [varchar](20) NULL,
	[membermphone] [varchar](20) NULL,
	[memberFax] [varchar](20) NULL,
	[memberemail] [varchar](40) NULL,
	[memberzip] [varchar](6) NULL,
	[membersex] [int] NULL,
	[memberpaperworkno] [varchar](20) NULL,
	[memberbirthday] [varchar](8) NULL,
	[memberjob] [varchar](30) NULL,
	[cardnotomemberno] [varchar](20) NULL,
	[memberqqno] [varchar](20) NULL,
	[membermsnno] [varchar](60) NULL,
	[membertype] [varchar](2) NULL,
	[weixinno] [varchar](20) NULL,
	[autopassword] [varchar](20) NULL,
 CONSTRAINT [PK_memberinfo] PRIMARY KEY CLUSTERED 
(
	[membervesting] ASC,
	[memberno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcooperatesaleinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcooperatesaleinfo](
	[salecompid] [char](10) NOT NULL,
	[salebillid] [varchar](20) NOT NULL,
	[saledate] [varchar](8) NULL,
	[saletime] [varchar](8) NULL,
	[salecooperid] [varchar](30) NULL,
	[slaepaymode] [varchar](5) NULL,
	[salecostproamt] [float] NULL,
	[salecostcardno] [varchar](20) NULL,
	[salecostcardtype] [varchar](20) NULL,
	[membername] [varchar](20) NULL,
	[memberphone] [varchar](20) NULL,
	[salemark] [varchar](80) NULL,
	[salefactpaycode] [varchar](20) NULL,
	[slaefactpayamt] [float] NULL,
	[salebillflag] [int] NULL,
	[firstsalerid] [varchar](20) NULL,
	[firstsalerinid] [varchar](20) NULL,
	[firstsaleamt] [float] NULL,
	[secondsalerid] [varchar](20) NULL,
	[secondsalerinid] [varchar](20) NULL,
	[secondsaleamt] [float] NULL,
	[thirdsalerid] [varchar](20) NULL,
	[thirdsalerinid] [varchar](20) NULL,
	[thirdsaleamt] [float] NULL,
	[fourthsalerid] [varchar](20) NULL,
	[fourthsalerinid] [varchar](20) NULL,
	[fourthsaleamt] [float] NULL,
	[fifthsalerid] [varchar](20) NULL,
	[fifthsalerinid] [varchar](20) NULL,
	[fifthsaleamt] [float] NULL,
	[sixthsalerid] [varchar](20) NULL,
	[sixthsalerinid] [varchar](20) NULL,
	[sixthsaleamt] [float] NULL,
	[seventhsalerid] [varchar](20) NULL,
	[seventhsalerinid] [varchar](20) NULL,
	[seventhsaleamt] [float] NULL,
	[eighthsalerid] [varchar](20) NULL,
	[eighthsalerinid] [varchar](20) NULL,
	[eighthsaleamt] [float] NULL,
	[ninthsalerid] [varchar](20) NULL,
	[ninthsalerinid] [varchar](20) NULL,
	[ninthsaleamt] [float] NULL,
	[tenthsalerid] [varchar](20) NULL,
	[tenthsalerinid] [varchar](20) NULL,
	[tenthsaleamt] [float] NULL,
	[financedate] [varchar](8) NULL,
	[operationer] [varchar](20) NULL,
	[operationdate] [varchar](8) NULL,
	[salebakflag] [int] NULL,
 CONSTRAINT [PK_mcooperatesaleinfo] PRIMARY KEY CLUSTERED 
(
	[salecompid] ASC,
	[salebillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mconsumeinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mconsumeinfo](
	[cscompid] [varchar](10) NOT NULL,
	[csbillid] [varchar](20) NOT NULL,
	[cskeyno] [varchar](20) NULL,
	[csmanualno] [varchar](20) NULL,
	[csdate] [varchar](8) NULL,
	[csstarttime] [varchar](6) NULL,
	[csendtime] [varchar](6) NULL,
	[cscardno] [varchar](20) NULL,
	[csname] [varchar](20) NULL,
	[cscardtype] [varchar](10) NULL,
	[csersex] [int] NULL,
	[csertype] [int] NULL,
	[csercount] [int] NULL,
	[csopationerid] [varchar](20) NULL,
	[csopationdate] [varchar](10) NULL,
	[financedate] [varchar](8) NULL,
	[backcsflag] [int] NULL,
	[backcsbillid] [varchar](20) NULL,
	[cscurkeepamt] [float] NULL,
	[cscurdepamt] [float] NULL,
	[tuangoucardno] [varchar](20) NULL,
	[tiaomacardno] [varchar](20) NULL,
	[diyongcardno] [varchar](20) NULL,
 CONSTRAINT [PK_mconsumeinfo] PRIMARY KEY NONCLUSTERED 
(
	[cscompid] ASC,
	[csbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcardrechargeinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcardrechargeinfo](
	[rechargecompid] [varchar](10) NOT NULL,
	[rechargebillid] [varchar](20) NOT NULL,
	[rechargedate] [varchar](8) NULL,
	[rechargetime] [varchar](6) NULL,
	[rechargecardno] [varchar](20) NULL,
	[rechargecardtype] [varchar](10) NULL,
	[rechargeaccounttype] [varchar](10) NULL,
	[rechargetype] [int] NULL,
	[membername] [varchar](20) NULL,
	[rechargekeepamt] [float] NULL,
	[rechargedebtamt] [float] NULL,
	[curcardamt] [float] NULL,
	[curcarddebtamt] [float] NULL,
	[firstsalerid] [varchar](20) NULL,
	[firstsalerinid] [varchar](20) NULL,
	[firstsaleamt] [float] NULL,
	[secondsalerid] [varchar](20) NULL,
	[secondsalerinid] [varchar](20) NULL,
	[secondsaleamt] [float] NULL,
	[thirdsalerid] [varchar](20) NULL,
	[thirdsalerinid] [varchar](20) NULL,
	[thirdsaleamt] [float] NULL,
	[fourthsalerid] [varchar](20) NULL,
	[fourthsalerinid] [varchar](20) NULL,
	[fourthsaleamt] [float] NULL,
	[fifthsalerid] [varchar](20) NULL,
	[fifthsalerinid] [varchar](20) NULL,
	[fifthsaleamt] [float] NULL,
	[sixthsalerid] [varchar](20) NULL,
	[sixthsalerinid] [varchar](20) NULL,
	[sixthsaleamt] [float] NULL,
	[seventhsalerid] [varchar](20) NULL,
	[seventhsalerinid] [varchar](20) NULL,
	[seventhsaleamt] [float] NULL,
	[eighthsalerid] [varchar](20) NULL,
	[eighthsalerinid] [varchar](20) NULL,
	[eighthsaleamt] [float] NULL,
	[ninthsalerid] [varchar](20) NULL,
	[ninthsalerinid] [varchar](20) NULL,
	[ninthsaleamt] [float] NULL,
	[tenthsalerid] [varchar](20) NULL,
	[tenthsalerinid] [varchar](20) NULL,
	[tenthsaleamt] [float] NULL,
	[financedate] [varchar](8) NULL,
	[operationer] [varchar](20) NULL,
	[operationdate] [varchar](8) NULL,
	[firstpaymode] [varchar](5) NULL,
	[firstpayamt] [float] NULL,
	[secondpaymode] [varchar](5) NULL,
	[secondpayamt] [float] NULL,
	[thirdpaymode] [varchar](5) NULL,
	[thirdpayamt] [float] NULL,
	[fourthpaymode] [varchar](5) NULL,
	[fourthpayamt] [float] NULL,
	[rechargeremark] [varchar](160) NULL,
	[backbillid] [varchar](160) NULL,
	[backconfirmflag] [varchar](5) NULL,
	[salebakflag] [int] NULL,
	[sendpointflag] [int] NULL,
 CONSTRAINT [PK_mcardrechargeinfo] PRIMARY KEY NONCLUSTERED 
(
	[rechargecompid] ASC,
	[rechargebillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcardnoinsert]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcardnoinsert](
	[cinsertcompid] [varchar](10) NOT NULL,
	[cinsertbillid] [varchar](20) NOT NULL,
	[cinsertdate] [varchar](8) NULL,
	[cinserttime] [varchar](8) NULL,
	[cinsertware] [varchar](10) NULL,
	[CREATEcompname] [varchar](60) NULL,
	[checkoutflag] [int] NULL,
	[billflag] [int] NULL,
	[billno] [varchar](50) NULL,
	[checkoutmark] [varchar](120) NULL,
	[checkoutimgurl] [varchar](120) NULL,
	[reportimage] [image] NULL,
	[cinsertper] [varchar](20) NULL,
	[optionconfrimdate] [varchar](10) NULL,
	[optionconfrimper] [varchar](20) NULL,
	[optioncanceldate] [varchar](10) NULL,
	[optioncancelper] [varchar](20) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mcardnoinsert] PRIMARY KEY CLUSTERED 
(
	[cinsertcompid] ASC,
	[cinsertbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcardchangeinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcardchangeinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changebillid] [varchar](20) NOT NULL,
	[changetype] [int] NOT NULL,
	[changedate] [varchar](8) NULL,
	[changetime] [varchar](8) NULL,
	[changebeforcardno] [varchar](20) NULL,
	[changecardfrom] [varchar](20) NULL,
	[changebeforcardstate] [int] NULL,
	[changebeforcardtype] [varchar](10) NULL,
	[membername] [varchar](20) NULL,
	[memberphone] [varchar](20) NULL,
	[curaccountkeepamt] [float] NULL,
	[curaccountdebtamt] [float] NULL,
	[curproaccountkeepamt] [float] NULL,
	[curproaccountdebtamt] [float] NULL,
	[changelowamt] [float] NULL,
	[changefillamt] [float] NULL,
	[changdebtamt] [float] NULL,
	[changeaftercardno] [varchar](20) NULL,
	[changeaftercardstate] [int] NULL,
	[changeaftercardtype] [varchar](10) NULL,
	[firstsalerid] [varchar](20) NULL,
	[firstsalerinid] [varchar](20) NULL,
	[firstsaleamt] [float] NULL,
	[secondsalerid] [varchar](20) NULL,
	[secondsalerinid] [varchar](20) NULL,
	[secondsaleamt] [float] NULL,
	[thirdsalerid] [varchar](20) NULL,
	[thirdsalerinid] [varchar](20) NULL,
	[thirdsaleamt] [float] NULL,
	[fourthsalerid] [varchar](20) NULL,
	[fourthsalerinid] [varchar](20) NULL,
	[fourthsaleamt] [float] NULL,
	[fifthsalerid] [varchar](20) NULL,
	[fifthsalerinid] [varchar](20) NULL,
	[fifthsaleamt] [float] NULL,
	[sixthsalerid] [varchar](20) NULL,
	[sixthsalerinid] [varchar](20) NULL,
	[sixthsaleamt] [float] NULL,
	[seventhsalerid] [varchar](20) NULL,
	[seventhsalerinid] [varchar](20) NULL,
	[seventhsaleamt] [float] NULL,
	[eighthsalerid] [varchar](20) NULL,
	[eighthsalerinid] [varchar](20) NULL,
	[eighthsaleamt] [float] NULL,
	[ninthsalerid] [varchar](20) NULL,
	[ninthsalerinid] [varchar](20) NULL,
	[ninthsaleamt] [float] NULL,
	[tenthsalerid] [varchar](20) NULL,
	[tenthsalerinid] [varchar](20) NULL,
	[tenthsaleamt] [float] NULL,
	[rechargeremark] [varchar](160) NULL,
	[financedate] [varchar](8) NULL,
	[operationer] [varchar](20) NULL,
	[operationdate] [varchar](8) NULL,
	[confirmer] [varchar](20) NULL,
	[confirmdate] [varchar](8) NULL,
	[backconfirmflag] [varchar](5) NULL,
	[salebakflag] [int] NULL,
	[billflag] [int] NULL,
	[sendpointflag] [int] NULL,
 CONSTRAINT [PK_mcardchangeinfo] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changebillid] ASC,
	[changetype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcardapponline]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcardapponline](
	[cappcompid] [varchar](10) NOT NULL,
	[cappcompbillid] [varchar](20) NOT NULL,
	[cappdate] [varchar](8) NULL,
	[capptime] [varchar](6) NULL,
	[cappempid] [varchar](20) NULL,
	[cappbillflag] [int] NULL,
	[cappopationper] [varchar](20) NULL,
	[cappopationdate] [varchar](8) NULL,
	[cappconfirmper] [varchar](20) NULL,
	[cappconfirmdate] [varchar](8) NULL,
	[cappconfirmcompid] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mcardapponline] PRIMARY KEY CLUSTERED 
(
	[cappcompid] ASC,
	[cappcompbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mcardallotment]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcardallotment](
	[callotcompid] [varchar](10) NOT NULL,
	[callotbillid] [varchar](20) NOT NULL,
	[callotdate] [varchar](8) NULL,
	[callottime] [varchar](6) NULL,
	[callotempid] [varchar](20) NULL,
	[recevieempid] [varchar](20) NULL,
	[callotopationempid] [varchar](20) NULL,
	[callotopationdate] [varchar](8) NULL,
	[checkoutflag] [int] NULL,
	[checkoutdate] [varchar](8) NULL,
	[checkoutemp] [varchar](20) NULL,
	[cappbillid] [varchar](20) NULL,
	[cappcompid] [varchar](10) NULL,
	[callotwareid] [varchar](10) NULL,
	[invalid] [int] NULL,
 CONSTRAINT [PK_mcardallotment] PRIMARY KEY CLUSTERED 
(
	[callotcompid] ASC,
	[callotbillid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[intentiondetail]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[intentiondetail](
	[intdid] [int] IDENTITY(1,1) NOT NULL,
	[intdcomplyno] [varchar](10) NOT NULL,
	[intdbillid] [varchar](30) NOT NULL,
	[intdwaite] [varchar](16) NULL,
	[intstuno] [varchar](18) NULL,
	[incardno] [varchar](18) NULL,
	[instaffno] [varchar](20) NULL,
	[instaffname] [varchar](20) NULL,
	[intposition] [varchar](20) NULL,
	[intbirthday] [varchar](20) NULL,
	[intdscore] [int] NULL,
	[intpositions] [int] NULL,
	[intdproname] [varchar](20) NULL,
	[intdpunish] [varchar](255) NULL,
	[intdremark] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[intdid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[intention]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[intention](
	[intid] [int] IDENTITY(1,1) NOT NULL,
	[intcomplyno] [varchar](10) NOT NULL,
	[intbillid] [varchar](30) NOT NULL,
	[intdproject] [int] NULL,
	[intdstage] [int] NULL,
	[intdstarttime] [varchar](20) NULL,
	[intdendtime] [varchar](20) NULL,
	[intuser] [varchar](20) NULL,
	[intdata] [varchar](30) NULL,
	[intetionstate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[intid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[goodsstocks]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodsstocks](
	[goodsno] [nvarchar](255) NULL,
	[goodsstock] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goodsnomr]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodsnomr](
	[goodsno] [nvarchar](255) NULL,
	[goodsnome] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goodsnameinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[goodsnameinfo](
	[goodsno] [varchar](20) NOT NULL,
	[goodsbarno] [varchar](40) NULL,
	[goodsname] [varchar](80) NULL,
	[goodstype] [varchar](5) NULL,
	[goodspricetype] [varchar](5) NULL,
	[maxbarcode] [varchar](20) NULL,
 CONSTRAINT [PK_goodsnameinfo] PRIMARY KEY CLUSTERED 
(
	[goodsno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[goodsinfobak20140105]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[goodsinfobak20140105](
	[goodsmodeid] [varchar](10) NOT NULL,
	[goodsno] [varchar](20) NOT NULL,
	[goodsuniquebar] [varchar](10) NULL,
	[goodsbarno] [varchar](100) NULL,
	[goodsname] [varchar](80) NULL,
	[CREATEdate] [varchar](8) NULL,
	[goodstype] [varchar](5) NULL,
	[goodspricetype] [varchar](10) NULL,
	[goodsappsource] [int] NULL,
	[goodswarehouse] [varchar](10) NULL,
	[goodssupplier] [varchar](5) NULL,
	[costunit] [varchar](5) NULL,
	[saleunit] [varchar](5) NULL,
	[purchaseunit] [varchar](5) NULL,
	[goodsformat] [varchar](20) NULL,
	[saletocostcount] [float] NULL,
	[purtocostcount] [float] NULL,
	[purchaseprice] [float] NULL,
	[costamtbysale] [float] NULL,
	[standprice] [float] NULL,
	[storesalseprice] [float] NULL,
	[shelflife] [int] NULL,
	[lowstock] [float] NULL,
	[heightstock] [float] NULL,
	[appflag] [int] NULL,
	[useflag] [int] NULL,
	[stopdate] [varchar](8) NULL,
	[stopmark] [varchar](100) NULL,
	[pointtype] [int] NULL,
	[pointvalue] [float] NULL,
	[yetype] [int] NULL,
	[yevalue] [float] NULL,
	[tctype] [int] NULL,
	[tcvalue] [float] NULL,
	[finaltype] [int] NULL,
	[goodssource] [varchar](10) NOT NULL,
	[goodsabridge] [varchar](10) NULL,
	[goodsusetype] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[goodsinfo]    Script Date: 01/21/2014 12:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[goodsinfo](
	[goodsmodeid] [varchar](10) NOT NULL,
	[goodsno] [varchar](20) NOT NULL,
	[goodsuniquebar] [varchar](10) NULL,
	[goodsbarno] [varchar](100) NULL,
	[goodsname] [varchar](80) NULL,
	[CREATEdate] [varchar](8) NULL,
	[goodstype] [varchar](5) NULL,
	[goodspricetype] [varchar](10) NULL,
	[goodsappsource] [int] NULL,
	[goodswarehouse] [varchar](10) NULL,
	[goodssupplier] [varchar](5) NULL,
	[costunit] [varchar](5) NULL,
	[saleunit] [varchar](5) NULL,
	[purchaseunit] [varchar](5) NULL,
	[goodsformat] [varchar](20) NULL,
	[saletocostcount] [float] NULL,
	[purtocostcount] [float] NULL,
	[purchaseprice] [float] NULL,
	[costamtbysale] [float] NULL,
	[standprice] [float] NULL,
	[storesalseprice] [float] NULL,
	[shelflife] [int] NULL,
	[lowstock] [float] NULL,
	[heightstock] [float] NULL,
	[appflag] [int] NULL,
	[useflag] [int] NULL,
	[stopdate] [varchar](8) NULL,
	[stopmark] [varchar](100) NULL,
	[pointtype] [int] NULL,
	[pointvalue] [float] NULL,
	[yetype] [int] NULL,
	[yevalue] [float] NULL,
	[tctype] [int] NULL,
	[tcvalue] [float] NULL,
	[finaltype] [int] NULL,
	[goodssource] [varchar](10) NOT NULL,
	[goodsabridge] [varchar](10) NULL,
	[goodsusetype] [int] NULL,
	[minordercount] [float] NULL,
 CONSTRAINT [PK_goodsinfo] PRIMARY KEY CLUSTERED 
(
	[goodsmodeid] ASC,
	[goodsno] ASC,
	[goodssource] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[goodshead]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodshead](
	[goodsmodeid] [nvarchar](255) NULL,
	[goodsno] [nvarchar](255) NULL,
	[goodsname] [nvarchar](255) NULL,
	[createdate] [nvarchar](255) NULL,
	[goodstype] [nvarchar](255) NULL,
	[goodspricetype] [nvarchar](255) NULL,
	[goodsappsource] [float] NULL,
	[goodswarehouse] [nvarchar](255) NULL,
	[costunit] [nvarchar](255) NULL,
	[costunit1] [nvarchar](255) NULL,
	[costunit2] [nvarchar](255) NULL,
	[saletocostcount] [float] NULL,
	[purtocostcount] [float] NULL,
	[purchaseprice] [float] NULL,
	[costamtbysale] [float] NULL,
	[standprice] [float] NULL,
	[storesalseprice] [float] NULL,
	[goodssource] [nvarchar](255) NULL,
	[appflag] [float] NULL,
	[useflag] [float] NULL,
	[goodsusetype] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dsalecardproinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dsalecardproinfo](
	[salecompid] [varchar](10) NOT NULL,
	[salebillid] [varchar](20) NOT NULL,
	[salebilltype] [int] NOT NULL,
	[seleproseqno] [float] NOT NULL,
	[saleproid] [varchar](20) NULL,
	[saleprocardcount] [float] NULL,
	[saleprotype] [int] NULL,
	[saleprocount] [float] NULL,
	[sendprocount] [float] NULL,
	[saleproamt] [float] NULL,
	[saleprodebtamt] [float] NULL,
	[procutoffdate] [varchar](8) NULL,
	[saleproremark] [varchar](200) NULL,
	[firthpaymode] [varchar](5) NULL,
	[firthpayamt] [float] NULL,
	[secondpaymode] [varchar](5) NULL,
	[secondpayamt] [float] NULL,
	[thirdpaymode] [varchar](5) NULL,
	[thirdpayamt] [float] NULL,
	[fourthpaymode] [varchar](5) NULL,
	[fourthpayamt] [float] NULL,
 CONSTRAINT [PK_dsalecardproinfo] PRIMARY KEY CLUSTERED 
(
	[salecompid] ASC,
	[salebillid] ASC,
	[seleproseqno] ASC,
	[salebilltype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dsalebarcodecardinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dsalebarcodecardinfo](
	[salecompid] [varchar](10) NOT NULL,
	[salebillid] [varchar](20) NOT NULL,
	[saleseqno] [float] NOT NULL,
	[saleproid] [varchar](20) NULL,
	[saleprocount] [float] NULL,
	[saleproamt] [float] NULL,
	[saleremark] [varchar](200) NULL,
 CONSTRAINT [PK_dsalebarcodecardinfo] PRIMARY KEY CLUSTERED 
(
	[salecompid] ASC,
	[salebillid] ASC,
	[saleseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dreturngoodsinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dreturngoodsinfo](
	[returncompid] [varchar](10) NOT NULL,
	[returnbillid] [varchar](20) NOT NULL,
	[returnseqno] [float] NOT NULL,
	[returngoodsno] [varchar](20) NULL,
	[returngoodsunit] [varchar](5) NULL,
	[returncount] [float] NULL,
	[returntype] [int] NULL,
	[revicestoreno] [varchar](20) NULL,
	[factreturncount] [float] NULL,
	[factreturnprice] [float] NULL,
	[factreturnamt] [float] NULL,
 CONSTRAINT [PK_dreturngoodsinfo] PRIMARY KEY CLUSTERED 
(
	[returncompid] ASC,
	[returnbillid] ASC,
	[returnseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dproexchangeinfobypro]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dproexchangeinfobypro](
	[changecompid] [varchar](10) NOT NULL,
	[changebillid] [varchar](20) NOT NULL,
	[changeseqno] [float] NOT NULL,
	[changeproid] [varchar](20) NULL,
	[bproseqno] [float] NULL,
	[lastcount] [float] NULL,
	[lastamt] [float] NULL,
	[changeprocount] [float] NULL,
	[changeproamt] [float] NULL,
 CONSTRAINT [PK_dproexchangeinfobypro] PRIMARY KEY NONCLUSTERED 
(
	[changecompid] ASC,
	[changebillid] ASC,
	[changeseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dproexchangeinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dproexchangeinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changebillid] [varchar](20) NOT NULL,
	[changeseqno] [float] NOT NULL,
	[changeproid] [varchar](20) NULL,
	[procount] [float] NULL,
	[changeprocount] [float] NULL,
	[changeprorate] [float] NULL,
	[changeproamt] [float] NULL,
	[changebyproaccountamt] [float] NULL,
	[changebyaccountamt] [float] NULL,
	[changepaymode] [varchar](5) NULL,
	[changebycashamt] [float] NULL,
	[nointernalcardno] [varchar](20) NULL,
	[changebydyqamt] [float] NULL,
	[firstsalerid] [varchar](20) NULL,
	[firstsalerinid] [varchar](20) NULL,
	[firstsaleamt] [float] NULL,
	[secondsalerid] [varchar](20) NULL,
	[secondsalerinid] [varchar](20) NULL,
	[secondsaleamt] [float] NULL,
	[thirdsalerid] [varchar](20) NULL,
	[thirdsalerinid] [varchar](20) NULL,
	[thirdsaleamt] [float] NULL,
	[fourthsalerid] [varchar](20) NULL,
	[fourthsalerinid] [varchar](20) NULL,
	[fourthsaleamt] [float] NULL,
	[changemark] [varchar](200) NULL,
	[salebakflag] [int] NULL,
 CONSTRAINT [PK_dproexchangeinfo] PRIMARY KEY NONCLUSTERED 
(
	[changecompid] ASC,
	[changebillid] ASC,
	[changeseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dpayoutinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dpayoutinfo](
	[payoutcompid] [varchar](10) NOT NULL,
	[payoutbillid] [varchar](20) NOT NULL,
	[payoutseqno] [float] NOT NULL,
	[payoutitemid] [varchar](20) NULL,
	[payoutitemamt] [float] NULL,
	[checkbookflag] [int] NULL,
	[checkbookno] [varchar](200) NULL,
	[payoutmark] [varchar](400) NULL,
	[payoutbillstate] [int] NULL,
	[checkedopationerid] [varchar](20) NULL,
	[checkedopationdate] [varchar](10) NULL,
	[confirmopationerid] [varchar](20) NULL,
	[confirmopationdate] [varchar](10) NULL,
 CONSTRAINT [PK_dpayoutinfo] PRIMARY KEY CLUSTERED 
(
	[payoutcompid] ASC,
	[payoutbillid] ASC,
	[payoutseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dpayinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dpayinfo](
	[paycompid] [varchar](10) NOT NULL,
	[paybillid] [varchar](20) NOT NULL,
	[paybilltype] [varchar](5) NOT NULL,
	[payseqno] [float] NOT NULL,
	[paymode] [varchar](5) NULL,
	[payamt] [float] NULL,
	[payremark] [varchar](30) NULL,
 CONSTRAINT [PK_dpayinfo] PRIMARY KEY NONCLUSTERED 
(
	[paycompid] ASC,
	[paybillid] ASC,
	[paybilltype] ASC,
	[payseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dnointernalcardinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dnointernalcardinfo](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[seqno] [float] NOT NULL,
	[ineritemno] [varchar](20) NULL,
	[entrycount] [float] NULL,
	[usecount] [float] NULL,
	[lastcount] [float] NULL,
	[entryamt] [float] NULL,
	[useamt] [float] NULL,
	[lastamt] [float] NULL,
	[entryremark] [varchar](200) NULL,
 CONSTRAINT [PK_dnointernalcardinfo] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC,
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dmpackageinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dmpackageinfo](
	[compid] [varchar](10) NOT NULL,
	[packageno] [varchar](20) NOT NULL,
	[packageprono] [varchar](20) NOT NULL,
	[packageprocount] [float] NULL,
	[packageproamt] [float] NULL,
 CONSTRAINT [PK_dmpackageinfo] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[packageno] ASC,
	[packageprono] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsstockinfobak20140106]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsstockinfobak20140106](
	[changecompid] [varchar](10) NOT NULL,
	[changetype] [varchar](2) NOT NULL,
	[changebillno] [varchar](30) NOT NULL,
	[changeseqno] [float] NOT NULL,
	[changegoodsno] [varchar](30) NULL,
	[standunit] [varchar](8) NULL,
	[standcount] [float] NULL,
	[standprice] [float] NULL,
	[producedate] [varchar](8) NULL,
	[changeunit] [varchar](8) NULL,
	[changeprice] [float] NULL,
	[changecount] [float] NULL,
	[changeamt] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsstockinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsstockinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changetype] [varchar](2) NOT NULL,
	[changebillno] [varchar](30) NOT NULL,
	[changeseqno] [float] NOT NULL,
	[changegoodsno] [varchar](30) NULL,
	[standunit] [varchar](8) NULL,
	[standcount] [float] NULL,
	[standprice] [float] NULL,
	[producedate] [varchar](8) NULL,
	[changeunit] [varchar](8) NULL,
	[changeprice] [float] NULL,
	[changecount] [float] NULL,
	[changeamt] [float] NULL,
 CONSTRAINT [PK_dgoodsstockinfo] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changetype] ASC,
	[changebillno] ASC,
	[changeseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodssendinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodssendinfo](
	[sendcompid] [varchar](10) NOT NULL,
	[sendbillid] [varchar](30) NOT NULL,
	[sendseqno] [float] NOT NULL,
	[sendgoodsno] [varchar](20) NULL,
	[sendgoodsunit] [varchar](5) NULL,
	[ordergoodscount] [float] NULL,
	[ordergoodsamt] [float] NULL,
	[downordercount] [float] NULL,
	[nodowncount] [float] NULL,
	[sendgoodprice] [float] NULL,
	[sendgoodrate] [float] NULL,
	[sendgoodscount] [float] NULL,
	[sendgoodsamt] [float] NULL,
	[frombarcode] [varchar](20) NULL,
	[tobarcode] [varchar](20) NULL,
 CONSTRAINT [pk_dgoodssendinfo] PRIMARY KEY CLUSTERED 
(
	[sendcompid] ASC,
	[sendbillid] ASC,
	[sendseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodssendbarinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodssendbarinfo](
	[sendcompid] [varchar](10) NOT NULL,
	[sendbillid] [varchar](30) NOT NULL,
	[sendseqno] [float] NOT NULL,
	[sendgoodsno] [varchar](20) NULL,
	[frombarcode] [varchar](20) NULL,
	[tobarcode] [varchar](20) NULL,
	[sendbarcount] [float] NULL,
 CONSTRAINT [pk_dgoodssendbarinfo] PRIMARY KEY CLUSTERED 
(
	[sendcompid] ASC,
	[sendbillid] ASC,
	[sendseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsreturnbarinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsreturnbarinfo](
	[returncompid] [varchar](10) NOT NULL,
	[returnbillid] [varchar](30) NOT NULL,
	[returnseqno] [float] NOT NULL,
	[returngoodsno] [varchar](20) NULL,
	[frombarcode] [varchar](20) NULL,
	[tobarcode] [varchar](20) NULL,
	[returncount] [float] NULL,
 CONSTRAINT [pk_dgoodsreturnbarinfo] PRIMARY KEY CLUSTERED 
(
	[returncompid] ASC,
	[returnbillid] ASC,
	[returnseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsreceipt]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsreceipt](
	[receiptcompid] [varchar](10) NOT NULL,
	[receiptbillid] [varchar](30) NOT NULL,
	[receiptseqno] [float] NOT NULL,
	[receiptgoodsno] [varchar](20) NULL,
	[receiptgoodsunit] [varchar](10) NULL,
	[receiptprice] [float] NULL,
	[receiptgoodscount] [float] NULL,
	[receiptgoodsamt] [float] NULL,
	[sendgoodscount] [float] NULL,
	[damagegoodscount] [float] NULL,
	[debegiidscount] [float] NULL,
	[ordergoodscount] [float] NULL,
 CONSTRAINT [pk_dgoodsreceipt] PRIMARY KEY CLUSTERED 
(
	[receiptcompid] ASC,
	[receiptbillid] ASC,
	[receiptseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsouterpc]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsouterpc](
	[outercompid] [varchar](10) NOT NULL,
	[outerbillid] [varchar](30) NOT NULL,
	[outergoodsno] [varchar](20) NOT NULL,
	[outerseqno] [float] NOT NULL,
	[inserbillid] [varchar](20) NULL,
	[outercount] [float] NULL,
	[outerprice] [float] NULL,
 CONSTRAINT [PK_dgoodsouterpc] PRIMARY KEY CLUSTERED 
(
	[outercompid] ASC,
	[outerbillid] ASC,
	[outergoodsno] ASC,
	[outerseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsouter]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsouter](
	[outercompid] [varchar](10) NOT NULL,
	[outerbillid] [varchar](30) NOT NULL,
	[outerseqno] [float] NOT NULL,
	[outergoodsno] [varchar](20) NULL,
	[standunit] [varchar](5) NULL,
	[standprice] [float] NULL,
	[curgoodsstock] [float] NULL,
	[outerunit] [varchar](5) NULL,
	[outercount] [float] NULL,
	[outerprice] [float] NULL,
	[outeramt] [float] NULL,
	[outerrate] [float] NULL,
	[frombarcode] [varchar](20) NULL,
	[tobarcode] [varchar](20) NULL,
 CONSTRAINT [PK_dgoodsouter] PRIMARY KEY CLUSTERED 
(
	[outercompid] ASC,
	[outerbillid] ASC,
	[outerseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsorderinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsorderinfo](
	[ordercompid] [varchar](10) NOT NULL,
	[orderbillid] [varchar](30) NOT NULL,
	[orderseqno] [float] NOT NULL,
	[ordergoodsno] [varchar](20) NULL,
	[ordergoodscount] [float] NULL,
	[ordergoodsunit] [varchar](5) NULL,
	[ordergoodsprice] [float] NULL,
	[ordergoodsamt] [float] NULL,
	[headstockcount] [float] NULL,
	[downordercount] [float] NULL,
	[downorderamt] [float] NULL,
	[nodowncount] [float] NULL,
	[norevicecount] [float] NULL,
	[supplierno] [varchar](20) NULL,
	[headwareno] [varchar](20) NULL,
	[goodssource] [int] NULL,
	[ordergoodstype] [int] NULL,
	[ordermark] [varchar](200) NULL,
 CONSTRAINT [pk_dgoodsorderinfo] PRIMARY KEY CLUSTERED 
(
	[ordercompid] ASC,
	[orderbillid] ASC,
	[orderseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsinventory]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsinventory](
	[inventcompid] [varchar](10) NOT NULL,
	[inventbillid] [varchar](30) NOT NULL,
	[inventseqno] [float] NOT NULL,
	[inventgoodsno] [varchar](20) NULL,
	[inventunit] [varchar](5) NULL,
	[inventcount] [float] NULL,
	[curstockcount] [float] NULL,
	[discount] [float] NULL,
	[inventfrombarno] [varchar](20) NULL,
	[inventtobarno] [varchar](20) NULL,
	[inventcreateflag] [int] NULL,
	[inserunit] [varchar](10) NULL,
	[inserprice] [float] NULL,
	[outerunit] [varchar](10) NULL,
	[outerprice] [float] NULL,
 CONSTRAINT [PK_dgoodsinventory] PRIMARY KEY CLUSTERED 
(
	[inventcompid] ASC,
	[inventbillid] ASC,
	[inventseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsinsertpc]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsinsertpc](
	[insercompid] [varchar](10) NOT NULL,
	[insergoodsno] [varchar](20) NOT NULL,
	[inserbillid] [varchar](20) NOT NULL,
	[inserseqno] [float] NOT NULL,
	[producedate] [varchar](8) NULL,
	[expireddate] [varchar](8) NULL,
	[curlavecount] [float] NULL,
	[inserwareid] [varchar](10) NULL,
	[inserdate] [varchar](8) NULL,
 CONSTRAINT [PK_dgoodsinsertpc] PRIMARY KEY CLUSTERED 
(
	[insercompid] ASC,
	[insergoodsno] ASC,
	[inserbillid] ASC,
	[inserseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsinsert]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsinsert](
	[insercompid] [varchar](10) NOT NULL,
	[inserbillid] [varchar](30) NOT NULL,
	[inserseqno] [float] NOT NULL,
	[insergoodsno] [varchar](20) NULL,
	[inserunit] [varchar](5) NULL,
	[insercount] [float] NULL,
	[goodsprice] [float] NULL,
	[goodsamt] [float] NULL,
	[standunit] [varchar](5) NULL,
	[standcount] [float] NULL,
	[standprice] [float] NULL,
	[producedate] [varchar](8) NULL,
	[producenorm] [varchar](20) NULL,
	[frombarcode] [varchar](20) NULL,
	[tobarcode] [varchar](20) NULL,
 CONSTRAINT [PK_dgoodsinsert] PRIMARY KEY CLUSTERED 
(
	[insercompid] ASC,
	[inserbillid] ASC,
	[inserseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dgoodsbarinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dgoodsbarinfo](
	[goodsno] [varchar](20) NOT NULL,
	[goodsbarno] [varchar](20) NOT NULL,
	[barnostate] [int] NULL,
	[createdate] [varchar](10) NULL,
	[createstaffno] [varchar](20) NULL,
	[inserdate] [varchar](10) NULL,
	[inserbillno] [varchar](20) NULL,
	[outerdate] [varchar](10) NULL,
	[outerbill] [varchar](20) NULL,
	[receivestore] [varchar](10) NULL,
	[costdate] [varchar](10) NULL,
	[costbillo] [varchar](20) NULL,
	[coststore] [varchar](10) NULL,
 CONSTRAINT [PK_dgoodsbarinfo] PRIMARY KEY CLUSTERED 
(
	[goodsno] ASC,
	[goodsbarno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detial_trade_byday_fromshops]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[detial_trade_byday_fromshops](
	[shopId] [varchar](10) NOT NULL,
	[shopName] [varchar](20) NULL,
	[dateReport] [varchar](8) NOT NULL,
	[total] [float] NULL,
	[cashservice] [float] NULL,
	[cashprod] [float] NULL,
	[cashcardtrans] [float] NULL,
	[cashbackcard] [float] NULL,
	[cashtotal] [float] NULL,
	[creditservice] [float] NULL,
	[creditprod] [float] NULL,
	[credittrans] [float] NULL,
	[creditbackcard] [float] NULL,
	[credittotal] [float] NULL,
	[checkservice] [float] NULL,
	[checkprod] [float] NULL,
	[checktrans] [float] NULL,
	[checkbackcard] [float] NULL,
	[checktotal] [float] NULL,
	[zftservice] [float] NULL,
	[zftprod] [float] NULL,
	[zfttrans] [float] NULL,
	[zftbackcard] [float] NULL,
	[zfttotal] [float] NULL,
	[ockservice] [float] NULL,
	[ockkprod] [float] NULL,
	[ocktrans] [float] NULL,
	[ockbackcard] [float] NULL,
	[ocktotal] [float] NULL,
	[tgkservice] [float] NULL,
	[tgkkprod] [float] NULL,
	[tgktrans] [float] NULL,
	[tgktotal] [float] NULL,
	[totalcardtrans] [float] NULL,
	[cashchangesale] [float] NULL,
	[bankchangesale] [float] NULL,
	[cashbytmksale] [float] NULL,
	[bankbytmksale] [float] NULL,
	[checkbytmksale] [float] NULL,
	[fingerbytmksale] [float] NULL,
	[okpqypwybytmksale] [float] NULL,
	[cashhezprj] [float] NULL,
	[bankhezprj] [float] NULL,
	[sumcashhezprj] [float] NULL,
	[cardsalesservices] [float] NULL,
	[cardsalesprod] [float] NULL,
	[staffsallprod] [float] NULL,
	[acquisitioncardservices] [float] NULL,
	[costpointtotal] [float] NULL,
	[cashdyservice] [float] NULL,
	[prjdyservice] [float] NULL,
	[tmkservice] [float] NULL,
	[managesigning] [float] NULL,
	[payoutRegister] [float] NULL,
 CONSTRAINT [PK_detial_trade_byday_fromshops] PRIMARY KEY CLUSTERED 
(
	[shopId] ASC,
	[dateReport] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[defaultlist]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[defaultlist](
	[defaultid] [int] IDENTITY(1,1) NOT NULL,
	[defaultname] [varchar](20) NULL,
	[defaultphone] [varchar](20) NULL,
 CONSTRAINT [PK_defaultlist] PRIMARY KEY NONCLUSTERED 
(
	[defaultid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dconsumeinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dconsumeinfo](
	[cscompid] [varchar](10) NOT NULL,
	[csbillid] [varchar](20) NOT NULL,
	[csinfotype] [int] NOT NULL,
	[csseqno] [float] NOT NULL,
	[csitemno] [varchar](20) NULL,
	[csitemunit] [varchar](5) NULL,
	[csitemcount] [float] NULL,
	[csunitprice] [float] NULL,
	[csdiscount] [float] NULL,
	[csdisprice] [float] NULL,
	[csitemamt] [float] NULL,
	[cspaymode] [varchar](5) NULL,
	[csfirstsaler] [varchar](20) NULL,
	[csfirsttype] [varchar](5) NULL,
	[csfirstinid] [varchar](20) NULL,
	[csfirstshare] [float] NULL,
	[cssecondsaler] [varchar](20) NULL,
	[cssecondtype] [varchar](5) NULL,
	[cssecondinid] [varchar](20) NULL,
	[cssecondshare] [float] NULL,
	[csthirdsaler] [varchar](20) NULL,
	[csthirdtype] [varchar](5) NULL,
	[csthirdinid] [varchar](20) NULL,
	[csthirdshare] [float] NULL,
	[csortherpayid] [varchar](30) NULL,
	[csproseqno] [float] NULL,
	[saletype] [int] NULL,
	[goodsbarno] [varchar](20) NULL,
 CONSTRAINT [PK_dconsumeinfo] PRIMARY KEY NONCLUSTERED 
(
	[cscompid] ASC,
	[csbillid] ASC,
	[csinfotype] ASC,
	[csseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dcardnoinsert]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dcardnoinsert](
	[cinsertcompid] [varchar](10) NOT NULL,
	[cinsertbillid] [varchar](20) NOT NULL,
	[seqno] [float] NOT NULL,
	[cardtypeid] [varchar](10) NULL,
	[cardnofrom] [varchar](20) NULL,
	[cardnoto] [varchar](20) NULL,
	[cardnum] [float] NULL,
	[cardprice] [float] NULL,
	[cardamt] [float] NULL,
 CONSTRAINT [PK_dcardnoinsert] PRIMARY KEY CLUSTERED 
(
	[cinsertcompid] ASC,
	[cinsertbillid] ASC,
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dcardchangeinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dcardchangeinfo](
	[changecompid] [varchar](10) NOT NULL,
	[changebillid] [varchar](20) NOT NULL,
	[oldcardno] [varchar](20) NOT NULL,
	[oldcardtype] [varchar](10) NULL,
	[oldcardname] [varchar](20) NOT NULL,
	[curaccountkeepamt] [float] NULL,
	[curaccountdebtamt] [float] NULL,
	[proaccountkeepamt] [float] NULL,
	[proaccountdebtamt] [float] NULL,
 CONSTRAINT [PK_dcardchangeinfo] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changebillid] ASC,
	[oldcardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dcardapponline]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dcardapponline](
	[cappcompid] [varchar](10) NOT NULL,
	[cappcompbillid] [varchar](20) NOT NULL,
	[cappseqno] [float] NOT NULL,
	[cappcardtypeid] [varchar](10) NULL,
	[cappcount] [float] NULL,
 CONSTRAINT [PK_dcardapponline] PRIMARY KEY CLUSTERED 
(
	[cappcompid] ASC,
	[cappcompbillid] ASC,
	[cappseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dcardallotment]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dcardallotment](
	[callotcompid] [varchar](10) NOT NULL,
	[callotbillid] [varchar](20) NOT NULL,
	[callotseqno] [float] NOT NULL,
	[cardtypeid] [varchar](10) NULL,
	[cardnofrom] [varchar](20) NULL,
	[cardnoto] [varchar](20) NULL,
	[ccount] [float] NULL,
	[allotcount] [float] NULL,
 CONSTRAINT [PK_dcardallotment] PRIMARY KEY CLUSTERED 
(
	[callotcompid] ASC,
	[callotbillid] ASC,
	[callotseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[corpsbuyinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[corpsbuyinfo](
	[corpscardno] [varchar](20) NOT NULL,
	[corpstype] [int] NOT NULL,
	[corpssource] [varchar](10) NOT NULL,
	[corpspicno] [varchar](20) NOT NULL,
	[corpsamt] [float] NULL,
	[operationer] [varchar](20) NULL,
	[operationdate] [varchar](10) NULL,
	[corpssate] [int] NULL,
	[useincompid] [varchar](10) NULL,
	[useinbillno] [varchar](20) NULL,
	[useindate] [varchar](10) NULL,
 CONSTRAINT [PK_corpsbuyinfo] PRIMARY KEY CLUSTERED 
(
	[corpscardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compwarehouse]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compwarehouse](
	[compno] [varchar](10) NOT NULL,
	[warehouseno] [varchar](10) NOT NULL,
	[warehousename] [varchar](30) NULL,
	[warehousecontact] [varchar](10) NULL,
	[warehousephone] [varchar](20) NULL,
	[warehousefax] [varchar](20) NULL,
	[warehouseaddress] [varchar](40) NULL,
 CONSTRAINT [PK_compwarehouse] PRIMARY KEY NONCLUSTERED 
(
	[compno] ASC,
	[warehouseno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compclasstraderesult]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compclasstraderesult](
	[compid] [varchar](10) NOT NULL,
	[ddate] [varchar](10) NOT NULL,
	[beautyeji] [float] NULL,
	[hairyeji] [float] NULL,
	[footyeji] [float] NULL,
	[fingeryeji] [float] NULL,
	[totalyeji] [float] NULL,
	[realbeautyeji] [float] NULL,
	[realhairyeji] [float] NULL,
	[realfootyeji] [float] NULL,
	[realfingeryeji] [float] NULL,
	[realtotalyeji] [float] NULL,
 CONSTRAINT [PK_compclasstraderesult] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[ddate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compchainstruct]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compchainstruct](
	[curcompno] [varchar](10) NOT NULL,
	[parentcompno] [varchar](10) NULL,
	[complevel] [int] NULL,
	[CREATEdate] [varchar](10) NULL,
 CONSTRAINT [PK_compchainstruct] PRIMARY KEY NONCLUSTERED 
(
	[curcompno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compchaininfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compchaininfo](
	[curcomp] [varchar](10) NOT NULL,
	[relationcomp] [varchar](10) NOT NULL,
 CONSTRAINT [PK_compchaininfo] PRIMARY KEY NONCLUSTERED 
(
	[curcomp] ASC,
	[relationcomp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[companyinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companyinfo](
	[compno] [varchar](10) NOT NULL,
	[compname] [varchar](60) NULL,
	[compstate] [varchar](2) NULL,
	[compphone] [varchar](15) NULL,
	[compaddress] [varchar](60) NULL,
	[comptradelicense] [varchar](40) NULL,
	[compfex] [varchar](15) NULL,
	[compzipcode] [varchar](6) NULL,
	[compadslno] [varchar](20) NULL,
	[compadslpassword] [varchar](20) NULL,
	[comparea] [float] NULL,
	[comprent] [float] NULL,
	[compresponsible] [varchar](20) NULL,
	[compmode] [varchar](5) NULL,
	[CREATEdate] [varchar](10) NULL,
	[region] [varchar](100) NULL,
	[xcoordinate] [varchar](20) NULL,
	[ycoordinate] [varchar](20) NULL,
 CONSTRAINT [PK_companyinfo] PRIMARY KEY NONCLUSTERED 
(
	[compno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[commoninfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[commoninfo](
	[infotype] [varchar](5) NOT NULL,
	[infoname] [varchar](40) NULL,
	[parentcodekey] [varchar](10) NOT NULL,
	[parentcodevalue] [varchar](40) NULL,
	[codekey] [varchar](10) NOT NULL,
	[codevalue] [varchar](40) NULL,
	[codesource] [varchar](10) NULL,
 CONSTRAINT [PK_commoninfo] PRIMARY KEY CLUSTERED 
(
	[infotype] ASC,
	[parentcodekey] ASC,
	[codekey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardtypenameinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardtypenameinfo](
	[cardtypeno] [varchar](10) NOT NULL,
	[cardtypename] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardtypeinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardtypeinfo](
	[cardtypemodeid] [varchar](10) NOT NULL,
	[cardtypeno] [varchar](10) NOT NULL,
	[cardtypename] [varchar](30) NULL,
	[cardusetype] [int] NULL,
	[cardchiptype] [int] NULL,
	[carduselife] [float] NULL,
	[cardsaleprice] [float] NULL,
	[cardcost] [float] NULL,
	[saletctype] [int] NULL,
	[saletcvalue] [float] NULL,
	[saleyjtype] [int] NULL,
	[saleyjvalue] [float] NULL,
	[fillyjtype] [int] NULL,
	[fillyjvalue] [float] NULL,
	[filltctype] [int] NULL,
	[filltcvalue] [float] NULL,
	[pointtype] [int] NULL,
	[prjpointvalue] [float] NULL,
	[goodspointvalue] [float] NULL,
	[lowfillamt] [float] NULL,
	[lowopenamt] [float] NULL,
	[salegoodsflag] [int] NULL,
	[slaeproerate] [float] NULL,
	[slaegoodsrate] [float] NULL,
	[changerule] [int] NULL,
	[openflag] [int] NULL,
	[fillflag] [int] NULL,
	[finaltype] [int] NULL,
	[cardtypesource] [varchar](10) NOT NULL,
 CONSTRAINT [PK_cardtypeinfo] PRIMARY KEY CLUSTERED 
(
	[cardtypemodeid] ASC,
	[cardtypeno] ASC,
	[cardtypesource] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardtransactionhistory]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardtransactionhistory](
	[transactioncompid] [varchar](10) NOT NULL,
	[transactionseqno] [int] IDENTITY(1,1) NOT NULL,
	[transactioncardno] [varchar](20) NULL,
	[transactiondate] [varchar](8) NULL,
	[transactiontype] [varchar](10) NULL,
	[codeno] [varchar](20) NULL,
	[codename] [varchar](50) NULL,
	[ccount] [float] NULL,
	[price] [float] NULL,
	[billtype] [varchar](10) NULL,
	[billno] [varchar](20) NULL,
	[firstempid] [varchar](20) NULL,
	[secondempid] [varchar](20) NULL,
	[thirthempid] [varchar](20) NULL,
	[paymode] [varchar](10) NULL,
 CONSTRAINT [PK_cardtransactionhistory] PRIMARY KEY NONCLUSTERED 
(
	[transactioncompid] ASC,
	[transactionseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardstockchange]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardstockchange](
	[changecompid] [varchar](10) NOT NULL,
	[changetype] [varchar](2) NOT NULL,
	[changebill] [varchar](20) NOT NULL,
	[changeseqno] [float] NOT NULL,
	[cardtype] [varchar](30) NULL,
	[changecardfromno] [varchar](20) NULL,
	[changecardtono] [varchar](20) NULL,
	[changecount] [float] NULL,
	[changeprice] [float] NULL,
	[changeamt] [float] NULL,
	[changedate] [varchar](8) NULL,
	[changeware] [varchar](10) NULL,
 CONSTRAINT [PK_cardstockchange] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changetype] ASC,
	[changebill] ASC,
	[changeseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardstock]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardstock](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[cardclass] [varchar](10) NULL,
	[cardfrom] [varchar](20) NULL,
	[cardto] [varchar](20) NULL,
	[ccount] [float] NULL,
	[storage] [varchar](10) NULL,
	[compid] [varchar](10) NULL,
 CONSTRAINT [PK_cardstock] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardspecialcost]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardspecialcost](
	[cardno] [varchar](20) NOT NULL,
	[costxc1] [float] NULL,
	[costxc2] [float] NULL,
	[costxc3] [float] NULL,
	[costxc4] [float] NULL,
	[costxc5] [float] NULL,
	[costxc6] [float] NULL,
	[costxc7] [float] NULL,
	[costxc8] [float] NULL,
	[costxc9] [float] NULL,
 CONSTRAINT [PK_cardspecialcost] PRIMARY KEY CLUSTERED 
(
	[cardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardsoninfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardsoninfo](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[cardtype] [varchar](10) NULL,
	[salecarddate] [varchar](8) NULL,
	[parentcardno] [varchar](20) NULL,
	[membername] [varchar](20) NULL,
	[memberphone] [varchar](20) NULL,
	[salebillno] [varchar](20) NULL,
	[saleamt] [float] NULL,
	[songfalg] [varchar](10) NULL,
 CONSTRAINT [PK_cardsoninfo] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardreturning]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardreturning](
	[cardreturningid] [int] IDENTITY(1,1) NOT NULL,
	[callbillid] [varchar](30) NOT NULL,
	[calluserid] [varchar](50) NULL,
	[cardreturningtime] [varchar](100) NULL,
	[cardreturningcontent] [varchar](1000) NULL,
	[cardelse] [varchar](100) NULL,
	[cardreturningdetails] [varchar](2000) NULL,
	[cardreturningstate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cardreturningid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardproaccount]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardproaccount](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[projectno] [varchar](20) NOT NULL,
	[proseqno] [float] NOT NULL,
	[propricetype] [int] NULL,
	[salecount] [float] NULL,
	[costcount] [float] NULL,
	[lastcount] [float] NULL,
	[saleamt] [float] NULL,
	[costamt] [float] NULL,
	[lastamt] [float] NULL,
	[saledate] [varchar](8) NULL,
	[cutoffdate] [varchar](8) NULL,
	[proremark] [varchar](60) NULL,
	[prostopeflag] [int] NULL,
	[exchangeseqno] [float] NULL,
	[changecompid] [varchar](10) NULL,
	[changebillid] [varchar](20) NULL,
	[createbilltype] [varchar](10) NULL,
	[createbillno] [varchar](20) NULL,
	[createseqno] [float] NULL,
 CONSTRAINT [PK_cardproaccount] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC,
	[projectno] ASC,
	[proseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardinfo](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[cardtype] [varchar](10) NULL,
	[membernotocard] [varchar](20) NULL,
	[salecarddate] [varchar](8) NULL,
	[cutoffdate] [varchar](8) NULL,
	[cardstate] [int] NULL,
	[salebillno] [varchar](20) NULL,
	[costpassword] [varchar](10) NULL,
	[searchpassword] [varchar](10) NULL,
	[cardremark] [varchar](180) NULL,
	[cardsource] [int] NULL,
	[costcountbydebts] [int] NULL,
	[costamtbydebts] [float] NULL,
	[costamt] [float] NULL,
 CONSTRAINT [PK_cardinfo] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardcostgoodsrate]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardcostgoodsrate](
	[compid] [varchar](10) NOT NULL,
	[goodstypeid] [varchar](10) NOT NULL,
	[cardtypeno] [varchar](10) NOT NULL,
	[acounttypeno] [varchar](10) NOT NULL,
	[startdate] [varchar](8) NULL,
	[enddate] [varchar](8) NULL,
	[costrate] [real] NULL,
 CONSTRAINT [PK_cardcostgoodsrate] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[goodstypeid] ASC,
	[cardtypeno] ASC,
	[acounttypeno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardchangerule]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardchangerule](
	[rulemodeid] [varchar](10) NOT NULL,
	[cardtypeno] [varchar](20) NOT NULL,
	[seqno] [float] NOT NULL,
	[tocardtypeno] [varchar](20) NULL,
	[changeamt] [float] NULL,
	[cardtypesource] [varchar](10) NULL,
 CONSTRAINT [PK_cardchangerule] PRIMARY KEY CLUSTERED 
(
	[rulemodeid] ASC,
	[cardtypeno] ASC,
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardchangehistory]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardchangehistory](
	[changecompid] [varchar](10) NOT NULL,
	[changecardno] [varchar](20) NOT NULL,
	[changeseqno] [float] NOT NULL,
	[changetype] [int] NULL,
	[changebillid] [varchar](20) NULL,
	[beforestate] [int] NULL,
	[afterstate] [int] NULL,
	[chagedate] [varchar](8) NULL,
	[targetcardno] [varchar](20) NULL,
 CONSTRAINT [PK_cardchangehistory] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changecardno] ASC,
	[changeseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardchangecostrate]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardchangecostrate](
	[compid] [varchar](10) NOT NULL,
	[projecttypeid] [varchar](10) NOT NULL,
	[cardtypeno] [varchar](10) NOT NULL,
	[acounttypeno] [varchar](10) NOT NULL,
	[startdate] [varchar](8) NULL,
	[enddate] [varchar](8) NULL,
	[costrate] [real] NULL,
 CONSTRAINT [PK_cardchangecostrate] PRIMARY KEY CLUSTERED 
(
	[compid] ASC,
	[projecttypeid] ASC,
	[cardtypeno] ASC,
	[acounttypeno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardaccountchangehistorybak20140118]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardaccountchangehistorybak20140118](
	[changecompid] [varchar](10) NOT NULL,
	[changecardno] [varchar](20) NOT NULL,
	[changeaccounttype] [int] NOT NULL,
	[changeseqno] [int] NOT NULL,
	[changetype] [int] NULL,
	[changeamt] [float] NULL,
	[changebilltype] [varchar](5) NULL,
	[changebillno] [varchar](20) NULL,
	[chagedate] [varchar](8) NULL,
	[changebeforeamt] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardaccountchangehistorybak20131231]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardaccountchangehistorybak20131231](
	[changecompid] [varchar](10) NOT NULL,
	[changecardno] [varchar](20) NOT NULL,
	[changeaccounttype] [int] NOT NULL,
	[changeseqno] [int] NOT NULL,
	[changetype] [int] NULL,
	[changeamt] [float] NULL,
	[changebilltype] [varchar](5) NULL,
	[changebillno] [varchar](20) NULL,
	[chagedate] [varchar](8) NULL,
	[changebeforeamt] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardaccountchangehistory]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardaccountchangehistory](
	[changecompid] [varchar](10) NOT NULL,
	[changecardno] [varchar](20) NOT NULL,
	[changeaccounttype] [int] NOT NULL,
	[changeseqno] [int] NOT NULL,
	[changetype] [int] NULL,
	[changeamt] [float] NULL,
	[changebilltype] [varchar](5) NULL,
	[changebillno] [varchar](20) NULL,
	[chagedate] [varchar](8) NULL,
	[changebeforeamt] [float] NULL,
 CONSTRAINT [PK_cardaccountchangehistory] PRIMARY KEY CLUSTERED 
(
	[changecompid] ASC,
	[changecardno] ASC,
	[changeaccounttype] ASC,
	[changeseqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardaccount]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardaccount](
	[cardvesting] [varchar](10) NOT NULL,
	[cardno] [varchar](20) NOT NULL,
	[accounttype] [int] NOT NULL,
	[accountbalance] [float] NULL,
	[accountdebts] [float] NULL,
	[accountdatefrom] [varchar](20) NULL,
	[accountdateend] [varchar](20) NULL,
	[accountremark] [varchar](60) NULL,
 CONSTRAINT [PK_cardaccount] PRIMARY KEY CLUSTERED 
(
	[cardvesting] ASC,
	[cardno] ASC,
	[accounttype] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[callwaiting]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[callwaiting](
	[callid] [int] IDENTITY(1,1) NOT NULL,
	[callbillid] [varchar](30) NOT NULL,
	[calluserid] [varchar](50) NULL,
	[callon] [varchar](20) NULL,
	[calledon] [varchar](20) NULL,
	[agentnum] [varchar](20) NULL,
	[offertime] [varchar](50) NULL,
	[calledtime] [varchar](50) NULL,
	[calltime] [varchar](50) NULL,
	[calltype] [int] NULL,
	[callstate] [int] NULL,
	[callmark] [varchar](600) NULL,
PRIMARY KEY CLUSTERED 
(
	[callid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[callditails]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[callditails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[callbillid] [varchar](40) NULL,
	[calltime] [varchar](30) NULL,
	[calltimes] [varchar](30) NULL,
	[callon] [varchar](30) NULL,
	[calledon] [varchar](30) NULL,
	[calledons] [varchar](50) NULL,
	[callhoues] [time](7) NULL,
	[callall] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[calldata]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[calldata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[callbillid] [varchar](40) NULL,
	[calltime] [varchar](30) NULL,
	[callstate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[allstaff_work_yeji_daybyday]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[allstaff_work_yeji_daybyday](
	[yeji_date] [varchar](10) NOT NULL,
	[compid] [varchar](10) NOT NULL,
	[person_inid] [varchar](20) NULL,
	[staffno] [varchar](30) NULL,
	[staffname] [varchar](30) NULL,
	[staffposition] [varchar](30) NULL,
	[oldcostcount] [float] NULL,
	[newcostcount] [float] NULL,
	[trcostcount] [float] NULL,
	[cashbigcost] [float] NULL,
	[cashsmallcost] [float] NULL,
	[cashhulicost] [float] NULL,
	[cardbigcost] [float] NULL,
	[cardsmallcost] [float] NULL,
	[cardhulicost] [float] NULL,
	[cardprocost] [float] NULL,
	[cardsgcost] [float] NULL,
	[cardpointcost] [float] NULL,
	[projectdycost] [float] NULL,
	[cashdycost] [float] NULL,
	[tmcardcost] [float] NULL,
	[salegoodsamt] [float] NULL,
	[salecardsamt] [float] NULL,
	[prochangeamt] [float] NULL,
	[saletmkamt] [float] NULL,
	[qhpayinner] [float] NULL,
	[qhpayouter] [float] NULL,
	[jdpayinner] [float] NULL,
	[smpayinner] [float] NULL,
	[staffyeji] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[allstaff_work_detail_daybyday]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[allstaff_work_detail_daybyday](
	[compid] [varchar](10) NOT NULL,
	[person_inid] [varchar](20) NULL,
	[action_id] [int] NULL,
	[srvdate] [varchar](10) NULL,
	[code] [varchar](20) NULL,
	[name] [varchar](40) NULL,
	[payway] [varchar](20) NULL,
	[billamt] [float] NULL,
	[ccount] [float] NULL,
	[cost] [float] NULL,
	[staffticheng] [float] NULL,
	[staffyeji] [float] NULL,
	[prj_type] [varchar](20) NULL,
	[cls_flag] [int] NULL,
	[billid] [varchar](20) NULL,
	[paycode] [varchar](20) NULL,
	[cardid] [varchar](20) NULL,
	[cardtype] [varchar](20) NULL,
	[postation] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[accountclosureinfo]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accountclosureinfo](
	[closecompid] [varchar](10) NOT NULL,
	[closedate] [varchar](8) NOT NULL,
	[closeoptioner] [varchar](20) NULL,
	[closeoptiondate] [varchar](8) NULL,
	[closeoptiontime] [varchar](6) NULL,
 CONSTRAINT [PK_accountclosureinfo] PRIMARY KEY CLUSTERED 
(
	[closecompid] ASC,
	[closedate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a3province]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a3province](
	[id] [int] NOT NULL,
	[code] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_a3province] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC,
	[code] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a3city]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a3city](
	[id] [int] NOT NULL,
	[code] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[provinceId] [int] NOT NULL,
 CONSTRAINT [PK_a3city] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC,
	[code] ASC,
	[name] ASC,
	[provinceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a3area]    Script Date: 01/21/2014 12:44:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a3area](
	[id] [int] NOT NULL,
	[code] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[cityId] [int] NOT NULL,
 CONSTRAINT [PK_a3area] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC,
	[code] ASC,
	[name] ASC,
	[cityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__cardtypei__openf__2E1BDC42]    Script Date: 01/21/2014 12:44:09 ******/
ALTER TABLE [dbo].[cardtypeinfo] ADD  DEFAULT ((1)) FOR [openflag]
GO
/****** Object:  Default [DF__cardtypei__fillf__2F10007B]    Script Date: 01/21/2014 12:44:09 ******/
ALTER TABLE [dbo].[cardtypeinfo] ADD  DEFAULT ((1)) FOR [fillflag]
GO
/****** Object:  Default [DF__dgoodsord__goods__2DE6D218]    Script Date: 01/21/2014 12:44:09 ******/
ALTER TABLE [dbo].[dgoodsorderinfo] ADD  DEFAULT ((0)) FOR [goodssource]
GO
