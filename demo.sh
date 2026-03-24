#!/bin/bash
# demo.sh — Demonstração interativa do analisador léxico

echo "════════════════════════════════════════════════════════════"
echo " DEMONSTRAÇÃO INTERATIVA — ANALISADOR LÉXICO"
echo "════════════════════════════════════════════════════════════"
echo ""

# Compila se necessário
if [ ! -f lexer ]; then
    echo "🔨 Compilando lexer..."
    make
    echo ""
fi

echo "▶ Demo 1: Código embutido (exemplo do professor)"
echo "────────────────────────────────────────────────────────────"
./lexer
echo ""

echo "▶ Demo 2: teste1.c — funções simples"
echo "────────────────────────────────────────────────────────────"
./lexer teste1.c
echo ""

echo "▶ Demo 3: teste2.c — comentários, strings e operadores"
echo "────────────────────────────────────────────────────────────"
./lexer teste2.c
echo ""

echo "▶ Demo 4: teste autoral — for, colchetes e operadores relacionais"
echo "────────────────────────────────────────────────────────────"
./lexer teste_autoral_DIAS.c
echo ""

echo "════════════════════════════════════════════════════════════"
echo " Demonstração concluída!"
echo "════════════════════════════════════════════════════════════"
