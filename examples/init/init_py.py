def ghload (data, pkg=None):
    if pkg is None:
      ds = r["mmstat4::ghload"](data)
    else
      ds = r[pkg + '::' + data]
    return ds
  
def ghsource (prg, data):
    r["mmstat4::ghsource"](prg)
    return r[data]
