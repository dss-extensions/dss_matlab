classdef (CaseInsensitiveProperties) IDSSElement < DSS_MATLAB.Base
    % IDSSElement: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Properties - 
    %    AllPropertyNames - (read-only) Array of strings containing the names of all properties for the active DSS object.
    %    Name - (read-only) Full Name of Active DSS Object (general element or circuit element).
    %    NumProperties - (read-only) Number of Properties for the active DSS object.

    properties
        Properties = DSS_MATLAB.IDSSProperty
        AllPropertyNames
        Name
        NumProperties
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