use std::{thread, time};

pub(crate) mod redis;

pub fn send_db(data: &[String]) {
    let val = data.join(" ").replace("Space", " ");
    loop {
        if redis::send(&val).is_ok() {
            break;
        }
        thread::sleep(time::Duration::from_secs(10))
    }
}