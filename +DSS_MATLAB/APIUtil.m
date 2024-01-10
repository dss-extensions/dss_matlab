classdef APIUtil < handle
    properties
        %DataPtr_PDouble
        %DataPtr_PInteger
        %DataPtr_PByte
        CountPtr_PDouble
        CountPtr_PInteger
        CountPtr_PByte
        libname
        dssctx
        is_prime
        allow_complex
    end
    methods
        function obj = APIUtil(varargin)
            
            if getenv('DSS_EXTENSIONS_DEBUG') == '1'
                warnings.warn('Environment variable DSS_EXTENSIONS_DEBUG=1 is set: loading the debug version of the DSS C-API library')
                obj.libname = 'dss_capid';
            else
                obj.libname = 'dss_capi';
            end
            MfilePath = fileparts(mfilename('fullpath'));
            DLLfilePath = fullfile(MfilePath, obj.libname);
            PropertiesMOfilePath = fullfile(MfilePath, 'messages', 'properties-en-US.mo');
            DSS_MATLAB.librefcount(1);
            obj.allow_complex = false;
            if (nargin > 1) && (varargin{2})
                obj.allow_complex = true;
            end
            if libisloaded(obj.libname)
                if (nargin > 0) && (varargin{1} ~= 0)
                    obj.dssctx = calllib(obj.libname, 'ctx_New');
                    DSS_MATLAB.ctxrefcount(obj.dssctx, 1);
                    obj.is_prime = 0;
                else
                    obj.dssctx = calllib(obj.libname, 'ctx_Get_Prime');
                    obj.is_prime = 1;
                end
                return;
            end
            orig_state = warning;
            warning('off','all')
            try
                % Try loading using the thunk file, if available
                loadlibrary(DLLfilePath, @DSS_MATLAB.dss_capi);
            catch 
                % Try loading using the thunk file, otherwise use the dynamic version
                loadlibrary(DLLfilePath, @DSS_MATLAB.dss_capi_no_thunk);
            end
            calllib(obj.libname, 'DSS_Start', 0);
            if (nargin > 0) && (varargin{1} ~= 0)
                obj.dssctx = calllib(obj.libname, 'ctx_New');
                DSS_MATLAB.ctxrefcount(obj.dssctx, 1);
                obj.is_prime = 0;
            else
                obj.dssctx = calllib(obj.libname, 'ctx_Get_Prime');
                obj.is_prime = 1;
                calllib(obj.libname, 'DSS_SetPropertiesMO', PropertiesMOfilePath);
            end
            warning(orig_state);
        end
       
        function delete(obj)
            
            if obj.is_prime == 0
                cnt = DSS_MATLAB.ctxrefcount(obj.dssctx, -1);
                if cnt == 0
                    calllib(obj.libname, 'ctx_Dispose', obj.dssctx);
                end
            end

            % If nothing is using the library, unload it.
            % Required to properly exit MATLAB.
            cnt = DSS_MATLAB.librefcount(-1);
            if (cnt == 0)
                prime_ctx = calllib(obj.libname, 'ctx_Get_Prime');
                calllib(obj.libname, 'ctx_Text_Set_Command', prime_ctx, 'Set Parallel=no');
                calllib(obj.libname, 'ctx_DSS_ClearAll', prime_ctx);
                unloadlibrary(obj.libname);
            end
        end
        
        function obj = InitBuffers(obj)
            % obj.DataPtr_PDouble = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PDouble', obj.dssctx);
            % obj.DataPtr_PInteger = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PInteger', obj.dssctx);
            % obj.DataPtr_PByte = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PByte', obj.dssctx);
            obj.CountPtr_PDouble = calllib(obj.libname, 'ctx_DSS_GR_CountPtr_PDouble', obj.dssctx);
            obj.CountPtr_PInteger = calllib(obj.libname, 'ctx_DSS_GR_CountPtr_PInteger', obj.dssctx);
            obj.CountPtr_PByte = calllib(obj.libname, 'ctx_DSS_GR_CountPtr_PByte', obj.dssctx);

            % if (obj.DataPtr_PDouble.isNull || obj.DataPtr_PDouble.isNull || obj.DataPtr_PByte.isNull)
                % disp('Null-pointer return from the API! Cannot continue!');
                % return
                % % error('Null-pointer return from the API! Cannot continue!');
            % end
            
            % setdatatype(obj.DataPtr_PDouble, 'doublePtrPtr', 1);
            % setdatatype(obj.DataPtr_PInteger, 'int32PtrPtr', 1);
            % setdatatype(obj.DataPtr_PByte, 'int8PtrPtr', 1);
            
            setdatatype(obj.CountPtr_PDouble, 'int32Ptr', 4);
            setdatatype(obj.CountPtr_PInteger, 'int32Ptr', 4);
            setdatatype(obj.CountPtr_PByte, 'int32Ptr', 4);
        end
        
        
        function result = get_float64_gr_array(obj)
            data = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PDouble', obj.dssctx);
            cnt = obj.CountPtr_PDouble.Value;
            setdatatype(data, 'doublePtr', 1, cnt(1));
            result = data.Value;
            if obj.allow_complex && (cnt(4) ~= 0)
                % If the last element is filled, we have a matrix.  Otherwise, the 
                % matrix feature is disabled or the result is indeed a vector
                result = reshape(result, [cnt(3), cnt(4)]);
            end
        end
        
        function result = get_complex128_gr_array(obj)
            if ~obj.allow_complex
                result = obj.get_float64_gr_array();
                return
            end

            % Currently we use the same as API as get_float64_array, may change later
            data = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PDouble', obj.dssctx);
            cnt = obj.CountPtr_PDouble.Value;
            setdatatype(data, 'doublePtr', 1, cnt(1));
            result = data.Value(1:2:end) + 1j * data.Value(2:2:end);
            if obj.allow_complex && (cnt(4) ~= 0)
                % If the last element is filled, we have a matrix.  Otherwise, the 
                % matrix feature is disabled or the result is indeed a vector
                result = reshape(result, [cnt(3), cnt(4)]);
            end
        end

        function result = get_complex128_gr_simple(obj)
            if ~obj.allow_complex
                result = obj.get_float64_gr_array();
                return
            end

            % Currently we use the same as API as get_float64_array, may change later
            data = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PDouble', obj.dssctx);
            cnt = obj.CountPtr_PDouble.Value;
            assert(cnt(1) == 2, 'Unexpected number of elements returned by API');
            setdatatype(data, 'doublePtr', 1, 2);
            result = data.Value(1) + 1j * data.Value(2);
        end

        function result = get_int32_gr_array(obj)
            data = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PInteger', obj.dssctx);
            cnt = obj.CountPtr_PInteger.Value;
            setdatatype(data, 'int32Ptr', 1, cnt(1));
            result = data.Value;
            if obj.allow_complex && (cnt(4) ~= 0)
                % If the last element is filled, we have a matrix.  Otherwise, the 
                % matrix feature is disabled or the result is indeed a vector
                result = reshape(result, [cnt(3), cnt(4)]);
            end
        end
 
        function result = get_int8_gr_array(obj)
            data = calllib(obj.libname, 'ctx_DSS_GR_DataPtr_PByte', obj.dssctx);
            cnt = obj.CountPtr_PByte.Value;
            setdatatype(data, 'int8Ptr', 1, cnt(1));
            result = data.Value;
            if obj.allow_complex && (cnt(4) ~= 0)
                % If the last element is filled, we have a matrix.  Otherwise, the 
                % matrix feature is disabled or the result is indeed a vector
                result = reshape(result, [cnt(3), cnt(4)]);
            end
        end
        
        function result = get_string_array(obj, funcname, varargin)
            dataPointer = libpointer('voidPtr', 0);
            countPointer = libpointer('int32Ptr', [0, 0, 0, 0]);
            calllib(obj.libname, funcname, obj.dssctx, dataPointer, countPointer, varargin{:});
            result = cell(countPointer.Value(1), 1);
            for i=1:countPointer.Value(1)
                result(i) = cellstr(calllib(obj.libname, 'DSS_Get_PAnsiChar', dataPointer, i - 1));
            end
            calllib(obj.libname, 'DSS_Dispose_PPAnsiChar', dataPointer, countPointer.Value(2));
        end

        function obj = set_string_array(obj, funcname, Value)
            calllib(obj.libname, funcname, obj.dssctx, Value, numel(Value));
        end

        function obj = set_complex128_simple(obj, funcname, value)
            if ~isreal(value)
                assert(length(value) ~= 1, 'A single complex number or a pair of reals was expected');
                calllib(obj.libname, funcname, obj.dssctx, value, 2);
                return
            end
            assert((length(value) == 1) || (length(value) == 2), 'A single complex number or a pair of reals was expected');
            if (length(value) ~= 2)
                value = [value; 0];
            end
            calllib(obj.libname, funcname, obj.dssctx, value, 2);
        end

        % function result = get_int8_array(obj, funcname, varargin)
        %     dataPointer = libpointer('int8PtrPtr');
        %     countPointer = libpointer('int32Ptr', [0, 0, 0, 0]);
        %     calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
        %     dataPointer.Value
        %     setdatatype(dataPointer.Value, 'int8Ptr', 1, countPointer.Value(1));
        %     result = dataPointer.Value;
        %     calllib(obj.libname, 'DSS_Dispose_PByte', dataPointer);
        %     obj.CheckForError();
        % end   
        
        % function result = get_int32_array(obj, funcname, varargin)
        %     dataPointer = libpointer('int32PtrPtr');
        %     countPointer = libpointer('int32Ptr', [0, 0, 0, 0]);
        %     calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
        %     setdatatype(dataPointer.Value, 'int32Ptr', 1, countPointer.Value(1));
        %     result = dataPointer.Value;
        %     calllib(obj.libname, 'DSS_Dispose_PInteger', dataPointer);
        % end
   
        % function result = get_float64_array(obj, funcname, varargin)
        %     dataPointer = libpointer('doublePtrPtr');
        %     countPointer = libpointer('int32Ptr', [0, 0, 0, 0]);
        %     calllib(obj.libname, funcname, dataPointer, countPointer, varargin{:});
        %     setdatatype(dataPointer.Value, 'doublePtr', 1, countPointer.Value(1));
        %     result = dataPointer.Value;
        %     calllib(obj.libname, 'DSS_Dispose_PDouble', dataPointer);
        % end
   
    end
end