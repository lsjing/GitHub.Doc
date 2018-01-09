CREATE TABLE [dbo].[Idempotent_PushOracle](
	[SysNo] [int] IDENTITY(1,1) NOT NULL,
	[ObjectID] [int] NULL,
	[OperationType] [int] NULL,
	[IsDelete] [int] NULL,
	[LastUpdateTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserSysNo] [int] NULL,
	[LastUpdateUserSysNo] [int] NULL,
 CONSTRAINT [PK_Idempotent_PushOracle] PRIMARY KEY NONCLUSTERED 
(
	[SysNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对象ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Idempotent_PushOracle', @level2type=N'COLUMN',@level2name=N'ObjectID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Idempotent_PushOracle', @level2type=N'COLUMN',@level2name=N'OperationType'
GO
