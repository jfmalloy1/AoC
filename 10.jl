#Sorted list of adaptor values
adaptors = sort([parse(Int, x) for x in readlines("10_input.txt")])

#Problem 1
let jolts = 0, diff1 = 0, diff2 = 0, diff3 = 0 #Initial jolt value, count differences for 1/2/3 jolts
    for a in adaptors
        #Find difference, set adaptor to that value (if it falls within 1-3)
        if a-jolts == 1
            diff1 += 1
            jolts = a
        elseif a-jolts == 2
            diff2 += 1
            jolts = a
        elseif a-jolts == 3
            diff3 += 1
            jolts = a
        end
    end
    #Add one to diff3 & 3 to jolts to account for final jolt bump
    diff3 += 1
    jolts += 3
    println("Num 1-jolt adaptors: ", diff1)
    println("Num 3-jolt adaptors: ", diff3)
    println("P1 Answer: ", diff1*diff3)
end

#Problem 2
function check_valid(adaptors, jolts, i, depth)
    #Base cases
    if i == length(adaptors) #End of array
        println("End of line check ", depth)
        return depth
    end
    if adaptors[i] - jolts > 3 #No further adaptors
        println("No further adaptors check ", depth)
        return depth
    end

    #Recursive step - if the next adaptor is 1,2,or 3 away, go deeper & add to count
    let count = 0
        if adaptors[i] - jolts == 1
            println("1 differences")
            jolts = adaptors[i]
            count += check_valid(adaptors, jolts, i+1, depth+1)
        end
        depth = i
        if adaptors[i] - jolts == 2
            println("2 differences")
            jolts = adaptors[i]
            count += check_valid(adaptors, jolts, i+1, depth+1)
        end
        depth = i
        if adaptors[i] - jolts == 3
            println("3 differences")
            jolts = adaptors[i]
            count += check_valid(adaptors, jolts, i+1, depth+1)
        end
        return count
    end
end

println("Final count: ", check_valid(adaptors, 0, 1, 0))
