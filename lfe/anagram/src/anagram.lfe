(defmodule anagram
  (export (find 2)))

; Function to find anagrams, solving the exercism problem for 
; this week using Lisp Flavored Erlang (LFE)
;
; @spec find(string(), [string()]) -> [string()]
; @doc Find anagrams of a word in a list of words
; Returns a list of anagrams of the given word in the list of words
; By definition, we exclude the word itself from the list of anagrams (/= word w)
; and we compare the sorted characters of the word with the sorted characters of the word in the list
; (/= word w) and (== (lists:sort word) (lists:sort w))
; after converting the words to lowercase
; @end
(defun find
  ((word words)
    (let ((word (string:to_lower word)))
      (lists:filter
      (lambda (w)
        (let ((w (string:to_lower w)))
          (and
            (/= word w)
            (== (lists:sort word) (lists:sort w)))))
      words))))

