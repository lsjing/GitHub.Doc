USE [BenlaiP2B_Dev]
GO

/****** Object:  Table [dbo].[BLDI_Emp_All]    Script Date: 2017/12/1 15:09:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLDI_Emp_All](
	[SysNo] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [nvarchar](30) NOT NULL,
	[PersonNumber] [nvarchar](30) NOT NULL,
	[PersonName] [nvarchar](150) NOT NULL,
	[Gender] [nvarchar](30) NULL,
	[WorkPonhe] [nvarchar](150) NULL,
	[WorkEmail] [nvarchar](150) NULL,
	[OrgId] [nvarchar](30) NULL,
	[JobId] [nvarchar](30) NULL,
	[JobName] [nvarchar](120) NOT NULL,
	[Status] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ProbationDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ManageId] [nvarchar](30) NULL,
	[Nprimary] [int] NOT NULL,
	[Attendance] [int] NULL,
	[Length] [decimal](18, 4) NULL,
	[Continuous] [int] NULL,
 CONSTRAINT [PK__BLDI_Emp__AA2FFBE52483F7FC] PRIMARY KEY CLUSTERED 
(
	[SysNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员编号(人员唯一标识)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'PersonNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'PersonName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'Gender'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'WorkPonhe'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'WorkEmail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'OrgId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'JobId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'JobName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在职状态(y/n)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'Status'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入职日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转正日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'ProbationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离职日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级id(直线上级关联人员id)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'ManageId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主要岗位(y/n)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'Nprimary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否考勤(y/n)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'Attendance'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入职前社会工龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'Length'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否连续工龄(y/n)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BLDI_Emp_All', @level2type=N'COLUMN',@level2name=N'Continuous'
GO


