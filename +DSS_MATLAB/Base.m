classdef Base < handle & matlab.mixin.CustomDisplay & matlab.mixin.SetGet
    methods (Access = protected)
        function propgrp = getPropertyGroups(obj)
            propgrp = matlab.mixin.util.PropertyGroup();
        end
        
        function header = getHeader(obj)
            if ~isscalar(obj)
                header = getHeader@matlab.mixin.CustomDisplay(obj);
            else
                headerStr = matlab.mixin.CustomDisplay.getClassNameForHeader(obj);
                headerStr = [headerStr,' (DSS MATLAB interface class)'];
                header = sprintf('%s\n',headerStr);
            end
        end
    end

    methods (Access = public)

    end

    methods

        function obj = CheckForError(obj)
            error = calllib('dss_capi_v7', 'Error_Get_Number');
            if error ~= 0
                ME = MException(['DSS_MATLAB:Error' int2str(error)], strrep(calllib('dss_capi_v7', 'Error_Get_Description'), '\', '\\'));
                throw(ME);
            end
        end
    end
end
