# 02 — Como o Scanner Reconhece Tokens

Este documento explica, passo a passo, como três classes de tokens são reconhecidas neste projeto, com destaque para o uso de **lookahead**.

---

## Classe 1: Identificadores e Palavras Reservadas

**Padrão:** `[a-zA-Z_][a-zA-Z0-9_]*`

**Passo a passo:**

1. O scanner chama `espiar()` e encontra uma letra ou `_`.
2. Chama `avancar()` para consumir o primeiro caractere e inicia um buffer.
3. Entra em loop: enquanto `espiar()` retornar letra, dígito ou `_`, continua consumindo.
4. Ao sair do loop, chama `checar_reservada(buf)` para decidir se o lexema é uma palavra-chave ou um identificador comum.

**Exemplo:**

- Entrada: `for` → scanner consome `f`, `o`, `r` → `checar_reservada("for")` retorna `TOK_FOR` → token: `<for, for>`
- Entrada: `contador` → `checar_reservada` retorna `TOK_ID` → token: `<ID, contador>`

Aqui não há lookahead explícito: basta verificar se o próximo caractere ainda pertence ao padrão.

---

## Classe 2: Operadores de dois caracteres (lookahead em ação)

**Padrão:** `==`, `!=`, `<=`, `>=`

**Passo a passo para `=`:**

1. Scanner avança e lê `=`.
2. **Lookahead:** chama `espiar()` sem consumir.
   - Se o próximo for `=` → consome com `avancar()` → token `<EQ, ==>`
   - Caso contrário → token `<ASSIGN, =>`

**Por que o lookahead é necessário?**

Sem ele, o scanner não consegue distinguir `=` (atribuição) de `==` (igualdade) apenas com o caractere atual. É preciso "espiar" o próximo antes de decidir qual token emitir.

**Exemplo concreto:**

- Entrada: `x == 5`
  - Lê `x` → `<ID, x>`
  - Lê `=`, espia `=` → consome → `<EQ, ==>`
  - Lê `5` → `<NUM_INT, 5>`

- Entrada: `x = 5`
  - Lê `=`, espia ` ` (espaço) → **não** consome → `<ASSIGN, =>`

---

## Classe 3: Strings literais

**Padrão:** `"[^"]*"`

**Passo a passo:**

1. Scanner encontra `"` (aspas de abertura) e chama `avancar()`.
2. Entra em loop consumindo todos os caracteres até encontrar `"` de fechamento ou EOF.
3. Se encontrar `"` → consome e retorna token `<STRING, conteúdo>`.
4. Se chegar ao EOF sem fechar → erro léxico: `"string não fechada"`.

**Exemplo:**

- Entrada: `"Resultado: "` → token: `<STRING, Resultado: >`
- Entrada: `"texto incompleto` (sem fechar) → `ERRO LÉXICO: string não fechada`

O lexema armazenado **não inclui as aspas** — apenas o conteúdo interno.
