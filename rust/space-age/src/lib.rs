#[derive(Debug)]
pub struct Duration {
    seconds: u64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self { seconds: s }
    }
}

pub trait Planet {
    const ORBITAL_PERIOD: f64;
    fn years_during(d: &Duration) -> f64 {
        d.seconds as f64 / 31_557_600.0 / Self::ORBITAL_PERIOD
    }
}

macro_rules! define_planet {
    ($planet:ident, $orbital_period:expr) => {
        // Define the struct $planet
        pub struct $planet;
        // Implement the method directly on the struct
        impl Planet for $planet {
            const ORBITAL_PERIOD: f64 = $orbital_period;
        }
    };
}

define_planet! { Mercury, 0.2408467 }
define_planet! { Venus, 0.61519726 }
define_planet! { Earth, 1.0 }
define_planet! { Mars, 1.8808158 }
define_planet! { Jupiter, 11.862615 }
define_planet! { Saturn, 29.447498 }
define_planet! { Uranus, 84.016846 }
define_planet! { Neptune, 164.79132 }
