function run_normalize3x3()
%% startup code 
startup_code()
params = getparams();

%% run the job 
s150 = subsUsedGet(150);
s20 = subsUsedGet(20);
subsToRun = unique([s150, s20]);

startmatlab = 'matlabr2015a -nodisplay -nojvm -r -singleCompThread'; % matlab version used to run in parallel
for i = 1:length(subsToRun)
    subnum = subsToRun(i);
    if ispc
        runprogram  = sprintf('"run MAIN_doSearchLightCrossValFolds_Ht2_NewT2013_anatomical(%d); exit;" ',subnum);
        pause(0.1);
        unix([startmatlab  runprogram ' &'])
    else
        run_normalize_job(subnum)
    end
end

end