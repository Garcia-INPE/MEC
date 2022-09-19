#MEC_models=( BAM_20km BRAMS_08km Eta_08km GFS_30km WRF_07km WRFG_07km )  # Model names, to be evaluated
MEC_models=( BAM_20km )  # Model names, to be evaluated
#MEC_models_cmp=( BAM_20km BRAMS_08km Eta_08km WRF_07km )      # Model names, to be compared in SpBestOf
MEC_models_cmp=( BAM_20km )      # Model names, to be compared in SpBestOf
#MEC_models_cmp=( GFS_30km )
MEC_var=TMIN                        # Variable to be evaluated
MEC_init_time=00                    # Model's initialization time, e.g. 00 | 12

MEC_ref_per=202208                  # Nome para o período de referência 
#MEC_valid_date1=20220801            # Valid dates (target) of the forecast, in format YYYYMMDD
#MEC_valid_date2=20220805

#MEC_per_type=CUSTOM                 # Indicates a custom period (affects how the figures are concatenated)
                                    # Options: CUSTOM or NORMAL
                                    # movido para o script 00-EvalSetInit_run_once.ksh

#MEC_grid_res=LOWEST                # Automatically chooses the lowest res between model x obs or
MEC_grid_res=MERGE_10.ctl           # a CTL filename (must be in ./TEMPLATE)

MEC_sp_domain=MCD  # Max Common Domain       # Spatial domain
