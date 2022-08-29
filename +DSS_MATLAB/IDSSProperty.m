classdef (CaseInsensitiveProperties) IDSSProperty < DSS_MATLAB.Base
    % IDSSProperty: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Description - Description of the property.
    %    Name - Name of Property
    %    Val - 

    properties
        Description
        Name
        Val
    end

    methods (Access = public)
        function obj = IDSSProperty(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.Description(obj)
            % (read-only) Description of the property.
            result = calllib(obj.libname, 'ctx_DSSProperty_Get_Description', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read-only) Name of Property
            result = calllib(obj.libname, 'ctx_DSSProperty_Get_Name', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.Val(obj)
            result = calllib(obj.libname, 'ctx_DSSProperty_Get_Val', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Val(obj, Value)
            calllib(obj.libname, 'ctx_DSSProperty_Set_Val', obj.dssctx, Value);
            obj.CheckForError();
        end
    end
end