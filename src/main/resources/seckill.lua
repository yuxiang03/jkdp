local voucherId = ARGV[1]
local userId = ARGV[2]
local orderId = ARGV[3]
-- 库存key
-- 订单key
local stockKey = 'seckill:stock:' .. voucherId
local orderKey = 'seckill:order:' .. voucherId

if (tonumber(redis.call('get',stockKey)) <= 0) then
    return 1
end

-- 判断用户是否下单
if (redis.call('sismember',orderKey,userId)==1) then
    return 2
end
-- 扣减库存
redis.call('incrby',stockKey,-1)
-- 下单
redis.call('sadd',orderKey,userId)
-- 发送消息到队列中
redis.call('xadd','stream.orders','*','userId',userId,'id',orderId,'voucherId',voucherId)
return 0