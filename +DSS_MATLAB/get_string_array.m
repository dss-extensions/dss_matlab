function result = get_string_array(funcname)
    dataPointer = libpointer('voidPtr', 0);
    countPointer = libpointer('int32Ptr', [0, 0]);
    calllib('dss_capi_v7', funcname, dataPointer, countPointer);
    result = cell(countPointer.Value(1), 1);
    for i=1:countPointer.Value(1)
        result(i) = cellstr(calllib('dss_capi_v7', 'DSS_Get_PAnsiChar', dataPointer, i - 1));
    end
    calllib('dss_capi_v7', 'DSS_Dispose_PPAnsiChar', dataPointer, countPointer.Value(2));
end
