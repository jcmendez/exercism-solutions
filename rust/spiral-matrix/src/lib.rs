pub fn spiral_matrix(size: u32) -> Vec<Vec<u32>> {
    let mut current_size = size as usize;
    let mut matrix = vec![vec![0; current_size]; current_size];
    let mut x = 0;
    let mut y = 0;
    let mut val = 1;
    while val <= size * size {
        fill_edges(&mut matrix, &mut x, &mut y, &mut val, current_size);
        current_size = if current_size > 2 { current_size - 2 } else { 0 }; // Decrease size for the next layer
    }
    matrix
}

/// Utility function to fill a cell in the matrix and increment the value
///
/// # Arguments
///   matrix: &mut Vec<Vec<u32>> - The matrix to fill
///   x: usize - The x coordinate of the cell to fill
///   y: usize - The y coordinate of the cell to fill
///   val: &mut u32 - The value to fill the cell with
///
/// # Returns
///   None
fn fill_and_increment(matrix: &mut Vec<Vec<u32>>, x: usize, y: usize, val: &mut u32) {
    matrix[y][x] = *val;
    *val += 1;
}

/// Utility function to fill the edges of the matrix with the correct values
///
/// # Arguments
///   matrix: &mut Vec<Vec<u32>> - The matrix to fill
///   x: &mut usize - The x coordinate of the current cell
///      This will be updated to the x coordinate of the next cell
///   y: &mut usize - The y coordinate of the current cell
///      This will be updated to the y coordinate of the next cell
///   val: &mut u32 - The value to fill the cells with
///   size: usize - The size of the current layer
///
/// # Returns
///   None
fn fill_edges(matrix: &mut Vec<Vec<u32>>, x: &mut usize, y: &mut usize, val: &mut u32, size: usize) {
    if size == 0 { return; }
    fill_top(matrix, x, y, val, size);
    if size > 1 { fill_right(matrix, x, y, val, size-1); }
    if size > 1 { fill_bottom(matrix, x, y, val, size-1); }
    if size > 2 { fill_left(matrix, x, y, val, size-2); }
}

/// Utility function to fill the top edge of the matrix with the correct values
fn fill_top(matrix: &mut Vec<Vec<u32>>, x: &mut usize, y: &mut usize,  val: &mut u32, size: usize) {
    for dx in 0..size { fill_and_increment(matrix, *x + dx , *y , val); }
    *x += size - 1;
    *y += 1;
}

/// Utility function to fill the right edge of the matrix with the correct values
fn fill_right(matrix: &mut Vec<Vec<u32>>, x: &mut usize, y: &mut usize,  val: &mut u32, size: usize) {
    for dy in 0..size { fill_and_increment(matrix, *x , *y + dy, val); }
    *y += size - 1;
    *x -= 1;
}

/// Utility function to fill the bottom edge of the matrix with the correct values
fn fill_bottom(matrix: &mut Vec<Vec<u32>>, x: &mut usize, y: &mut usize,  val: &mut u32, size: usize) {
    for dx in 0..size { fill_and_increment(matrix, *x - dx , *y , val); }
    *x -= size - 1;
    *y -= 1;
}

/// Utility function to fill the left edge of the matrix with the correct values
fn fill_left(matrix: &mut Vec<Vec<u32>>, x: &mut usize, y: &mut usize,  val: &mut u32, size: usize) {
    for dy in 0..size { fill_and_increment(matrix, *x , *y - dy, val); }
    *y -= size - 1;
    *x += 1;
}