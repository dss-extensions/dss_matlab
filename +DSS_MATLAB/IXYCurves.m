classdef (CaseInsensitiveProperties) IXYCurves < DSS_MATLAB.Base
    % IXYCurves: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllNames - Array of strings with all XYCurve names
    %    Count - Number of XYCurve objects
    %    First - Set first object of XYCurve; returns 0 if none.
    %    Name - Get/sets the name of the current active XYCurve
    %    Next - Sets next XYCurve active; returns 0 if no more.
    %    idx - Sets next XYCurve active; returns 0 if no more.
    %    Npts - Get/Set Number of points in X-Y curve
    %    Xarray - Get/set X values as a Array of doubles. Set Npts to max number expected if setting
    %    Xscale - Factor to scale X values from original curve
    %    Xshift - Amount to shift X value from original curve
    %    Yarray - Get/Set Y values in curve; Set Npts to max number expected if setting
    %    Yscale - Factor to scale Y values from original curve
    %    Yshift - Amount to shift Y valiue from original curve
    %    x - Set X value or get interpolated value after setting Y
    %    y - Set Y value or get interpolated Y value after setting X

    properties (Access = protected)
        apiutil
    end

    properties
        AllNames
        Count
        First
        Name
        Next
        idx
        Npts
        Xarray
        Xscale
        Xshift
        Yarray
        Yscale
        Yshift
        x
        y
    end

    methods (Access = public)
        function obj = IXYCurves(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all XYCurve names
            result = DSS_MATLAB.get_string_array('XYCurves_Get_AllNames');
        end

        function result = get.Count(obj)
            % Number of XYCurve objects
            result = calllib('dss_capi_v7', 'XYCurves_Get_Count');
        end

        function result = get.First(obj)
            % Set first object of XYCurve; returns 0 if none.
            result = calllib('dss_capi_v7', 'XYCurves_Get_First');
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active XYCurve
            result = calllib('dss_capi_v7', 'XYCurves_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next XYCurve active; returns 0 if no more.
            result = calllib('dss_capi_v7', 'XYCurves_Get_Next');
        end

        function result = get.idx(obj)
            % Get/set active XYCurve by index;  1..Count
            result = calllib('dss_capi_v7', 'XYCurves_Get_idx');
        end
        function obj = set.idx(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_idx', Value);
            obj.CheckForError();
        end


        function result = get.Npts(obj)
            % Get/Set Number of points in X-Y curve
            result = calllib('dss_capi_v7', 'XYCurves_Get_Npts');
        end
        function obj = set.Npts(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Npts', Value);
            obj.CheckForError();
        end

        function result = get.Xarray(obj)
            % Get/set X values as a Array of doubles. Set Npts to max number expected if setting
            calllib('dss_capi_v7', 'XYCurves_Get_Xarray_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xarray(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Xarray', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Xscale(obj)
            % Factor to scale X values from original curve
            result = calllib('dss_capi_v7', 'XYCurves_Get_Xscale');
        end
        function obj = set.Xscale(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Xscale', Value);
            obj.CheckForError();
        end

        function result = get.Xshift(obj)
            % Amount to shift X value from original curve
            result = calllib('dss_capi_v7', 'XYCurves_Get_Xshift');
        end
        function obj = set.Xshift(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Xshift', Value);
            obj.CheckForError();
        end

        function result = get.Yarray(obj)
            % Get/Set Y values in curve; Set Npts to max number expected if setting
            calllib('dss_capi_v7', 'XYCurves_Get_Yarray_GR');
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Yarray(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Yarray', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Yscale(obj)
            % Factor to scale Y values from original curve
            result = calllib('dss_capi_v7', 'XYCurves_Get_Yscale');
        end
        function obj = set.Yscale(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Yscale', Value);
            obj.CheckForError();
        end

        function result = get.Yshift(obj)
            % Amount to shift Y valiue from original curve
            result = calllib('dss_capi_v7', 'XYCurves_Get_Yshift');
        end
        function obj = set.Yshift(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Yshift', Value);
            obj.CheckForError();
        end

        function result = get.x(obj)
            % Set X value or get interpolated value after setting Y
            result = calllib('dss_capi_v7', 'XYCurves_Get_x');
        end
        function obj = set.x(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_x', Value);
            obj.CheckForError();
        end

        function result = get.y(obj)
            % Set Y value or get interpolated Y value after setting X
            result = calllib('dss_capi_v7', 'XYCurves_Get_y');
        end
        function obj = set.y(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_y', Value);
            obj.CheckForError();
        end
    end
end