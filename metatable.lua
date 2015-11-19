print("hello lua")


Set={}


Set.mt = {}
function Set.new(t)
	local set = {}
	setmetatable(set, Set.mt)
	if t then
		for _, l in ipairs(t) do set[l] = true end
	end
	return set
end


function Set.union(a,b)
	local res = Set.new()
	if a then
		for k in pairs(a) do res[k] = true end
	end
	if b then
		for k in pairs(b) do res[k] = true end
	end
	return res
end

function Set.tostring(set)
	local s = "{"
	local sep = ""
	for e in pairs(set) do
		s = s .. sep .. e
		sep = ", "
	end

	return s .. "}"
end

function Set.print(set)
	print(Set.tostring(set))
end

local s1 = Set.new{10, 20, 30, 50}
local s2 = Set.new{40, 1}

print("s1 metatable = " .. tostring( getmetatable(s1) ))
print("s2 metatable = " .. tostring( getmetatable(s2) ))

local union = Set.union(s1, s2)
Set.print(union)

--算术运算metatable __add（加）、__mul（乘）、__sub（减）、__div（除）、__unm（负）、__pow（幂）、__concat（连接行为）
Set.mt.__add = Set.union--重新设置元方法
Set.mt.__metatable = "not your business"
local s3 = s1 + s2

Set.print(s3)


--库定义的metamethod
Set.mt.__tostring=Set.tostring
print(s3)



