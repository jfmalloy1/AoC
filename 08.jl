input = readlines("08_input.txt")
l = length(input)

function check_termination(input)
    #Accumulator, while loop flag, i to loop through, array for lines seen
    let accumulator = 0, flag = 1, i = 1, seen = []
        while flag == 1
            #P1: Break out of while loop if the instruction has been seen before
            if i in seen
                #println("Final accumulator: ", accumulator)
                return false
            end

            #Ensure lines are seen
            push!(seen, i)

            #Split line
            op, arg = split(input[i], " ")
            num = parse(Int, arg)

            #Parse instructions
            if op == "acc" #Add to accumulator, move forward 1 line
                accumulator += num
                i += 1
            elseif op == "nop" #Move forward one step
                i += 1
            elseif op == "jmp" #Move backwards/forwards num lines
                i += num
            end

            #Normal terminator
            if i > length(input)
                println("Final (correct) accumulator: ", accumulator)
                flag = 0
            end
            #println(accumulator)
        end
        return true
    end
end

#Change input - keep track of lines changed
changed = []
for i in 1:l
    org, arg = split(input[i], " ")
    if org == "nop" && i ∉ changed
        #Change input text, check termination (break if it returns 1), then change back
        input[i] = "jmp "*arg
        if check_termination(input)
            break
        end
        input[i] = "nop "*arg
        push!(changed, i)
    elseif org == "jmp" && i ∉ changed
        input[i] = "nop "*arg
        if check_termination(input)
            break
        end
        input[i] = "jmp "*arg
        push!(changed, i)
    end
end
#check_termination(input)
