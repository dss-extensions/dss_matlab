classdef (CaseInsensitiveProperties) IDSSProperty < DSS_MATLAB.Base
    % IDSSProperty: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Description - Description of the property.
    %    Name - Name of Property
    %    Val - 

    properties (Access = protected)
        apiutil
    end

    properties
        Description
        Name
        Val
    end

    methods (Access = public)
        function obj = IDSSProperty(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.Description(obj)
            % (read-only) Description of the property.
            result = calllib('dss_capi_v7', 'DSSProperty_Get_Description');
        end

        function result = get.Name(obj)
            % (read-only) Name of Property
            result = calllib('dss_capi_v7', 'DSSProperty_Get_Name');
        end

        function result = get.Val(obj)
            result = calllib('dss_capi_v7', 'DSSProperty_Get_Val');
        end
        function obj = set.Val(obj, Value)
            calllib('dss_capi_v7', 'DSSProperty_Set_Val', Value);
            obj.CheckForError();
        end
    end
end