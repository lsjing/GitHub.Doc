  --�� ������ʷ��Ʒ����̨���࣬�ṩ��ť����
  --�� ��ť���븽������Ʒ��������ά��.xls

  --�� ������ʷ���ط��࣬�ṩ�ű��Ͱ�ť����
  --�� ��ť���븽������Ʒ��������ά��.xls
  --�������û�е�ַ��ϢĬ�ϵ�ַΪCityName
  --select * from cloud_ProducingArea where level=3 and (Address is null or Address='')
  --update cloud_ProducingArea set Address=CityName where level=3 and (Address is null or Address='')

  --�� ������ʷ��Ʒ����˰�ʣ��ṩ�����ֵ�
  --update product set CloudSaleTaxRate=wp.SaleTaxRate,LastUpdateTime=getdate() 
  --from product p 
  --left join WebSite_Product wp  on wp.ProductSysNo=p.SysNo and wp.IsDelete=0
  --where isnull(wp.SaleTaxRate,-1)<>-1 and isnull(p.CloudSaleTaxRate,-1)=-1 and p.Status<>-1 and product.SysNo=p.SysNo
  --���ֵ����ݸ����������ֵ�.xlsx

  --�� ������ʷ��Ʒ�����ȼ����ṩ�����ֵ����ݺͰ�ť����
  --�� ��ť���븽������Ʒ��������ά��.xls
  --�� �ֵ����ݸ����������ֵ�.xlsx

  --�� ������ʷ��Ʒ������࣬�ṩ�����ֵ����ݺͰ�ť����
  --�� ��ť���븽������Ʒ��������ά��.xls
  --�� �ֵ����ݸ����������ֵ�.xlsx

  --�� ������Ʒ�͹�Ӧ����Ч(Ĭ��ҳ���ϲ��ܲ��CloudAuditStatusΪ�յ�����)
  --update Vendor set CloudAuditStatus=0 where Status<>-1
  --update Product set CloudAuditStatus=0 where Status<>-1
  --update Vendor set Status=-1,CloudAuditStatus=0 where Status=0 and CloudAuditStatus is not null
  --update Product set Status=-1,CloudAuditStatus=0 where Status<>-1 and CloudAuditStatus is not null

  --�� ����̨��ӹ���������������ֵ���ṩ�ű���ѯ���ṩ�����������ֵ
  --�� ��Ҫ������̨��ӵ����۵�λ
  --select d2.DicName '�µ����۵�λ' from Dictionary d2 where d2.DicName not in(
	 -- select 
		--d.DicName
	 -- from Dictionary d
	 -- inner join measurement_unit u on d.DicName=u.name and d.DicFlag='SaleUnit' and d.Status=1 and u.status=1 and u.isdelete=0
  --) and d2.DicFlag='SaleUnit' and d2.Status=1
  --�� ��Ҫ������̨��ӵ�����˰��
  -- select d2.DicName '�µ�����˰��' from Dictionary d2 where d2.DicName not in(
	 -- select 
		--d.DicName
	 -- from Dictionary d
	 -- inner join Dictionary u on CONVERT(decimal(19,6),d.DicName)=CONVERT(decimal(19,6),u.DicName) and d.Status=1 and u.status=1 
	 -- where d.DicFlag='CloudSaleTaxRate' and u.DicFlag='SaleTaxRate' 
  --) and d2.DicFlag='SaleTaxRate' and d2.Status=1
 
