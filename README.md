# normalize3x3_AR5

Steps do complete in this code: 
1) re-run normalize to 3x3 makes AR process faster: `run_normalize3x3.m`
2) run AR-6 model estimation: `run_AR6_job.m`

Next steps use code in: 
`D:\Roee_Main_Folder\1_AnalysisFiles\Poldrack_RFX\Publish_Ready_Process\code\helper_function`
3) run anatomical searchlight: 
`run_multi_t_non_directional_anatomical`
Don't forget to change to to correct folder on line 5 of : 
`MAIN_doSearchLightCrossValFolds_Ht2_NewT2013_anatomical.m`
And change lines 8, 11 in above file as well before running 
4) Compute the pvalues from each subject: 
`calcPvalsAllSubs_ar3.m`
5) Run prevelance estimate of replicability: 
`run_prevalance_estimates_replicability.m`
6) compute the box plots: 
`figure;boxplot(allpvals) %box plots or pvals across subjects`
`figure;violin(sizesout)`

