cumu = n cache -> {
    for l in (cache len)..(n + 1) {
        r = [0]
        for x in 1..(l + 1) {
            item = cache.(l - x).(min x (l - x))
            r = r |> push (last r + item)
        }
        cache = cache |> push r
    }
    cache
}

row = n cache -> {
    cache = fn n cache
    r = cache.n
    i: [Nat] = 0..n 
        |> map { i -> r.(i + 1) - r.i }
        |> collect
    (i, cache)
}

cache = [[1]]

println "rows:"
for x in 1..11 {
    (i, cache) = row x cache
    println "{ x }: { i }"
}
