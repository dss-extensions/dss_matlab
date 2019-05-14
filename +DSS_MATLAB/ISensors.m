classdef (CaseInsensitiveProperties) ISensors < DSS_MATLAB.Base
    % ISensors: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all Sensor names
    %    Count - Number of Sensor objects
    %    First - Set first object of Sensor; returns 0 if none.
    %    Name - Get/sets the name of the current active Sensor
    %    Next - Sets next Sensor active; returns 0 if no more.
    %    idx - Sets next Sensor active; returns 0 if no more.
    %    Currents - Array of doubles for the line current measurements; don't use with kWS and kVARS.
    %    IsDelta - True if measured voltages are line-line. Currents are always line currents.
    %    MeteredElement - Full Name of the measured element
    %    MeteredTerminal - Number of the measured terminal in the measured element.
    %    PctError - Assumed percent error in the Sensor measurement. Default is 1.
    %    ReverseDelta - True if voltage measurements are 1-3, 3-2, 2-1.
    %    Weight - Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1.
    %    kVARS - Array of doubles for Q measurements. Overwrites Currents with a new estimate using kWS.
    %    kVS - Array of doubles for the LL or LN (depending on Delta connection) voltage measurements.
    %    kVbase - Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors.
    %    kWS - Array of doubles for P measurements. Overwrites Currents with a new estimate using kVARS.
    % 
    % Methods:
    %    Reset - 
    %    ResetAll - 

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Currents
        IsDelta
        MeteredElement
        MeteredTerminal
        PctError
        ReverseDelta
        Weight
        kVARS
        kVS
        kVbase
        kWS
    end

    methods (Access = public)

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'Sensors_Reset');
        end

        function obj = ResetAll(obj)
            calllib('dss_capi_v7', 'Sensors_ResetAll');
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Sensor names
            result = DSS_MATLAB.get_string_array('Sensors_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Sensor objects
            result = calllib('dss_capi_v7', 'Sensors_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of Sensor; returns 0 if none.
            result = calllib('dss_capi_v7', 'Sensors_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Sensor
            result = calllib('dss_capi_v7', 'Sensors_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Sensor active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'Sensors_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active Sensor by index;  1..Count
            result = calllib('dss_capi_v7', 'Sensors_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Currents(obj)
            % Array of doubles for the line current measurements; don't use with kWS and kVARS.
            result = DSS_MATLAB.get_float64_array('Sensors_Get_Currents');
        end
        function obj = set.Currents(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_Currents', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % True if measured voltages are line-line. Currents are always line currents.
            result = (calllib('dss_capi_v7', 'Sensors_Get_IsDelta') ~= 0);
        end
        function obj = set.IsDelta(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_IsDelta', Value);
            obj.CheckForError();
        end

        function result = get.MeteredElement(obj)
            % Full Name of the measured element
            result = calllib('dss_capi_v7', 'Sensors_Get_MeteredElement');
        end
        function obj = set.MeteredElement(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_MeteredElement', Value);
            obj.CheckForError();
        end

        function result = get.MeteredTerminal(obj)
            % Number of the measured terminal in the measured element.
            result = calllib('dss_capi_v7', 'Sensors_Get_MeteredTerminal');
        end
        function obj = set.MeteredTerminal(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_MeteredTerminal', Value);
            obj.CheckForError();
        end

        function result = get.PctError(obj)
            % Assumed percent error in the Sensor measurement. Default is 1.
            result = calllib('dss_capi_v7', 'Sensors_Get_PctError');
        end
        function obj = set.PctError(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_PctError', Value);
            obj.CheckForError();
        end

        function result = get.ReverseDelta(obj)
            % True if voltage measurements are 1-3, 3-2, 2-1.
            result = (calllib('dss_capi_v7', 'Sensors_Get_ReverseDelta') ~= 0);
        end
        function obj = set.ReverseDelta(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_ReverseDelta', Value);
            obj.CheckForError();
        end

        function result = get.Weight(obj)
            % Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1.
            result = calllib('dss_capi_v7', 'Sensors_Get_Weight');
        end
        function obj = set.Weight(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_Weight', Value);
            obj.CheckForError();
        end

        function result = get.kVARS(obj)
            % Array of doubles for Q measurements. Overwrites Currents with a new estimate using kWS.
            result = DSS_MATLAB.get_float64_array('Sensors_Get_kVARS');
        end
        function obj = set.kVARS(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_kVARS', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kVS(obj)
            % Array of doubles for the LL or LN (depending on Delta connection) voltage measurements.
            result = DSS_MATLAB.get_float64_array('Sensors_Get_kVS');
        end
        function obj = set.kVS(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_kVS', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kVbase(obj)
            % Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors.
            result = calllib('dss_capi_v7', 'Sensors_Get_kVbase');
        end
        function obj = set.kVbase(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_kVbase', Value);
            obj.CheckForError();
        end

        function result = get.kWS(obj)
            % Array of doubles for P measurements. Overwrites Currents with a new estimate using kVARS.
            result = DSS_MATLAB.get_float64_array('Sensors_Get_kWS');
        end
        function obj = set.kWS(obj, Value)
            calllib('dss_capi_v7', 'Sensors_Set_kWS', Value, numel(Value));
            obj.CheckForError();
        end
    end
end