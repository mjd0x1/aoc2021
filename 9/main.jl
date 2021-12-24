function process()

    s = readlines("data.txt")
    numbers = [parse.(Int, split(x, "")) for x in s]
    m = hcat(numbers...)'
    top = fill(9, size(m)[2])
    side = fill(9, size(m)[1] + 2)
    buffered = [top'
        m
        top']
    z = [side buffered side]

    pts = []
    coords = []
    for x = 2:size(z)[1]-1
        for y = 2:size(z)[2]-1
            if z[x, y] < min(z[x-1, y], z[x+1, y], z[x, y+1], z[x, y-1])
                push!(pts, z[x, y])
                push!(coords, (x, y))
            end
        end
    end
    for x in pts

    end
end

println(process())