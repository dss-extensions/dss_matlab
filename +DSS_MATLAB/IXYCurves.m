classdef (CaseInsensitiveProperties) IXYCurves < DSS_MATLAB.Base
    % IXYCurves: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Count - (read-only) Number of XYCurve Objects
    %    First - (read-only) Sets first XYcurve object active; returns 0 if none.
    %    Name -           (read) Name of active XYCurve Object          (write) Get Name of active XYCurve Object          
    %    Next - (read-only) Advances to next XYCurve object; returns 0 if no more objects of this class
    %    Npts - Get/Set Number of points in X-Y curve
    %    Xarray - Get/Set X values as a Array of doubles. Set Npts to max number expected if setting
    %    Xscale - Factor to scale X values from original curve
    %    Xshift - Amount to shift X value from original curve
    %    Yarray - Get/Set Y values in curve; Set Npts to max number expected if setting
    %    Yscale -           (read) Factor to scale Y values from original curve          (write) Amount to scale Y values from original curve. Represents a curve shift.          
    %    Yshift - amount to shift Y valiue from original curve
    %    x - Set X value or get interpolated value after setting Y
    %    y -           (read) Y value for present X or set this value then get corresponding X          (write) Set Y value or get interpolated Y value after setting X          

    properties
        Count
        First
        Name
        Next
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

    methods

        function result = get.Count(obj)
            % (read-only) Number of XYCurve Objects
            result = calllib('dss_capi_v7', 'XYCurves_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Sets first XYcurve object active; returns 0 if none.
            result = calllib('dss_capi_v7', 'XYCurves_Get_First');
        end

        function result = get.Name(obj)
            % (read) Name of active XYCurve Object
            % (write) Get Name of active XYCurve Object
            result = calllib('dss_capi_v7', 'XYCurves_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Advances to next XYCurve object; returns 0 if no more objects of this class
            result = calllib('dss_capi_v7', 'XYCurves_Get_Next');
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
            % Get/Set X values as a Array of doubles. Set Npts to max number expected if setting
            result = DSS_MATLAB.get_float64_array('XYCurves_Get_Xarray');
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
            result = DSS_MATLAB.get_float64_array('XYCurves_Get_Yarray');
        end
        function obj = set.Yarray(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Yarray', Value, numel(Value));
            obj.CheckForError();
        end

        function result = get.Yscale(obj)
            % (read) Factor to scale Y values from original curve
            % (write) Amount to scale Y values from original curve. Represents a curve shift.
            result = calllib('dss_capi_v7', 'XYCurves_Get_Yscale');
        end
        function obj = set.Yscale(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_Yscale', Value);
            obj.CheckForError();
        end

        function result = get.Yshift(obj)
            % amount to shift Y valiue from original curve
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
            % (read) Y value for present X or set this value then get corresponding X
            % (write) Set Y value or get interpolated Y value after setting X
            result = calllib('dss_capi_v7', 'XYCurves_Get_y');
        end
        function obj = set.y(obj, Value)
            calllib('dss_capi_v7', 'XYCurves_Set_y', Value);
            obj.CheckForError();
        end
    end
end