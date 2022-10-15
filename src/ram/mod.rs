use std::sync::{Mutex, MutexGuard};

use gethostname::gethostname;
use once_cell::sync::Lazy;
use rand::Rng;

pub mod clear_cache;

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
            if let Ok(return_val) = SAFE_PUB_VAR.lock() {
                return return_val;
            }
        }
    }
}

pub struct Constant {
    pub who: String,
}

pub static CONST: Lazy<Constant> = Lazy::new(|| {
    Constant {
        who: format!("{:?}:{}", gethostname(), rand::thread_rng().gen_range(0..=1000000)),
    }
});
