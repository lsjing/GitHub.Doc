alter table sys_user add PersonNumber nvarchar(50)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HCM系统的人员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'PersonNumber'
GO