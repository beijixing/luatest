
local  Acount = {}


function Acount:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Acount:display()
	print("show initFormationUi")
end



local a = Acount:new()
a:display()
