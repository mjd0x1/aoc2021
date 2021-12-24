function process2()

    p1 = []
    p2 = []
    rolls = []
    prev = 4
    for i in mod1.(1:6:10000, 100)
        push!(p1, mod1(sum(i:i+2) + prev, 10))
        push!(rolls, string([i:i+2...]))
        prev += sum(i:i+2)
    end
    prev = 8
    for i in mod1.(4:6:10000, 100)
        push!(p2, mod1(sum(i:i+2) + prev, 10))
        prev += sum(i:i+2)
    end

    player1 = cumsum(p1)
    player2 = cumsum(p2)

    id1 = findfirst(x -> x >= 1000, player1)
    id2 = findfirst(x -> x >= 1000, player2)

    id = min(id1, id2)
    player2[id-1], ((id - 1) * 6) + 3

end


println(process())
