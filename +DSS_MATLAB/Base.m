classdef Base < handle & matlab.mixin.CustomDisplay & matlab.mixin.SetGet
    properties (Access = protected, Hidden = true)
        apiutil
        libname
    end

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
        function obj = Base(apiutil)
            obj.apiutil = apiutil;
            obj.libname = apiutil.libname;
        end

    end

    methods

        function varargout = CheckForError(obj, varargin)
            error = calllib(obj.libname, 'Error_Get_Number');
            if error ~= 0
                ME = MException(['DSS_MATLAB:Error' int2str(error)], strrep(calllib(obj.libname, 'Error_Get_Description'), '\', '\\'));
                throw(ME);
            end
            varargout = varargin;
        end
        
        function obj = clear_api_buffers(obj)
            calllib(obj.libname, 'DSS_DisposeGRData');
            calllib(obj.libname, 'DSS_ResetStringBuffer');
        end
    end
end
