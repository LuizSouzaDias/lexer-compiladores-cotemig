# COMO TESTAR O ANALISADOR LÉXICO

Este guia mostra, passo a passo, como compilar e executar o lexer a partir do terminal.

---

## Pré-requisitos

- GCC instalado (`gcc --version` deve funcionar)
- Terminal Linux, macOS ou Windows com MinGW/WSL

---

## Passo 1 — Compilar

```bash
make
```

Saída esperada:
```
🔨 Compilando lexer.c...
✅ Compilação concluída com sucesso!
```

---

## Passo 2 — Executar os testes individuais

```bash
make test1
make test2
make test3
```

Ou todos de uma vez:

```bash
make test-all
```

---

## Passo 3 — Executar manualmente

```bash
./lexer teste2.c
```

Ou analisar qualquer arquivo `.c`:

```bash
./lexer meu_codigo.c
```

---

## Interpretando a saída

Cada linha da saída representa um token reconhecido:

```
TIPO          LEXEMA                POSIÇÃO
────────────  ────────────────────  ─────────────
int           int                   [linha  5, col  1]
ID            soma                  [linha  5, col  5]
LPAREN        (                     [linha  5, col  9]
```

| Coluna   | Significado |
|----------|-------------|
| **TIPO** | Categoria do token (palavra reservada, identificador, operador, etc.) |
| **LEXEMA** | Texto exato encontrado no código-fonte |
| **POSIÇÃO** | Linha e coluna onde o token começa |

---

## O que é um erro léxico?

Quando o scanner encontra um caractere que não pertence a nenhum padrão reconhecido, ele emite uma mensagem de erro:

```
ERRO LÉXICO linha 7, coluna 5: caractere inesperado '$'
```

Para testar erros, edite `teste3_erros.c` e descomente uma das linhas marcadas.

---

## Testando a melhoria implementada (palavra reservada `for` e colchetes `[ ]`)

```bash
./lexer teste_autoral_DIAS.c
```

Você deve ver tokens como:
```
for           for                   [linha 16, col  5]
LBRACKET      [                     [linha  5, col 20]
RBRACKET      ]                     [linha  5, col 21]
```
