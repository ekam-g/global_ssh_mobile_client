use redis::{Client, Commands, Connection};
use redis::RedisResult;

fn client() -> RedisResult<Connection> {
    let p = Client::open("redis://127.0.0.1:6379")?;
    p.get_connection()
}

pub fn send(val: &String) -> RedisResult<bool> {
    let mut client = client()?;
    client.lpush(&crate::ram::CONST.who, val)
}

// pub fn read_val() -> RedisResult<bool> {
//     let mut client = client()?;
//     client.get(&crate::ram::CONST.who)
// }
