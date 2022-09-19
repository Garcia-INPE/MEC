# ==============================================================================
# JRM Garcia (roberto.garcia@inpe.br)
# DIMNT / CGCT / INPE / MCTI
# ------------------------------------------------------------------------------
# CONSOLIDA TODOS OS EVAL.CONT.PER EM UM SÓ POIS É PEQUENO
# ==============================================================================
# Current R script name
args <- commandArgs(trailingOnly=F)
script.name <- sub("--file=", "", args[grep("--file=", args)])

args <- commandArgs(trailingOnly=T)

if (length(args) != 3) {
  cat("\nMEC -", script.name, "\n\n")
  cat("Rscript", script.name, " <EVAL_NAME> <VAR> <INIT_TIME> or\n")
  cat("Rscript", script.name, " <EVAL_NAME> <VAR> <INIT_TIME> <LAST_EVAL_DATE>\n\n")
  cat("<EVAL_NAME>      A name of the evaluation, e.g. REG21 | Eta | ...\n")
  cat("<VAR>            Variable name, e.g. PREC | TMAX | TMIN | ...\n")
  cat("<INIT_TIME>      Model's initialization time, e.g. 00 | 12\n")
  stop("Wrong number of arguments!\n")
}

# MEC_eval_name="REG21T-test"; MEC_dont_check_args=T; MEC_var="TMIN"; MEC_init_time="00"; source('PrepCommonEnv.R')
MEC_eval_name=args[1]
MEC_dont_check_args=T; source('PrepCommonEnv.R')
MEC_var=args[2]
MEC_init_time=args[3]

cat('* Consolidating evaluation in period: ')
# Lista somente os arquivos EVAL_CONT_PER_1_00.RData, EVAL_CONT_PER_2_00.RData, etc
files = sort(dir(DIR$eval, paste0("EVAL_CONT_PER_[0-9]*_", CFG$hh, ".RData")))

cat(length(files), 'files, ')
EVAL.PER = data.table()
cat('consolidating ')
for (f in files) {
  cat(".")
  load(paste0(DIR$eval, f))
  EVAL.PER = rbind.data.frame(EVAL.PER, EVAL.CONT.PER)
}

fname.eval.per <- paste0(DIR$deploy, 'EVAL_CONT_PER_', CFG$hh, '.RData')
EVAL.CONT.PER = EVAL.PER
setkey(EVAL.CONT.PER)
cat(", ok!\n")
save(EVAL.CONT.PER, file = fname.eval.per)
