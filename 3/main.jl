
get_col_sum(col, a) = map(x -> x[col], a) |> sum

function process()

    s = readlines("data.txt")
    a = map(x -> parse.(Int, split(x, "")), s)
    get_col_sum(1, a)

end

println(process())