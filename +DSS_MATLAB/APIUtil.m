classdef APIUtil < handle
    properties (Access = protected)
        libraryWasLoaded = 0
    end
    properties
        %DataPtr_PDouble
        %DataPtr_PInteger
        %DataPtr_PByte
        CountPtr_PDouble
        CountPtr_PInteger
        CountPtr_PByte
    end
    methods
        function obj = APIUtil()
            MfilePath = fileparts(mfilename('fullpath'));
            DLLfilePath = fullfile(MfilePath, 'dss_capi_v7');
            if libisloaded('dss_capi_v7')
                return
            else
                orig_state = warning;
                warning('off','all')
                try
                    % Try loading using the thunk file, if available
                    loadlibrary(DLLfilePath, @DSS_MATLAB.dss_capi_v7);
                catch 
                    % Try loading using the thunk file, otherwise use the dynamic version
                    loadlibrary(DLLfilePath, @DSS_MATLAB.dss_capi_v7_no_thunk);
                end
                obj.libraryWasLoaded = 1;
                warning(orig_state);
            end
        end
       
        function delete(obj)
            % Don't unload the library anymore for better compatibility with 
            % the COM behavior
            
            % if (obj.libraryWasLoaded ~= 0)
                % unloadlibrary('dss_capi_v7');
            % end
        end
        
        function obj = InitBuffers(obj)
            % obj.DataPtr_PDouble = calllib('dss_capi_v7', 'DSS_GR_DataPtr_PDouble');
            % obj.DataPtr_PInteger = calllib('dss_capi_v7', 'DSS_GR_DataPtr_PInteger');
            % obj.DataPtr_PByte = calllib('dss_capi_v7', 'DSS_GR_DataPtr_PByte');
            obj.CountPtr_PDouble = calllib('dss_capi_v7', 'DSS_GR_CountPtr_PDouble');
            obj.CountPtr_PInteger = calllib('dss_capi_v7', 'DSS_GR_CountPtr_PInteger');
            obj.CountPtr_PByte = calllib('dss_capi_v7', 'DSS_GR_CountPtr_PByte');

            % if (obj.DataPtr_PDouble.isNull || obj.DataPtr_PDouble.isNull || obj.DataPtr_PByte.isNull)
                % disp('Null-pointer return from the API! Cannot continue!');
                % return
                % % error('Null-pointer return from the API! Cannot continue!');
            % end
            
            % setdatatype(obj.DataPtr_PDouble, 'doublePtrPtr', 1);
            % setdatatype(obj.DataPtr_PInteger, 'int32PtrPtr', 1);
            % setdatatype(obj.DataPtr_PByte, 'int8PtrPtr', 1);
            
            setdatatype(obj.CountPtr_PDouble, 'int32Ptr', 2);
            setdatatype(obj.CountPtr_PInteger, 'int32Ptr', 2);
            setdatatype(obj.CountPtr_PByte, 'int32Ptr', 2);
        end
        
        
       function result = get_float64_gr_array(obj)
           data = calllib('dss_capi_v7', 'DSS_GR_DataPtr_PDouble');
           setdatatype(data, 'doublePtr', 1, obj.CountPtr_PDouble.Value(1));
           result = data.Value;
       end
       
       function result = get_int32_gr_array(obj)
           data = calllib('dss_capi_v7', 'DSS_GR_DataPtr_PInteger');
           setdatatype(data, 'int32Ptr', 1, obj.CountPtr_PInteger.Value(1));
           result = data.Value;
       end

       function result = get_int8_gr_array(obj)
           data = calllib('dss_capi_v7', 'DSS_GR_DataPtr_PByte');
           setdatatype(data, 'int8Ptr', 1, obj.CountPtr_PByte.Value(1));
           result = data.Value;
       end
        
    end
end