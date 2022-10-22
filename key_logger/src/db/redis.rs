use redis::{Client, Commands, Connection, ToRedisArgs};
use redis::RedisResult;

fn client() -> RedisResult<Connection> {
    let redis = Client::open(crate::REDIS_KEY)?;
    redis.get_connection()
}

pub fn send(val: &String) -> RedisResult<bool> {
    let mut client = client()?;
    client.rpush(&crate::ram::CONST.who, val)
}

pub fn exists<T : ToRedisArgs>(val : T)  -> RedisResult<bool> {
    let mut client = client()?;
    client.exists(val)
}
