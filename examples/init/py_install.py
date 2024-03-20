import rpy2, rpy2.robjects.pandas2ri as rop

def ghload (data, pkg=None):
    if pkg is None:
      call = '.data = mmstat4::ghload("%s")' % data
    else:
      call = '.data = %s::%s' % (pkg, data)
    rpy2.robjects.r(call)
    return rop.rpy2py(rpy2.robjects.r[".data"])
