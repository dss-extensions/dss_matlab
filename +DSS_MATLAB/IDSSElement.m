classdef (CaseInsensitiveProperties) IDSSElement < DSS_MATLAB.Base
    % IDSSElement: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Properties - 
    %    AllPropertyNames - Array of strings containing the names of all properties for the active DSS object.
    %    Name - Full Name of Active DSS Object (general element or circuit element).
    %    NumProperties - Number of Properties for the active DSS object.
    % 
    % Methods:
    %    ToJSON - Returns the properties of the active DSS object as a JSON-encoded string.    The `options` parameter contains bit-flags to toggle specific features.  See `Obj_ToJSON` (C-API) for more, or `DSSObj.to_json` in MATLAB. (API Extension)

    properties
        Properties
        AllPropertyNames
        Name
        NumProperties
    end

    methods (Access = public)
        function obj = IDSSElement(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
            obj.Properties = DSS_MATLAB.IDSSProperty(obj.apiutil);
        end

        function result = ToJSON(obj, options)
            % Returns the properties of the active DSS object as a JSON-encoded string.
            % 
            % The `options` parameter contains bit-flags to toggle specific features.
            % See `Obj_ToJSON` (C-API) for more, or `DSSObj.to_json` in MATLAB.
            % 
            % (API Extension)
            if ~exist('options', 'var')
                options = 0;
            end

            result = calllib(obj.libname, 'ctx_DSSElement_ToJSON', obj.dssctx, options);
            obj.CheckForError();
        end
    end
    methods

        function result = get.AllPropertyNames(obj)
            % (read-only) Array of strings containing the names of all properties for the active DSS object.
            result = obj.apiutil.get_string_array('ctx_DSSElement_Get_AllPropertyNames');
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read-only) Full Name of Active DSS Object (general element or circuit element).
            result = calllib(obj.libname, 'ctx_DSSElement_Get_Name', obj.dssctx);
            obj.CheckForError();
        end

        function result = get.NumProperties(obj)
            % (read-only) Number of Properties for the active DSS object.
            result = calllib(obj.libname, 'ctx_DSSElement_Get_NumProperties', obj.dssctx);
            obj.CheckForError();
        end
    end
end