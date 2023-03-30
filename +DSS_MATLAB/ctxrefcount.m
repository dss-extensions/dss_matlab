function out = ctxrefcount(ctx, data)
    persistent refcountmap;
    if isempty(refcountmap)
        refcountmap = containers.Map('KeyType','uint64','ValueType','int32');
    end
    refcount = 0;
    if isKey(refcountmap, ctx)
        refcount = refcountmap(ctx);
    end
    if data > 0
        refcount = refcount + 1;
    end
    if data < 0
        refcount = refcount - 1;
    end
    refcountmap(ctx) = refcount;
    out = refcount;
end
