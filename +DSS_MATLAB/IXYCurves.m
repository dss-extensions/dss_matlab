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
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.AllNames(obj)
            % Array of strings with all XYCurve names
            result = obj.apiutil.get_string_array('ctx_XYCurves_Get_AllNames', obj.dssctx);
        end

        function result = get.Count(obj)
            % Number of XYCurve objects
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Count', obj.dssctx);
        end

        function result = get.First(obj)
            % Set first object of XYCurve; returns 0 if none.
            result = calllib(obj.libname, 'ctx_XYCurves_Get_First', obj.dssctx);
        end

        function result = get.Name(obj)
            % Get/sets the name of the current active XYCurve
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Name', obj.dssctx);
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Name', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % Sets next XYCurve active; returns 0 if no more.
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Next', obj.dssctx);
        end

        function result = get.idx(obj)
            % Get/set active XYCurve by index;  1..Count
            result = calllib(obj.libname, 'ctx_XYCurves_Get_idx', obj.dssctx);
        end
        function obj = set.idx(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_idx', obj.dssctx, Value);
            obj.CheckForError();
        end


        function result = get.Npts(obj)
            % Get/Set Number of points in X-Y curve
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Npts', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Npts(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Npts', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Xarray(obj)
            % Get/set X values as a Array of doubles. Set Npts to max number expected if setting
            calllib(obj.libname, 'ctx_XYCurves_Get_Xarray_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Xarray(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Xarray', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Xscale(obj)
            % Factor to scale X values from original curve
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Xscale', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Xscale(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Xscale', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Xshift(obj)
            % Amount to shift X value from original curve
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Xshift', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Xshift(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Xshift', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Yarray(obj)
            % Get/Set Y values in curve; Set Npts to max number expected if setting
            calllib(obj.libname, 'ctx_XYCurves_Get_Yarray_GR', obj.dssctx);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
        function obj = set.Yarray(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Yarray', obj.dssctx, Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Yscale(obj)
            % Factor to scale Y values from original curve
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Yscale', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Yscale(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Yscale', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.Yshift(obj)
            % Amount to shift Y valiue from original curve
            result = calllib(obj.libname, 'ctx_XYCurves_Get_Yshift', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Yshift(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_Yshift', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.x(obj)
            % Set X value or get interpolated value after setting Y
            result = calllib(obj.libname, 'ctx_XYCurves_Get_x', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.x(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_x', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.y(obj)
            % Set Y value or get interpolated Y value after setting X
            result = calllib(obj.libname, 'ctx_XYCurves_Get_y', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.y(obj, Value)
            calllib(obj.libname, 'ctx_XYCurves_Set_y', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end