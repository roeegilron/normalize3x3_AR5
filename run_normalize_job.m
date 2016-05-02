function run_normalize_job(subnum)
%% startup stuff 
startup_code()
params = getparams();
%% load batch file 
load('preprocess_normalize_3x3.mat'); 
subdirname = sprintf('sub%.3d_Ed',subnum); 
anatfold = fullfile(params.datafold,subdirname,'ana');
reaalignfold = fullfile(params.datafold,subdirname,'func','realigned_data');
%% 1.  run normazlie job (normalize to 3x3); 
ff_anat = findFilesBVQX(anatfold,'y_*.nii'); % deformation file 
matlabbatch{1}.spm.spatial.normalise.write.subj.def = ff_anat;
ff = findFilesBVQX(reaalignfold,'as*.nii'); 
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = ff;
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3 ]; 
save(fullfile(params.datafold,subdirname,'normalizejob3x3job.mat')); 
spm_jobman('run', fullfile(params.datafold,subdirname,'normalizejob3x3job.mat'));

%% move normalized files to seperate folder 
nomrmalizefiles = fullfile(reaalignfold,'was*.nii'); 
dir2make = fullfile(params.datafold,subdirname,'func','normalized_data_3x3');
mkdir(dir2make);
movefile(nomrmalizefiles,dir2make)
end