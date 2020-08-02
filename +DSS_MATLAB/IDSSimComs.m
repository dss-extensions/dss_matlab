classdef (CaseInsensitiveProperties) IDSSimComs < DSS_MATLAB.Base
    % IDSSimComs: DSS MATLAB interface class to DSS C-API
    % 
    % Methods:
    %    BusVoltage - 
    %    BusVoltagepu - 

    methods (Access = public)
        function obj = IDSSimComs(apiutil)
            obj@DSS_MATLAB.Base(apiutil);
        end

        function result = BusVoltage(obj, Index)
            calllib(obj.libname, 'DSSimComs_BusVoltage_GR', Index);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end

        function result = BusVoltagepu(obj, Index)
            calllib(obj.libname, 'DSSimComs_BusVoltagepu_GR', Index);
            obj.CheckForError();
            result = obj.apiutil.get_float64_gr_array();
        end
    end
    methods

    end
end