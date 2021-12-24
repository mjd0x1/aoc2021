

function check_for_winner(matrices, winners)

    won = []
    for (i, m) in enumerate(matrices)
        if i ∉ winners
            rows = [m[x, :] == [-1, -1, -1, -1, -1] for x = 1:5]
            cols = [m[:, x] == [-1, -1, -1, -1, -1] for x = 1:5]
            if sum(rows) > 0 || sum(cols) > 0
                push!(won, i)
            end
        end
    end
    won
end

function update_boards(x, matrices)
    for m in matrices
        m[m.==x] .= -1
    end
end

function process()

    s = readlines("data.txt")
    numbers = parse.(Int, split(s[1], ","))
    matrices = []
    for i = 0:div(length(s) - 2, 6)
        push!(matrices, hcat([parse.(Int, split("x" * " " * s[3+i*6:7+i*6][x], r"\s+")[2:end]) for x = 1:5]...)')
    end

    winner_count = []
    for x in numbers
        update_boards(x, matrices)
        n = check_for_winner(matrices, winner_count)
        if n != []
            winner_count = [winner_count..., n...]
            if length(winner_count) == length(matrices)
                matrices[last(n)][matrices[last(n)].==-1] .= 0
                return x * sum(matrices[last(n)])
            end
        end
    end
end

println(process())