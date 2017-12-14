  --● 设置历史商品云中台分类，提供按钮更新
  --△ 按钮导入附件：商品基础属性维护.xls

  --● 设置历史产地分类，提供脚本和按钮更新
  --△ 按钮导入附件：商品基础属性维护.xls
  --如果产地没有地址信息默认地址为CityName
  --select * from cloud_ProducingArea where level=3 and (Address is null or Address='')
  --update cloud_ProducingArea set Address=CityName where level=3 and (Address is null or Address='')

  --● 设置历史商品销项税率，提供数据字典
  --update product set CloudSaleTaxRate=wp.SaleTaxRate,LastUpdateTime=getdate() 
  --from product p 
  --left join WebSite_Product wp  on wp.ProductSysNo=p.SysNo and wp.IsDelete=0
  --where isnull(wp.SaleTaxRate,-1)<>-1 and isnull(p.CloudSaleTaxRate,-1)=-1 and p.Status<>-1 and product.SysNo=p.SysNo
  --▽字典数据附件：数据字典.xlsx

  --● 设置历史商品质量等级，提供数据字典数据和按钮更新
  --△ 按钮导入附件：商品基础属性维护.xls
  --▽ 字典数据附件：数据字典.xlsx

  --● 设置历史商品财务分类，提供数据字典数据和按钮更新
  --△ 按钮导入附件：商品基础属性维护.xls
  --▽ 字典数据附件：数据字典.xlsx

  --● 设置商品和供应商无效(默认页面上不能查出CloudAuditStatus为空的数据)
  --update Vendor set CloudAuditStatus=0 where Status<>-1
  --update Product set CloudAuditStatus=0 where Status<>-1
  --update Vendor set Status=-1,CloudAuditStatus=0 where Status=0 and CloudAuditStatus is not null
  --update Product set Status=-1,CloudAuditStatus=0 where Status<>-1 and CloudAuditStatus is not null

  --● 云中台添加果坊不包含的属性值，提供脚本查询，提供数据添加属性值
  --□ 需要在云中台添加的销售单位
  --select d2.DicName '新的销售单位' from Dictionary d2 where d2.DicName not in(
	 -- select 
		--d.DicName
	 -- from Dictionary d
	 -- inner join measurement_unit u on d.DicName=u.name and d.DicFlag='SaleUnit' and d.Status=1 and u.status=1 and u.isdelete=0
  --) and d2.DicFlag='SaleUnit' and d2.Status=1
  --□ 需要在云中台添加的销项税率
  -- select d2.DicName '新的销售税率' from Dictionary d2 where d2.DicName not in(
	 -- select 
		--d.DicName
	 -- from Dictionary d
	 -- inner join Dictionary u on CONVERT(decimal(19,6),d.DicName)=CONVERT(decimal(19,6),u.DicName) and d.Status=1 and u.status=1 
	 -- where d.DicFlag='CloudSaleTaxRate' and u.DicFlag='SaleTaxRate' 
  --) and d2.DicFlag='SaleTaxRate' and d2.Status=1
 
