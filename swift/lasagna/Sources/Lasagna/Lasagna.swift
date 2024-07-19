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
/// - Returns: the total time in minutes how many minutes in total you've worked on cooking 
///            the lasagna, which is the sum of the preparation time in minutes, and the time 
///            in minutes the lasagna has spent in the oven at the moment.
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    return preparationTimeInMinutes(layers: layers) + elapsedMinutes
}
