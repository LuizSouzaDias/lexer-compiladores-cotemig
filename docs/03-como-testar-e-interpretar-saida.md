# 03 — Como Testar e Interpretar a Saída

## Roteiro de terminal (qualquer pessoa pode repetir)

### 1. Compilar

```bash
make
```

### 2. Testar arquivo 1 (funções simples)

```bash
make test1
```

### 3. Testar arquivo 2 (comentários, strings, operadores)

```bash
make test2
```

### 4. Testar arquivo 3 (erros léxicos)

```bash
make test3
```

### 5. Rodar todos os testes de uma vez

```bash
make test-all
```

### 6. Analisar um arquivo específico diretamente

```bash
./lexer teste2.c
```

---

## Lendo as colunas da saída

```
TIPO          LEXEMA                POSIÇÃO
────────────  ────────────────────  ─────────────
int           int                   [linha  5, col  1]
ID            buscar                [linha  5, col  5]
LPAREN        (                     [linha  5, col 11]
```

| Coluna | O que significa |
|--------|----------------|
| **TIPO** | A categoria léxica do token: `ID` (identificador), `int` (palavra reservada), `PLUS` (operador `+`), `SEMICOL` (`;`), `STRING` (texto entre aspas), `NUM_INT`, `NUM_FLOAT`, `ERROR`, etc. |
| **LEXEMA** | O texto exato como aparece no código-fonte. Para `int x = 5`, os lexemas são `int`, `x`, `=`, `5`, `;`. |
| **POSIÇÃO** | Linha e coluna onde o token começa. Útil para mensagens de erro precisas. |

---

## O que significa um erro léxico?

Um erro léxico ocorre quando o scanner encontra um caractere ou sequência que não pertence a nenhum padrão reconhecido. A mensagem tem o formato:

```
ERRO LÉXICO linha X, coluna Y: descrição
```

**Exemplos:**

| Entrada | Erro gerado |
|---------|-------------|
| `int $x = 10;` | `ERRO LÉXICO linha 1, coluna 5: $` |
| `"texto sem fechar` | `ERRO LÉXICO linha 1, coluna 1: string não fechada` |
| `if (x ! 0)` | `ERRO LÉXICO linha 1, coluna 7: caractere inesperado '!'` |

Para testar erros, edite `teste3_erros.c` e descomente uma das linhas marcadas — uma por vez.
