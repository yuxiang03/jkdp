---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by yuxiang.
--- DateTime: 2024/3/8 16:54
---
if(redis.call('get',KEYS[1]) == ARGV[1]) then
    return redis.call('del',KEYS[1])
end
return 0