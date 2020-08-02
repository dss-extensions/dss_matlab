classdef (CaseInsensitiveProperties) IDSSElement < DSS_MATLAB.Base
    % IDSSElement: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Properties - 
    %    AllPropertyNames - Array of strings containing the names of all properties for the active DSS object.
    %    Name - Full Name of Active DSS Object (general element or circuit element).
    %    NumProperties - Number of Properties for the active DSS object.

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

    end
    methods

        function result = get.AllPropertyNames(obj)
            % (read-only) Array of strings containing the names of all properties for the active DSS object.
            result = obj.apiutil.get_string_array('DSSElement_Get_AllPropertyNames');
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % (read-only) Full Name of Active DSS Object (general element or circuit element).
            result = calllib(obj.libname, 'DSSElement_Get_Name');
            obj.CheckForError();
        end

        function result = get.NumProperties(obj)
            % (read-only) Number of Properties for the active DSS object.
            result = calllib(obj.libname, 'DSSElement_Get_NumProperties');
            obj.CheckForError();
        end
    end
end