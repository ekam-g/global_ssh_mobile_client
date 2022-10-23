use std::{env, thread, time};
use std::sync::{Mutex, MutexGuard};
use gethostname::gethostname;
use once_cell::sync::Lazy;

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
    let mut uses = 0;
    let mut host_db_name = format!("{}:{:?}:{}", env::consts::OS, gethostname(), uses);
    loop {
        if let Ok(yes_or_no) = crate::db::redis::exists(&host_db_name) {
            if !yes_or_no { break; } else {
                uses += 1;
                host_db_name = format!("{}:{:?}:{}", env::consts::OS, gethostname(), uses);
            }
        }
        thread::sleep(time::Duration::from_millis(10))
    }
    Constant {
        who: host_db_name,
    }
});
