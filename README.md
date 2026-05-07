# Sistema de Catálogo de Filmes em Delphi

## Objetivo

- **Desafio:** Catálogo de Filmes | **Entrada:** TXT | **Saída:** CSV
- Sistema desktop desenvolvido em Delphi para cadastro e gerenciamento de um catálogo de filmes. Permite importar registros a partir de arquivos `.txt` (com suporte a múltiplos delimitadores) e exportar o catálogo completo para `.csv`. Os dados são persistidos em um banco de dados **SQL Server** via **FireDAC**.

---

## Tecnologias Utilizadas

- **Delphi (RAD Studio)** — ambiente de desenvolvimento e linguagem Object Pascal
- **VCL (Visual Component Library)** — interface gráfica desktop (Forms, DBGrid, PageControl, MaskEdit)
- **FireDAC** — camada de acesso a banco de dados (`TFDConnection`, `TFDQuery`)
- **SQL Server (MSSQL)** — banco de dados relacional utilizado para persistência
- **TIniFile** — leitura de configurações de conexão via arquivo `config.ini`
- **TStringList / TFile** — manipulação de arquivos TXT e CSV
- **PngBitBtn / PngSpeedButton** — componentes visuais para botões com ícones PNG

---

## Como Executar

### Pré-requisitos

- **Delphi RAD Studio** (versão com suporte a FireDAC e VCL)
- **SQL Server** instalado e acessível na rede (local ou remoto)
- Banco de dados `filmes` criado (veja a seção de importação de dados)
- Arquivo `config.ini` configurado corretamente (veja abaixo)

### Configuração do banco de dados

Execute o script SQL localizado em `SQL/sqlFilmes.sql` para criar o banco e a tabela:

```sql
create database filmes
use filmes

create table catalogo(
    idFilme       int identity,
    titulo        varchar(100),
    diretor       varchar(100),
    genero        varchar(50),
    sinopse       varchar(500),
    anoLancamento varchar(10),
    constraint pk_filme primary key (titulo, diretor)
)
```

### Configuração da conexão (`config.ini`)

O arquivo `config.ini` deve estar na mesma pasta do executável (`Win32/Debug/`):

```ini
[DB]
Server=NOME_DO_SERVIDOR\INSTANCIA
Database=filmes
User=seu_usuario
Password=sua_senha
```

Para usar autenticação Windows, adicione a linha abaixo e omita `User` e `Password`:

```ini
Auth=Windows
```

### Executando o projeto

1. Clone ou extraia o repositório:
   ```bash
   git clone https://github.com/BrunoPignatar/Sistema-de-cat-logos-de-filmes-em-Delphi.git
   ```

2. Abra o arquivo de projeto `uFilmes.dproj` no Delphi RAD Studio

3. Compile e execute com `F9` (ou `Run > Run`)

4. O executável gerado estará em `Win32/Debug/uFilmes.exe`

---

## Como Importar / Exportar Dados

### Importar (Entrada — arquivo `.txt`)

1. Na tela principal, clique no botão **Importar**
2. Selecione um arquivo `.txt` via caixa de diálogo
3. O sistema aceita múltiplos formatos de delimitador: `|`, `;` ou `,`
4. Linhas de cabeçalho e marcadores entre colchetes `[...]` são ignorados automaticamente
5. Cada linha deve conter exatamente **5 campos** na ordem:

   ```
   Titulo;Diretor;Genero;Sinopse;AnoLancamento
   ```

   Exemplo de arquivo válido:
   ```
   Titulo;Diretor;Genero;Sinopse;AnoLancamento
   Interestelar;Christopher Nolan;Ficção Científica;Um grupo de astronautas viaja...;2014
   O Poderoso Chefão;Francis Ford Coppola;Drama;A saga da família Corleone...;1972
   ```

6. Registros duplicados (mesmo título e diretor) são ignorados automaticamente

### Exportar (Saída — arquivo `.csv`)

1. Na tela principal, clique no botão **Exportar CSV**
2. Escolha o local e o nome do arquivo (padrão sugerido: `CatalogoFilmes.csv`)
3. O arquivo gerado usa codificação **UTF-8** e separador `;`, no formato:

   ```csv
   CodFilme;Titulo;Diretor;Genero;AnoLancamento;Sinopse
   1;Interestelar;Christopher Nolan;Ficção Científica;2014;Um grupo de astronautas viaja...
   ```

> **Atenção:** Se o arquivo CSV já estiver aberto em outro programa (como Excel), feche-o antes de exportar para evitar erro de escrita.

---

## Funcionalidades

- **Listagem do catálogo** — exibição de todos os filmes em grade (`DBGrid`) com ordenação por coluna ao clicar no cabeçalho
- **Pesquisa/Filtro** — busca dinâmica por qualquer campo (título, diretor, gênero, código, ano) com atualização em tempo real
- **Cadastro de filmes** — formulário com os campos: Título, Diretor, Gênero, Sinopse e Ano de Lançamento
- **Edição de registros** — carregamento dos dados do filme selecionado para alteração
- **Exclusão de registros** — remoção com caixa de confirmação antes de apagar
- **Validação de campos obrigatórios** — todos os campos são exigidos antes de gravar (Título, Diretor, Gênero, Ano de Lançamento e Sinopse)
- **Validação de duplicidade** — impede cadastro de filmes com mesmo título e diretor já existentes
- **Importação via TXT** — leitura de arquivos com suporte a delimitadores `|`, `;` e `,`, ignorando cabeçalhos e marcadores automaticamente
- **Exportação para CSV** — geração de arquivo `.csv` em UTF-8 com todos os registros do catálogo
- **Proteção do DBGrid** — bloqueio do atalho `Ctrl+Del` para evitar exclusões acidentais direto na grade
- **Conexão configurável** — parâmetros de banco lidos do `config.ini`, com suporte a autenticação SQL Server e Windows

---

## Estrutura do Projeto

```
Sistema-de-cat-logos-de-filmes-em-Delphi/
├── Classes/
│   ├── cCadFilme.pas       # Classe TFilme — regras de negócio e CRUD
│   └── uEnum.pas           # Enumerações: TEstadoDoCadastro
├── Controle/
│   └── Catalogos.csv       # Exemplo de arquivo CSV exportado
├── SQL/
│   └── sqlFilmes.sql       # Script de criação do banco e tabela
├── Win32/Debug/
│   ├── config.ini          # Configuração de conexão com o banco de dados
│   └── uFilmes.exe         # Executável gerado
├── uCadFilme.pas           # Formulário principal (TfrmCadFilme)
├── uCadFilme.dfm           # Layout do formulário principal
├── uDtmConexao.pas         # DataModule de conexão FireDAC (TDataModule1)
├── uDtmConexao.dfm         # Layout do DataModule
├── uFilmes.dpr             # Arquivo de projeto Delphi
├── uFilmes.dproj           # Arquivo de projeto RAD Studio
└── README.md
```

---

## Autor

**Bruno Pignatar**
- GitHub: [@BrunoPignatar](https://github.com/BrunoPignatar)
