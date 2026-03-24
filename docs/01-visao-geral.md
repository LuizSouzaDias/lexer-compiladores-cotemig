# 01 — Visão Geral: O Scanner no Front End do Compilador

## O papel do scanner

O compilador é dividido em etapas. O **front end** é responsável por entender o programa-fonte: ele lê o texto, verifica se está correto e produz uma representação intermediária para as etapas seguintes. O **scanner** (ou analisador léxico) é a primeira função do front end. Ele recebe um fluxo contínuo de caracteres e o organiza em unidades com significado, chamadas de **tokens**.

Sem o scanner, o parser receberia caracteres soltos — uma bagunça. Com o scanner, o parser recebe uma sequência limpa como: `int`, `soma`, `(`, `int`, `a`, `,`, `int`, `b`, `)`, `{`, `return`, ...

---

## As três noções fundamentais

| Conceito | Definição | Exemplo |
|----------|-----------|---------|
| **Padrão** | Descrição abstrata (geralmente uma expressão regular) do conjunto de cadeias válidas para uma categoria | `[a-zA-Z_][a-zA-Z0-9_]*` descreve identificadores |
| **Lexema** | Sequência concreta de caracteres encontrada no código-fonte | `contador`, `soma`, `x` |
| **Token** | Par `<tipo, lexema>` — a classificação atribuída ao lexema pelo scanner | `<ID, contador>`, `<int, int>`, `<NUM_INT, 42>` |

---

## Exemplo concreto

Considere a linha de código:

```c
int x = 42;
```

O scanner lê caractere por caractere e produz a seguinte sequência de tokens:

| Lexema | Token produzido |
|--------|----------------|
| `int`  | `<int, int>` (palavra reservada) |
| `x`    | `<ID, x>` (identificador) |
| `=`    | `<ASSIGN, =>` (operador de atribuição) |
| `42`   | `<NUM_INT, 42>` (inteiro literal) |
| `;`    | `<SEMICOL, ;>` (delimitador) |

Essa sequência é o que o scanner entrega ao parser para análise sintática.
