USE [NEWDESENV]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 08/02/2021 00:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cliente_id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](1000) NULL,
	[Endereço] [varchar](1000) NULL,
	[Tipo] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedores]    Script Date: 08/02/2021 00:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores](
	[Fornecedor_id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](500) NULL,
 CONSTRAINT [PK_Fornecedores] PRIMARY KEY CLUSTERED 
(
	[Fornecedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItensNotasFiscais]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItensNotasFiscais](
	[ItemNotaFiscal_id] [int] IDENTITY(1,1) NOT NULL,
	[NotaFiscal_id] [int] NOT NULL,
	[Produto_id] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[Total] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_ItensNotasFiscais] PRIMARY KEY CLUSTERED 
(
	[ItemNotaFiscal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotasFiscais]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotasFiscais](
	[NotaFiscal_id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_id] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Emitida] [bit] NULL,
 CONSTRAINT [PK_NotasFiscais] PRIMARY KEY CLUSTERED 
(
	[NotaFiscal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[Produto_id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](500) NULL,
	[Unidade] [varchar](50) NULL,
	[Preco] [decimal](18, 5) NULL,
	[Fornecedor_id] [int] NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[Produto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItensNotasFiscais]  WITH CHECK ADD  CONSTRAINT [FK_ItensNotasFiscais_NotasFiscais] FOREIGN KEY([NotaFiscal_id])
REFERENCES [dbo].[NotasFiscais] ([NotaFiscal_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItensNotasFiscais] CHECK CONSTRAINT [FK_ItensNotasFiscais_NotasFiscais]
GO
ALTER TABLE [dbo].[ItensNotasFiscais]  WITH CHECK ADD  CONSTRAINT [FK_ItensNotasFiscais_Produtos] FOREIGN KEY([Produto_id])
REFERENCES [dbo].[Produtos] ([Produto_id])
GO
ALTER TABLE [dbo].[ItensNotasFiscais] CHECK CONSTRAINT [FK_ItensNotasFiscais_Produtos]
GO
ALTER TABLE [dbo].[NotasFiscais]  WITH CHECK ADD  CONSTRAINT [FK_NotasFiscais_Clientes] FOREIGN KEY([Cliente_id])
REFERENCES [dbo].[Clientes] ([Cliente_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotasFiscais] CHECK CONSTRAINT [FK_NotasFiscais_Clientes]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [FK_Produtos_Fornecedores] FOREIGN KEY([Fornecedor_id])
REFERENCES [dbo].[Fornecedores] ([Fornecedor_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [FK_Produtos_Fornecedores]
GO
/****** Object:  StoredProcedure [dbo].[ClientsDelete]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Encontrar Itens na Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ClientsDelete] @Clienteid int
AS
BEGIN

DELETE
  FROM [NEWDESENV].[dbo].[Clientes]
  where [Cliente_id] = @Clienteid


END
GO
/****** Object:  StoredProcedure [dbo].[ClientsId]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Encontrar Itens na Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ClientsId] @Clienteid int
AS
BEGIN

SELECT [Cliente_id]
      ,[Nome]
      ,[Endereço]
      ,[Tipo]
  FROM [NEWDESENV].[dbo].[Clientes]
  where [Cliente_id] = @Clienteid


END
GO
/****** Object:  StoredProcedure [dbo].[ClientsInsert]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ClientsInsert] @Nome varchar(1000), @Endereco varchar(1000), @Tipo varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

INSERT INTO [dbo].[Clientes]
           ([Nome]
           ,[Endereço]
           ,[Tipo])
     VALUES
           (@Nome
           ,@Endereco
           ,@Tipo)

SELECT SCOPE_IDENTITY() Cliente_Id


END
GO
/****** Object:  StoredProcedure [dbo].[ClientsList]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ClientsList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT *
  FROM [NEWDESENV].[dbo].[Clientes]


END
GO
/****** Object:  StoredProcedure [dbo].[ClientsUpdate]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ClientsUpdate] @ClienteId int, @Nome varchar(1000), @Endereco varchar(1000), @Tipo varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

UPDATE [dbo].[Clientes]
   SET [Nome] = @Nome
      ,[Endereço] = @Endereco
      ,[Tipo] = @Tipo
 WHERE [Cliente_id] = @ClienteId


SELECT SCOPE_IDENTITY() Cliente_Id


END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceDelete]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Inserir Itens na Nota Fiscal
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceDelete] @NotaFiscalid int
AS
BEGIN


DELETE FROM [dbo].[NotasFiscais]
  where [NotaFiscal_id] = @NotaFiscalid


END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceEmitir]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Inserir Nota Fiscal
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceEmitir] @NotaFiscalid int
AS
BEGIN

UPDATE [dbo].[NotasFiscais]
   SET [Emitida] = 1
 WHERE [NotaFiscal_id]= @NotaFiscalid

END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceId]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Inserir Itens na Nota Fiscal
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceId] @NotaFiscalid int
AS
BEGIN

SELECT [NotaFiscal_id]
      ,nf.[Cliente_id]
      ,[Data]
	  , c.Nome
  FROM [dbo].[NotasFiscais] nf
  inner join [dbo].[Clientes] c on nf.Cliente_id = c.Cliente_id
  where [NotaFiscal_id] = @NotaFiscalid


END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceInsert]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Inserir Nota Fiscal
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceInsert] @Clienteid int
AS
BEGIN

INSERT INTO [dbo].[NotasFiscais]
           ([Cliente_id]
           ,[Data])
     VALUES
           (@Clienteid
           ,getdate())

SELECT SCOPE_IDENTITY() NotaFiscal_Id

END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItemList]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Itens da Nota
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceItemList] @NotaFiscalid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [ItemNotaFiscal_id]
      ,[NotaFiscal_id]
      ,i.[Produto_id]
      ,[Quantidade]
      ,[Total]
	  ,p.[Nome]
	  , p.Unidade
	  , p.Preco
  FROM [NEWDESENV].[dbo].[ItensNotasFiscais] i
  inner join [dbo].[Produtos] p on p.Produto_id = i.[Produto_id]
  where [NotaFiscal_id] = @NotaFiscalid



END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItemsDelete]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Inserir Itens na Nota Fiscal
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceItemsDelete] @ItemNotaFiscalid int
AS
BEGIN

DELETE FROM [dbo].[ItensNotasFiscais]
      WHERE [ItemNotaFiscal_id] =  @ItemNotaFiscalid


END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItemsInsert]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Inserir Itens na Nota Fiscal
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceItemsInsert] @NotaFiscalid int, @Produtoid int, @Quantidade int, @Preco decimal(18,5)
AS
BEGIN

INSERT INTO [dbo].[ItensNotasFiscais]
           ([NotaFiscal_id]
           ,[Produto_id]
           ,[Quantidade]
           ,[Total])
     VALUES
           (@NotaFiscalid
           ,@Produtoid
           ,@Quantidade
           ,@Preco * @Quantidade)


END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceList]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Fornecedores
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT [NotaFiscal_id]
      ,nf.[Cliente_id]
      ,[Data]
	  , c.Nome
	  , c.Endereço
	  , isnull(
	  (SELECT sum(total)
		  FROM [NEWDESENV].[dbo].[ItensNotasFiscais]
			where [NotaFiscal_id] = nf.[NotaFiscal_id]
		  group by [NotaFiscal_id]
		),0)TotalNota
	  ,nf.[Emitida]
  FROM [NEWDESENV].[dbo].[NotasFiscais] nf
  inner Join [dbo].[Clientes] c on c.Cliente_id = nf.Cliente_id



END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceListBestCustomers]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Fornecedores
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceListBestCustomers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT c.nome, Sum(it.Total) Total
  FROM [NEWDESENV].[dbo].[NotasFiscais] nf
  inner join [dbo].[Clientes] c on c.Cliente_id = nf.Cliente_id 
  inner join [dbo].[ItensNotasFiscais] it on it.NotaFiscal_id = nf.NotaFiscal_id
group by c.nome
order by 2 desc


END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceListProductsSales]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Fornecedores
-- =============================================
CREATE PROCEDURE [dbo].[InvoiceListProductsSales] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT p.Nome 
	  ,i.[Produto_id]
      ,Count([Quantidade]) UnidadesVendidas
      ,Sum([Total]) ValorTotal
  FROM [NEWDESENV].[dbo].[ItensNotasFiscais] i 
  inner join [dbo].[Produtos] p on p.Produto_id = i.Produto_id
  group by p. nome, i.[Produto_id]
order by 2 desc


END
GO
/****** Object:  StoredProcedure [dbo].[ProductsDelete]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Encontrar Itens na Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProductsDelete] @Productid int
AS
BEGIN

DELETE FROM [dbo].[Produtos]
      WHERE [Produto_id] = @Productid


END
GO
/****** Object:  StoredProcedure [dbo].[ProductsId]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Encontrar Itens na Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProductsId] @Produtoid int
AS
BEGIN

SELECT [Produto_id]
      ,p.[Nome] nomeprod
      ,[Unidade]
      ,[Preco]
      ,p.[Fornecedor_id]
	  ,f.nome nomefornec
  FROM [dbo].[Produtos] p
  inner join [dbo].[Fornecedores] f on f.Fornecedor_id = p.Fornecedor_id
  where [Produto_id] = @Produtoid


END
GO
/****** Object:  StoredProcedure [dbo].[ProductsInsert]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProductsInsert] @Nome varchar(1000), @Unidade varchar(50), @Preco decimal(18,5), @Fornecedorid int
AS
BEGIN

	SET NOCOUNT ON;

INSERT INTO [dbo].[Produtos]
           ([Nome]
           ,[Unidade]
           ,[Preco]
           ,[Fornecedor_id])
     VALUES
           (@Nome
           ,@Unidade
           ,@Preco
           ,@Fornecedorid)

SELECT SCOPE_IDENTITY() Produto_Id


END
GO
/****** Object:  StoredProcedure [dbo].[ProductsList]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Produtos
-- =============================================
CREATE PROCEDURE [dbo].[ProductsList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT  
	f.[Nome] as nomefornec
      ,p.[Nome] as nomeprod
      ,p.[Unidade]
	  ,p.Preco
	  ,p.Produto_id
  FROM [NEWDESENV].[dbo].[Produtos] p
  inner join [dbo].[Fornecedores] f on f.Fornecedor_id = p.Fornecedor_id


END
GO
/****** Object:  StoredProcedure [dbo].[ProductsUpdate]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProductsUpdate] @Produtoid int, @Nome varchar(1000), @Unidade varchar(50), @Preco decimal(18,5), @Fornecedorid int
AS
BEGIN

	SET NOCOUNT ON;

UPDATE [dbo].[Produtos]
   SET [Nome] = @Nome
      ,[Unidade] = @Unidade
      ,[Preco] = @Preco
      ,[Fornecedor_id] = @Fornecedorid
 WHERE [Produto_id] = @Produtoid


SELECT SCOPE_IDENTITY() Produto_id


END
GO
/****** Object:  StoredProcedure [dbo].[ProviderList]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Fornecedores
-- =============================================
CREATE PROCEDURE [dbo].[ProviderList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT *
  FROM [NEWDESENV].[dbo].[Fornecedores]


END
GO
/****** Object:  StoredProcedure [dbo].[ProvidersDelete]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Encontrar Itens na Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProvidersDelete] @Fornecedorid int
AS
BEGIN

DELETE
  FROM [NEWDESENV].[dbo].[Fornecedores]
  where [Fornecedor_id] = @Fornecedorid


END
GO
/****** Object:  StoredProcedure [dbo].[ProvidersId]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para Encontrar Itens na Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProvidersId] @Fornecedorid int
AS
BEGIN

SELECT [Fornecedor_id]
      ,[Nome]
  FROM [NEWDESENV].[dbo].[Fornecedores]
  where [Fornecedor_id] = @Fornecedorid


END
GO
/****** Object:  StoredProcedure [dbo].[ProvidersInsert]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProvidersInsert] @Nome varchar(1000)
AS
BEGIN

	SET NOCOUNT ON;

INSERT INTO [dbo].[Fornecedores]
           ([Nome])
     VALUES
           (@Nome)

SELECT SCOPE_IDENTITY() Fornecedor_Id


END
GO
/****** Object:  StoredProcedure [dbo].[ProvidersUpdate]    Script Date: 08/02/2021 00:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Rodrigo Panta
-- Create date: Rodrigo Panta
-- Description:	STP para listar Clientes
-- =============================================
CREATE PROCEDURE [dbo].[ProvidersUpdate] @FornecedorId int, @Nome varchar(1000)
AS
BEGIN

	SET NOCOUNT ON;

UPDATE [dbo].[Fornecedores]
   SET [Nome] = @Nome
 WHERE [Fornecedor_id] = @FornecedorId


SELECT SCOPE_IDENTITY() Fornecedor_Id


END
GO
