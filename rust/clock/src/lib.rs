use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        // I believe problem statement should have been more clear about the input range
        // but tests show they would accept negative hours and minutes
        // assert!(hours >= 0 && hours < 24, "Hours must be between 0 and 23");
        // assert!(minutes >= 0 && minutes < 60, "Minutes must be between 0 and 59");
        let minutes = (hours * 60 + minutes).rem_euclid(24 * 60);
        Clock { minutes }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        // Here again, minutes can be negative so we need to wrap around
        Clock { minutes: (self.minutes + minutes).rem_euclid(24*60) }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let hours = (self.minutes / 60) % 24;
        let minutes = self.minutes % 60;
        write!(f, "{:02}:{:02}", hours, minutes)
    }
}
