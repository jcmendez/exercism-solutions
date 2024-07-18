pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let len = array.len();
    if len == 0 {
        return None;
    }
    let mut left = 0;
    let mut right = len - 1;
    while left <= right {
        let mid = left + (right - left) / 2;
        if array[mid] == key {
            return Some(mid);
        }
        if array[mid] < key {
            left = mid + 1;
        } else {
            if mid == 0 {
                return None;
            }
            right = mid - 1;
        }
    }
    None
}
