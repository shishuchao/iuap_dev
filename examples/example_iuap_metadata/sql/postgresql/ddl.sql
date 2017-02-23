/* tablename: md_component */
-- drop table if exists md_component;
create table md_component (id varchar(50) not null 
/*组件ID*/,
versiontype smallint not null 
/*版本标识*/,
namespace varchar(512) null 
/*名称空间*/,
ownmodule varchar(50) null 
/*所属模块*/,
name varchar(50) not null 
/*组件名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
version varchar(512) null 
/*组件版本*/,
resmodule varchar(90) null 
/*资源模块*/,
resid varchar(90) null 
/*名称资源ID*/,
preload char(1) null 
/*是否预加载*/,
isbizmodel char(1) null 
/*是否业务模型组件*/,
fromsourcebmf char(1) null 
/*是否来源于原始bmf*/,
industry varchar(50) not null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
 constraint pk_md_component primary key (id,versiontype,industry),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 数据类型及实体表 */
-- drop table if exists md_class;
create table md_class (id varchar(50) not null 
/*classID*/,
versiontype smallint not null 
/*版本标识*/,
parentclassid varchar(50) null 
/*父实体ID*/,
componentid varchar(50) null 
/*组件ID*/,
keyattribute varchar(50) null 
/*主键属性*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
fullclassname varchar(256) null 
/*类全路径名称*/,
classtype smallint null 
/*数据类型*/,
accessorclassname varchar(256) null 
/*访问器对应类名*/,
fixedlength char(1) null 
/*是否定长*/,
precise smallint null 
/*精度*/,
refmodelname varchar(768) null 
/*参照名称*/,
returntype varchar(50) null 
/*枚举类型返回类型*/,
isprimary char(1) null 
/*是否主实体*/,
isactive char(1) null 
/*是否启用*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
isauthen char(1) null 
/*是否安全授权*/,
resid varchar(90) null 
/*名称资源ID*/,
bizitfimpclassname varchar(256) null 
/*业务接口实现类*/,
modinfoclassname varchar(256) null 
/*元数据动态修改类*/,
iscreatesql char(1) null 
/*是否生成建库脚本*/,
defaulttablename varchar(50) null 
/*默认表表名*/,
isextendbean char(1) null 
/*继承标签*/,
userdefclassname varchar(256) null 
/*自定义功能类名*/,
stereotype varchar(256) null 
/*版型*/,
industry varchar(50) not null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
 constraint pk_md_class primary key (id,versiontype,industry),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: md_association */
-- drop table if exists md_association;
create table md_association (id varchar(50) not null 
/*关联关系ID*/,
versiontype smallint not null 
/*版本标识*/,
name varchar(60) not null 
/*名称*/,
componentid varchar(50) null 
/*组件ID*/,
startbeanid varchar(50) not null 
/*起始BeanID*/,
startelementid varchar(50) not null 
/*起始元素ID*/,
endelementid varchar(50) not null 
/*关联末端元素ID*/,
startcardinality varchar(10) null 
/*起始重复度*/,
endcardinality varchar(10) null 
/*末端重复度*/,
type smallint null 
/*关联类型*/,
cascadeupdate char(1) null 
/*是否级联更新*/,
cascadedelete char(1) null 
/*是否级联删除*/,
isactive char(1) null 
/*是否启用*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
industry varchar(50)   null 
/*租户ID*/,
tenantid varchar(50) null 
/*创建行业*/,
 constraint pk_md_association primary key (id),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 属性表 */
-- drop table if exists md_property;
create table md_property (id varchar(50) not null 
/*属性ID*/,
versiontype smallint not null 
/*版本标识*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
classid varchar(50) null 
/*所属类ID*/,
defaultvalue varchar(512) null 
/*默认值*/,
attrminvalue varchar(50) null 
/*最小值*/,
attrmaxvalue varchar(50) null 
/*最大值*/,
fixedlength char(1) null 
/*是否定长*/,
attrlength smallint null 
/*长度*/,
precise smallint null 
/*精度*/,
datatype varchar(50) null 
/*类型ID*/,
datatypestyle smallint null 
/*数据类型样式*/,
nullable char(1) null 
/*是否可为空*/,
customattr char(1) null 
/*是否自定义属性*/,
calculation char(1) null 
/*是否计算属性*/,
readonly char(1) null 
/*是否只读*/,
visibility smallint null 
/*可见性*/,
accessorclassname varchar(256) null 
/*访问器对应类名*/,
attrsequence smallint null 
/*序号*/,
hided char(1) null 
/*是否隐藏*/,
refmodelname varchar(256) null 
/*参照名称*/,
isactive char(1) null 
/*是否启用*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
isauthen char(1) null 
/*是否安全授权*/,
resid varchar(90) null 
/*名称资源ID*/,
dynamicattr char(1) null 
/*是否动态属性*/,
notserialize char(1) null 
/*是否不可序列化*/,
accesspower char(1) null 
/*使用权*/,
accesspowergroup varchar(256) null 
/*使用权组*/,
industry varchar(50) not null 
/*行业*/,
createindustry varchar(50) null 
/*租户ID*/,
tenantid varchar(50) null 
/*创建行业*/,
dynamictable varchar(50) null 
/*动态表*/,
 constraint pk_md_property primary key (id,versiontype,industry),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 表 */
-- drop table if exists md_table;
create table md_table (id varchar(50) not null 
/*表ID*/,
versiontype smallint not null 
/*版本标识*/,
displayname varchar(90) null 
/*显示名称*/,
name varchar(50) not null 
/*名称*/,
databaseid varchar(50) null 
/*数据库ID*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
isactive char(1) null 
/*是否启用*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
resid varchar(90) null 
/*名称资源ID*/,
parenttable varchar(50) null 
/*父表id*/,
isextendtable char(1) null 
/*是否扩展表*/,
fromsourcebmf char(1) null 
/*是否源于bmf*/,
industry varchar(50) null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
resmodule varchar(50) null 
/*多语资源目录*/,
 constraint pk_md_table primary key (id),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 字段信息表 */
-- drop table if exists md_column;
create table md_column (id varchar(50) not null 
/*字段信息ID*/,
versiontype smallint not null 
/*版本标识*/,
tableid varchar(50) null 
/*表ID*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
isactive char(1) null 
/*是否启用*/,
sqldatetype varchar(50) null 
/*SQLDateType*/,
pkey char(1) null 
/*是否为主键*/,
identitied char(1) null 
/*isIdentity*/,
incrementstep smallint null 
/*incrementStep*/,
incrementseed smallint null 
/*incrementSeed*/,
nullable char(1) null 
/*是否可为空*/,
precise smallint null 
/*精度*/,
columnlength smallint null 
/*长度*/,
defaultvalue varchar(512) null 
/*默认值*/,
columnsequence smallint null 
/*序号*/,
modifytime char(19) null 
/*修改时间*/,
createtime char(19) null 
/*创建时间*/,
modifier varchar(30) null 
/*修改人*/,
creator varchar(30) null 
/*创建人*/,
resid varchar(90) null 
/*名称资源ID*/,
groupid varchar(50) null 
/*组id*/,
columntype smallint null 
/*列类型*/,
forlocale char(1) null 
/*租户ID*/,
tenantid varchar(50) null 
/*是否支持本地语言*/,
 constraint pk_md_column primary key (id),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 数据库表关系表 */
-- drop table if exists md_db_relation;
create table md_db_relation (id varchar(50) not null 
/*数据库表关联ID*/,
versiontype smallint not null 
/*版本标识*/,
name varchar(90) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
starttableid varchar(50) not null 
/*起始表ID*/,
startfieldid varchar(50) not null 
/*起始字段ID*/,
startattrid varchar(50) null 
/*起始属性*/,
startcardinality varchar(10) null 
/*startCardinality*/,
endtableid varchar(50) not null 
/*被关联表ID*/,
endfieldid varchar(50) not null 
/*被关联字段ID*/,
endcardinality varchar(10) null 
/*endCardinality*/,
asstype smallint null 
/*对应实体间关联类型*/,
creator varchar(30) null 
/*创建人*/,
createtime char(19) null 
/*创建时间*/,
modifier varchar(30) null 
/*修改人*/,
modifytime char(19) null 
/*修改时间*/,
resid varchar(90) null 
/*名称资源ID*/,
isforeignkey char(1) null 
/*租户ID*/,
tenantid varchar(50) null 
/*是否外键*/,
 constraint pk_md_db_relation primary key (id,versiontype),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: OR关系映射表 */
-- drop table if exists md_ormap;
create table md_ormap (classid varchar(50) not null 
/*类ID*/,
attributeid varchar(50) not null 
/*属性ID*/,
tableid varchar(50) not null 
/*表ID*/,
columnid varchar(50) not null 
/*租户ID*/,
tenantid varchar(50) null 
/*列ID*/,
 constraint pk_md_ormap primary key (attributeid),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 数据库表 */
-- drop table if exists md_db;
create table md_db (id varchar(50) not null 
/*数据库ID*/,
versiontype smallint not null 
/*版本标识*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
isactive char(1) not null 
/*是否启用*/,
modifytime char(19) null 
/*修改时间*/,
createtime char(19) null 
/*创建时间*/,
modifier varchar(30) null 
/*修改人*/,
creator varchar(30) null 
/*创建人*/,
resid varchar(90) null 
/*租户ID*/,
tenantid varchar(50) null 
/*名称资源ID*/,
 constraint pk_md_db primary key (id,versiontype),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 模块表 */
-- drop table if exists md_module;
create table md_module (id varchar(50) not null 
/*模块ID*/,
versiontype smallint not null 
/*版本标识*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
parentmoduleid varchar(50) null 
/*父模块ID*/,
isactive char(1) null 
/*是否启用*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
resid varchar(90) null 
/*名称资源ID*/,
resmodule varchar(90) null 
/*租户ID*/,
tenantid varchar(50) null 
/*多语资源模块*/,
 constraint pk_md_module primary key (id,versiontype),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);

/* tablename: 参数表 */
-- drop table if exists md_parameter;
create table md_parameter (id varchar(50) not null 
/*参数ID*/,
versiontype smallint not null 
/*版本标识*/,
operationid varchar(50) null 
/*所属方法ID*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
datatype varchar(50) not null 
/*类型id*/,
datatypestyle smallint not null 
/*数据类型样式*/,
parasequence smallint not null 
/*参数序号*/,
modifier varchar(30) null 
/*修改人*/,
creator varchar(30) null 
/*创建人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
resid varchar(90) null 
/*名称资源ID*/,
paramdefclassname varchar(50) null 
/*参数类型自定义类名*/,
isaggvo char(1) null 
/*是否聚合VO*/,
paramtypeforlog varchar(10)   null 
/*租户ID*/,
tenantid varchar(50) null 
/*paramTypeForLog*/,
 constraint pk_md_parameter primary key (id,versiontype),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 枚举值表 */
-- drop table if exists md_enumvalue;
create table md_enumvalue (id varchar(50) not null 
/*枚举类型ID*/,
versiontype smallint not null 
/*版本标识*/,
value varchar(512) not null 
/*枚举值*/,
name varchar(512) null 
/*枚举值对应名*/,
description varchar(512) null 
/*枚举值对应描述*/,
resid varchar(90) null 
/*名称资源ID*/,
enumsequence smallint null 
/*序号*/,
hidden char(1) null 
/*是否隐藏*/,
industry varchar(50) not null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
 constraint pk_md_enumvalue primary key (id,versiontype,value,industry),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 业务接口映射表 */
-- drop table if exists md_bizitfmap;
create table md_bizitfmap (bizinterfaceid varchar(50) not null 
/*业务接口ID*/,
intattrid varchar(50) not null 
/*接口属性ID*/,
classid varchar(50) not null 
/*对应ClassID*/,
classattrid varchar(50) null 
/*实体属性ID*/,
bizitfimpclassname varchar(256) null 
/*业务接口实现类*/,
classattrpath varchar(512) null 
/*实体属性路径*/,
versiontype smallint null 
/*开发维度*/,
industry varchar(50) null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
 constraint pk_md_bizitfmap primary key (intattrid,classid),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);

/* tablename: 组件对业务模块映射表 */
-- drop table if exists md_comp_busimodule;
create table md_comp_busimodule (componentid varchar(50) not null 
/*componentid*/,
busimodulecode varchar(50) null 
/*租户ID*/,
tenantid varchar(50) null 
/*busimoduleCode*/,
 constraint pk_md_c_b_mod primary key (componentid),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);


/* tablename: 系统模块数据库结构信息表 */
-- drop table if exists md_sysmoduleconfig;
create table md_sysmoduleconfig (tablename varchar(50) null 
/*表名*/,
codefield varchar(50) null 
/*code列名*/,
namefield varchar(50) null 
/*name列名*/,
resmodulefield varchar(50) null 
/*多语模块列名*/,
resmodulevalue varchar(50) null 
/*多语模块固定值*/,
residfield varchar(50) null 
/*租户ID*/,
tenantid varchar(50) null 
/*多语资源id列名*/,
  ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);

/* 以下表后续考虑删除 */

/* tablename: 访问器实例参数 */
-- drop table if exists md_accessorpara;
create table md_accessorpara (id varchar(256) not null 
/*属性或实体ID*/,
assosequence smallint not null 
/*访问器参数序号*/,
paravalue varchar(512) null 
/*参数值*/,
versiontype smallint null 
/*版本*/,
industry varchar(50) null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
 constraint pk_md_accessorpara primary key (id,assosequence),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);

/* tablename: 操作接口表 */
-- drop table if exists md_opinterface;
create table md_opinterface (id varchar(50) not null 
/*业务操作ID*/,
versiontype smallint not null 
/*版本标识*/,
name varchar(50) not null 
/*名称*/,
displayname varchar(90) null 
/*显示名称*/,
description varchar(512) null 
/*描述信息*/,
help varchar(1024) null 
/*帮助信息*/,
parentid varchar(50) null 
/*父操作ID*/,
componentid varchar(50) not null 
/*所属组件ID*/,
fullclassname varchar(256) null 
/*业务操作类名*/,
isservice char(1) null 
/*是否服务*/,
visibility smallint null 
/*可见性*/,
remote char(1) null 
/*是否远程*/,
singleton char(1) null 
/*是否单例*/,
creator varchar(30) null 
/*创建人*/,
modifier varchar(30) null 
/*修改人*/,
createtime char(19) null 
/*创建时间*/,
modifytime char(19) null 
/*修改时间*/,
implstrategy varchar(256) null 
/*实现策略*/,
resid varchar(90) null 
/*名称资源ID*/,
authorizable char(1) null 
/*是否授权*/,
ownertype varchar(50) null 
/*所属类型*/,
defaultimplclassname varchar(256) null 
/*默认实现类*/,
isbusioperation char(1) null 
/*是否业务操作*/,
isbusiactivity char(1) null 
/*是否业务活动*/,
industry varchar(50)   not null 
/*租户ID*/,
tenantid varchar(50) null 
/*行业*/,
 constraint pk_md_interface primary key (id,versiontype,industry),
 ts char(19) default to_char(current_timestamp,'yyyy-mm-dd hh24:mi:ss'),
dr numeric(10) default 0
);

-- drop table if exists pub_multilang;
create table pub_multilang
(
  charsetname character varying(50),
  dislpayname character(75),
  dr numeric(10,0) DEFAULT 0,
  langcode character varying(50),
  langdirpath character varying(50),
  langseq numeric(10,0),
  localcountry character varying(50),
  locallang character varying(50),
  pk_multilang character varying(50),
  transclassname character varying(50),
  ts character(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text),
  CONSTRAINT pk_pub_multilang PRIMARY KEY (pk_multilang)
);