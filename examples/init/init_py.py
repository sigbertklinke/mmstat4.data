import rpy2, rpy2.robjects.pandas2ri as rop
#rpy2.robjects.r('allbus = mmstat4::ghload("data/allbus2012.rds")')
#allbus = rop.rpy2py(rpy2.robjects.r["allbus"])

def ghload (data, pkg=None):
    if pkg is None:
      call = '.data = mmstat4::ghload("%s")' % data
    else:
      call = '.data = %s::%s' % (pkg, data)
    rpy2.robjects.r(call)
    return rop.rpy2py(rpy2.robjects.r[".data"])
  
def ghsource (prg, data):
    call = 'mmstat4::ghsource("%s")' % prg
    rpy2.robjects.r(call)
    return rpy2.robjects.pandas2ri.rpy2py(rpy2.robjects.r[data])
