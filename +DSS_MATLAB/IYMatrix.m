classdef (CaseInsensitiveProperties) IYMatrix < DSS_MATLAB.Base
    % IYMatrix: DSS MATLAB interface class to DSS C-API
    % 
    % Properties:
    %    SystemYChanged - 
    %    UseAuxCurrents - 
    % 
    % Methods:
    %    GetCompressedYMatrix - Returns the circuit's YMatrix as a sparse MATLAB matrix
    %    ZeroInjCurr - 
    %    GetSourceInjCurrents - 
    %    GetPCInjCurr - 
    %    BuildYMatrixD - 
    %    AddInAuxCurrents - 
    %    GetIPointer - Get access to the internal Current pointer
    %    GetVPointer - Get access to the internal Voltage pointer
    %    SolveSystem - 
    %    getI - Get the data from the internal Current pointer
    %    getV - Get the data from the internal Voltage pointer

    properties
        SystemYChanged
        UseAuxCurrents
    end

    methods

        function result = GetCompressedYMatrix(obj, factor)
            % Returns the circuit's YMatrix as a sparse MATLAB matrix
            if (nargin < 2)
                factor = 0;
            end
            
            nBus = libpointer('uint32Ptr', 0);
            nNz = libpointer('uint32Ptr', 0);
            ColPtr = libpointer('int32PtrPtr');
            RowIdxPtr = libpointer('int32PtrPtr');
            cValsPtr = libpointer('doublePtrPtr');
            calllib('dss_capi_v7', 'YMatrix_GetCompressedYMatrix', factor, nBus, nNz, ColPtr, RowIdxPtr, cValsPtr);
            obj.CheckForError;
            if ((~nBus.Value(1) || ~nNz.Value(1)))
                result = 0;
                return
            else
                setdatatype(ColPtr.Value, 'int32Ptr', 1, nBus.Value(1) + 1);
                setdatatype(RowIdxPtr.Value, 'int32Ptr', 1, nNz.Value(1));
                setdatatype(cValsPtr.Value, 'doublePtr', 1, nNz.Value(1) * 2);
                vals = cValsPtr.Value(1:2:end) + 1j * cValsPtr.Value(2:2:end);

                % We need to decompress the columns
                ColPtrValues = ColPtr.Value + 1;
                cols = zeros(1, nNz.Value(1));
                for col=1:nBus.Value(1)
                    cols(ColPtrValues(col):ColPtrValues(col+1)-1) = col;
                end
                
                result = sparse(double(RowIdxPtr.Value) + 1, cols, vals);
                calllib('dss_capi_v7', 'DSS_Dispose_PInteger', ColPtr);
                calllib('dss_capi_v7', 'DSS_Dispose_PInteger', RowIdxPtr);
                calllib('dss_capi_v7', 'DSS_Dispose_PDouble', cValsPtr);
            end
        end

        function obj = ZeroInjCurr(obj)
            calllib('dss_capi_v7', 'YMatrix_ZeroInjCurr');
        end

        function obj = GetSourceInjCurrents(obj)
            calllib('dss_capi_v7', 'YMatrix_GetSourceInjCurrents');
        end

        function obj = GetPCInjCurr(obj)
            calllib('dss_capi_v7', 'YMatrix_GetPCInjCurr');
        end

        function obj = BuildYMatrixD(obj, BuildOps, AllocateVI)
            calllib('dss_capi_v7', 'YMatrix_BuildYMatrixD', BuildOps, AllocateVI);
        end

        function obj = AddInAuxCurrents(obj, SType)
            calllib('dss_capi_v7', 'YMatrix_AddInAuxCurrents', SType);
        end

        function result = GetIPointer(obj)
            % Get access to the internal Current pointer
            IvectorPtr = libpointer('doublePtrPtr');
            numNodes = (calllib('dss_capi_v7', 'Circuit_Get_NumNodes') + 1) * 2;
            calllib('dss_capi_v7', 'YMatrix_getIpointer', IvectorPtr);
            setdatatype(IvectorPtr.Value, 'doublePtr', 1, numNodes);
            result = IvectorPtr;
        end
 
        function result = GetVPointer(obj)
            % Get access to the internal Voltage pointer
            VvectorPtr = libpointer('doublePtrPtr');
            numNodes = (calllib('dss_capi_v7', 'Circuit_Get_NumNodes') + 1) * 2;
            calllib('dss_capi_v7', 'YMatrix_getVpointer', VvectorPtr);
            setdatatype(VvectorPtr.Value, 'doublePtr', 1, numNodes);
            result = VvectorPtr;
        end
 
        function result = SolveSystem(obj, NodeV)
            result = calllib('dss_capi_v7', 'YMatrix_SolveSystem', NodeV);
            DSS_MATLAB.CheckForError();
        end

        function result = get.SystemYChanged(obj)
            result = calllib('dss_capi_v7', 'YMatrix_Get_SystemYChanged') ~= 0;
        end
        function obj = set.SystemYChanged(obj, value)
            calllib('dss_capi_v7', 'YMatrix_Set_SystemYChanged', value);
            DSS_MATLAB.CheckForError();
        end

        function result = get.UseAuxCurrents(obj)
            result = calllib('dss_capi_v7', 'YMatrix_Get_UseAuxCurrents') ~= 0;
        end
        function obj = set.UseAuxCurrents(obj, value)
            calllib('dss_capi_v7', 'YMatrix_Set_UseAuxCurrents', value);
            DSS_MATLAB.CheckForError();
        end
        
        function result = getYSparse(obj)
            result = obj.GetCompressedYMatrix;
        end

        function result = getI(obj)
            % Get the data from the internal Current pointer
            result = obj.IPointer.Value;
        end

        function result = getV(obj)
            % Get the data from the internal Voltage pointer
            result = obj.VPointer.Value;
        end
    end
end