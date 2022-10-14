use std::sync::Mutex;
use once_cell::sync::Lazy;

pub struct SafeGlobalVar {
    pub key_pressed_cashe: Vec<String>,
}

pub static SAFE_PUB_VAR: Lazy<Mutex<SafeGlobalVar>> = Lazy::new(|| {
    Mutex::new(SafeGlobalVar {
        key_pressed_cashe: "".to_ownd(),
    })
});