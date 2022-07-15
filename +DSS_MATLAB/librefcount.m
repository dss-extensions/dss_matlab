function out = librefcount(data)
    persistent refcount;
    if isempty(refcount)
        refcount = 0;
    end
    if data > 0
        refcount = refcount + 1;
    end
    if data < 0
        refcount = refcount - 1;
    end
    out = refcount;
end
