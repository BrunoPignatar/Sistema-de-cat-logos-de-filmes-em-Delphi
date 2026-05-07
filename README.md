<div align="center">

<img src="https://img.shields.io/badge/Delphi-RAD%20Studio-EE1F35?style=for-the-badge&logo=embarcadero&logoColor=white"/>
<img src="https://img.shields.io/badge/SQL%20Server-MSSQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
<img src="https://img.shields.io/badge/FireDAC-Database%20Layer-0078D4?style=for-the-badge&logo=microsoft&logoColor=white"/>
<img src="https://img.shields.io/badge/Platform-Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white"/>
<img src="https://img.shields.io/badge/Status-Concluído-00C853?style=for-the-badge"/>

<br/><br/>

# 🎬 Sistema de Catálogo de Filmes

### Aplicação desktop em **Delphi** com banco de dados SQL Server
### Entrada via **TXT** · Saída via **CSV** · Interface visual em **VCL**

<br/>

![Delphi](https://img.shields.io/badge/Object_Pascal-Delphi-EE1F35?style=flat-square&logo=embarcadero)
![SQL](https://img.shields.io/badge/SQL-T--SQL-CC2927?style=flat-square&logo=microsoftsqlserver)
![Windows](https://img.shields.io/badge/OS-Windows_10%2F11-0078D4?style=flat-square&logo=windows)
![License](https://img.shields.io/badge/Licença-MIT-green?style=flat-square)

</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Arquitetura](#-arquitetura)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação Passo a Passo](#-instalação-passo-a-passo)
- [Configuração do Banco de Dados](#-configuração-do-banco-de-dados)
- [Configuração da Conexão](#-configuração-da-conexão-configini)
- [Como Usar](#-como-usar)
- [Importar TXT](#-importando-dados-via-txt)
- [Exportar CSV](#-exportando-para-csv)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Solução de Problemas](#-solução-de-problemas)

---

## 🎯 Sobre o Projeto

> **Desafio:** Catálogo de Filmes &nbsp;|&nbsp; **Entrada:** `.TXT` &nbsp;|&nbsp; **Saída:** `.CSV`

Sistema desktop desenvolvido em **Delphi (Object Pascal)** para gerenciar um catálogo de filmes. Conecta-se a um banco **SQL Server** via **FireDAC**, permite cadastrar filmes manualmente, importar dados em massa por arquivo `.txt` com múltiplos formatos de delimitador, e exportar o catálogo completo para `.csv` com encoding UTF-8.

---

## ✨ Funcionalidades

| Funcionalidade | Descrição |
|---|---|
| 📋 **Listagem** | Grade com todos os filmes e ordenação por coluna |
| 🔍 **Pesquisa dinâmica** | Filtro em tempo real por qualquer campo |
| ➕ **Cadastro** | Formulário completo com validação de campos obrigatórios |
| ✏️ **Edição** | Carrega dados do registro selecionado para alteração |
| 🗑️ **Exclusão** | Remove com caixa de confirmação antes de apagar |
| 🚫 **Anti-duplicidade** | Impede filmes com mesmo título e diretor |
| 📥 **Importar TXT** | Lê arquivos com delimitadores `\|`, `;` ou `,` |
| 📤 **Exportar CSV** | Gera `.csv` em UTF-8 com todos os registros |
| 🔒 **Proteção do grid** | Bloqueia `Ctrl+Del` para evitar exclusões acidentais |
| ⚙️ **Conexão configurável** | Parâmetros lidos do `config.ini` (SQL ou Windows Auth) |

---

## 🏗️ Arquitetura

```
┌─────────────────────────────────────────────┐
│              INTERFACE (VCL)                │
│  ┌──────────────┐    ┌──────────────────┐   │
│  │  uCadFilme   │    │   uDtmConexao    │   │
│  │  (FormView)  │◄──►│  (DataModule)    │   │
│  └──────┬───────┘    └────────┬─────────┘   │
│         │                     │             │
│  ┌──────▼───────┐    ┌────────▼─────────┐   │
│  │  cCadFilme   │    │    FireDAC       │   │
│  │  (TFilme)    │    │  TFDConnection   │   │
│  │  CRUD/Rules  │    │  TFDQuery        │   │
│  └──────────────┘    └────────┬─────────┘   │
└────────────────────────────────┼────────────┘
                                 │
                    ┌────────────▼────────────┐
                    │      SQL SERVER         │
                    │   database: filmes      │
                    │   table: catalogo       │
                    └─────────────────────────┘

  [.TXT] ──► Importar ──► SQL Server ──► Exportar ──► [.CSV]
```

---

## 🖥️ Pré-requisitos

Antes de começar, garanta que você tem instalado:

| # | Requisito | Versão mínima | Download |
|---|---|---|---|
| 1 | **Windows** | 10 ou 11 (64-bit) | — |
| 2 | **Delphi RAD Studio** | 10.3 Rio ou superior | [embarcadero.com](https://www.embarcadero.com/products/rad-studio) |
| 3 | **SQL Server** | 2016 ou superior | [microsoft.com](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads) |
| 4 | **SSMS** *(opcional)* | Qualquer versão | [Download SSMS](https://learn.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms) |
| 5 | **Git** | Qualquer versão | [git-scm.com](https://git-scm.com/downloads) |

> 💡 **Não tem licença do Delphi?** Baixe a versão gratuita **Community Edition** em [embarcadero.com/products/delphi/starter](https://www.embarcadero.com/products/delphi/starter)

---

## 🚀 Instalação Passo a Passo

### Passo 1 — Clonar o repositório

Abra o **Prompt de Comando** ou **PowerShell** e execute:

```bash
git clone https://github.com/BrunoPignatar/Sistema-de-cat-logos-de-filmes-em-Delphi.git
```

```bash
cd Sistema-de-cat-logos-de-filmes-em-Delphi
```

---

### Passo 2 — Instalar o SQL Server

1. Baixe o **SQL Server Developer** (gratuito para desenvolvimento) em:
   👉 https://www.microsoft.com/pt-br/sql-server/sql-server-downloads

2. Execute o instalador e escolha **"Básico"** para instalação rápida

3. Anote o **nome do servidor** exibido ao final da instalação
   > Exemplo: `MEUPC\SQLEXPRESS` ou `localhost`

4. *(Opcional)* Instale o **SSMS** para gerenciar o banco visualmente

---

### Passo 3 — Habilitar autenticação SQL Server

Por padrão o SQL Server aceita apenas autenticação Windows. Para usar usuário e senha:

1. Abra o **SSMS** e conecte-se ao servidor
2. Clique com o botão direito no servidor → **Propriedades**
3. Vá em **Segurança** → marque **"SQL Server e Autenticação do Windows"**
4. Clique em **OK** e **reinicie o serviço** do SQL Server

---

## 🗄️ Configuração do Banco de Dados

### Passo 4 — Criar o banco e a tabela

Abra o **SSMS**, conecte-se ao servidor, clique em **"Nova Consulta"** e execute o script abaixo (disponível também em `SQL/sqlFilmes.sql`):

```sql
-- Criar o banco de dados
CREATE DATABASE filmes;
GO

-- Usar o banco criado
USE filmes;
GO

-- Criar a tabela principal
CREATE TABLE catalogo (
    idFilme       INT IDENTITY,
    titulo        VARCHAR(100),
    diretor       VARCHAR(100),
    genero        VARCHAR(50),
    sinopse       VARCHAR(500),
    anoLancamento VARCHAR(10),
    CONSTRAINT pk_filme Primary key(titulo, diretor)
);
GO
```

✅ Após executar, você deve ver a mensagem `Command(s) completed successfully.`

---

## ⚙️ Configuração da Conexão (`config.ini`)

### Passo 5 — Configurar o arquivo de conexão

Localize o arquivo `Win32\Debug\config.ini` dentro do projeto e edite com o **Bloco de Notas**:

```ini
[DB]
Server=NOME_DO_SEU_SERVIDOR\INSTANCIA
Database=filmes
User=sa
Password=sua_senha_aqui
```

> 🔎 **Como descobrir o nome do servidor?**
> No SSMS, o nome aparece na tela de login. Exemplos comuns:
> - `localhost`
> - `MEUPC\SQLEXPRESS`
> - `192.168.1.10\SQLSERVER`

**Para usar autenticação Windows** (sem usuário/senha), configure assim:

```ini
[DB]
Server=NOME_DO_SERVIDOR
Database=filmes
Auth=Windows
```

---

### Passo 6 — Abrir o projeto no Delphi

1. Abra o **Delphi RAD Studio**
2. Vá em **File → Open → Project...**
3. Navegue até a pasta clonada e selecione `uFilmes.dproj`
4. Aguarde o Delphi carregar todas as units

---

### Passo 7 — Compilar e executar

No Delphi, pressione:

```
F9  →  Compila e executa o projeto
```

Ou pelo menu: **Run → Run**

O executável compilado ficará em:
```
Win32\Debug\uFilmes.exe
```

> ⚠️ Certifique-se de que o arquivo `config.ini` está na **mesma pasta** que o `uFilmes.exe`

---

## 📖 Como Usar

### Tela Principal — Listagem

```
┌─────────────────────────────────────────────────────────┐
│  🎬 Catálogo de Filmes                                  │
├──────────────────────────────────────────────────────── │
│  [Novo]  [Alterar]  [Apagar]  [Pesquisar: __________ ] │
├────────┬──────────────┬──────────────┬──────┬──────────┤
│ Código │    Título    │   Diretor    │ Gên. │   Ano    │
├────────┼──────────────┼──────────────┼──────┼──────────┤
│   1    │ Interestelar │ C. Nolan     │ FC   │   2014   │
│   2    │ O Poderoso.. │ F. Coppola   │ Dra  │   1972   │
└────────┴──────────────┴──────────────┴──────┴──────────┘
         [📥 Importar TXT]  [📤 Exportar CSV]  [Fechar]
```

- Clique no **cabeçalho de qualquer coluna** para ordenar
- Use o campo **Pesquisar** para filtrar registros em tempo real
- Selecione um registro na grade antes de clicar em **Alterar** ou **Apagar**

### Tela de Cadastro

Campos disponíveis:

| Campo | Obrigatório | Tipo |
|---|---|---|
| Título | ✅ Sim | Texto |
| Diretor | ✅ Sim | Texto |
| Gênero | ✅ Sim | Texto |
| Ano de Lançamento | ✅ Sim | Numérico (apenas números) |
| Sinopse | ✅ Sim | Texto longo |

---

## 📥 Importando Dados via TXT

O sistema aceita arquivos `.txt` com os seguintes formatos de delimitador:

| Delimitador | Exemplo |
|---|---|
| Ponto e vírgula `;` | `Título;Diretor;Gênero;Sinopse;Ano` |
| Pipe `\|` | `Título\|Diretor\|Gênero\|Sinopse\|Ano` |
| Vírgula `,` | `Título,Diretor,Gênero,Sinopse,Ano` |

### Formato esperado do arquivo

Crie um arquivo `.txt` com **UTF-8** e 5 colunas por linha:

```
Titulo;Diretor;Genero;Sinopse;AnoLancamento
Interestelar;Christopher Nolan;Ficção Científica;Astronautas viajam pelo universo em busca de um novo lar para a humanidade;2014
O Poderoso Chefão;Francis Ford Coppola;Drama;A saga da família Corleone e o submundo do crime nos EUA;1972
Parasita;Bong Joon-ho;Suspense;Uma família pobre infiltra-se na vida de uma família rica com consequências inesperadas;2019
```

### Regras de importação

- ✅ Linhas de cabeçalho são detectadas e ignoradas automaticamente
- ✅ Marcadores no formato `[secao]` são ignorados
- ✅ Registros duplicados (mesmo título + diretor) são pulados
- ✅ Linhas em branco são ignoradas
- ❌ Linhas com menos de 5 campos são descartadas
- ❌ Campos vazios invalidam a linha inteira

### Como importar

1. Clique em **📥 Importar TXT** na tela principal
2. Selecione o arquivo `.txt` no explorador de arquivos
3. Aguarde a mensagem de confirmação com o total de registros inseridos

---

## 📤 Exportando para CSV

### Formato do arquivo gerado

```csv
CodFilme;Titulo;Diretor;Genero;AnoLancamento;Sinopse
1;Interestelar;Christopher Nolan;Ficção Científica;2014;Astronautas viajam...
2;O Poderoso Chefão;Francis Ford Coppola;Drama;1972;A saga da família...
```

- Separador: **ponto e vírgula** (`;`)
- Codificação: **UTF-8**
- Nome padrão sugerido: `CatalogoFilmes.csv`

### Como exportar

1. Clique em **📤 Exportar CSV** na tela principal
2. Escolha o local e nome do arquivo no explorador
3. Clique em **Salvar**

> ⚠️ Se o arquivo CSV já estiver aberto no Excel ou outro programa, **feche-o antes** de exportar para evitar erro de escrita.

---

## 📁 Estrutura do Projeto

```
📦 Sistema-de-cat-logos-de-filmes-em-Delphi/
│
├── 📂 Classes/
│   ├── 📄 cCadFilme.pas        ← Classe TFilme | Regras de negócio e CRUD
│   └── 📄 uEnum.pas            ← Enumerações: TEstadoDoCadastro
│
├── 📂 Controle/
│   └── 📄 Catalogos.csv        ← Exemplo de arquivo CSV exportado
│
├── 📂 SQL/
│   └── 📄 sqlFilmes.sql        ← Script de criação do banco e tabela
│
├── 📂 Win32/Debug/
│   ├── ⚙️  config.ini          ← Configuração da conexão com o banco
│   └── 🖥️  uFilmes.exe         ← Executável compilado
│
├── 📄 uCadFilme.pas            ← Formulário principal (TfrmCadFilme)
├── 📄 uCadFilme.dfm            ← Layout visual do formulário
├── 📄 uDtmConexao.pas          ← DataModule de conexão FireDAC
├── 📄 uDtmConexao.dfm          ← Layout do DataModule
├── 📄 uFilmes.dpr              ← Arquivo de projeto Delphi
├── 📄 uFilmes.dproj            ← Arquivo de projeto RAD Studio
└── 📄 README.md
```

---

## 🔧 Solução de Problemas

<details>
<summary><strong>❌ "Arquivo config.ini não encontrado"</strong></summary>

O `config.ini` precisa estar na **mesma pasta** do executável.

- Se executando pela IDE: coloque em `Win32\Debug\config.ini`
- Se executando o `.exe` diretamente: coloque na mesma pasta do `uFilmes.exe`

</details>

<details>
<summary><strong>❌ Erro de conexão com o banco de dados</strong></summary>

1. Verifique se o **serviço do SQL Server** está rodando:
   - Abra `services.msc` → procure por `SQL Server (...)` → Status deve ser **Executando**

2. Confirme o nome do servidor no `config.ini`:
   - Abra o SSMS e veja o nome exato exibido na tela de conexão

3. Verifique se a **autenticação SQL Server** está habilitada (Passo 3 deste guia)

4. Teste a conexão diretamente no SSMS com as mesmas credenciais do `config.ini`

</details>

<details>
<summary><strong>❌ "Filme já cadastrado" ao importar</strong></summary>

O sistema impede duplicatas com base na combinação **Título + Diretor**. Se o filme já existe no banco, ele é ignorado na importação — isso é o comportamento esperado.

</details>

<details>
<summary><strong>❌ Erro ao exportar CSV ("fechar o arquivo já aberto")</strong></summary>

O arquivo `.csv` de destino está aberto em outro programa (Excel, por exemplo). Feche o arquivo antes de exportar novamente.

</details>

<details>
<summary><strong>❌ Registros não aparecem após importar TXT</strong></summary>

Verifique se o arquivo `.txt`:
- Está salvo em **UTF-8** (no Bloco de Notas: Salvar como → Codificação: UTF-8)
- Tem exatamente **5 colunas** por linha
- Não tem campos vazios em nenhuma linha de dados
- Usa um dos delimitadores suportados: `;`, `|` ou `,`

</details>

---

<div align="center">

---

Feito com ❤️ por **Bruno Pignatar**

[![GitHub](https://img.shields.io/badge/GitHub-BrunoPignatar-181717?style=for-the-badge&logo=github)](https://github.com/BrunoPignatar)

</div>
