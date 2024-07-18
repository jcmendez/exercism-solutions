#[derive(Debug)]
pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}


type Dice = [u8; 5];

/// Count the number of each die value
fn count(dice: Dice) -> [u8; 6] {
    let mut counts: [u8; 6] = [0; 6];
    for &d in dice.iter() {
        counts[d as usize - 1] += 1;
    }
    counts
}

/// Calculate the score for a yacht
fn yacht(dice: Dice) -> u8 {
    let c = count(dice);
    if c.contains(&5) { 50 } else { 0 }
}

/// Calculate the score for a big straight
fn big_straight(dice: Dice) -> u8 {
    if count(dice) == [0, 1, 1, 1, 1, 1] { 30 } else { 0 }
}

/// Calculate the score for a little straight
fn little_straight(dice: Dice) -> u8 {
    if count(dice) == [1, 1, 1, 1, 1, 0] { 30 } else { 0 }
}

/// Calculate the score for a four of a kind
fn four_of_akind(dice: Dice) -> u8 {
    let c = count(dice);
    match c.iter().position(|&x| x >= 4) {
        None => 0,
        Some(v) => 4 * (v as u8 + 1),
    }
}

/// Calculate the score for a full house
fn full_house(dice: Dice) -> u8 {
    let c = count(dice);
    if c.contains(&3) && c.contains(&2) {
        dice.iter().map(|&x| x as u8).sum()
    } else {
        0
    }
}

/// Score a roll of dice in a given category.
///
/// # Arguments
///
/// * `dice` - a roll of dice
/// * `category` - a scoring category
///
/// # Returns
///
/// The score of the dice in the given category
pub fn score(dice: Dice, category: Category) -> u8 {
    match category {
        Category::Ones => dice.iter().filter(|&&d| d == 1).map(|&x| x as u8).sum(),
        Category::Twos => dice.iter().filter(|&&d| d == 2).map(|&x| x as u8).sum(),
        Category::Threes => dice.iter().filter(|&&d| d == 3).map(|&x| x as u8).sum(),
        Category::Fours => dice.iter().filter(|&&d| d == 4).map(|&x| x as u8).sum(),
        Category::Fives => dice.iter().filter(|&&d| d == 5).map(|&x| x as u8).sum(),
        Category::Sixes => dice.iter().filter(|&&d| d == 6).map(|&x| x as u8).sum(),
        Category::FullHouse => full_house(dice),
        Category::FourOfAKind => four_of_akind(dice),
        Category::LittleStraight => little_straight(dice),
        Category::BigStraight => big_straight(dice),
        Category::Choice => dice.iter().map(|&x| x as u8).sum(),
        Category::Yacht => yacht(dice),
    }
}

