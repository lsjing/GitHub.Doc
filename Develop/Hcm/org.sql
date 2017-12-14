USE [BenlaiP2B_Dev]
GO

/****** Object:  Table [dbo].[BLDI_Org]    Script Date: 2017/12/1 15:10:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLDI_Org](
	[SysNo] [int] IDENTITY(1,1) NOT NULL,
	[OrgId] [bigint] NOT NULL,
	[OrgName] [nvarchar](250) NOT NULL,
	[SupOrgId] [bigint] NULL,
	[SupOrgName] [nvarchar](250) NULL,
	[OrgLevel] [int] NOT NULL,
	[OrgManager] [nvarchar](150) NULL,
	[CostCenter] [nvarchar](150) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK__BLDI_ORG__66696A8C97E285FA] PRIMARY KEY CLUSTERED 
(
	[SysNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'OrgId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'OrgName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'SupOrgId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'SupOrgName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门层级(0,1,2,3,4,5)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'OrgLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'OrgManager'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成本中心' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'CostCenter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(A/I)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Org', @level2type=N'COLUMN',@level2name=N'Status'
GO


