function run_AR6_job(subnum)
%% startup stuff 
startup_code()
params = getparams();
%% load batch file 
load('stats_FIR_AR6.mat'); 
subdirname = sprintf('sub%.3d_Ed',subnum); 
anatfold = fullfile(params.datafold,subdirname,'ana');
funcfold = fullfile(params.datafold,subdirname,'func');
normazlied3x3fold = fullfile(params.datafold,subdirname,'func','normalized_data_3x3');
ff_norm_3x3  = findFilesBVQX(normazlied3x3fold,'was*.nii');
% add session number: 
for i = 1:length(ff_norm_3x3)
    ff_norm_3x3{i} = [ff_norm_3x3{i} ',1'];
end
% mkdir for results 
resultsdirname = fullfile(funcfold,'stats_noramalized_sep_beta_FIR_ar6'); 
mkdir(resultsdirname); 
% model specificaiot: 
matlabbatch{1}.spm.stats.fmri_spec.dir = {resultsdirname}; 
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = ff_norm_3x3; 
matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {fullfile(pwd,'onsetsSEP.mat')}; 
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg =  {fullfile(funcfold,'multiple_regressors.txt')};
% model estimation: 
matlabbatch{2}.spm.stats.fmri_est.method.Bayesian.ARP = 6; % AR(6) used 
save(fullfile(params.datafold,subdirname,'AR6_job.mat')); 
% run job
spm_jobman('initcfg');
spm_jobman('run', fullfile(params.datafold,subdirname,'AR6_job.mat'));

end
