classdef (CaseInsensitiveProperties) IDSSElement < DSS_MATLAB.Base
    % IDSSElement: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    AllPropertyNames - Array of strings containing the names of all properties for the active DSS object.
    %    Name - Full Name of Active DSS Object (general element or circuit element).
    %    NumProperties - Number of Properties for the active DSS object.

    properties (Access = protected)
        apiutil
        PropertiesRef
    end

    properties
        AllPropertyNames
        Name
        NumProperties
    end

    methods (Access = public)
        function obj = IDSSElement(apiutil)
            obj.apiutil = apiutil;
            obj.PropertiesRef = DSS_MATLAB.IDSSProperty(obj.apiutil);
        end

        function result = Properties(obj, NameOrIdx)
            if ischar(NameOrIdx) | isstring(NameOrIdx)
                calllib('dss_capi_v7', 'DSSProperty_Set_Name', NameOrIdx);
            elseif isinteger(NameOrIdx)
                calllib('dss_capi_v7', 'DSSProperty_Set_Index', NameOrIdx);
            else
                ME = MException(['DSS_MATLAB:Error'], 'Expected char, string or integer');
                throw(ME);
            end
            obj.CheckForError();
            result = obj.PropertiesRef;
        end
    end
    methods

        function result = get.AllPropertyNames(obj)
            % (read-only) Array of strings containing the names of all properties for the active DSS object.
            result = DSS_MATLAB.get_string_array('DSSElement_Get_AllPropertyNames');
        end

        function result = get.Name(obj)
            % (read-only) Full Name of Active DSS Object (general element or circuit element).
            result = calllib('dss_capi_v7', 'DSSElement_Get_Name');
        end

        function result = get.NumProperties(obj)
            % (read-only) Number of Properties for the active DSS object.
            result = calllib('dss_capi_v7', 'DSSElement_Get_NumProperties');
        end
    end
end