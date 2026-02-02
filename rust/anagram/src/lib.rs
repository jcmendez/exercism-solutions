use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    HashSet::from_iter(possible_anagrams.iter().filter(|&anagram| {
        is_anagram(word, *anagram)
    }).cloned())
}

fn is_anagram(first_word: &str, second_word: &str) -> bool {
    // Words are not anagrams of themselves
    if first_word.to_lowercase() == second_word.to_lowercase() {
        return false;
    }
    let mut vector1 = first_word.to_lowercase().chars().collect::<Vec<char>>();
    let mut vector2 = second_word.to_lowercase().chars().collect::<Vec<char>>();
    vector1.sort();
    vector2.sort();
    vector1 == vector2
}
