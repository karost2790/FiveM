-- Meta class
Rectangle = {area = 0, length = 0, breadth = 0}
-- Derived class
function Rectangle:new (o, length, breadth)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 
    self.length = length or 0
    self.breadth = breadth or 0
    self.area = length*breadth;
    return 0
end 

-- Derived classs method printArea
function Rectangle:printArea()
    print("The area of the Rectangle is ", self.area)
end

a = 0
B = '1'
c = nil

--r = Rectangle:new( nil,10,20)
--print(r.length)
--r:printArea()
