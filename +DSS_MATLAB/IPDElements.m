classdef (CaseInsensitiveProperties) IPDElements < DSS_MATLAB.Base
    % IPDElements: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AccumulatedL - accummulated failure rate for this branch on downline
    %    Count - Number of PD elements (including disabled elements)
    %    FaultRate - Get/Set Number of failures per year.   For LINE elements: Number of failures per unit length per year.
    %    First - Set the first enabled PD element to be the active element.  Returns 0 if none found.
    %    FromTerminal - Number of the terminal of active PD element that is on the "from"   side. This is set after the meter zone is determined.
    %    IsShunt - Boolean indicating of PD element should be treated as a shunt   element rather than a series element. Applies to Capacitor and Reactor   elements in particular.
    %    Lambda - Failure rate for this branch. Faults per year including length of line.
    %    Name - Get/Set name of active PD Element. Returns null string if active element   is not PDElement type.
    %    Next - Advance to the next PD element in the circuit. Enabled elements   only. Returns 0 when no more elements.
    %    Numcustomers - Number of customers, this branch
    %    ParentPDElement - Sets the parent PD element to be the active circuit element.  Returns 0 if no more elements upline.
    %    RepairTime - Average repair time for this element in hours
    %    SectionID - Integer ID of the feeder section that this PDElement branch is part of
    %    TotalMiles - Total miles of line from this element to the end of the zone. For recloser siting algorithm.
    %    Totalcustomers - Total number of customers from this branch to the end of the zone
    %    pctPermanent - Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.
    %    AllNames - Array of strings consisting of all PD element names.    (API Extension)
    %    AllCurrents - Complex array of currents for all conductors, all terminals, for each PD element.    (API Extension)
    %    AllCurrentsMagAng - Complex array (magnitude and angle format) of currents for all conductors, all terminals, for each PD element.    (API Extension)
    %    AllCplxSeqCurrents - Complex double array of Sequence Currents for all conductors of all terminals, for each PD elements.    (API Extension)
    %    AllSeqCurrents - Double array of the symmetrical component currents into each 3-phase terminal, for each PD element.    (API Extension)
    %    AllPowers - Complex array of powers into each conductor of each terminal, for each PD element.    (API Extension)
    %    AllSeqPowers - Double array of sequence powers into each 3-phase teminal, for each PD element    (API Extension)
    %    AllNumPhases - Integer array listing the number of phases of all PD elements    (API Extension)
    %    AllNumConductors - Integer array listing the number of conductors of all PD elements    (API Extension)
    %    AllNumTerminals - Integer array listing the number of terminals of all PD elements    (API Extension)
    % 
    % Methods:
    %    AllMaxCurrents - Array of doubles with the maximum current across the conductors, for each PD   element.    By default, only the *first terminal* is used for the maximum current, matching  the behavior of the "export capacity" command. Pass `true` to   force the analysis to all terminals.    See also:   https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/    (API Extension)
    %    AllPctNorm - Array of doubles with the maximum current across the conductors as a percentage   of the Normal Ampere Rating, for each PD element.    By default, only the *first terminal* is used for the maximum current, matching  the behavior of the "export capacity" command. Pass `true` to   force the analysis to all terminals.    See also:   https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/    (API Extension)
    %    AllPctEmerg - Array of doubles with the maximum current across the conductors as a percentage  of the Emergency Ampere Rating, for each PD element.    By default, only the *first terminal* is used for the maximum current, matching  the behavior of the "export capacity" command. Pass `true` to   force the analysis to all terminals.    See also:   https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/    (API Extension)

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
        AllNames
        AllCurrents
        AllCurrentsMagAng
        AllCplxSeqCurrents
        AllSeqCurrents
        AllPowers
        AllSeqPowers
        AllNumPhases
        AllNumConductors
        AllNumTerminals
    end

    methods (Access = public)
        function obj = IPDElements(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = AllMaxCurrents(obj, AllNodes)
            % Array of doubles with the maximum current across the conductors, for each PD 
            % element.
            % 
            % By default, only the *first terminal* is used for the maximum current, matching
            % the behavior of the "export capacity" command. Pass `true` to 
            % force the analysis to all terminals.
            % 
            % See also: 
            % https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/
            % 
            % (API Extension)
            if ~exist('AllNodes', 'var')
                AllNodes = 0;
            end

            calllib(obj.libname, 'PDElements_Get_AllMaxCurrents_GR', AllNodes);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = AllPctNorm(obj, AllNodes)
            % Array of doubles with the maximum current across the conductors as a percentage 
            % of the Normal Ampere Rating, for each PD element.
            % 
            % By default, only the *first terminal* is used for the maximum current, matching
            % the behavior of the "export capacity" command. Pass `true` to 
            % force the analysis to all terminals.
            % 
            % See also: 
            % https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/
            % 
            % (API Extension)
            if ~exist('AllNodes', 'var')
                AllNodes = 0;
            end

            calllib(obj.libname, 'PDElements_Get_AllPctNorm_GR', AllNodes);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = AllPctEmerg(obj, AllNodes)
            % Array of doubles with the maximum current across the conductors as a percentage
            % of the Emergency Ampere Rating, for each PD element.
            % 
            % By default, only the *first terminal* is used for the maximum current, matching
            % the behavior of the "export capacity" command. Pass `true` to 
            % force the analysis to all terminals.
            % 
            % See also: 
            % https://sourceforge.net/p/electricdss/discussion/beginners/thread/da5b93ca/
            % 
            % (API Extension)
            if ~exist('AllNodes', 'var')
                AllNodes = 0;
            end

            calllib(obj.libname, 'PDElements_Get_AllPctEmerg_GR', AllNodes);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

    end
    methods

        function result = get.AccumulatedL(obj)
            % (read-only) accummulated failure rate for this branch on downline
            result = calllib(obj.libname, 'PDElements_Get_AccumulatedL');
            obj.CheckForError();
        end

        function result = get.Count(obj)
            % (read-only) Number of PD elements (including disabled elements)
            result = calllib(obj.libname, 'PDElements_Get_Count');
            obj.CheckForError();
        end

        function result = get.FaultRate(obj)
            % Get/Set Number of failures per year. 
            % For LINE elements: Number of failures per unit length per year.
            result = calllib(obj.libname, 'PDElements_Get_FaultRate');
            obj.CheckForError();
        end
        function obj = set.FaultRate(obj, Value)
            calllib(obj.libname, 'PDElements_Set_FaultRate', Value);
            obj.CheckForError();
        end

        function result = get.First(obj)
            % (read-only) Set the first enabled PD element to be the active element.
            % Returns 0 if none found.
            result = calllib(obj.libname, 'PDElements_Get_First');
            obj.CheckForError();
        end

        function result = get.FromTerminal(obj)
            % (read-only) Number of the terminal of active PD element that is on the "from" 
            % side. This is set after the meter zone is determined.
            result = calllib(obj.libname, 'PDElements_Get_FromTerminal');
            obj.CheckForError();
        end

        function result = get.IsShunt(obj)
            % (read-only) Boolean indicating of PD element should be treated as a shunt 
            % element rather than a series element. Applies to Capacitor and Reactor 
            % elements in particular.
            result = (calllib(obj.libname, 'PDElements_Get_IsShunt') ~= 0);
            obj.CheckForError();
        end

        function result = get.Lambda(obj)
            % (read-only) Failure rate for this branch. Faults per year including length of line.
            result = calllib(obj.libname, 'PDElements_Get_Lambda');
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Get/Set name of active PD Element. Returns null string if active element 
            % is not PDElement type.
            result = calllib(obj.libname, 'PDElements_Get_Name');
            obj.CheckForError();
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'PDElements_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Advance to the next PD element in the circuit. Enabled elements 
            % only. Returns 0 when no more elements.
            result = calllib(obj.libname, 'PDElements_Get_Next');
            obj.CheckForError();
        end

        function result = get.Numcustomers(obj)
            % (read-only) Number of customers, this branch
            result = calllib(obj.libname, 'PDElements_Get_Numcustomers');
            obj.CheckForError();
        end

        function result = get.ParentPDElement(obj)
            % (read-only) Sets the parent PD element to be the active circuit element.
            % Returns 0 if no more elements upline.
            result = calllib(obj.libname, 'PDElements_Get_ParentPDElement');
            obj.CheckForError();
        end

        function result = get.RepairTime(obj)
            % Average repair time for this element in hours
            result = calllib(obj.libname, 'PDElements_Get_RepairTime');
            obj.CheckForError();
        end
        function obj = set.RepairTime(obj, Value)
            calllib(obj.libname, 'PDElements_Set_RepairTime', Value);
            obj.CheckForError();
        end

        function result = get.SectionID(obj)
            % (read-only) Integer ID of the feeder section that this PDElement branch is part of
            result = calllib(obj.libname, 'PDElements_Get_SectionID');
            obj.CheckForError();
        end

        function result = get.TotalMiles(obj)
            % (read-only) Total miles of line from this element to the end of the zone. For recloser siting algorithm.
            result = calllib(obj.libname, 'PDElements_Get_TotalMiles');
            obj.CheckForError();
        end

        function result = get.Totalcustomers(obj)
            % (read-only) Total number of customers from this branch to the end of the zone
            result = calllib(obj.libname, 'PDElements_Get_Totalcustomers');
            obj.CheckForError();
        end

        function result = get.pctPermanent(obj)
            % Get/Set percent of faults that are permanent (require repair). Otherwise, fault is assumed to be transient/temporary.
            result = calllib(obj.libname, 'PDElements_Get_pctPermanent');
            obj.CheckForError();
        end
        function obj = set.pctPermanent(obj, Value)
            calllib(obj.libname, 'PDElements_Set_pctPermanent', Value);
            obj.CheckForError();
        end

        function result = get.AllNames(obj)
            % Array of strings consisting of all PD element names.
            % 
            % (API Extension)
            result = obj.apiutil.get_string_array('PDElements_Get_AllNames');
            obj.CheckForError();
        end

        function result = get.AllCurrents(obj)
            % Complex array of currents for all conductors, all terminals, for each PD element.
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllCurrents_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllCurrentsMagAng(obj)
            % Complex array (magnitude and angle format) of currents for all conductors, all terminals, for each PD element.
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllCurrentsMagAng_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllCplxSeqCurrents(obj)
            % Complex double array of Sequence Currents for all conductors of all terminals, for each PD elements.
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllCplxSeqCurrents_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllSeqCurrents(obj)
            % Double array of the symmetrical component currents into each 3-phase terminal, for each PD element.
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllSeqCurrents_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllPowers(obj)
            % Complex array of powers into each conductor of each terminal, for each PD element.
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllPowers_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllSeqPowers(obj)
            % Double array of sequence powers into each 3-phase teminal, for each PD element
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllSeqPowers_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.AllNumPhases(obj)
            % Integer array listing the number of phases of all PD elements
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllNumPhases_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.AllNumConductors(obj)
            % Integer array listing the number of conductors of all PD elements
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllNumConductors_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end

        function result = get.AllNumTerminals(obj)
            % Integer array listing the number of terminals of all PD elements
            % 
            % (API Extension)
            calllib(obj.libname, 'PDElements_Get_AllNumTerminals_GR');
            obj.CheckForError();
            result = obj.apiutil.get_int32_gr_array();
        end
    end
end