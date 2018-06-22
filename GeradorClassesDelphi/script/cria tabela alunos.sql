CREATE TABLE [dbo].[Alunos](
	[Codigo] [int] IDENTITY NOT NULL PRIMARY KEY,
	[Nome] [varchar](70) NULL,
	[Endereço] [varchar](100) NULL,
	[Bairro] [varchar](100) NULL,
	[cep] [varchar](15) NULL,
	[telefone] [varchar](15) NULL
)
GO