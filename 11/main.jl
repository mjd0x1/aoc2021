function process()

    s = readlines("data.txt")
    m = hcat(map(x -> parse.(Int, x), split.(s, ""))...)'
    ssum = 0
    for i = 1:1000
        m .+= 1
        newtens = findall(x -> x .== 1, m .== 10)
        while length(newtens) > 0
            update = CartesianIndex{2}[]
            tens = findall(x -> x .== 1, m .>= 10)
            for i in newtens
                for x = -1:1, y = -1:1
                    test = CartesianIndex(x, y) + i
                    if 1 <= test[1] <= 10 && 1 <= test[2] <= 10
                        push!(update, test)
                    end
                end
            end


            for x in update
                m[x] = m[x] .+ 1
            end

            newtens = setdiff(findall(x -> x .== 1, m .>= 10), tens)

        end
        ssum += sum(m .>= 10)
        m[m.>=10] .= 0
        if sum(m) .== 0
            println(i)
        end
    end
    "finished"
end

println(process())