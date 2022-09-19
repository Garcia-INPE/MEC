./00-MEC.ksh REG21T-test T 00 20200201 20200203 LOWEST MCD
./00-MEC.ksh REG21T-test T 00 20200201 20200203 CTL MCD
./00-MEC.ksh REG21T-test TMIN 00 20200201 20200203 CTL MCD
./00-MEC.ksh REG21T-test TMIN 00 20210101 20210101 CTL MCD

1) Criar um diretótio para o experimento, eg., REG21T-test;
2) Revisar o script 00-EvalSetInit_run_once.ksh e executá-lo. Este script copiará alguns scripts do grads para o diretório onde os arquivos processados do MEC (MEC_DATA) serão escritos.
./00-EvalSetInit_run_once.ksh
3) No diretório CONFIG, revisar os caminhos e datas de avaliação dos modelos (eg., BAM_20km.ksh)
4) Verificar as datas de avaliação no script REAG21T-test: 00-EvalSetInit_run_once.ksh
5) Verificar os nomes dos experimentos a serem avaliados e os nomes dos experimentos de referência e das datas de avaliação no script REG21T-test/DefEvalCfg.ksh (esclha dos exps)
Nota: no script REAG21T-test deverá ser informado um arquivo CTL com as definições da grade a ser utilizada com o MCD
6) Verificar o script CONFIG/BAM_20km.ksh (nome do exp) e de todos os experimentos a serem considerados na avaliação
./00-MEC.ksh REG21T-test TMIN 00 20220601 20220601 LOWEST MCD 

- 29/06/2022:
* executar script REG21T-test/01...R, 02..R
* instalar os pacotes do R (ncdf4, ...)

- 05/07/2022:
* no script 03-..., é executado (ao final) o join dos arquivos e estes são consolidados no diretório deploy
* OK consertar o ambiente do MEC na itapemirim (library(data.table))
* OK para fazer as figuras, executar mais do que um dia
* OK para a interface: criar um diretório com o nome do experimento e alocar os arquivos .RData dentro deste diretório (pegar os arquivos do DEPLOY)

* OK ./03-Eval.ksh REG21T-test TMIN 00 1

* OK instalar a lista de cpacotes do arquivo lista_final.txt (ver na Itaipava);
* OK Instalar o pacote (pelo R) dashboardthemes (abrir o R e executar dentro do prompt: install.packages("dashboardthemes"));
* OK para a interface: alterar o nome do exp dentro do arquico AUX-CURRENT_EVAL.txt
* OK criar um script para chamar a interface:
cat << EOF > runMEC.R
library(shiny)
runApp(".")
EOF
* OK executar a interface como "Rscript runMEC.R"

* consolidar o periodo de avaliações (arquivo EVAL.CONT.PER - a partoir dp script 05, executar com as mesmas opções do script 03)
* OK incluir a chamada do script 05-Plot.sh dentro do script 03, ao final (este script vai consolidar as estatísticas diárias em estatísticas mensais) e gera os campos diários e mensais

* OK verificar o erro de carregamento da máscara no script 05b-PlotPrevious.R (o problema estava no caminho do arquivo /scripts/ensemble/MEC-DEV/CommonData/shapefiles//BR/regioes/regioes_2010.shp no caminho que está no repositório, está BRA ao invés de BR))

- 20/07/2022:
* Incluído o caso CUSTOM para considerar um período de testes curtos (resolve a issue #21);
* Para poder rodar o script 06-JoinPlots.ksh, como estamos testando um período "CUSTOM", foi necessário
remover a variável MEC_PRIOR_NAME dos nomes das imagens para que o montage pudesse criar os paineis das figuras (essas alterações impactam os demais períodos de avaliação?)
* Falta criar o diretório de saída do deploy /dados/ensemble/dsk001/MEC_DATA/REG21T-test/DEPLOY/IMG -> esse diretório não deveria estar definido dentro do script /scripts/ensemble/MEC-DEV/REG21T-test/EVAL_SET.ksh?
* ./06-JoinPlots.ksh REG21T-test TMIN 00


