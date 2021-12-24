function process()
    f = 928
    s = readlines("data.txt")
    data = s[1:f]
    folds = s[f+2:end]
    ids = map(x -> parse(Int, split(x[3], "=")[2]) + 1, split.(folds, " "))
    dims = map(x -> x[3][1], split.(folds, " "))
    coords = map(x -> parse.(Int, x) .+ 1, split.(data, ","))
    mx = maximum(map(x -> x[1], coords))
    my = maximum(map(x -> x[2], coords))
    output = zeros(mx, my)
    map(x -> output[x...] = 1, coords)
    folded_matrix = zeros(1, 1)
    for (i, x) in enumerate(ids)

        if dims[i] == 'x'
            fold_matrix = reverse(output[x+1:end, :], dims = 1)
            orig_matrix = output[1:x-1, :]
            if size(fold_matrix)[1] > size(orig_matrix)[1]
                rows = size(fold_matrix)[1] - size(orig_matrix)[1]
                folded_matrix = orig_matrix .+ fold_matrix[rows+1:end, :]
                folded_matrix = vcat(fold_matrix[1:rows, :], folded_matrix)
            end
            if size(fold_matrix)[1] < size(orig_matrix)[1]
                rows = size(orig_matrix)[1] - size(fold_matrix)[1]
                folded_matrix = orig_matrix[1+rows:end, :] .+ fold_matrix
                folded_matrix = vcat(orig_matrix[1:rows, :], folded_matrix)
            end
            if size(fold_matrix)[1] == size(orig_matrix)[1]
                folded_matrix = orig_matrix .+ fold_matrix
            end

        else
            fold_matrix = reverse(output[:, x+1:end], dims = 2)
            orig_matrix = output[:, 1:x-1]
            if size(fold_matrix)[2] > size(orig_matrix)[2]
                rows = size(fold_matrix)[2] - size(orig_matrix)[2]
                folded_matrix = orig_matrix .+ fold_matrix[:, rows+1:end]
                folded_matrix = hcat(fold_matrix[:, 1:rows], folded_matrix)
            end
            if size(fold_matrix)[2] < size(orig_matrix)[2]
                rows = size(orig_matrix)[2] - size(fold_matrix)[2]
                folded_matrix = orig_matrix[:, 1+rows:end] .+ fold_matrix
                folded_matrix = hcat(orig_matrix[:, 1:rows], folded_matrix)
            end
            if size(fold_matrix)[2] == size(orig_matrix)[2]
                folded_matrix = orig_matrix .+ fold_matrix
            end

        end
        output = copy(folded_matrix)
    end
    output
end

println(process())