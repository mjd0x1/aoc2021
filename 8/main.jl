function process()

    s = readlines("data.txt")
    all = []
    words = []
    for x in s
        push!(all, split(strip(split(x, "|")[2]), " "))
    end
    for x in s
        push!(words, split(strip(split(x, "|")[1]), " "))
    end
    ssum = 0
    output = []
    errors = []
    for (i, x) in enumerate(words)
        a = map(t -> join(sort([t...])), all[i])
        w = map(t -> join(sort([t...])), x)
        word_counts = Dict(w .=> 0)
        word_counts[w[length.(w).==2][1]] = 1
        word_counts[w[length.(w).==4][1]] = 4
        word_counts[w[length.(w).==3][1]] = 7
        word_counts[w[length.(w).==7][1]] = 8
        #the elemenet of length 2 is inside the one of length 5 = 3
        sixes = w[length.(w).==6]
        six = sixes[[length(intersect(w[length.(w).==2][1], x)) != 2 for x in sixes]][1]
        word_counts[six] = 6
        nines = w[length.(w).==6]
        nine = nines[[length(intersect(w[length.(w).==4][1], x)) == 4 && x != six for x in nines]][1]
        word_counts[nine] = 9

        fives = w[length.(w).==5]
        two = fives[[length(intersect(nine, x)) != 5 for x in fives]][1]
        word_counts[two] = 2
        threes = w[length.(w).==5]
        three = threes[[length(intersect(w[length.(w).==2][1], x)) == 2 for x in threes]][1]
        word_counts[three] = 3
        five = setdiff(fives, [two, three])[1]
        word_counts[five] = 5
        d = map(i -> word_counts[i], a)
        ssum += (10 .^ (length(d)-1:-1:0))'d
        push!(output, (10 .^ (length(d)-1:-1:0))'d)

        push!(errors, length(fives[[length(intersect(nine, x)) != 5 for x in fives]]) > 1 ? 1 : 0)
    end
    ssum
end

println(process())