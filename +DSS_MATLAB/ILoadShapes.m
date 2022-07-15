classdef (CaseInsensitiveProperties) ILoadShapes < DSS_MATLAB.Base
    % ILoadShapes: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all LoadShape names
    %    Count - Number of LoadShape objects
    %    First - Set first object of LoadShape; returns 0 if none.
    %    Name - Get/sets the name of the current active LoadShape
    %    Next - Sets next LoadShape active; returns 0 if no more.
    %    idx - Sets next LoadShape active; returns 0 if no more.
    %    HrInterval - Fixed interval time value, hours.
    %    MinInterval - Fixed Interval time value, in minutes
    %    Npts - Get/set Number of points in active Loadshape.
    %    PBase - 
    %    Pmult - Array of doubles for the P multiplier in the Loadshape.
    %    QBase - Base for normalizing Q curve. If left at zero, the peak value is used.
    %    Qmult - Array of doubles containing the Q multipliers.
    %    TimeArray - Time array in hours correscponding to P and Q multipliers when the Interval=0.
    %    UseActual - Boolean flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier.
    %    sInterval - 
    % 
    % Methods:
    %    New - 
    %    Normalize - 

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        HrInterval
        MinInterval
        Npts
        PBase
        Pmult
        QBase
        Qmult
        TimeArray
        UseActual
        sInterval
    end

    methods (Access = public)
        function obj = ILoadShapes(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = New(obj, Name)
            result = calllib(obj.libname, 'LoadShapes_New', Name);
            obj.CheckForError();
        end

        function obj = Normalize(obj)
            calllib(obj.libname, 'LoadShapes_Normalize');
            obj.CheckForError();
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all LoadShape names
            result = obj.apiutil.get_string_array('LoadShapes_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of LoadShape objects
            result = calllib(obj.libname, 'LoadShapes_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of LoadShape; returns 0 if none.
            result = calllib(obj.libname, 'LoadShapes_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active LoadShape
            result = calllib(obj.libname, 'LoadShapes_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next LoadShape active; returns 0 if no more.
            result = calllib(obj.libname, 'LoadShapes_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active LoadShape by index;  1..Count
            result = calllib(obj.libname, 'LoadShapes_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.HrInterval(obj)
            % Fixed interval time value, hours.
            result = calllib(obj.libname, 'LoadShapes_Get_HrInterval');
            obj.CheckForError();
        end
        function obj = set.HrInterval(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_HrInterval', Value);
            obj.CheckForError();
        end

        function result = get.MinInterval(obj)
            % Fixed Interval time value, in minutes
            result = calllib(obj.libname, 'LoadShapes_Get_MinInterval');
            obj.CheckForError();
        end
        function obj = set.MinInterval(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_MinInterval', Value);
            obj.CheckForError();
        end

        function result = get.Npts(obj)
            % Get/set Number of points in active Loadshape.
            result = calllib(obj.libname, 'LoadShapes_Get_Npts');
            obj.CheckForError();
        end
        function obj = set.Npts(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_Npts', Value);
            obj.CheckForError();
        end

        function result = get.PBase(obj)
            result = calllib(obj.libname, 'LoadShapes_Get_PBase');
            obj.CheckForError();
        end
        function obj = set.PBase(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_PBase', Value);
            obj.CheckForError();
        end

        function result = get.Pmult(obj)
            % Array of doubles for the P multiplier in the Loadshape.
            calllib(obj.libname, 'LoadShapes_Get_Pmult_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Pmult(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_Pmult', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.QBase(obj)
            % Base for normalizing Q curve. If left at zero, the peak value is used.
            result = calllib(obj.libname, 'LoadShapes_Get_Qbase');
            obj.CheckForError();
        end
        function obj = set.QBase(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_Qbase', Value);
            obj.CheckForError();
        end

        function result = get.Qmult(obj)
            % Array of doubles containing the Q multipliers.
            calllib(obj.libname, 'LoadShapes_Get_Qmult_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Qmult(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_Qmult', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.TimeArray(obj)
            % Time array in hours correscponding to P and Q multipliers when the Interval=0.
            calllib(obj.libname, 'LoadShapes_Get_TimeArray_GR');
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.TimeArray(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_TimeArray', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.UseActual(obj)
            % Boolean flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier.
            result = (calllib(obj.libname, 'LoadShapes_Get_UseActual') ~= 0);
            obj.CheckForError();
        end
        function obj = set.UseActual(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_UseActual', Value);
            obj.CheckForError();
        end

        function result = get.sInterval(obj)
            result = calllib(obj.libname, 'LoadShapes_Get_SInterval');
            obj.CheckForError();
        end
        function obj = set.sInterval(obj, Value)
            calllib(obj.libname, 'LoadShapes_Set_SInterval', Value);
            obj.CheckForError();
        end
    end
end