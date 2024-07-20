
/// Generates a secret handshake sequence based on the given number.
///
/// - Parameter number: The number used to generate the secret handshake sequence.
/// - Returns: An array of strings representing the secret handshake sequence.
/// - Note: The number is a binary representation of the secret handshake sequence.
///         The least significant bit is a wink, the second bit is a double blink,
///         the third bit is a close your eyes, and the fourth is a jump.
///         The fifth bit is a reverse the order of the operations in the secret handshake.
/// This is a solution to the "Secret Handshake" exercise on Exercism for the swift track.
func commands(number: Int) -> [String] {
  guard number > 0 else { return [] }
  if number & 0b10000 != 0 {
    return commands(number: Int(number & 0b01111)).reversed()
  } else if number & 0b01000 != 0 {
    return  commands(number: Int(number & 0b00111)) + ["jump"]
  } else if number & 0b00100 != 0 {
    return  commands(number: Int(number & 0b00011)) + ["close your eyes"]
  } else if number & 0b00010 != 0 {
    return commands(number: Int(number & 0b00001)) + ["double blink"] 
  } else if number & 0b00001 != 0 {
    return ["wink"]
  } else {
    return []
  }
}
