def binary_chop(num, arr)
arr.sort!
first = 0
last = arr.size - 1
middle = (arr.size - 1) / 2

unless num == arr[middle]
  if num > arr[middle]
    first = middle + 1
    middle = (last - first) / 2
  else
    last = middle - 1
    middle = (last - first) / 2
  end
end
middle
end
