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
            obj@DSS_MATLAB.Base(apiutil);
        end

    end
    methods

        function result = get.ActiveClassName(obj)
            % (read-only) Returns name of active class.
            result = calllib(obj.libname, 'ActiveClass_Get_ActiveClassName');
            obj.CheckForError();
        end

        function result = get.AllNames(obj)
            % (read-only) Array of strings consisting of all element names in the active class.
            result = obj.apiutil.get_string_array('ActiveClass_Get_AllNames');
            obj.CheckForError();
        end

        function result = get.Count(obj)
            % (read-only) Number of elements in Active Class. Same as NumElements Property.
            result = calllib(obj.libname, 'ActiveClass_Get_Count');
            obj.CheckForError();
        end

        function result = get.First(obj)
            % (read-only) Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none.
            result = calllib(obj.libname, 'ActiveClass_Get_First');
            obj.CheckForError();
        end

        function result = get.Name(obj)
            % Name of the Active Element of the Active Class
            result = calllib(obj.libname, 'ActiveClass_Get_Name');
            obj.CheckForError();
        end
        function obj = set.Name(obj, Value)
            calllib(obj.libname, 'ActiveClass_Set_Name', Value);
            obj.CheckForError();
        end

        function result = get.Next(obj)
            % (read-only) Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more.
            result = calllib(obj.libname, 'ActiveClass_Get_Next');
            obj.CheckForError();
        end

        function result = get.NumElements(obj)
            % (read-only) Number of elements in this class. Same as Count property.
            result = calllib(obj.libname, 'ActiveClass_Get_NumElements');
            obj.CheckForError();
        end

        function result = get.ActiveClassParent(obj)
            % Get the name of the parent class of the active class
            result = calllib(obj.libname, 'ActiveClass_Get_ActiveClassParent');
            obj.CheckForError();
        end
    end
end