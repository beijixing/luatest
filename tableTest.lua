tb={
a=0,b=10,c=2000,d=3,e=3334,f=5}

for k, v in pairs(tb) do
	-- print(k .. "=" .. v)
end

-- print(table.getn(tb))


tb2 = {10,20,32,4,5,6,7}

-- print(table.getn(tb2))

table.insert(tb2, 100)
table.insert(tb2, 200)


-- for k, v in ipairs(tb2) do
-- 	print(v)
-- end

local cnt = #tb2


-- tb2[4] = nil
-- tb2[6] = nil

table.remove(tb2, 4)
table.remove(tb2, 5)

for k, v in ipairs(tb2) do
	print(v)
end

print("table-1 = ")

--table 做数组用时调用insert插入数据，可以使用ipairs或者pairs遍历数组，用下标引用数组元素。
--对数组中间的一个元素赋值为nil后，再用ipairs遍历数组，遇到nil后遍历结束，nil后面的数据遍历不到。这时只能用pairs遍历数组。
--如果还想用ipairs遍历数组，在移除数据时，调用remove方法移除，remove移除的元素后的元素会向前移动，数组中不含有nil元素。





