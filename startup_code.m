function startup_code()
if ispc 
    spmdir = 'D:\Cloud_Storage\DB\Dropbox\MRI_Methods_class\SPM12\spm12'; 
    p = genpath(spmdir); addpath(p); 
    bvqxdir = 'D:\Roee_Main_Folder\1_AnalysisFiles\Poldrack_RFX\toolboxes\NE_5153';
    p = genpath(bvqxdir); addpath(p); 
else
    % has both SPM and BVQX in it: 
    spmdir = '/home/rack-hezi-03/home/roigilro/vocalDataSet/workflow/workflow/toolboxes'; 
    p = genpath(spmdir); addpath(p); 
end
end