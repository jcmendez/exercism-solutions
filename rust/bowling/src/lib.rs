
#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    NotEnoughPinsLeft,
    GameComplete,
}

// Struct to represent a frame in a bowling game
pub enum Frame {
    Open(u16, u16), // Two rolls, each element is the number of pins
    Spare(u16, u16, bool), // Spare, each element is the number of pins, bool is true if this is the last frame
    Strike(bool) // Strike, bool is true if this is the last frame
}

impl Frame {
    // Create a new frame based on the rolls and whether this is the last frame
    pub fn new(roll1: u16, roll2: u16, is_last_frame: bool) -> Self {
        if roll1 == 10 {
            Frame::Strike(is_last_frame)
        } else if roll1 + roll2 == 10 {
            Frame::Spare(roll1, roll2, is_last_frame)
        } else {
            Frame::Open(roll1, roll2)
        }
    }
}

// Struct to represent a bowling game
pub struct BowlingGame {
    is_complete: bool, // True if the game is complete
    frame_complete: bool, // True if the current frame is complete
    rolls: Vec<u16>, // Vector of rolls
    frames: Vec<Frame>, // Vector of frames
    bonus_rolls_left: u16, // Number of bonus rolls left
    bonus_rolls: Vec<u16>, // Vector of bonus rolls
}

impl BowlingGame {
    pub fn new() -> Self {
        BowlingGame {
            is_complete: false,
            frame_complete: false,
            rolls: Vec::new(),
            frames: Vec::new(),
            bonus_rolls_left: 0,
            bonus_rolls: Vec::new(),
        }
    }

    // Private function to push a frame into the game
    fn push_frame(&mut self, frame: Frame) {
        self.frame_complete = true;
        self.frames.push(frame);
        if self.frames.len() == 10 {
            match self.frames.last().unwrap() {
                Frame::Open(_,_) => { self.is_complete = true; }
                Frame::Spare(_,_,_) => { self.bonus_rolls_left = 1; }
                Frame::Strike(_) => { self.bonus_rolls_left = 2; }
            }
        }
    }

    // Private function to record a bonus roll
    fn bonus_roll(&mut self, pins: u16) -> Result<(), Error> {
        self.bonus_rolls.push(pins);
        self.bonus_rolls_left -= 1;
        if self.bonus_rolls_left == 0 {
            self.is_complete = true;
        }
        let num_rolls = self.bonus_rolls.len();
        let sum_points: u16 = self.bonus_rolls.iter().sum();
        if num_rolls == 1 && sum_points > 10 {
            Err(Error::NotEnoughPinsLeft)
        } else if num_rolls == 2 && sum_points > 10 {
            if self.bonus_rolls[0usize] == 10 {
                self.rolls.push(pins);
                Ok(())
            } else {
                Err(Error::NotEnoughPinsLeft)
            }
        } else {
            self.rolls.push(pins);
            Ok(())
        }
    }

    // Private function to record a regular roll
    fn regular_roll(&mut self, pins: u16) -> Result<(), Error> {
        if self.rolls.is_empty() {
            if pins == 10 {
                self.push_frame(Frame::Strike(false));
            }
            self.rolls.push(pins);
            return Ok(());
        }


        let num_frames = self.frames.len();
        let is_last_frame = num_frames == 9;

        if self.frame_complete {
            if pins == 10 {
                self.push_frame(Frame::Strike(is_last_frame));
            } else {
                self.frame_complete = false;
            }
            self.rolls.push(pins);
        } else {
            let last_roll = self.rolls.last().unwrap();
            if *last_roll + pins > 10 {
               return Err(Error::NotEnoughPinsLeft);
            }
            self.push_frame(Frame::new(*last_roll, pins, is_last_frame));
            self.rolls.push(pins);
        }
        Ok(())
    }

    // Record a roll in the game
    pub fn roll(&mut self, pins: u16) -> Result<(), Error> {
        if pins > 10 {
            Err(Error::NotEnoughPinsLeft)
        } else if self.is_complete {
            Err(Error::GameComplete)
        } else if self.bonus_rolls_left > 0 {
            self.bonus_roll(pins)
        } else {
            self.regular_roll(pins)
        }
    }

    // Private function to calculate the score of a given frame
    fn frame_score(&self, frame: &Frame, frame_index: usize, roll_index: usize) -> u16 {
        match frame {
            Frame::Open(roll1, roll2) => {
                roll1 + roll2
            }
            Frame::Spare(_,_, is_last_frame) => {
                if *is_last_frame {
                    return 10 + self.bonus_rolls[0];
                } else {
                    let next_frame = &self.frames[frame_index + 1];
                    match next_frame {
                        Frame::Open(roll1, _) => {
                            10 + roll1
                        }
                        Frame::Spare(roll1, _, _) => {
                            10 + roll1
                        }
                        Frame::Strike(_) => {
                            20
                        }
                    }
                }
            }
            Frame::Strike(is_last_frame) => {
                if *is_last_frame {
                    return 10 + self.bonus_rolls[0] + self.bonus_rolls[1];
                } else {
                    let next_frame = &self.frames[frame_index + 1];
                    match next_frame {
                        Frame::Open(roll1, roll2) => {
                            10 + roll1 + roll2
                        }
                        Frame::Spare(_, _, _) => {
                            20
                        }
                        Frame::Strike(_) => {
                            let next_roll = &self.rolls[roll_index + 1];
                            let next_next_roll = &self.rolls[roll_index + 2];
                            10 + next_roll + next_next_roll
                        }
                    }
                }
            }
        }
    }

    // Calculate the score of the game
    pub fn score(&self) -> Option<u16> {
        match self.is_complete {
            true => {
                let mut score = 0;
                let mut roll_index: usize = 0;
                for (i, frame) in self.frames.iter().enumerate() {
                    score += self.frame_score(frame, i, roll_index);
                    roll_index += match frame {
                        Frame::Open(_,_) => 2,
                        Frame::Spare(_,_,_) => 2,
                        Frame::Strike(_) => 1,
                    };
                }
                Some(score)
            }
            false => {
                None
            }
        }
    }
}
