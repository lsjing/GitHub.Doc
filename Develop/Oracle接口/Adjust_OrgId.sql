alter table st_adjust add OrgId bigint 

   EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OA����/���粿��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'St_Adjust', @level2type=N'COLUMN',@level2name=N'OrgId' 
GO