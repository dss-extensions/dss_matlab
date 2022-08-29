classdef Base < handle & matlab.mixin.CustomDisplay & matlab.mixin.SetGet
    properties (Access = protected, Hidden = true)
        apiutil
        libname
        dssctx
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
            obj.dssctx = apiutil.dssctx;
        end

    end

    methods

        function varargout = CheckForError(obj, varargin)
            error = calllib(obj.libname, 'ctx_Error_Get_Number', obj.dssctx);
            if error ~= 0
                ME = MException(['DSS_MATLAB:Error' int2str(error)], strrep(calllib(obj.libname, 'ctx_Error_Get_Description', obj.dssctx), '\', '\\'));
                throw(ME);
            end
            varargout = varargin;
        end
        
        function obj = clear_api_buffers(obj)
            calllib(obj.libname, 'ctx_DSS_DisposeGRData', obj.dssctx);
            calllib(obj.libname, 'ctx_DSS_ResetStringBuffer', obj.dssctx);
        end
    end
end
