use std::{thread, time};

use crate::SAFE_PUB_VAR;

pub fn clear_ram_thread()
{
    loop {
        thread::sleep(time::Duration::from_secs(300));
        loop {
            if let Ok(mut data) = SAFE_PUB_VAR.lock() {
                data.key_pressed_cache = vec!["".to_owned()];
                break;
            }
            thread::sleep(time::Duration::from_millis(10))
        }
    }
}