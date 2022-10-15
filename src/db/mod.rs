mod redis;

pub fn send_db(data: &[String]) {
    loop {
        let val = data.join(" ").replace("Space", " ");
        if redis::send(&val).is_ok() {
            println!("{}", val);
            break;
        }
    }
}