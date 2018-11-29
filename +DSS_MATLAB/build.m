function build
    % Builds the DSS_MATLAB loader DLL
    ME = [];
    original_dir = pwd;
    try
        MfilePath = fileparts(mfilename('fullpath'));
        cd(MfilePath);
        disp('Building...');
        DLLfilePath = fullfile(MfilePath, 'dss_capi_v7');
        % loadlibrary('dss_capi_v7', 'dss_capi_v7.h', 'mfilename', 'dss_capi_v7.m');
        loadlibrary(DLLfilePath, fullfile(MfilePath, 'dss_capi_v7.h'));
        pause(0.5)
        disp('Unloading library...')
        unloadlibrary('dss_capi_v7');
        pause(0.5)
        disp('Reloading with prototype...');
        loadlibrary(DLLfilePath, @DSS_MATLAB.dss_capi_v7);
        disp('Unloading again...')
        unloadlibrary('dss_capi_v7');
        pause(0.5)
        disp('Done!');
    catch ME
    end
    
    cd(pwd);
    
    if ~isempty(ME)
       rethrow(ME);
    end    
end