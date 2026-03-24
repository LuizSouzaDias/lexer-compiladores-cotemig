/*
 * Arquivo: teste_autoral_DIAS.c
 * Autor: Luiz Henrique Souza Dias
 * Matricula: 72300027
 * Turma: Compiladores — Cotemig
 * Descricao: Teste autoral para o exercicio 10.1 da disciplina de Compiladores.
 *            Cobre: string literal, operador relacional, comentario de linha
 *            e comentario de bloco. Tambem testa a melhoria implementada:
 *            palavra reservada 'for' e delimitadores '[' e ']'.
 */

/* Comentario de bloco: funcao de soma de vetor */
int somarVetor(int arr[], int tamanho) {
    int soma = 0;

    // Comentario de linha: laco for usa a nova palavra reservada implementada
    for (int i = 0; i < tamanho; i++) {
        soma = soma + arr[i];
    }

    return soma;
}

int main() {
    int numeros[] = {1, 2, 3, 4, 5};
    int total = somarVetor(numeros, 5);

    // Teste de operador relacional >=
    if (total >= 10) {
        char msg[] = "Soma maior ou igual a 10";
    }

    /* Comentario de bloco: verificacao com != */
    if (total != 0) {
        return total;
    }

    return 0;
}
