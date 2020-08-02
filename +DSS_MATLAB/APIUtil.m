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
        libname
    end
    methods
        function obj = APIUtil()
            if getenv('DSS_EXTENSIONS_DEBUG') == '1'
                warnings.warn('Environment variable DSS_EXTENSIONS_DEBUG=1 is set: loading the debug version of the DSS C-API library')
                obj.libname = 'dss_capi_v7d';
            else
                obj.libname = 'dss_capi_v7';
            end
        
            MfilePath = fileparts(mfilename('fullpath'));
            DLLfilePath = fullfile(MfilePath, obj.libname);
            if libisloaded(obj.libname)
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
                % unloadlibrary(obj.libname);
            % end
        end
        
        function obj = InitBuffers(obj)
            % obj.DataPtr_PDouble = calllib(obj.libname, 'DSS_GR_DataPtr_PDouble');
            % obj.DataPtr_PInteger = calllib(obj.libname, 'DSS_GR_DataPtr_PInteger');
            % obj.DataPtr_PByte = calllib(obj.libname, 'DSS_GR_DataPtr_PByte');
            obj.CountPtr_PDouble = calllib(obj.libname, 'DSS_GR_CountPtr_PDouble');
            obj.CountPtr_PInteger = calllib(obj.libname, 'DSS_GR_CountPtr_PInteger');
            obj.CountPtr_PByte = calllib(obj.libname, 'DSS_GR_CountPtr_PByte');

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
            data = calllib(obj.libname, 'DSS_GR_DataPtr_PDouble');
            setdatatype(data, 'doublePtr', 1, obj.CountPtr_PDouble.Value(1));
            result = data.Value;
        end
        
        function result = get_int32_gr_array(obj)
            data = calllib(obj.libname, 'DSS_GR_DataPtr_PInteger');
            setdatatype(data, 'int32Ptr', 1, obj.CountPtr_PInteger.Value(1));
            result = data.Value;
        end
 
        function result = get_int8_gr_array(obj)
            data = calllib(obj.libname, 'DSS_GR_DataPtr_PByte');
            setdatatype(data, 'int8Ptr', 1, obj.CountPtr_PByte.Value(1));
            result = data.Value;
        end
        
        function result = get_string_array(obj, funcname, varargin)
            dataPointer = libpointer('voidPtr', 0);
            countPointer = libpointer('int32Ptr', [0, 0]);
            calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
            result = cell(countPointer.Value(1), 1);
            for i=1:countPointer.Value(1)
                result(i) = cellstr(calllib(obj.libname, 'DSS_Get_PAnsiChar', dataPointer, i - 1));
            end
            calllib(obj.libname, 'DSS_Dispose_PPAnsiChar', dataPointer, countPointer.Value(2));
        end
   
        function result = get_int8_array(obj, funcname, varargin)
            dataPointer = libpointer('int8PtrPtr');
            countPointer = libpointer('int32Ptr', [0, 0]);
            calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
            dataPointer.Value
            setdatatype(dataPointer.Value, 'int8Ptr', 1, countPointer.Value(1));
            result = dataPointer.Value;
            calllib(obj.libname, 'DSS_Dispose_PByte', dataPointer);
        end   
        
        function result = get_int32_array(obj, funcname, varargin)
            dataPointer = libpointer('int32PtrPtr');
            countPointer = libpointer('int32Ptr', [0, 0]);
            calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
            setdatatype(dataPointer.Value, 'int32Ptr', 1, countPointer.Value(1));
            result = dataPointer.Value;
            calllib(obj.libname, 'DSS_Dispose_PInteger', dataPointer);
        end
   
        function result = get_float64_array(obj, funcname, varargin)
            dataPointer = libpointer('doublePtrPtr');
            countPointer = libpointer('int32Ptr', [0, 0]);
            calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
            setdatatype(dataPointer.Value, 'doublePtr', 1, countPointer.Value(1));
            result = dataPointer.Value;
            calllib(obj.libname, 'DSS_Dispose_PDouble', dataPointer);
        end
   
    end
end