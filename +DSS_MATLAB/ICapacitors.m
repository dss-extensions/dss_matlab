classdef (CaseInsensitiveProperties) ICapacitors < DSS_MATLAB.Base
    % ICapacitors: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings with all Capacitor names in the circuit.
    %    AvailableSteps - (read-only) Number of Steps available in cap bank to be switched ON.
    %    Count - (read-only) Number of Capacitor objects in active circuit.
    %    First - (read-only) Sets the first Capacitor active. Returns 0 if no more.
    %    IsDelta - Delta connection or wye?
    %    Name - Sets the active Capacitor by Name.
    %    Next - (read-only) Sets the next Capacitor active. Returns 0 if no more.
    %    NumSteps - Number of steps (default 1) for distributing and switching the total bank kVAR.
    %    States -           (read) A array of  integer [0..numsteps-1] indicating state of each step. If value is -1 an error has occurred.          (write) Array of integer [0 ..numSteps-1] indicating the state of each step          
    %    kV - Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.
    %    kvar - Total bank KVAR, distributed equally among phases and steps.
    % 
    % Methods:
    %    AddStep - 
    %    Close - 
    %    Open - 
    %    SubtractStep - 

    properties
        AllNames
        AvailableSteps
        Count
        First
        IsDelta
        Name
        Next
        NumSteps
        States
        kV
        kvar
    end

    methods

        function result = AddStep(obj)
            result = (calllib('dss_capi_v7', 'Capacitors_AddStep') ~= 0);
        end

        function obj = Close(obj)
            calllib('dss_capi_v7', 'Capacitors_Close');
        end

        function obj = Open(obj)
            calllib('dss_capi_v7', 'Capacitors_Open');
        end

        function result = SubtractStep(obj)
            result = (calllib('dss_capi_v7', 'Capacitors_SubtractStep') ~= 0);
        end

        function result = get.AllNames(obj)
            % (read-only) Array of strings with all Capacitor names in the circuit.
            result = DSS_MATLAB.get_string_array('Capacitors_Get_AllNames');
        end

        function result = get.AvailableSteps(obj)
            % (read-only) Number of Steps available in cap bank to be switched ON.
            result = calllib('dss_capi_v7', 'Capacitors_Get_AvailableSteps');
        end

        function result = get.Count(obj)
            % (read-only) Number of Capacitor objects in active circuit.
            result = calllib('dss_capi_v7', 'Capacitors_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Sets the first Capacitor active. Returns 0 if no more.
            result = calllib('dss_capi_v7', 'Capacitors_Get_First');
        end

        function result = get.IsDelta(obj)
            % Delta connection or wye?
            result = (calllib('dss_capi_v7', 'Capacitors_Get_IsDelta') ~= 0);
        end
        function obj = set.IsDelta(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_IsDelta', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Sets the active Capacitor by Name.
            result = calllib('dss_capi_v7', 'Capacitors_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets the next Capacitor active. Returns 0 if no more.
            result = calllib('dss_capi_v7', 'Capacitors_Get_Next');
        end

        function result = get.NumSteps(obj)
            % Number of steps (default 1) for distributing and switching the total bank kVAR.
            result = calllib('dss_capi_v7', 'Capacitors_Get_NumSteps');
        end
        function obj = set.NumSteps(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_NumSteps', Value);
            obj.CheckForError();
        end

        function result = get.States(obj)
            % (read) A array of  integer [0..numsteps-1] indicating state of each step. If value is -1 an error has occurred.
            % (write) Array of integer [0 ..numSteps-1] indicating the state of each step
            result = DSS_MATLAB.get_int32_array('Capacitors_Get_States');
        end
        function obj = set.States(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_States', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kV(obj)
            % Bank kV rating. Use LL for 2 or 3 phases, or actual can rating for 1 phase.
            result = calllib('dss_capi_v7', 'Capacitors_Get_kV');
        end
        function obj = set.kV(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_kV', Value);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Total bank KVAR, distributed equally among phases and steps.
            result = calllib('dss_capi_v7', 'Capacitors_Get_kvar');
        end
        function obj = set.kvar(obj, Value)
            calllib('dss_capi_v7', 'Capacitors_Set_kvar', Value);
            obj.CheckForError();
        end
    end
end