{- | Leap Year module for exercism.io Haskell track 
-}
module LeapYear (isLeapYear) where

{- | isLeapYear function
    Returns True if the given year is a leap year, False otherwise.
    A leap year is a year that is evenly divisible by 4, except for years that are evenly divisible by 100.
    The years that are evenly divisible by 100 are leap years only if they are also evenly divisible by 400.
    For example:
    1997 is not a leap year
    1996 is a leap year
    1900 is not a leap year
    2000 is a leap year
-}
isLeapYear :: Integer -> Bool
isLeapYear year = (year `mod` 4 == 0) && (year `mod` 100 /= 0 || year `mod` 400 == 0)
