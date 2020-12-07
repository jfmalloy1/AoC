input = readlines("03_input.txt")

#Find number of rows/columns
ylen = size(input)[1]
xlen = length(input[1])

#tobaggan function
function tobaggan(x_move, y_move)
    #Starting coordinates
    let x = 1, y = 1, count = 0
        while y < ylen
            #Add x movement
            x += x_move
            #If x goes off the "edge", reset
            if x > xlen
                x = x - xlen
            end
            #Add y movement
            y += y_move
            #Tree?
            if input[y][x] == '#'
                count += 1
            end
        end
        return count
    end
end

println("There are: ", tobaggan(1,1)*tobaggan(3,1)*tobaggan(5,1)*tobaggan(7,1)*tobaggan(1,2), " trees")
