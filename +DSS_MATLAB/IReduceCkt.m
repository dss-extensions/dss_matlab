classdef (CaseInsensitiveProperties) IReduceCkt < DSS_MATLAB.Base
    % IReduceCkt: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    Zmag - Zmag (ohms) for Reduce Option for Z of short lines
    %    KeepLoad - Keep load flag (T/F) for Reduction options that remove branches
    %    EditString - Edit String for RemoveBranches functions
    %    StartPDElement - Start element for Remove Branch function
    %    EnergyMeter - Name of Energymeter to use for reduction
    % 
    % Methods:
    %    SaveCircuit - Save present (reduced) circuit  Filename is listed in the Text Result interface
    %    DoDefault - Do Default Reduction algorithm
    %    DoShortLines - Do ShortLines algorithm: Set Zmag first if you don't want the default
    %    DoDangling - Reduce Dangling Algorithm; branches with nothing connected
    %    DoLoopBreak - 
    %    DoParallelLines - 
    %    DoSwitches - 
    %    Do1phLaterals - 
    %    DoBranchRemove - 

    properties
        Zmag
        KeepLoad
        EditString
        StartPDElement
        EnergyMeter
    end

    methods (Access = public)
        function obj = IReduceCkt(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function obj = SaveCircuit(obj, CktName)
            % Save present (reduced) circuit
            % Filename is listed in the Text Result interface
            calllib(obj.libname, 'ReduceCkt_SaveCircuit', CktName);
            obj.CheckForError();
        end

        function obj = DoDefault(obj)
            % Do Default Reduction algorithm
            calllib(obj.libname, 'ReduceCkt_DoDefault');
            obj.CheckForError();
        end

        function obj = DoShortLines(obj)
            % Do ShortLines algorithm: Set Zmag first if you don't want the default
            calllib(obj.libname, 'ReduceCkt_DoShortLines');
            obj.CheckForError();
        end

        function obj = DoDangling(obj)
            % Reduce Dangling Algorithm; branches with nothing connected
            calllib(obj.libname, 'ReduceCkt_DoDangling');
            obj.CheckForError();
        end

        function obj = DoLoopBreak(obj)
            calllib(obj.libname, 'ReduceCkt_DoLoopBreak');
            obj.CheckForError();
        end

        function obj = DoParallelLines(obj)
            calllib(obj.libname, 'ReduceCkt_DoParallelLines');
            obj.CheckForError();
        end

        function obj = DoSwitches(obj)
            calllib(obj.libname, 'ReduceCkt_DoSwitches');
            obj.CheckForError();
        end

        function obj = Do1phLaterals(obj)
            calllib(obj.libname, 'ReduceCkt_Do1phLaterals');
            obj.CheckForError();
        end

        function obj = DoBranchRemove(obj)
            calllib(obj.libname, 'ReduceCkt_DoBranchRemove');
            obj.CheckForError();
        end
    end
    methods

        function result = get.Zmag(obj)
            % Zmag (ohms) for Reduce Option for Z of short lines
            result = calllib(obj.libname, 'ReduceCkt_Get_Zmag');
            obj.CheckForError();
        end
        function obj = set.Zmag(obj, Value)
            calllib(obj.libname, 'ReduceCkt_Set_Zmag', Value);
            obj.CheckForError();
        end

        function result = get.KeepLoad(obj)
            % Keep load flag (T/F) for Reduction options that remove branches
            result = (calllib(obj.libname, 'ReduceCkt_Get_KeepLoad') ~= 0);
            obj.CheckForError();
        end
        function obj = set.KeepLoad(obj, Value)
            calllib(obj.libname, 'ReduceCkt_Set_KeepLoad', bool(Value));
            obj.CheckForError();
        end

        function result = get.EditString(obj)
            % Edit String for RemoveBranches functions
            result = calllib(obj.libname, 'ReduceCkt_Get_EditString');
            obj.CheckForError();
        end
        function obj = set.EditString(obj, Value)
            calllib(obj.libname, 'ReduceCkt_Set_EditString', Value);
            obj.CheckForError();
        end

        function result = get.StartPDElement(obj)
            % Start element for Remove Branch function
            result = calllib(obj.libname, 'ReduceCkt_Get_StartPDElement');
            obj.CheckForError();
        end
        function obj = set.StartPDElement(obj, Value)
            calllib(obj.libname, 'ReduceCkt_Set_StartPDElement', Value);
            obj.CheckForError();
        end

        function result = get.EnergyMeter(obj)
            % Name of Energymeter to use for reduction
            result = calllib(obj.libname, 'ReduceCkt_Get_EnergyMeter');
            obj.CheckForError();
        end
        function obj = set.EnergyMeter(obj, Value)
            calllib(obj.libname, 'ReduceCkt_Set_EnergyMeter', Value);
            obj.CheckForError();
        end

    end
end