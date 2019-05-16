classdef (CaseInsensitiveProperties) ITopology < DSS_MATLAB.Base
    % ITopology: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveBranch - Returns index of the active branch
    %    ActiveLevel - Topological depth of the active branch
    %    AllIsolatedBranches - Array of all isolated branch names.
    %    AllIsolatedLoads - Array of all isolated load names.
    %    AllLoopedPairs - Array of all looped element names, by pairs.
    %    BackwardBranch - MOve back toward the source, return index of new active branch, or 0 if no more.
    %    BranchName - Name of the active branch.
    %    BusName - Set the active branch to one containing this bus, return index or 0 if not found
    %    First - Sets the first branch active, returns 0 if none.
    %    FirstLoad - First load at the active branch, return index or 0 if none.
    %    ForwardBranch - Move forward in the tree, return index of new active branch or 0 if no more
    %    LoopedBranch - Move to looped branch, return index or 0 if none.
    %    Next - Sets the next branch active, returns 0 if no more.
    %    NextLoad - Next load at the active branch, return index or 0 if no more.
    %    NumIsolatedBranches - Number of isolated branches (PD elements and capacitors).
    %    NumIsolatedLoads - Number of isolated loads
    %    NumLoops - Number of loops
    %    ParallelBranch - Move to directly parallel branch, return index or 0 if none.

    properties (Access = protected)
        apiutil
    end

    properties
        ActiveBranch
        ActiveLevel
        AllIsolatedBranches
        AllIsolatedLoads
        AllLoopedPairs
        BackwardBranch
        BranchName
        BusName
        First
        FirstLoad
        ForwardBranch
        LoopedBranch
        Next
        NextLoad
        NumIsolatedBranches
        NumIsolatedLoads
        NumLoops
        ParallelBranch
    end

    methods (Access = public)
        function obj = ITopology(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.ActiveBranch(obj)
            % (read-only) Returns index of the active branch
            result = calllib('dss_capi_v7', 'Topology_Get_ActiveBranch');
        end

        function result = get.ActiveLevel(obj)
            % (read-only) Topological depth of the active branch
            result = calllib('dss_capi_v7', 'Topology_Get_ActiveLevel');
        end

        function result = get.AllIsolatedBranches(obj)
            % (read-only) Array of all isolated branch names.
            result = DSS_MATLAB.get_string_array('Topology_Get_AllIsolatedBranches');
        end

        function result = get.AllIsolatedLoads(obj)
            % (read-only) Array of all isolated load names.
            result = DSS_MATLAB.get_string_array('Topology_Get_AllIsolatedLoads');
        end

        function result = get.AllLoopedPairs(obj)
            % (read-only) Array of all looped element names, by pairs.
            result = DSS_MATLAB.get_string_array('Topology_Get_AllLoopedPairs');
        end

        function result = get.BackwardBranch(obj)
            % (read-only) MOve back toward the source, return index of new active branch, or 0 if no more.
            result = calllib('dss_capi_v7', 'Topology_Get_BackwardBranch');
        end

        function result = get.BranchName(obj)
            % Name of the active branch.
            result = calllib('dss_capi_v7', 'Topology_Get_BranchName');
        end
        function obj = set.BranchName(obj, Value)
            calllib('dss_capi_v7', 'Topology_Set_BranchName', Value);
            obj.CheckForError();
        end

        function result = get.BusName(obj)
            % Set the active branch to one containing this bus, return index or 0 if not found
            result = calllib('dss_capi_v7', 'Topology_Get_BusName');
        end
        function obj = set.BusName(obj, Value)
            calllib('dss_capi_v7', 'Topology_Set_BusName', Value);
            obj.CheckForError();
        end

        function result = get.First(obj)
            % (read-only) Sets the first branch active, returns 0 if none.
            result = calllib('dss_capi_v7', 'Topology_Get_First');
        end

        function result = get.FirstLoad(obj)
            % (read-only) First load at the active branch, return index or 0 if none.
            result = calllib('dss_capi_v7', 'Topology_Get_FirstLoad');
        end

        function result = get.ForwardBranch(obj)
            % (read-only) Move forward in the tree, return index of new active branch or 0 if no more
            result = calllib('dss_capi_v7', 'Topology_Get_ForwardBranch');
        end

        function result = get.LoopedBranch(obj)
            % (read-only) Move to looped branch, return index or 0 if none.
            result = calllib('dss_capi_v7', 'Topology_Get_LoopedBranch');
        end

        function result = get.Next(obj)
            % (read-only) Sets the next branch active, returns 0 if no more.
            result = calllib('dss_capi_v7', 'Topology_Get_Next');
        end

        function result = get.NextLoad(obj)
            % (read-only) Next load at the active branch, return index or 0 if no more.
            result = calllib('dss_capi_v7', 'Topology_Get_NextLoad');
        end

        function result = get.NumIsolatedBranches(obj)
            % (read-only) Number of isolated branches (PD elements and capacitors).
            result = calllib('dss_capi_v7', 'Topology_Get_NumIsolatedBranches');
        end

        function result = get.NumIsolatedLoads(obj)
            % (read-only) Number of isolated loads
            result = calllib('dss_capi_v7', 'Topology_Get_NumIsolatedLoads');
        end

        function result = get.NumLoops(obj)
            % (read-only) Number of loops
            result = calllib('dss_capi_v7', 'Topology_Get_NumLoops');
        end

        function result = get.ParallelBranch(obj)
            % (read-only) Move to directly parallel branch, return index or 0 if none.
            result = calllib('dss_capi_v7', 'Topology_Get_ParallelBranch');
        end
    end
end