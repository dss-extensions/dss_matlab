classdef (CaseInsensitiveProperties) IDSS < DSS_MATLAB.Base
    % IDSS: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    ActiveCircuit - 
    %    Circuits - 
    %    Error - 
    %    Text - 
    %    DSSProgress - 
    %    ActiveClass - 
    %    Executive - 
    %    Events - 
    %    CmathLib - 
    %    Parser - 
    %    DSSim_Coms - 
    %    YMatrix - 
    %    Classes - (read-only) List of DSS intrinsic classes (names of the classes)
    %    DataPath - DSS Data File Path.  Default path for reports, etc. from DSS
    %    DefaultEditor - (read-only) Returns the path name for the default text editor.
    %    NumCircuits - (read-only) Number of Circuits currently defined
    %    NumClasses - (read-only) Number of DSS intrinsic classes
    %    NumUserClasses - (read-only) Number of user-defined classes
    %    UserClasses - (read-only) List of user-defined classes
    %    Version - (read-only) Get version string for the DSS.
    %    AllowForms - Gets/sets whether text output is allowed
    % 
    % Methods:
    %    ClearAll - 
    %    Reset - 
    %    SetActiveClass - 
    %    Start - 
    %    ShowPanel - 
    %    NewCircuit - 

    properties (Access = protected)
        libraryWasLoaded = 0
    end
    properties
        ActiveCircuit = DSS_MATLAB.ICircuit
        Circuits = DSS_MATLAB.ICircuit
        Error = DSS_MATLAB.IError
        Text = DSS_MATLAB.IText
        DSSProgress = DSS_MATLAB.IDSSProgress
        ActiveClass = DSS_MATLAB.IActiveClass
        Executive = DSS_MATLAB.IDSS_Executive
        Events = DSS_MATLAB.IDSSEvents
        CmathLib = DSS_MATLAB.ICmathLib
        Parser = DSS_MATLAB.IParser
        DSSim_Coms = DSS_MATLAB.IDSSimComs
        YMatrix = DSS_MATLAB.IYMatrix
        Classes
        DataPath
        DefaultEditor
        NumCircuits
        NumClasses
        NumUserClasses
        UserClasses
        Version
        AllowForms
    end

    methods
        function obj = IDSS(obj)
            MfilePath = fileparts(mfilename('fullpath'));
            DLLfilePath = fullfile(MfilePath, 'dss_capi_v7');
            if libisloaded(DLLfilePath)
                return
            else
                loadlibrary(DLLfilePath, @DSS_MATLAB.dss_capi_v7);
                obj.libraryWasLoaded = 1;
            end
        end
        function delete(obj)
            if (obj.libraryWasLoaded ~= 0)
                MfilePath = fileparts(mfilename('fullpath'));
                DLLfilePath = fullfile(MfilePath, 'dss_capi_v7');
                unloadlibrary(DLLfilePath);
            end
        end

        function obj = ClearAll(obj)
            calllib('dss_capi_v7', 'DSS_ClearAll');
        end

        function obj = Reset(obj)
            calllib('dss_capi_v7', 'DSS_Reset');
        end

        function result = SetActiveClass(obj, ClassName)
            result = calllib('dss_capi_v7', 'DSS_SetActiveClass', ClassName);
        end

        function result = Start(obj, code)
            result = (calllib('dss_capi_v7', 'DSS_Start', code) ~= 0);
        end

        function result = get.Classes(obj)
            % (read-only) List of DSS intrinsic classes (names of the classes)
            result = DSS_MATLAB.get_string_array('DSS_Get_Classes');
        end

        function result = get.DataPath(obj)
            % DSS Data File Path.  Default path for reports, etc. from DSS
            result = calllib('dss_capi_v7', 'DSS_Get_DataPath');
        end
        function obj = set.DataPath(obj, Value)
            calllib('dss_capi_v7', 'DSS_Set_DataPath', Value);
            obj.CheckForError();
        end

        function result = get.DefaultEditor(obj)
            % (read-only) Returns the path name for the default text editor.
            result = calllib('dss_capi_v7', 'DSS_Get_DefaultEditor');
        end

        function result = get.NumCircuits(obj)
            % (read-only) Number of Circuits currently defined
            result = calllib('dss_capi_v7', 'DSS_Get_NumCircuits');
        end

        function result = get.NumClasses(obj)
            % (read-only) Number of DSS intrinsic classes
            result = calllib('dss_capi_v7', 'DSS_Get_NumClasses');
        end

        function result = get.NumUserClasses(obj)
            % (read-only) Number of user-defined classes
            result = calllib('dss_capi_v7', 'DSS_Get_NumUserClasses');
        end

        function result = get.UserClasses(obj)
            % (read-only) List of user-defined classes
            result = DSS_MATLAB.get_string_array('DSS_Get_UserClasses');
        end

        function result = get.Version(obj)
            % (read-only) Get version string for the DSS.
            result = calllib('dss_capi_v7', 'DSS_Get_Version');
        end

        function result = get.AllowForms(obj)
            % Gets/sets whether text output is allowed
            result = (calllib('dss_capi_v7', 'DSS_Get_AllowForms') ~= 0);
        end
        function obj = set.AllowForms(obj, value)
            calllib('dss_capi_v7', 'DSS_Set_AllowForms', value);
            obj.CheckForError();
        end

        function obj = ShowPanel(obj)
            warnings.warn('ShowPanel is not implemented.');
        end

        function result = NewCircuit(obj, name)
            calllib('dss_capi_v7', 'DSS_NewCircuit', name);
            obj.CheckForError();
            result = obj.ActiveCircuit;
        end
    end
end