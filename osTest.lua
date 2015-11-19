--[[

%a  		abbreviated weekday name (e.g., Wed)
%A  		full weekday name (e.g., Wednesday)
%b 			abbreviated month name (e.g., Sep) 
%B  		full month name (e.g., September)
%c  		date and time (e.g., 09/16/98 23:48:10)
%d  		day of the month (16) [01-31]
%H  		hour, using a 24-hour clock (23) [00-23]
%I 			hour, using a 12-hour clock (11) [01-12]
%M  		minute (48) [00-59]
%m 			month (09) [01-12]
%p 			either "am" or "pm" (pm)
%S 			second (10) [00-61]
%w 			weekday (3) [0-6 = Sunday-Saturday]
%x 			date (e.g., 09/16/98)
%X 			time (e.g., 23:48:10)   
%Y 			full year (1998)
%y 			two-digit year (98) [00-99]
%%			the character '%'
]]
print(os.time())

local time = os.date("*t",os.time())

for k, v in pairs(time) do
	print(k .. "=" .. tostring(v))
end

print(os.date("today is %A , in %B"))--today is Monday , in August
print(os.date("%x"))--08/31/15
print(os.date("%X"))--11:43:38
print(os.date("%y, %Y"))--15, 2015
print(os.date("%y-%m-%d/%H:%M:%S"))--15-08-31/11:40:56
print(os.date("%w"))--1 表示周一
print(os.date("%c"))--Mon Aug 31 11:44:15 2015

local x = os.clock()
local s = 0
for i = 1, 100000000 do
	s = s+1
end
print(string.format("elapsed time: %.2f\n", os.clock() - x)) -- 计算执行一段代码cpu花去的时钟秒数


print(os.getenv("PATH"))--/Users/admin

os.execute("mkdir " .. "ostestdir")--执行一些命令行指令


