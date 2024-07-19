/// 
/// - Parameters:
///   - powerUpActive: true if the bird has an active power-up, and false otherwise.
///   - touchingEagle: true if the bird is touching an eagle, and false otherwise.
/// - Returns: true only if the bird has a power-up active and is touching an eagle, and false otherwise.
func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return powerUpActive && touchingEagle
}

/// 
/// - Parameters:
///   - touchingPowerUp: true if the bird is touching a power-up, and false otherwise.
///   - touchingSeed: true if the bird is touching a seed, and false otherwise.
/// - Returns: true if the bird is touching a power-up or a seed, and false otherwise.
func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  return touchingPowerUp || touchingSeed
}

/// 
/// - Parameters:
///   - powerUpActive: true if the bird has an active power-up, and false otherwise.
///   - touchingEagle: true if the bird is touching an eagle, and false otherwise.
/// - Returns: true if the character is touching an eagle and does not have a power-up active, and false otherwise
func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return touchingEagle && !powerUpActive
}

/// 
/// - Parameters:
///   - hasPickedUpAllSeeds: true if the bird has picked up all of the seeds, and false otherwise.
///   - powerUpActive: true if the bird has an active power-up, and false otherwise.
///   - touchingEagle: true if the bird is touching an eagle, and false otherwise.
/// - Returns: true if the bird has gathered all of the seeds and has not lost based on the arguments defined in part 3, and return false otherwise
func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return hasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle)
}
