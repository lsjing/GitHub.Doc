


select p.ProductID,vw.CoutryName,vw.CityName,vw.AreaName from Product p
left join(
select wa1.SysNo CoutrySysNo,wa1.Name CoutryName,wa2.SysNo CitySysNo,wa2.Name as CityName,wa3.SysNo as AreaSysNo,wa3.Name as AreaName from WaresArea wa1
inner join WaresArea wa2 on wa2.ParentSysNo = wa1.SysNo and wa2.Level=2 and wa2.IsDelete=0 and wa2.Status=1
inner join WaresArea wa3 on wa3.ParentSysNo = wa2.SysNo and wa3.Level=3 and wa3.IsDelete=0 and wa3.Status=1 
where 1=1 and wa1.Level=1 and wa1.IsDelete=0 and wa1.Status=1
) vw on vw.AreaSysNo=p.OriginAreaSysNo
where vw.AreaName is not null and p.productid='1201010021F'