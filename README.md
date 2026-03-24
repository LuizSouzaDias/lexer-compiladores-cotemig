# ANALISADOR LÉXICO EM C — Luiz Henrique Souza Dias

**Disciplina:** Compiladores — Cotemig  
**Aluno:** Luiz Henrique Souza Dias  
**Matrícula:** 72300027  
**Turma:** Compiladores  

---

## Descrição

Analisador léxico (scanner) completo e didático implementado em C para a disciplina de Compiladores. Lê um arquivo `.c` como argumento de linha de comando e produz a lista de tokens reconhecidos com tipo, lexema e posição (linha e coluna).

---

## Tokens Reconhecidos

| Categoria         | Exemplos                          |
|-------------------|-----------------------------------|
| Palavras-chave    | `if`, `else`, `while`, `for`, `int`, `float`, `return` |
| Identificadores   | `x`, `soma`, `contador`           |
| Inteiros          | `42`, `0`, `123`                  |
| Reais             | `3.14`, `0.5`, `2.0`              |
| Strings           | `"hello world"`                   |
| Operadores simples| `+`, `-`, `*`, `/`, `=`, `<`, `>` |
| Operadores duplos | `==`, `!=`, `<=`, `>=`            |
| Delimitadores     | `(`, `)`, `{`, `}`, `[`, `]`, `;`, `,` |

---

## Compilação

```bash
make
```

---

## Execução

```bash
# Modo embutido (exemplo didático)
./lexer

# Analisar arquivo externo
./lexer teste1.c
./lexer teste2.c
./lexer teste_autoral_DIAS.c
```

---

## Testes

```bash
make test1       # funções simples
make test2       # comentários, strings e operadores
make test3       # casos de erro léxico
make test-all    # todos os testes
```

---

## Teste Autoral

```bash
./lexer teste_autoral_DIAS.c
```

Trecho da saída:

```
Autor(a): Luiz Henrique Souza Dias | Turma Compiladores | Repositório: lexer-compiladores
───────────────────────────────────────────────────────────

═══════════════════════════════════════════════════════════
 ANÁLISE LÉXICA DO ARQUIVO: teste_autoral_DIAS.c
═══════════════════════════════════════════════════════════

TOKENS RECONHECIDOS:
───────────────────────────────────────────────────────────
TIPO          LEXEMA                POSIÇÃO
────────────  ────────────────────  ─────────────
int           int                   [linha 13, col  1]
ID            somarVetor            [linha 13, col  5]
LPAREN        (                     [linha 13, col 15]
int           int                   [linha 13, col 16]
ID            arr                   [linha 13, col 20]
LBRACKET      [                     [linha 13, col 23]
RBRACKET      ]                     [linha 13, col 24]
...
for           for                   [linha 17, col  5]
...
GE            >=                    [linha 29, col 15]
...
STRING        Soma maior ou igual a 10  [linha 30, col 22]
...
NEQ           !=                    [linha 34, col 15]
...
EOF           <EOF>                 [linha 40, col  1]
───────────────────────────────────────────────────────────
Total de tokens: 110
```

---

## Alterações do Aluno

### Opção C — Nova palavra reservada `for`

Adicionado suporte completo ao token `TOK_FOR` para reconhecer a palavra reservada `for`.

**Alterações em `lexer.c`:**

1. Novo valor no enum `TokenType`: `TOK_FOR`
2. Entrada na tabela `reservadas[]`: `{"for", TOK_FOR}`
3. Nome legível no array `nomes_tokens[]`: `"for"`

**Efeito:** a entrada `for (int i = 0; i < n; i++)` agora produz o token `<for, for>` em vez de `<ID, for>`.

### Bônus — Delimitadores `[` e `]`

Adicionados também os tokens `TOK_LBRACKET` e `TOK_RBRACKET` para reconhecer colchetes, necessários em declarações de vetores como `int arr[]`.

---

## Estrutura do Repositório

```
/
├── lexer.c
├── Makefile
├── README.md
├── COMO_TESTAR.md
├── demo.sh
├── teste1.c
├── teste2.c
├── teste3_erros.c
├── IDENTIFICACAO.md
├── teste_autoral_DIAS.c
└── docs/
    ├── 01-visao-geral.md
    ├── 02-como-o-scanner-reconhece-tokens.md
    └── 03-como-testar-e-interpretar-saida.md
```

---

## Referências

- Aho, Lam, Sethi, Ullman — *Compiladores: Princípios, Técnicas e Ferramentas*
- Slides da disciplina — Prof. Dr. Júlio Cesar da Silva
