let expectedMinutesInOven = 40

/// 
/// - Parameter elapsedMinutes: the number of minutes the lasagna has been in the oven 
/// - Returns: the number of minutes remaining based on the expected bake time
func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}

/// 
/// - Parameter layers: the number of layers in the lasagna
/// - Returns: the total preparation time in minutes
func preparationTimeInMinutes(layers: Int) -> Int {
    return layers * 2
}

/// 
/// - Parameters:
///   - layers: the number of layers in the lasagna
///   - elapsedMinutes: the number of minutes the lasagna has been in the oven
/// - Returns: the total time in minutes to prepare and bake the lasagna
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    return preparationTimeInMinutes(layers: layers) + remainingMinutesInOven(elapsedMinutes: elapsedMinutes)
}
