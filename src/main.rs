use std::{thread, time};

use device_query::{DeviceQuery, DeviceState, Keycode};

use crate::ram::SAFE_PUB_VAR;

mod ram;

fn main() {
    loop {
        let device_state = DeviceState::new();
        let keys: Vec<Keycode> = device_state.get_keys();
        for key_pressed in keys {
            SAFE_PUB_VAR.lock().expect("todo").key_pressed_cache.push(key_pressed.to_string());
            if key_pressed.to_string().contains('Q') {
                SAFE_PUB_VAR.lock().expect("todo").key_pressed_cache = vec!["".to_string()];
            }
            for cache in SAFE_PUB_VAR.lock().expect("todo").key_pressed_cache.clone() {
                println!("Is pressed {}", cache);
            }
        }
        thread::sleep(time::Duration::from_millis(10))
    }
}
// Rochac
