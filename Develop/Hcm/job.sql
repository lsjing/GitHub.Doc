USE [BenlaiP2B_Dev]
GO

/****** Object:  Table [dbo].[BLDI_Job]    Script Date: 2017/12/1 15:10:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLDI_Job](
	[SysNo] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [nvarchar](30) NOT NULL,
	[JobCode] [nvarchar](30) NOT NULL,
	[JobName] [nvarchar](150) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK__BLDI_JOB__2AC9D60A452F99F1] PRIMARY KEY CLUSTERED 
(
	[SysNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [BLDI_JOB_JOB_CODE] UNIQUE NONCLUSTERED 
(
	[JobCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务编号(HCM系统唯一标识)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Job', @level2type=N'COLUMN',@level2name=N'JobId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务编号(业务唯一标识)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Job', @level2type=N'COLUMN',@level2name=N'JobCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Job', @level2type=N'COLUMN',@level2name=N'JobName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Job', @level2type=N'COLUMN',@level2name=N'Status'
GO


