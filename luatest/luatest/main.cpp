//
//  main.cpp
//
//  Created by admin on 15/8/31.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#include <iostream>

extern "C"{
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
}
#include <stdarg.h>

void error(lua_State* L, const char *fmt, ...)
{
    va_list argp;
    va_start(argp, fmt);
    vfprintf(stderr, fmt, argp);//格式化输出
    va_end(argp);
    lua_close(L);
    exit(EXIT_FAILURE);
}


void loadfile(char* filename, int *width, int *height)
{
    lua_State* L = lua_open();
    luaL_openlibs(L);
    
    if (luaL_loadfile(L, filename) || lua_pcall(L, 0, 0, 0)) {
        error(L, "cannot run configure file :%s", lua_tostring(L, -1));
    }
    
    lua_getglobal(L, "width");
    lua_getglobal(L, "height");
    
    if (!lua_isnumber(L, -2)) {
        error(L, " 'width' should be a number");
    }
    
    if (!lua_isnumber(L, -1)) {
         error(L, " 'height' should be a number");
    }
    
    *width = (int)lua_tonumber(L, -2);
    *height = (int)lua_tonumber(L, -1);
    
    lua_close(L);
}

int getfield(lua_State* L, const char *key)
{
    int result;
    lua_pushstring(L, key);
    lua_gettable(L, -2);
    if (!lua_isnumber(L, -1)) {
        error(L, "invalid componet in background color");
    }
    
    result = (int)lua_tonumber(L, -1);
    lua_pop(L, 1);
    return result;
}

void tableResolver(const char *filename)
{
    lua_State* L = lua_open();
    luaL_openlibs(L);
    
    if (luaL_loadfile(L, filename) || lua_pcall(L, 0, 0, 0)) {
        error(L, "cannot run configure file :%s", lua_tostring(L, -1));
    }
    
    lua_getglobal(L, "background");
    
    if (!lua_istable(L, -1)) {
        error(L, " 'background' should be a table");
    }
    
    int r,g,b;
    r=getfield(L, "r");
    g=getfield(L, "g");
    b=getfield(L, "b");
    
    printf("r=%d\ng=%d\nb=%d\n", r,g,b);
    lua_close(L);
}

double functionResolver(const char* filename, double a, double b)
{
    lua_State* L = lua_open();
    luaL_openlibs(L);
    
    if (luaL_loadfile(L, filename) || lua_pcall(L, 0, 0, 0)) {
        error(L, "cannot run configure file :%s", lua_tostring(L, -1));
    }
    
    lua_getglobal(L, "axd");
    lua_pushnumber(L, a);
    lua_pushnumber(L, b);
    
    if (lua_pcall(L, 2, 1, 0) != 0) {
        error(L, "error running function f :%s", lua_tostring(L, -1));
    }
    
    if (!lua_isnumber(L, -1)) {
        error(L, "function axd must return a num");
    }
    
    int z = lua_tonumber(L, -1);
    lua_pop(L, 1);
    lua_close(L);
    
    return z;
}


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    int width , height;
    loadfile("/Users/admin/Desktop/luaLibTest/luatest/luatest/hellolua.lua", &width, &height);
    
    printf("width = %d\n", width);
    printf("height = %d\n", height);
    
    tableResolver("/Users/admin/Desktop/luaLibTest/luatest/luatest/hellolua.lua");
    
    
    int result = functionResolver("/Users/admin/Desktop/luaLibTest/luatest/luatest/hellolua.lua", 10, 20);
    
    printf("result = %d", result);
    
//    luaL_open
    return 0;
}


void luaexplain()
{
    char buff[256];
    int err;
    lua_State *L = lua_open();
    
    //    luaopen_base(L);
    luaL_openlibs(L);
    //    luaopen_table(L);
    //    luaopen_string(L);
    //    luaopen_math(L);
    
    
    while (fgets(buff, sizeof(buff), stdin) != NULL) {
        err = luaL_loadbuffer(L, buff, strlen(buff), "*line") || lua_pcall(L, 0, 0, 0);
        
        if (err) {
            fprintf(stderr, "%s", lua_tostring(L, -1));
            
            lua_pop(L, 1);
            
        }
        
    }
    lua_close(L);
}
