
function process()

    s = readlines("data.txt")

    names = map(x -> split(x, " ")[1], s)
    ids = map(x -> parse(Int, split(x, " ")[2]), s)
    aim = 0
    horiz_posn = 0
    depth = 0
    for x = 1:length(names)
        if names[x] == "down"
            aim += ids[x]
        end
        if names[x] == "up"
            aim -= ids[x]
        end
        if names[x] == "forward"
            horiz_posn += ids[x]
            depth += aim * ids[x]
        end

    end
    horiz_posn * depth
end

println(process())