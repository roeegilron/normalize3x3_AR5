function run_AR6()
%% startup code
startup_code()
params = getparams();

%% run the job
s150 = subsUsedGet(150);
s20 = subsUsedGet(20);
subsToRun = unique([s150, s20]);

startmatlab = 'matlabr2015a -nodisplay -nojvm -singleCompThread -r '; % matlab version used to run in parallel
for i = 1:length(subsToRun)
    subnum = subsToRun(i);
    if ispc
        run_AR6_job(subnum)
    else
        runprogram  = sprintf('"run run_AR6_job(%d); exit;" ',subnum);
        pause(0.1);
        unix([startmatlab  runprogram ' &'])
    end
end

end