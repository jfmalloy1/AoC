passes = readlines("05_input.txt")

front = 'F'
left = 'L'

row_num = -1
seat_num = -1
seat_ID = 0
max_seat_ID = 0

seatIDs = Vector{Int}()

for seat in passes
    let min_row = 0, max_row = 128
        #Find min and max rows
        for r in seat[1:6]
            if r == front
                max_row -= (max_row-min_row) / 2
            else
                min_row += (max_row-min_row) / 2
            end
        end
        #7th character - top or bottom row
        #First subtract 1 from max_row, to match lower bound of problem
        max_row -= 1
        if seat[7] == front
            row_num = min_row
        else
            row_num = max_row
        end
        #Seat ID calculation
        global seat_ID = row_num*8
    end
    let min_seat = 0, max_seat = 8
        for s in seat[8:9]
            if s == left
                max_seat -= (max_seat-min_seat) / 2
            else
                min_seat += (max_seat-min_seat) / 2
            end
        end
        #10th character - left or right seat, also subtracting 1 from max_seat
        max_seat -= 1
        if seat[10] == left
            seat_num = min_seat
        else
            seat_num = max_seat
        end
        #Seat ID calculation
        global seat_ID += seat_num
    end
    #Problem 2: Add seats to an array for later checking
    append!(seatIDs, seat_ID)
    #Problem 1: Find max seat ID
    if seat_ID > max_seat_ID
        global max_seat_ID = seat_ID
    end
end

#Problem 1
println("Max seat ID: ", max_seat_ID)

#Problem 2
sort!(seatIDs)
for i in eachindex(seatIDs)
    next_seat = seatIDs[i] + 1
    if next_seat != seatIDs[i+1]
        println(next_seat)
        break
    end
end
