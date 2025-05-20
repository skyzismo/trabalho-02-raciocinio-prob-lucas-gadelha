# Trabalho 02 - Raciocínio Probabilístico

## Informações do Autor

- **Disciplina:** Inteligência Artificial IEC034/ICC265 - 2025/1
- **Curso:** Engenharia da Computação - Turma CO01
- **Aluno:** Lucas Vinícius Gonçalves Gadelha - 22050517

## Descrição do Repositório

- A resolução manual da Questão 01 está salva no arquivo *01_questao_trab_02_lucas_gadelha.pdf*

- O código para resolução da Questão 02 está escrito no arquivo *02_questao_trab_02_lucas_gadelha.pl*

### Como executar o Código da Questão 02

**NOTE:** O código foi implementado em ProbLog, mas **é compilado utilizando a linguagem Python**. Você deve possuir o Python previamente instalado em sua máquina.

1. Você deve instalar a lib Python do ProbLog

```
pip install problog
```

2. Com o ProbLog instalado, você pode executá-lo com o seguinte comando:
```
python -m problog 02_questao_trab_02_lucas_gadelha.pl
```

3. Dessa forma, a saída esperada é de:

```
v(t):   0.40964049
```

### Funcionamento do que foi implementado no Código da Questão 02

1. Modelagem de Causas Raiz (Variáveis Independentes)

    Conceito: Em sistemas de diagnóstico, causas raiz são fatores independentes que podem iniciar falhas.

    Implementação:

        Str (condição da rua) e Fhv (desgaste do volante) são variáveis independentes com distribuições definidas.

        Exemplo: str(snow_covered) tem probabilidade 34%, refletindo a chance da rua estar coberta de neve.

2. Propagação de Falhas (Relações Causais)

    Conceito: Falhas se propagam através de dependências entre componentes.

    Implementação:

        R (deslizamento do dínamo) depende de Str e Fhv.

        A CPT r_cond define como Str e Fhv afetam R. Por exemplo, se a rua está coberta de neve (snow_covered) e o volante está bom (t), há 50% de chance de R ser verdadeiro.

3. Efeito em Componentes Intermediários

    Conceito: Componentes intermediários refletem o estado do sistema.

    Implementação:

        V (tensão do dínamo) depende diretamente de R.

        Se R está funcionando (r(t)), há 95% de chance de V mostrar tensão. Se R está com defeito (r(f)), essa probabilidade cai para 10%.

4. Inferência Probabilística (Consulta)

Conceito: Sistemas de diagnóstico usam inferência para calcular probabilidades condicionais.

Implementação:

    A consulta calcula P(V=ligado∣Str=snow_covered)P(V=ligado∣Str=snow_covered).

    O ProbLog marginaliza todas as variáveis ocultas (Fhv, R) para encontrar a resposta

