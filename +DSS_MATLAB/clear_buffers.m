function clear_buffers()
    calllib('dss_capi_v7', 'DSS_DisposeGRData')
    calllib('dss_capi_v7', 'DSS_ResetStringBuffer')
end