{-# LANGUAGE BinaryLiterals #-}

{- | Secret Handshake module for the exercism.io Haskell Track
-}

module SecretHandshake (handshake) where

import Data.Bits ( Bits((.&.)) )

{- | handshake function returns a list of strings based on the secret handshake rules.

    The task is to convert a number to a list of strings based on the following rules:
    1. The least significant bit is a wink
    2. The second least significant bit is a double blink
    3. The third least significant bit is a close your eyes
    4. The fourth least significant bit is a jump
    5. The fifth least significant bit is a reverse the order of the operations in the secret handshake.

    We solved this task by recursively calling the handshake function with the next relevant bits
    until we reach the end of the bits. We then reverse the list if the fifth bit is set, which is
    possible because it is the first match we check for.
-}
handshake :: Int -> [String]
handshake n 
    | relevantBits >= 0b10000 = reverse (handshake ((.&.) relevantBits 0b01111))
    | relevantBits >= 0b01000 = handshake ((.&.) relevantBits 0b00111) ++ ["jump"]
    | relevantBits >= 0b00100 = handshake ((.&.) relevantBits 0b00011) ++ ["close your eyes"]
    | relevantBits >= 0b00010 = handshake ((.&.) relevantBits 0b00001) ++ ["double blink"]
    | relevantBits == 0b00001 = ["wink"]
    | otherwise = []
    where relevantBits = (.&.) n 0b11111