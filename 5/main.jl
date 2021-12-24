function process()

    s = readlines("data.txt")
    matrix = zeros(10, 10)
    for x in s[1:2]
        x1, y1 = parse.(Int, split(split(x, "->")[1], ","))
        x2, y2 = parse.(Int, split(split(x, "->")[2], ","))
        if abs(x1 - x2) == abs(y1 - y2)
            for i = 0:abs(x1 - x2)
                matrix[min(x1, x2)+1+i:min(x1, x2)+1+i, min(y1, y2)+1+i:min(y1, y2)+1+i] .+= 1
            end
        end
        if !(abs(x1 - x2) == abs(y1 - y2)) && (x1 == x2 || y1 == y2)
            if x1 == x2
                matrix[x1+1, min(y1, y2)+1:max(y1, y2)+1] .+= 1
            else
                matrix[min(x1, x2)+1:max(x1, x2)+1, y1+1] .+= 1
            end
        end

    end
    matrix
end

println(process())