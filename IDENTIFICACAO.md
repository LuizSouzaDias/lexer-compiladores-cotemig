# IDENTIFICAÇÃO DO ALUNO

| Campo         | Informação                   |
|---------------|------------------------------|
| **Nome**      | Luiz Henrique Souza Dias     |
| **Matrícula** | 72300027        |            
| **Disciplina**| Compiladores — Cotemig       |

---

## O que aprendi ao montar este repositório

Ao organizar este repositório, compreendi na prática como um scanner funciona de verdade: não basta reconhecer palavras isoladas, é preciso gerenciar o fluxo de caracteres com cuidado, usando funções como `avancar()`, `espiar()` e `pular_brancos()` para controlar o estado da leitura a cada instante. Aprendi também a importância do **lookahead** — sem ele, seria impossível distinguir `=` de `==` ou `<` de `<=` apenas olhando o caractere atual. A distinção entre **lexema** (o texto literal no código-fonte) e **token** (a categoria atribuída a esse texto) deixou de ser teoria e passou a fazer sentido como estrutura de dados real. Por fim, perceber que o scanner é apenas a primeira etapa de um processo maior — e que ele entrega uma sequência limpa de tokens para o parser — me ajudou a enxergar o compilador como um pipeline bem dividido.
