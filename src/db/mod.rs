mod redis;

pub fn send_db(data: &[String]) {
    let val = data.join(" ").replace("Space", " ");
    redis::send(&val).expect("TODO: panic message");
    println!("{}", val);
}