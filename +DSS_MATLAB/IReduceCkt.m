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
            calllib(obj.libname, 'ctx_ReduceCkt_SaveCircuit', obj.dssctx, CktName);
            obj.CheckForError();
        end

        function obj = DoDefault(obj)
            % Do Default Reduction algorithm
            calllib(obj.libname, 'ctx_ReduceCkt_DoDefault', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoShortLines(obj)
            % Do ShortLines algorithm: Set Zmag first if you don't want the default
            calllib(obj.libname, 'ctx_ReduceCkt_DoShortLines', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoDangling(obj)
            % Reduce Dangling Algorithm; branches with nothing connected
            calllib(obj.libname, 'ctx_ReduceCkt_DoDangling', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoLoopBreak(obj)
            calllib(obj.libname, 'ctx_ReduceCkt_DoLoopBreak', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoParallelLines(obj)
            calllib(obj.libname, 'ctx_ReduceCkt_DoParallelLines', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoSwitches(obj)
            calllib(obj.libname, 'ctx_ReduceCkt_DoSwitches', obj.dssctx);
            obj.CheckForError();
        end

        function obj = Do1phLaterals(obj)
            calllib(obj.libname, 'ctx_ReduceCkt_Do1phLaterals', obj.dssctx);
            obj.CheckForError();
        end

        function obj = DoBranchRemove(obj)
            calllib(obj.libname, 'ctx_ReduceCkt_DoBranchRemove', obj.dssctx);
            obj.CheckForError();
        end
    end
    methods

        function result = get.Zmag(obj)
            % Zmag (ohms) for Reduce Option for Z of short lines
            result = calllib(obj.libname, 'ctx_ReduceCkt_Get_Zmag', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.Zmag(obj, Value)
            calllib(obj.libname, 'ctx_ReduceCkt_Set_Zmag', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.KeepLoad(obj)
            % Keep load flag (T/F) for Reduction options that remove branches
            result = (calllib(obj.libname, 'ctx_ReduceCkt_Get_KeepLoad', obj.dssctx) ~= 0);
            obj.CheckForError();
        end
        function obj = set.KeepLoad(obj, Value)
            calllib(obj.libname, 'ctx_ReduceCkt_Set_KeepLoad', obj.dssctx, bool(Value));
            obj.CheckForError();
        end

        function result = get.EditString(obj)
            % Edit String for RemoveBranches functions
            result = calllib(obj.libname, 'ctx_ReduceCkt_Get_EditString', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EditString(obj, Value)
            calllib(obj.libname, 'ctx_ReduceCkt_Set_EditString', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.StartPDElement(obj)
            % Start element for Remove Branch function
            result = calllib(obj.libname, 'ctx_ReduceCkt_Get_StartPDElement', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.StartPDElement(obj, Value)
            calllib(obj.libname, 'ctx_ReduceCkt_Set_StartPDElement', obj.dssctx, Value);
            obj.CheckForError();
        end

        function result = get.EnergyMeter(obj)
            % Name of Energymeter to use for reduction
            result = calllib(obj.libname, 'ctx_ReduceCkt_Get_EnergyMeter', obj.dssctx);
            obj.CheckForError();
        end
        function obj = set.EnergyMeter(obj, Value)
            calllib(obj.libname, 'ctx_ReduceCkt_Set_EnergyMeter', obj.dssctx, Value);
            obj.CheckForError();
        end

    end
end