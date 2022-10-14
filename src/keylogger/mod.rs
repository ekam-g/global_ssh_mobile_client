use std::{thread, time};

use device_query::{DeviceQuery, DeviceState};

use crate::ram::PubInfo;

pub fn log() {
    for key_pressed in DeviceState::new().get_keys() {
        PubInfo::get().key_pressed_cache.push(key_pressed.to_string());
    }
    thread::sleep(time::Duration::from_millis(75))
}
