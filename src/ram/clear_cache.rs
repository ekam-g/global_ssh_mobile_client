use std::{thread, time};

use crate::ram::PubInfo;

pub fn clear_ram_thread() {
    loop {
        thread::sleep(time::Duration::from_secs(10));
        let mut data = PubInfo::get();
        crate::db::send_db(&data.key_pressed_cache);
        data.key_pressed_cache = vec!["".to_owned()];
    }
}