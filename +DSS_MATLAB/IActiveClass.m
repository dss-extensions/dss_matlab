classdef (CaseInsensitiveProperties) IActiveClass < DSS_MATLAB.Base
    % IActiveClass: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveClassName - Returns name of active class.
    %    AllNames - Array of strings consisting of all element names in the active class.
    %    Count - Number of elements in Active Class. Same as NumElements Property.
    %    First - Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none.
    %    Name - Name of the Active Element of the Active Class
    %    Next - Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more.
    %    NumElements - Number of elements in this class. Same as Count property.
    %    ActiveClassParent - Get the name of the parent class of the active class

    properties (Access = protected)
        apiutil
    end

    properties
        ActiveClassName
        AllNames
        Count
        First
        Name
        Next
        NumElements
        ActiveClassParent
    end

    methods (Access = public)
        function obj = IActiveClass(apiutil)
            obj.apiutil = apiutil;
        end

    end
    methods

        function result = get.ActiveClassName(obj)
            % (read-only) Returns name of active class.
            result = calllib('dss_capi_v7', 'ActiveClass_Get_ActiveClassName');
        end

        function result = get.AllNames(obj)
            % (read-only) Array of strings consisting of all element names in the active class.
            result = DSS_MATLAB.get_string_array('ActiveClass_Get_AllNames');
        end

        function result = get.Count(obj)
            % (read-only) Number of elements in Active Class. Same as NumElements Property.
            result = calllib('dss_capi_v7', 'ActiveClass_Get_Count');
        end

        function result = get.First(obj)
            % (read-only) Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none.
            result = calllib('dss_capi_v7', 'ActiveClass_Get_First');
        end

        function result = get.Name(obj)
            % Name of the Active Element of the Active Class
            result = calllib('dss_capi_v7', 'ActiveClass_Get_Name');
        end
        function obj = set.Name(obj, Value)
            calllib('dss_capi_v7', 'ActiveClass_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more.
            result = calllib('dss_capi_v7', 'ActiveClass_Get_Next');
        end

        function result = get.NumElements(obj)
            % (read-only) Number of elements in this class. Same as Count property.
            result = calllib('dss_capi_v7', 'ActiveClass_Get_NumElements');
        end

        function result = get.ActiveClassParent(obj)
            % Get the name of the parent class of the active class
            result = calllib('dss_capi_v7', 'ActiveClass_Get_ActiveClassParent');
        end
    end
end