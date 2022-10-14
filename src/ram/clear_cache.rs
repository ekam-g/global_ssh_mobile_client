use std::{thread, time};

use crate::SAFE_PUB_VAR;

pub fn clear_ram_thread()
{
    loop {
        thread::sleep(time::Duration::from_secs(10));
        loop {
            if let Ok(mut data) = SAFE_PUB_VAR.lock() {
                crate::db::send_db(&data.key_pressed_cache);
                data.key_pressed_cache = vec!["".to_owned()];
                break;
            }
            println!("bad")
        }
    }
}