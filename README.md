# Diário PL4

<!--
<details><summary><b>Day XXX</b>
</summary>
<ul>
    <li><code></code></li>
    <li><code></code></li>
    <li><code></code></li>
</ul>
<p style="text-align:justify">TEXT</p>
</details>
-->

<details><summary><b>Terminologia Básica</b>
</summary>
<ul>
  <li><code>.data</code> corresponde à zona de dados variáveis;</li>
  <li><code>.word</code> corresponde a 64 bits ou 8 bytes;</li>
  <li><code>.code</code> inicia a secção de código;</li>
  <li><code>.halt</code> finaliza a secção de código;</li>
  <li><code>l</code> corresponde a "load", carrega os dados em questão;</li>
  <li><code>s</code> corresponde a "store", guarda os dados em questâo;</li>
  <li><code>d</code> "double word", relativo a 64 bits;</li>
  <li><code>add</code> corresponde à "soma";</li>
  <li><code>i</code> é uma constante, relativa a imediato; sua utilidade vem quando lidamos com constantes ao invés de registros;</li>
</ul>
</details>

<detail><summary><b>Notas para a P1</b>
</summary>

## I - Para se converter de decimal para hexadecimal, deve-se:

1. Converter o número para binário:
2. Separar o número binário em grupos de quatro da direita para a esquerda e converter cada grupo ao seu hexadecimal adequado;
3. Juntar os resultados da esquerda para a direita a fim de formar o algarismo em hexadecimal.

## II - Pare se realizar uma simples soma em assembly, deve-se:
```
  .data
A: .word 10
B: .word 8
C: .word 0
; acima, realiza-se a declaração de variáveis em 64BITS

  .text
main:
  ld r4,A(r0)
  ld r5,B(r0)
  dadd r3,r4,r5
  sd r3,C(r0)
halt
```
Primeiramente, lembre-se do mais importante: Por que colocamos `r0`? PORQUE SIM! Sigamos.

Vamos analisar as linhas subsequentes à `main`:
1. `ld` (load/carregar/<-) em `r4` o valor correspondente à variável `A`;
2. `ld` (load/carregar) em `r5` o valor correspondente à variável `B`;
3. `dadd` (soma) em `r3` os valores de `r4` e `r5`, ou seja, `r3 = A+B = 10+8`;
4. `sd` (store/guardar->) em `C` o valor de `r3`.

## III - Para se realizar uma soma composta em assembly, deve-se:
```
  .data
A: .word 10
B: .word 8
Z: .word 2
C: .word 0

  .text
main:
  ld r4,A(r0)
  ld r5,B(r0)
  ld r6,Z(r0)

  dadd r3,r4,r5
  dadd r3,r3,r6
  sd r3,C(r0)
halt
```
Vamos analisar as linhas subsequentes à `main`:
1. `ld` (load/carregar/<-) em `r4` o valor correspondente à variável `A`;
2. `ld` (load/carregar) em `r5` o valor correspondente à variável `B`;
3. `ld` (load/carregar) em `r6` o valor correspondente à variável `Z`;
4. `dadd` (soma) em `r3` os valores de `r4` e `r5`, ou seja, `r3 = A+B = 10+8`; importante ressaltar que `r3` agora representa a soma de `A+B`;
5. `dadd` (soma) em `r3` os valores de `r3` e `r6`; ou seja, `r3 = (A+B)+Z`;
6. `sd` (store/guardar->) em `C` o valor de `r3`.

## IV - Para trocar duas variáveis, deve-se:
```
.data
  A: .word 10
  B: .word 8

.code
  ld r4,A(r0)
  ld r5,B(r0)
  sd r4,B(r0)
  sd r5,A(r0)
halt
```
1. Simplesmente atribui-se o valor de uma variável ao registro oposto com `sd`;
1.1. Alternativamente, poder-se-ía utilizar `dadd`a fim de atribuir diretamente ao registro ao assemelhar-se a uma soma com `r0`, da seguinte forma:
```
[...]
  dadd r3,r4,r0
  dadd r4,r5,r0
  dadd r5,r3,r0
[...]
```
## V - Quais estruturas de memória controlam o que é mostrado no terminal?
1. `CR` = Unidade controle; quando `CR=1`, aquilo que foi guardado no painel de dados é mostrado; É preciso, ao final do código, usar-se de `sd r10(r1)` (assumindo que atribuímos CR à r1).
2. `DR` = Unidade de armazenamento de dados. É preciso usar-se de `

## - VI - Como exibir uma soma de duas variárias num ecrã, cujos valores foram providos pelo usuário?
```
.data
  A: .word 10
  B: .word 8
  C: .word 0
  CR: .word32 0x10000 ; Control Register tem o endereço 10000
  DR: .word32 0x10008 ; Data Register tem o endereço 10008

.code
  lwu r1,CR(r0) ; end. mem. do Control Register em r1
  lwu r2,DR(r0) ; end. mem. do Data Register em r2

  daddi r10,r0,8 ; Código 8 (código para ler dados de teclado)

  sd r10,(r1) ; Chama rotina para a introdução de dados de teclado
  ld r4,(r2) ; Obtem 1º numero do teclado
  ld r4,A(r0)
  sd r10,(r1) ; Chama rotina para a introdução de dados do teclado
  ld r5,(r2) ; Obtem 2º numero do teclado
  ld r5,B(r0)
  dadd r3,r4,r5
  sd r3,C(r0) ; Colocar a soma que está em r3 na variável C

  sd r3,(r2) ; Valor a mostrar é colocado no Data Register

  daddi r10,r0,1 ; Código 1
  sd r10,(r1) ; Chama rotina para mostrar soma
halt
```


</details>
