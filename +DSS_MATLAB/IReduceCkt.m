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

        function obj = SaveCircuit(obj, CktName)
            % Save present (reduced) circuit
            % Filename is listed in the Text Result interface
            calllib('dss_capi_v7', 'ReduceCkt_SaveCircuit', CktName);
        end

        function obj = DoDefault(obj)
            % Do Default Reduction algorithm
            calllib('dss_capi_v7', 'ReduceCkt_DoDefault');
        end

        function obj = DoShortLines(obj)
            % Do ShortLines algorithm: Set Zmag first if you don't want the default
            calllib('dss_capi_v7', 'ReduceCkt_DoShortLines');
        end

        function obj = DoDangling(obj)
            % Reduce Dangling Algorithm; branches with nothing connected
            calllib('dss_capi_v7', 'ReduceCkt_DoDangling');
        end

        function obj = DoLoopBreak(obj)
            calllib('dss_capi_v7', 'ReduceCkt_DoLoopBreak');
        end

        function obj = DoParallelLines(obj)
            calllib('dss_capi_v7', 'ReduceCkt_DoParallelLines');
        end

        function obj = DoSwitches(obj)
            calllib('dss_capi_v7', 'ReduceCkt_DoSwitches');
        end

        function obj = Do1phLaterals(obj)
            calllib('dss_capi_v7', 'ReduceCkt_Do1phLaterals');
        end

        function obj = DoBranchRemove(obj)
            calllib('dss_capi_v7', 'ReduceCkt_DoBranchRemove');
        end
    end
    methods

        function result = get.Zmag(obj)
            % Zmag (ohms) for Reduce Option for Z of short lines
            result = calllib('dss_capi_v7', 'ReduceCkt_Get_Zmag');
        end
        function obj = set.Zmag(obj, Value)
            ReduceCkt_Set_Zmag(Value);
        end

        function result = get.KeepLoad(obj)
            % Keep load flag (T/F) for Reduction options that remove branches
            result = (calllib('dss_capi_v7', 'ReduceCkt_Get_KeepLoad') ~= 0);
        end
        function obj = set.KeepLoad(obj, Value)
            calllib('dss_capi_v7', 'ReduceCkt_Set_KeepLoad', bool(Value));
        end

        function result = get.EditString(obj)
            % Edit String for RemoveBranches functions
            result = calllib('dss_capi_v7', 'ReduceCkt_Get_EditString');
        end
        function obj = set.EditString(obj, Value)
            calllib('dss_capi_v7', 'ReduceCkt_Set_EditString', Value);
        end

        function result = get.StartPDElement(obj)
            % Start element for Remove Branch function
            result = calllib('dss_capi_v7', 'ReduceCkt_Get_StartPDElement');
        end
        function obj = set.StartPDElement(obj, Value)
            calllib('dss_capi_v7', 'ReduceCkt_Set_StartPDElement', Value);
        end

        function result = get.EnergyMeter(obj)
            % Name of Energymeter to use for reduction
            result = calllib('dss_capi_v7', 'ReduceCkt_Get_EnergyMeter');
        end
        function obj = set.EnergyMeter(obj, Value)
            calllib('dss_capi_v7', 'ReduceCkt_Set_EnergyMeter', Value);
        end

    end
end