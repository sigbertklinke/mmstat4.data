class MyClass: # MyClass(BossClass)
    def __init__(self, x):
        self.data = x
    def __repr__(self):
        return f"MyClass({self.data})"
    def display(self):
        print(repr(self))
      
def myclass_matrix(x):
    return MyClass(x)
  
iris = r["iris"]
obj  = MyClass(iris)
isinstance(obj, MyClass)
obj.display   # reference to method
obj.display() # call to method
