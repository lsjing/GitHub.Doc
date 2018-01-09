alter table ac_adjustment_item add Mode int 
alter table ac_master add AccountAdjustmentAmt decimal(19,2)
alter table ac_master add TicketAdjustmentAmt decimal(19,2)

alter table ac_stock_item add CompensatePointAmt decimal(19,2)
alter table ac_stock_item add PaidPrice decimal(19,2)
alter table ac_stock_item add PaidAmt decimal(19,2)


   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۿʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AC_Adjustment_Item', @level2type=N'COLUMN',@level2name=N'Mode' 
GO


   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˿۽��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AC_Master', @level2type=N'COLUMN',@level2name=N'AccountAdjustmentAmt' 
GO

   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ʊ�۽��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AC_Master', @level2type=N'COLUMN',@level2name=N'TicketAdjustmentAmt' 
GO

   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ֲ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AC_Stock_Item', @level2type=N'COLUMN',@level2name=N'CompensatePointAmt' 
GO


   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ջ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AC_Stock_Item', @level2type=N'COLUMN',@level2name=N'PaidPrice' 
GO

   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ջ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AC_Stock_Item', @level2type=N'COLUMN',@level2name=N'PaidAmt' 
GO