let anagrams = (word:string, words: list(string)): list(string) => {
    let sortString = (s: string): string => {
        s
        |> String.lowercase_ascii
        |> String.to_seq
        |> List.of_seq
        |> List.sort(Char.compare)
        |> List.to_seq
        |> String.of_seq;
    };
    // Take the word, lowercase it, convert it to a list, sort it
    let sortedWord = sortString(word);
    let sortedWords = List.map((w) => { sortString(w) }, words);
    List.filter((w) => {
        w == sortedWord;
    }, sortedWords);
};
