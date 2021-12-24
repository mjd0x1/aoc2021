function process()

    s = readlines("data.txt")
    (x1, x2) = (34, 67)
    (y1, y2) = (-215, -186)


    [sum(y1 .<= g.(x, 1:1000) .<= y2) > 0 ? x : 0 for x = 1:1000]
    g.(214, 1:1000) |> maximum

    [sum(x1 .<= g.(x, 1:1000) .<= x2) > 0 for x in s[s.!=0]]
end

gx(alpha, t) = t <= alpha ? alpha * t - t * (t - 1) / 2 : alpha * (alpha + 1) / 2
gy(alpha, t) = alpha * t - t * (t - 1) / 2

[sum((x1 .<= gx.(x, 1:1000) .<= x2) + (y1 .<= gy.(y, 1:1000) .<= y2) .> 1) > 0 for x = 1:200, y = -500:500] |> sum

println(process())