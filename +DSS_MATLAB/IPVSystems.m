classdef (CaseInsensitiveProperties) IPVSystems < DSS_MATLAB.Base
    % IPVSystems: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all PVSystem names
    %    Count - Number of PVSystem objects
    %    First - Set first object of PVSystem; returns 0 if none.
    %    Name - Get/sets the name of the current active PVSystem
    %    Next - Sets next PVSystem active; returns 0 if no more.
    %    idx - Sets next PVSystem active; returns 0 if no more.
    %    Irradiance - Get/set the present value of the Irradiance property in kW/m²
    %    PF - Get/set the power factor for the active PVSystem
    %    RegisterNames - Array of PVSYSTEM energy meter register names
    %    RegisterValues - Array of doubles containing values in PVSystem registers.
    %    kVArated - Get/set Rated kVA of the PVSystem
    %    kW - get kW output
    %    kvar - Get/set kvar output value
    %    daily - Name of the dispatch shape to use for daily simulations. Must be previously  defined as a Loadshape object of 24 hrs, typically. In the default dispatch  mode, the PVSystem element uses this loadshape to trigger State changes. (API Extension)
    %    duty - Name of the load shape to use for duty cycle dispatch simulations such as  for solar ramp rate studies. Must be previously defined as a Loadshape  object. Typically would have time intervals of 1-5 seconds. (API Extension)
    %    yearly - Dispatch shape to use for yearly simulations. Must be previously defined  as a Loadshape object. If this is not specified, the Daily dispatch shape,  if any, is repeated during Yearly solution modes. In the default dispatch  mode, the PVSystem element uses this loadshape to trigger State changes. (API Extension)
    %    Tdaily - Temperature shape to use for daily simulations. Must be previously defined  as a TShape object of 24 hrs, typically. The PVSystem element uses this  TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree  with the Pmpp vs T curve. (API Extension)
    %    Tduty - Temperature shape to use for duty cycle dispatch simulations such as for  solar ramp rate studies. Must be previously defined as a TShape object.  Typically would have time intervals of 1-5 seconds. Designate the number  of points to solve using the Set Number=xxxx command. If there are fewer  points in the actual shape, the shape is assumed to repeat. The PVSystem  model uses this TShape to determine the Pmpp from the Pmpp vs T curve.  Units must agree with the Pmpp vs T curve. (API Extension)
    %    Tyearly - Temperature shape to use for yearly simulations. Must be previously defined  as a TShape object. If this is not specified, the Daily dispatch shape, if  any, is repeated during Yearly solution modes. The PVSystem element uses  this TShape to determine the Pmpp from the Pmpp vs T curve. Units must  agree with the Pmpp vs T curve. (API Extension)
    %    IrradianceNow - Returns the current irradiance value for the active PVSystem. Use it to   know what's the current irradiance value for the PV during a simulation.
    %    Pmpp - Gets/sets the rated max power of the PV array for 1.0 kW/sq-m irradiance   and a user-selected array temperature of the active PVSystem.
    %    Sensor - Name of the sensor monitoring this element.

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Irradiance
        PF
        RegisterNames
        RegisterValues
        kVArated
        kW
        kvar
        daily
        duty
        yearly
        Tdaily
        Tduty
        Tyearly
        IrradianceNow
        Pmpp
        Sensor
    end

    methods (Access = public)
        function obj = IPVSystems(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all PVSystem names
            result = obj.apiutil.get_string_array('ctx_PVSystems_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of PVSystem objects
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of PVSystem; returns 0 if none.
            result = calllib(obj.libname, 'ctx_PVSystems_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active PVSystem
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next PVSystem active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active PVSystem by index;  1..Count
            result = calllib(obj.libname, 'ctx_PVSystems_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.Irradiance(obj)
            % Get/set the present value of the Irradiance property in kW/m²
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Irradiance', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Irradiance(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_Irradiance', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.PF(obj)
            % Get/set the power factor for the active PVSystem
            result = calllib(obj.libname, 'ctx_PVSystems_Get_PF', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.PF(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_PF', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.RegisterNames(obj)
            % (read-only) Array of PVSYSTEM energy meter register names
            result = obj.apiutil.get_string_array('ctx_PVSystems_Get_RegisterNames');
            obj.CheckForError();
        end

        function result = get.RegisterValues(obj)
            % (read-only) Array of doubles containing values in PVSystem registers.
            calllib(obj.libname, 'ctx_PVSystems_Get_RegisterValues_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = get.kVArated(obj)
            % Get/set Rated kVA of the PVSystem
            result = calllib(obj.libname, 'ctx_PVSystems_Get_kVArated', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kVArated(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_kVArated', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.kW(obj)
            % (read-only) get kW output
            result = calllib(obj.libname, 'ctx_PVSystems_Get_kW', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.kvar(obj)
            % Get/set kvar output value
            result = calllib(obj.libname, 'ctx_PVSystems_Get_kvar', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.kvar(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_kvar', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.daily(obj)
            % Name of the dispatch shape to use for daily simulations. Must be previously
            % defined as a Loadshape object of 24 hrs, typically. In the default dispatch
            % mode, the PVSystem element uses this loadshape to trigger State changes.        
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_PVSystems_Get_daily', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.daily(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_daily', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.duty(obj)
            % Name of the load shape to use for duty cycle dispatch simulations such as
            % for solar ramp rate studies. Must be previously defined as a Loadshape
            % object. Typically would have time intervals of 1-5 seconds.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_PVSystems_Get_duty', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.duty(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_duty', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.yearly(obj)
            % Dispatch shape to use for yearly simulations. Must be previously defined
            % as a Loadshape object. If this is not specified, the Daily dispatch shape,
            % if any, is repeated during Yearly solution modes. In the default dispatch
            % mode, the PVSystem element uses this loadshape to trigger State changes.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_PVSystems_Get_yearly', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.yearly(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_yearly', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Tdaily(obj)
            % Temperature shape to use for daily simulations. Must be previously defined
            % as a TShape object of 24 hrs, typically. The PVSystem element uses this
            % TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree
            % with the Pmpp vs T curve.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Tdaily', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Tdaily(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_Tdaily', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Tduty(obj)
            % Temperature shape to use for duty cycle dispatch simulations such as for
            % solar ramp rate studies. Must be previously defined as a TShape object.
            % Typically would have time intervals of 1-5 seconds. Designate the number
            % of points to solve using the Set Number=xxxx command. If there are fewer
            % points in the actual shape, the shape is assumed to repeat. The PVSystem
            % model uses this TShape to determine the Pmpp from the Pmpp vs T curve.
            % Units must agree with the Pmpp vs T curve.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Tduty', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Tduty(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_Tduty', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Tyearly(obj)
            % Temperature shape to use for yearly simulations. Must be previously defined
            % as a TShape object. If this is not specified, the Daily dispatch shape, if
            % any, is repeated during Yearly solution modes. The PVSystem element uses
            % this TShape to determine the Pmpp from the Pmpp vs T curve. Units must
            % agree with the Pmpp vs T curve.
            % 
            % (API Extension)
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Tyearly', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Tyearly(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_Tyearly', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.IrradianceNow(obj)
            % Returns the current irradiance value for the active PVSystem. Use it to 
            % know what's the current irradiance value for the PV during a simulation.
            result = calllib(obj.libname, 'ctx_PVSystems_Get_IrradianceNow', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Pmpp(obj)
            % Gets/sets the rated max power of the PV array for 1.0 kW/sq-m irradiance 
            % and a user-selected array temperature of the active PVSystem.
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Pmpp', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Pmpp(obj, Value)
            calllib(obj.libname, 'ctx_PVSystems_Set_Pmpp', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Sensor(obj)
            % Name of the sensor monitoring this element.
            result = calllib(obj.libname, 'ctx_PVSystems_Get_Sensor', obj.dssctx);
            obj.CheckForError();
        end
    end
end