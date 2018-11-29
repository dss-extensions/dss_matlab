classdef (CaseInsensitiveProperties) IParallel < DSS_MATLAB.Base
    % IParallel: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveActor -           (read) Gets the ID of the Active Actor          (write) Sets the Active Actor          
    %    ActiveParallel -           (read) Sets ON/OFF (1/0) Parallel features of the Engine          (write) Delivers if the Parallel features of the Engine are Active          
    %    ActorCPU -           (read) Gets the CPU of the Active Actor          (write) Sets the CPU for the Active Actor          
    %    ActorProgress - (read-only) Gets the progress of all existing actors in pct
    %    ActorStatus - (read-only) Gets the status of each actor
    %    ConcatenateReports -           (read) Reads the values of the ConcatenateReports option (1=enabled, 0=disabled)          (write) Enable/Disable (1/0) the ConcatenateReports option for extracting monitors data          
    %    NumCPUs - (read-only) Delivers the number of CPUs on the current PC
    %    NumCores - (read-only) Delivers the number of Cores of the local PC
    %    NumOfActors - (read-only) Gets the number of Actors created
    % 
    % Methods:
    %    CreateActor - 
    %    Wait - 

    properties
        ActiveActor
        ActiveParallel
        ActorCPU
        ActorProgress
        ActorStatus
        ConcatenateReports
        NumCPUs
        NumCores
        NumOfActors
    end

    methods

        function obj = CreateActor(obj)
            calllib('dss_capi_v7', 'Parallel_CreateActor');
        end

        function obj = Wait(obj)
            calllib('dss_capi_v7', 'Parallel_Wait');
        end

        function result = get.ActiveActor(obj)
            % (read) Gets the ID of the Active Actor
            % (write) Sets the Active Actor
            result = calllib('dss_capi_v7', 'Parallel_Get_ActiveActor');
        end
        function obj = set.ActiveActor(obj, Value)
            calllib('dss_capi_v7', 'Parallel_Set_ActiveActor', Value);
            obj.CheckForError();
        end

        function result = get.ActiveParallel(obj)
            % (read) Sets ON/OFF (1/0) Parallel features of the Engine
            % (write) Delivers if the Parallel features of the Engine are Active
            result = calllib('dss_capi_v7', 'Parallel_Get_ActiveParallel');
        end
        function obj = set.ActiveParallel(obj, Value)
            calllib('dss_capi_v7', 'Parallel_Set_ActiveParallel', Value);
            obj.CheckForError();
        end

        function result = get.ActorCPU(obj)
            % (read) Gets the CPU of the Active Actor
            % (write) Sets the CPU for the Active Actor
            result = calllib('dss_capi_v7', 'Parallel_Get_ActorCPU');
        end
        function obj = set.ActorCPU(obj, Value)
            calllib('dss_capi_v7', 'Parallel_Set_ActorCPU', Value);
            obj.CheckForError();
        end

        function result = get.ActorProgress(obj)
            % (read-only) Gets the progress of all existing actors in pct
            result = DSS_MATLAB.get_int32_array('Parallel_Get_ActorProgress');
        end

        function result = get.ActorStatus(obj)
            % (read-only) Gets the status of each actor
            result = DSS_MATLAB.get_int32_array('Parallel_Get_ActorStatus');
        end

        function result = get.ConcatenateReports(obj)
            % (read) Reads the values of the ConcatenateReports option (1=enabled, 0=disabled)
            % (write) Enable/Disable (1/0) the ConcatenateReports option for extracting monitors data
            result = calllib('dss_capi_v7', 'Parallel_Get_ConcatenateReports');
        end
        function obj = set.ConcatenateReports(obj, Value)
            calllib('dss_capi_v7', 'Parallel_Set_ConcatenateReports', Value);
            obj.CheckForError();
        end

        function result = get.NumCPUs(obj)
            % (read-only) Delivers the number of CPUs on the current PC
            result = calllib('dss_capi_v7', 'Parallel_Get_NumCPUs');
        end

        function result = get.NumCores(obj)
            % (read-only) Delivers the number of Cores of the local PC
            result = calllib('dss_capi_v7', 'Parallel_Get_NumCores');
        end

        function result = get.NumOfActors(obj)
            % (read-only) Gets the number of Actors created
            result = calllib('dss_capi_v7', 'Parallel_Get_NumOfActors');
        end
    end
end