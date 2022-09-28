# Aula 02 - Classes de Computadores e terminologia do MIPS

## Quais as classes de computadores e seus fatores críticos?
1. PMD;
    Preço; eficiência energética limitada por falta de arrefecimento, embalagem ineficiente (plástica), baterias, memória flash (maior consumo); limitação do tamanho do código de aplicativos.

2. Desktop;
    Autonomia das baterias (fontes necessárias); mercado guiado pela relação preço/desempenho.

3. Servers;
    Relação disponibilidade/fiabilidade (o quanto funciona sem comprometimentos); escalabilidade; throughput (desempenho geral), quantificado por transações/minuto.

4. Clusters;
    Relação preço/desempenho; consumo energético.

5. IoT;
    Desempenho mínimo estritamente necessário para a tarefa; fortes limitações de custo e consumo de energia;

## Qual a classe mais barata/difundida e por quê?
    IoT; preço, energia, performance associada à especificidade da aplicação.

## Qual a diferença entre processadores PMD e embutidos (IoT)?
    Especialidade; processadores mobile permitem maior flexibilidade ao se programar para, enquanto que IoT são restritos ao software que o gere.

## O que é o ISA?
    Instruction set arquitecture; conjunto de instruções para "configurar" a criação de processadores;

## O que é a GPR Subclass registo-memória?
    Instruções gerais também podem aceder à memórica (ex. 80x86).

## O que é a GPR Subclass registo-registo?;
    Somente instruções load e store podem aceder à memória (ex. ARM, MIPS).

## Qual a diferença entre as memórias de registo, data e code (instruções)?
    R - 64 bits ou 8 BYTES;
    D - 64 bits ou 8 BYTES;
    I - 32 bits ou 4 BYTES;

## Quais as fases do pipeline?
    (F) Fetch
    (D) Decode
    (Exec) Execução
    (Mem) Memory
    (W-B) Write back

## Qual a relação entre operandos (variáveis) e suas ocupações de memória?
    8B(word), 4B(word32), 2B(word16), 1B(byte) e seus múltiplos, respectivamente.

## Quais as diferenças entre os modos de endereçamento REGISTO e IMEDIATO do MIPS?
    Modo Registo (dadd); modo Imediato (daddi);

## O que é o PC-Relative em relação aos modos de endereçamento do MIPS?
    Modo Program Counter Relative - Uma forma de referenciar instruções e programar ações. Por exemplo PC=PC+4 está associado à insturção da linha seguinte, pois cada linha ocupa 4B, os quais foram devidamente incrementados.

## Quais os tipos de instruções do MIPS?
    Data Transfers (ld e sd);
    Operators (dadd e daddi)
    Control (branch - BEQZ, BNEZ, beq, bne)
    Vírgula flutuante (complex math operations with floats)

## Quais os três grandes tipos de instruções?
    Registos, imediatas, jumps (saltos), FR (operações de vírgula), FI (saltos condicionais).