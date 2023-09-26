// https://www.acmicpc.net/problem/10869

let arr = readLine()!.split(separator: " ").map( {Int($0)!} )
print(arr[0] + arr[1])
print(arr[0] - arr[1])
print(arr[0] * arr[1])
print(arr[0] / arr[1])
print(arr[0] % arr[1])
