-- read 􏱏􏱐􏳯􏲛􏲊􏳖􏳗􏲮􏲯􏳱􏳲􏴏􏰜􏱄􏳠􏰋􏲔􏱐􏴅􏴆􏳱􏳲􏰋􏱛􏳂􏱑
-- ￼￼￼"*all" "*line" "*number" num
-- 􏳱􏳲􏲹􏰲􏲮􏲯 􏳱􏳲􏱜􏰖􏲆
function iosimplemode()
	io.input("file.txt") --打开一个作为输入的文件
	local txt = io.read("*all")--读取文件内容
	print("txt = " .. txt)
	io.output("file.txt")--打开一个作为输出的文件
	io.write(txt,"\nabgghjjj")--向文件中写入内容
end

function iolines()
	local lines = {}
	io.input("file.txt")

	for line in io.lines() do
		table.insert(lines, line)
	end

	table.sort(lines)

	io.output("file.txt")--打开一个作为输出的文件
	for i,l in ipairs(lines) do 
		io.write(l)
	end
end

function ioCompletePatern()--完全io模式
	local f =assert(io.open("file.txt", "r"))

	local txt = f:read("*all")

	print("txt = " .. txt)

	print("fileSize = " .. fileSize(f))

	f:close()
end

function fileSize(filehandler)
	local current = filehandler:seek()
	local size = filehandler:seek("end")
	filehandler:seek("set", current)
	return size 
end

function ioBufferSize()--查询单词个数
	local BUFSIZE = 2^13 --8K
	local f = io.input(arg[1])
	local cc, lc, wc = 0,0,0

	while true do
		local  lines, rest = f:read(BUFSIZE, "*line")
		if not lines then 
			break
		end

		if rest then
			lines = lines .. rest .. "\n" 
		end

		cc = cc+string.len(lines)

		local _, t =  string.gsub(lines, "%S+", " ")
		wc = wc + t

		_, t = string.gsub(lines, "\n", "\n")
		lc = lc + t
	end

	print(lc, wc, cc)
end

function debugInfo()
	
	local info = debug.getinfo(iolines)
	for k, v in pairs( info ) do
		print(k .. tostring(v))
	end 
end

function iotest() 
	-- iosimplemode()
	-- iolines()
	ioCompletePatern()
	debugInfo()
end
iotest() 

