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
        function obj = ISensors(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = Reset(obj)
            calllib(obj.libname, 'ctx_Sensors_Reset', obj.dssctx);
            obj.CheckForError();
        end

        function obj = ResetAll(obj)
            calllib(obj.libname, 'ctx_Sensors_ResetAll', obj.dssctx);
            obj.CheckForError();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all Sensor names
            result = obj.apiutil.get_string_array('ctx_Sensors_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of Sensor objects
            result = calllib(obj.libname, 'ctx_Sensors_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of Sensor; returns 0 if none.
            result = calllib(obj.libname, 'ctx_Sensors_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active Sensor
            result = calllib(obj.libname, 'ctx_Sensors_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next Sensor active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_Sensors_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active Sensor by index;  1..Count
            result = calllib(obj.libname, 'ctx_Sensors_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.Currents(obj)
            % Array of doubles for the line current measurements; don't use with kWS and kVARS.
            calllib(obj.libname, 'ctx_Sensors_Get_Currents_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Currents(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_Currents', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.IsDelta(obj)
            % True if measured voltages are line-line. Currents are always line currents.
            result = (calllib(obj.libname, 'ctx_Sensors_Get_IsDelta', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.IsDelta(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_IsDelta', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MeteredElement(obj)
            % Full Name of the measured element
            result = calllib(obj.libname, 'ctx_Sensors_Get_MeteredElement', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MeteredElement(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_MeteredElement', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.MeteredTerminal(obj)
            % Number of the measured terminal in the measured element.
            result = calllib(obj.libname, 'ctx_Sensors_Get_MeteredTerminal', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.MeteredTerminal(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_MeteredTerminal', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PctError(obj)
            % Assumed percent error in the Sensor measurement. Default is 1.
            result = calllib(obj.libname, 'ctx_Sensors_Get_PctError', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PctError(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_PctError', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.ReverseDelta(obj)
            % True if voltage measurements are 1-3, 3-2, 2-1.
            result = (calllib(obj.libname, 'ctx_Sensors_Get_ReverseDelta', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.ReverseDelta(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_ReverseDelta', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Weight(obj)
            % Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1.
            result = calllib(obj.libname, 'ctx_Sensors_Get_Weight', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Weight(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_Weight', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kVARS(obj)
            % Array of doubles for Q measurements. Overwrites Currents with a new estimate using kWS.
            calllib(obj.libname, 'ctx_Sensors_Get_kVARS_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.kVARS(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_kVARS', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kVS(obj)
            % Array of doubles for the LL or LN (depending on Delta connection) voltage measurements.
            calllib(obj.libname, 'ctx_Sensors_Get_kVS_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.kVS(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_kVS', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.kVbase(obj)
            % Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors.
            result = calllib(obj.libname, 'ctx_Sensors_Get_kVbase', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kVbase(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_kVbase', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kWS(obj)
            % Array of doubles for P measurements. Overwrites Currents with a new estimate using kVARS.
            calllib(obj.libname, 'ctx_Sensors_Get_kWS_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.kWS(obj, Value)
            calllib(obj.libname, 'ctx_Sensors_Set_kWS', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end
    end
end