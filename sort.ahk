swap(array, i, j) {
    temp := array[i]
    array[i] := array[j]
    array[j] := temp
  }
  
  partition(array, left, right, order) {
    pivotIdx := right
    pivotValue := array[right]
    right--

    while (left <= right) {
      if (order = "A") {
        while (array[left] <= pivotValue && left < pivotIdx) {
          left++
        }
        while (right > 0 and array[right] > pivotValue) {
          right--
        }
      } else {
        while (array[left] >= pivotValue && left < pivotIdx) {
          left++
        }
        while (right > 0 and array[right] < pivotValue) {
          right--
        }
      }
      if (left <= right) {
        swap(array, left, right)
      }
    }
    swap(array, pivotIdx, left)
    return left
  }
  
  quicksort_internal(array, left, right, order) {
    if left >= right 
      return
    pivotIndex := partition(array, left, right, order)
    quicksort_internal(array, left, pivotIndex - 1, order)
    quicksort_internal(array, pivotIndex + 1, right, order)
  }
  
  quicksort(array, order) {
    quicksort_internal(array, 1, array.Length, order)
  }
