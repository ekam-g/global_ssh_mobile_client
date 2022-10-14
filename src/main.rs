mod ram;

use std::{thread, time};
use device_query::{DeviceQuery, DeviceState, Keycode};

fn main() {
    loop {
        let device_state = DeviceState::new();
        let keys: Vec<Keycode> = device_state.get_keys();
        for key_pressed in keys {
            println!("Is pressed {}"  , key_pressed);
        }
        thread::sleep(time::Duration::from_millis(10))
    }
}
// Rochac