function process()

    s = readlines("data.txt")
    numbers = parse.(Int, split(s[1], ","))
    output = [div((abs.(numbers .- x) .+ 1)'abs.(numbers .- x), 2) for x = 1:maximum(numbers)] |> minimum

end

println(process())