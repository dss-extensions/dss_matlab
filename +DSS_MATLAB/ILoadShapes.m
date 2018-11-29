classdef (CaseInsensitiveProperties) ILoadShapes < DSS_MATLAB.Base
    % ILoadShapes: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - (read-only) Array of strings containing names of all Loadshape objects currently defined.
    %    Count - (read-only) Number of Loadshape objects currently defined in Loadshape collection
    %    First - (read-only) Set the first loadshape active and return integer index of the loadshape. Returns 0 if none.
    %    HrInterval - Fixed interval time value, hours.
    %    MinInterval - Fixed Interval time value, in minutes
    %    Name -           (read) Get the Name of the active Loadshape          (write) Set the active Loadshape by name          
    %    Next - (read-only) Advance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes.
    %    Npts -           (read) Get Number of points in active Loadshape.          (write) Set number of points to allocate for active Loadshape.          
    %    PBase - 
    %    Pmult -           (read) Array of Doubles for the P multiplier in the Loadshape.          (write) Array of doubles containing the P array for the Loadshape.          
    %    QBase - Base for normalizing Q curve. If left at zero, the peak value is used.
    %    Qmult - Array of doubles containing the Q multipliers.
    %    TimeArray - Time array in hours correscponding to P and Q multipliers when the Interval=0.
    %    UseActual - T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier.
    %    sInterval - 
    % 
    % Methods:
    %    New - 
    %    Normalize - 

    properties
        AllNames
        Count
        First
        HrInterval
        MinInterval
        Name
        Next
        Npts
        PBase
        Pmult
        QBase
        Qmult
        TimeArray
        UseActual
        sInterval
    end

    methods

        function result = New(obj, Name)
            result = calllib('dss_capi_v7', 'LoadShapes_New', Name);
        end

        function obj = Normalize(obj)
            calllib('dss_capi_v7', 'LoadShapes_Normalize');
        end

        function result = get.AllNames(obj)
            % (read-only) Array of strings containing names of all Loadshape objects currently defined.
            result = DSS_MATLAB.get_string_array('LoadShapes_Get_AllNames');
        end

        function result = get.Count(obj)
            % (read-only) Number of Loadshape objects currently defined in Loadshape collection
            result = calllib('dss_capi_v7', 'LoadShapes_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Set the first loadshape active and return integer index of the loadshape. Returns 0 if none.
            result = calllib('dss_capi_v7', 'LoadShapes_Get_First');
        end

        function result = get.HrInterval(obj)
            % Fixed interval time value, hours.
            result = calllib('dss_capi_v7', 'LoadShapes_Get_HrInterval');
        end
        function obj = set.HrInterval(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_HrInterval', Value);
            obj.CheckForError();
        end

        function result = get.MinInterval(obj)
            % Fixed Interval time value, in minutes
            result = calllib('dss_capi_v7', 'LoadShapes_Get_MinInterval');
        end
        function obj = set.MinInterval(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_MinInterval', Value);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read) Get the Name of the active Loadshape
            % (write) Set the active Loadshape by name
            result = calllib('dss_capi_v7', 'LoadShapes_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Advance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes.
            result = calllib('dss_capi_v7', 'LoadShapes_Get_Next');
        end

        function result = get.Npts(obj)
            % (read) Get Number of points in active Loadshape.
            % (write) Set number of points to allocate for active Loadshape.
            result = calllib('dss_capi_v7', 'LoadShapes_Get_Npts');
        end
        function obj = set.Npts(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_Npts', Value);
            obj.CheckForError();
        end

        function result = get.PBase(obj)
            result = calllib('dss_capi_v7', 'LoadShapes_Get_PBase');
        end
        function obj = set.PBase(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_PBase', Value);
            obj.CheckForError();
        end

        function result = get.Pmult(obj)
            % (read) Array of Doubles for the P multiplier in the Loadshape.
            % (write) Array of doubles containing the P array for the Loadshape.
            result = DSS_MATLAB.get_float64_array('LoadShapes_Get_Pmult');
        end
        function obj = set.Pmult(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_Pmult', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.QBase(obj)
            % Base for normalizing Q curve. If left at zero, the peak value is used.
            result = calllib('dss_capi_v7', 'LoadShapes_Get_Qbase');
        end
        function obj = set.QBase(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_Qbase', Value);
            obj.CheckForError();
        end

        function result = get.Qmult(obj)
            % Array of doubles containing the Q multipliers.
            result = DSS_MATLAB.get_float64_array('LoadShapes_Get_Qmult');
        end
        function obj = set.Qmult(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_Qmult', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.TimeArray(obj)
            % Time array in hours correscponding to P and Q multipliers when the Interval=0.
            result = DSS_MATLAB.get_float64_array('LoadShapes_Get_TimeArray');
        end
        function obj = set.TimeArray(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_TimeArray', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.UseActual(obj)
            % T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier.
            result = (calllib('dss_capi_v7', 'LoadShapes_Get_UseActual') ~= 0);
        end
        function obj = set.UseActual(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_UseActual', Value);
            obj.CheckForError();
        end

        function result = get.sInterval(obj)
            result = calllib('dss_capi_v7', 'LoadShapes_Get_sInterval');
        end
        function obj = set.sInterval(obj, Value)
            calllib('dss_capi_v7', 'LoadShapes_Set_Sinterval', Value);
            obj.CheckForError();
        end
    end
end