pub mod clear_cache;

use std::sync::{Mutex, MutexGuard};
use once_cell::sync::Lazy;

pub struct PubInfo {
    pub key_pressed_cache: Vec<String>,
}

pub static SAFE_PUB_VAR: Lazy<Mutex<PubInfo>> = Lazy::new(|| {
    Mutex::new(PubInfo {
        key_pressed_cache: vec![],
    })
});

impl PubInfo {
    pub(crate) fn get() -> MutexGuard<'static, PubInfo> {
        loop {
            if let Ok(return_val) = SAFE_PUB_VAR.lock(){
                return return_val;
            }
        }
    }
}
