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
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.ActiveBranch(obj)
            % (read-only) Returns index of the active branch
            result = calllib(obj.libname, 'Topology_Get_ActiveBranch');
            obj.CheckForError();
        end

        function result = get.ActiveLevel(obj)
            % (read-only) Topological depth of the active branch
            result = calllib(obj.libname, 'Topology_Get_ActiveLevel');
            obj.CheckForError();
        end

        function result = get.AllIsolatedBranches(obj)
            % (read-only) Array of all isolated branch names.
            result = obj.apiutil.get_string_array('Topology_Get_AllIsolatedBranches');
            obj.CheckForError();
        end

        function result = get.AllIsolatedLoads(obj)
            % (read-only) Array of all isolated load names.
            result = obj.apiutil.get_string_array('Topology_Get_AllIsolatedLoads');
            obj.CheckForError();
        end

        function result = get.AllLoopedPairs(obj)
            % (read-only) Array of all looped element names, by pairs.
            result = obj.apiutil.get_string_array('Topology_Get_AllLoopedPairs');
            obj.CheckForError();
        end

        function result = get.BackwardBranch(obj)
            % (read-only) MOve back toward the source, return index of new active branch, or 0 if no more.
            result = calllib(obj.libname, 'Topology_Get_BackwardBranch');
            obj.CheckForError();
        end

        function result = get.BranchName(obj)
            % Name of the active branch.
            result = calllib(obj.libname, 'Topology_Get_BranchName');
            obj.CheckForError();
        end
        function obj = set.BranchName(obj, Value)
            calllib(obj.libname, 'Topology_Set_BranchName', Value);
            obj.CheckForError();
        end

        function result = get.BusName(obj)
            % Set the active branch to one containing this bus, return index or 0 if not found
            result = calllib(obj.libname, 'Topology_Get_BusName');
            obj.CheckForError();
        end
        function obj = set.BusName(obj, Value)
            calllib(obj.libname, 'Topology_Set_BusName', Value);
            obj.CheckForError();
        end

        function result = get.First(obj)
            % (read-only) Sets the first branch active, returns 0 if none.
            result = calllib(obj.libname, 'Topology_Get_First');
            obj.CheckForError();
        end

        function result = get.FirstLoad(obj)
            % (read-only) First load at the active branch, return index or 0 if none.
            result = calllib(obj.libname, 'Topology_Get_FirstLoad');
            obj.CheckForError();
        end

        function result = get.ForwardBranch(obj)
            % (read-only) Move forward in the tree, return index of new active branch or 0 if no more
            result = calllib(obj.libname, 'Topology_Get_ForwardBranch');
            obj.CheckForError();
        end

        function result = get.LoopedBranch(obj)
            % (read-only) Move to looped branch, return index or 0 if none.
            result = calllib(obj.libname, 'Topology_Get_LoopedBranch');
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets the next branch active, returns 0 if no more.
            result = calllib(obj.libname, 'Topology_Get_Next');
            obj.CheckForError();
        end

        function result = get.NextLoad(obj)
            % (read-only) Next load at the active branch, return index or 0 if no more.
            result = calllib(obj.libname, 'Topology_Get_NextLoad');
            obj.CheckForError();
        end

        function result = get.NumIsolatedBranches(obj)
            % (read-only) Number of isolated branches (PD elements and capacitors).
            result = calllib(obj.libname, 'Topology_Get_NumIsolatedBranches');
            obj.CheckForError();
        end

        function result = get.NumIsolatedLoads(obj)
            % (read-only) Number of isolated loads
            result = calllib(obj.libname, 'Topology_Get_NumIsolatedLoads');
            obj.CheckForError();
        end

        function result = get.NumLoops(obj)
            % (read-only) Number of loops
            result = calllib(obj.libname, 'Topology_Get_NumLoops');
            obj.CheckForError();
        end

        function result = get.ParallelBranch(obj)
            % (read-only) Move to directly parallel branch, return index or 0 if none.
            result = calllib(obj.libname, 'Topology_Get_ParallelBranch');
            obj.CheckForError();
        end
    end
end