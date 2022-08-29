classdef (CaseInsensitiveProperties) IParallel < DSS_MATLAB.Base
    % IParallel: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveActor - Gets/sets the ID of the Active Actor
    %    ActiveParallel - (read) Sets ON/OFF (1/0) Parallel features of the Engine  (write) Delivers if the Parallel features of the Engine are Active
    %    ActorCPU - Gets/sets the CPU of the Active Actor
    %    ActorProgress - Gets the progress of all existing actors in pct
    %    ActorStatus - Gets the status of each actor
    %    ConcatenateReports - (read) Reads the values of the ConcatenateReports option (1=enabled, 0=disabled)  (write) Enable/Disable (1/0) the ConcatenateReports option for extracting monitors data
    %    NumCPUs - Delivers the number of CPUs on the current PC
    %    NumCores - Delivers the number of Cores of the local PC
    %    NumOfActors - Gets the number of Actors created
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

    methods (Access = public)
        function obj = IParallel(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = CreateActor(obj)
            calllib(obj.libname, 'ctx_Parallel_CreateActor', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Wait(obj)
            calllib(obj.libname, 'ctx_Parallel_Wait', obj.dssctx);
            obj.CheckForError();
        end

    end
    methods

        function result = get.ActiveActor(obj)
            % Gets/sets the ID of the Active Actor
            result = calllib(obj.libname, 'ctx_Parallel_Get_ActiveActor', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ActiveActor(obj, Value)
            calllib(obj.libname, 'ctx_Parallel_Set_ActiveActor', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ActiveParallel(obj)
            % (read) Sets ON/OFF (1/0) Parallel features of the Engine
            % (write) Delivers if the Parallel features of the Engine are Active
            result = calllib(obj.libname, 'ctx_Parallel_Get_ActiveParallel', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ActiveParallel(obj, Value)
            calllib(obj.libname, 'ctx_Parallel_Set_ActiveParallel', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ActorCPU(obj)
            % Gets/sets the CPU of the Active Actor
            result = calllib(obj.libname, 'ctx_Parallel_Get_ActorCPU', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ActorCPU(obj, Value)
            calllib(obj.libname, 'ctx_Parallel_Set_ActorCPU', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ActorProgress(obj)
            % (read-only) Gets the progress of all existing actors in pct
            calllib(obj.libname, 'ctx_Parallel_Get_ActorProgress_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.ActorStatus(obj)
            % (read-only) Gets the status of each actor
            calllib(obj.libname, 'ctx_Parallel_Get_ActorStatus_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.ConcatenateReports(obj)
            % (read) Reads the values of the ConcatenateReports option (1=enabled, 0=disabled)
            % (write) Enable/Disable (1/0) the ConcatenateReports option for extracting monitors data
            result = calllib(obj.libname, 'ctx_Parallel_Get_ConcatenateReports', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.ConcatenateReports(obj, Value)
            calllib(obj.libname, 'ctx_Parallel_Set_ConcatenateReports', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.NumCPUs(obj)
            % (read-only) Delivers the number of CPUs on the current PC
            result = calllib(obj.libname, 'ctx_Parallel_Get_NumCPUs', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumCores(obj)
            % (read-only) Delivers the number of Cores of the local PC
            result = calllib(obj.libname, 'ctx_Parallel_Get_NumCores', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumOfActors(obj)
            % (read-only) Gets the number of Actors created
            result = calllib(obj.libname, 'ctx_Parallel_Get_NumOfActors', obj.dssctx);
            obj.CheckForError();
        end
    end
end