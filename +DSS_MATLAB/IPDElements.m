classdef (CaseInsensitiveProperties) IPDElements < DSS_MATLAB.Base
    % IPDElements: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AccumulatedL - (read-only) accummulated failure rate for this branch on downline
    %    Count - (read-only) Number of PD elements (including disabled elements)
    %    FaultRate - Get/Set Number of failures per year. For LINE elements: Number of failures per unit length per year. 
    %    First - (read-only) Set the first enabled PD element to be the active element.  Returns 0 if none found.
    %    FromTerminal - (read-only) Number of the terminal of active PD element that is on the "from" side. This is set after the meter zone is determined.
    %    IsShunt - (read-only) Variant boolean indicating of PD element should be treated as a shunt element rather than a series element. Applies to Capacitor and Reactor elements in particular.
    %    Lambda - (read-only) Failure rate for this branch. Faults per year including length of line.
    %    Name - Get/Set name of active PD Element. Returns null string if active element is not PDElement type.
    %    Next - (read-only) Advance to the next PD element in the circuit. Enabled elements only. Returns 0 when no more elements.
    %    Numcustomers - (read-only) Number of customers, this branch
    %    ParentPDElement - (read-only) Sets the parent PD element to be the active circuit element.  Returns 0 if no more elements upline.
    %    RepairTime - Average repair time for this element in hours
    %    SectionID - (read-only) Integer ID of the feeder section that this PDElement branch is part of
    %    TotalMiles - (read-only) Total miles of line from this element to the end of the zone. For recloser siting algorithm.
    %    Totalcustomers - (read-only) Total number of customers from this branch to the end of the zone
    %    pctPermanent - Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.

    properties
        AccumulatedL
        Count
        FaultRate
        First
        FromTerminal
        IsShunt
        Lambda
        Name
        Next
        Numcustomers
        ParentPDElement
        RepairTime
        SectionID
        TotalMiles
        Totalcustomers
        pctPermanent
    end

    methods

        function result = get.AccumulatedL(obj)
            % (read-only) accummulated failure rate for this branch on downline
            result = calllib('dss_capi_v7', 'PDElements_Get_AccumulatedL');
        end

        function result = get.Count(obj)
            % (read-only) Number of PD elements (including disabled elements)
            result = calllib('dss_capi_v7', 'PDElements_Get_Count');
        end

        function result = get.FaultRate(obj)
            % Get/Set Number of failures per year. For LINE elements: Number of failures per unit length per year.
            result = calllib('dss_capi_v7', 'PDElements_Get_FaultRate');
        end
        function obj = set.FaultRate(obj, Value)
            calllib('dss_capi_v7', 'PDElements_Set_FaultRate', Value);
            obj.CheckForError();
        end

        function result = get.First(obj)
            % (read-only) Set the first enabled PD element to be the active element.  Returns 0 if none found.
            result = calllib('dss_capi_v7', 'PDElements_Get_First');
        end

        function result = get.FromTerminal(obj)
            % (read-only) Number of the terminal of active PD element that is on the "from" side. This is set after the meter zone is determined.
            result = calllib('dss_capi_v7', 'PDElements_Get_FromTerminal');
        end

        function result = get.IsShunt(obj)
            % (read-only) Variant boolean indicating of PD element should be treated as a shunt element rather than a series element. Applies to Capacitor and Reactor elements in particular.
            result = (calllib('dss_capi_v7', 'PDElements_Get_IsShunt') ~= 0);
        end

        function result = get.Lambda(obj)
            % (read-only) Failure rate for this branch. Faults per year including length of line.
            result = calllib('dss_capi_v7', 'PDElements_Get_Lambda');
        end

        function result = get.Name(obj)
            % Get/Set name of active PD Element. Returns null string if active element is not PDElement type.
            result = calllib('dss_capi_v7', 'PDElements_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'PDElements_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Advance to the next PD element in the circuit. Enabled elements only. Returns 0 when no more elements.
            result = calllib('dss_capi_v7', 'PDElements_Get_Next');
        end

        function result = get.Numcustomers(obj)
            % (read-only) Number of customers, this branch
            result = calllib('dss_capi_v7', 'PDElements_Get_Numcustomers');
        end

        function result = get.ParentPDElement(obj)
            % (read-only) Sets the parent PD element to be the active circuit element.  Returns 0 if no more elements upline.
            result = calllib('dss_capi_v7', 'PDElements_Get_ParentPDElement');
        end

        function result = get.RepairTime(obj)
            % Average repair time for this element in hours
            result = calllib('dss_capi_v7', 'PDElements_Get_RepairTime');
        end
        function obj = set.RepairTime(obj, Value)
            calllib('dss_capi_v7', 'PDElements_Set_RepairTime', Value);
            obj.CheckForError();
        end

        function result = get.SectionID(obj)
            % (read-only) Integer ID of the feeder section that this PDElement branch is part of
            result = calllib('dss_capi_v7', 'PDElements_Get_SectionID');
        end

        function result = get.TotalMiles(obj)
            % (read-only) Total miles of line from this element to the end of the zone. For recloser siting algorithm.
            result = calllib('dss_capi_v7', 'PDElements_Get_TotalMiles');
        end

        function result = get.Totalcustomers(obj)
            % (read-only) Total number of customers from this branch to the end of the zone
            result = calllib('dss_capi_v7', 'PDElements_Get_Totalcustomers');
        end

        function result = get.pctPermanent(obj)
            % Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.
            result = calllib('dss_capi_v7', 'PDElements_Get_pctPermanent');
        end
        function obj = set.pctPermanent(obj, Value)
            calllib('dss_capi_v7', 'PDElements_Set_pctPermanent', Value);
            obj.CheckForError();
        end
    end
end