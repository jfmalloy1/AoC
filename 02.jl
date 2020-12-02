#Read in input
input = readlines("02_input.txt")
valid = 0

for i in input
    #Split each line into description (#-# char) and password (string)
    desc, password = split(i, ": ")
    #Further split description into numbers (#-#) and letter (char)
    nums, letter = split(desc)
    #Further split numbers into lower bound and upper bound
    lb, ub = split(nums, "-")

    #Convert lower & upper bounds into ints
    lb = parse(Int64, lb)
    ub = parse(Int64, ub)

    #Convert letter to a char - make the single character a char vector, then take the 1st (and only) element
    letter = Vector{Char}(letter)[1]

    # ##PART 1
    # #Find the number of occurances of letter in password
    # letter_count = count(i->(i==letter), password)
    # #println(letter, " occurs ", letter_count, " times in ", password)
    #
    # if letter_count >= lb && letter_count <= ub
    #     println("Password is satisfied: ", password)
    #     global valid += 1 #required global, since I'm not working in a Jupyter notebook? Scopes in Julia are weird @Doug
    # end

    ## PART 2
    flag = 0 #Flag to ensure only one placement is correct
    #Check first occurance
    if password[lb] == letter
        flag += 1
    end
    #Check second occurance
    if password[ub] == letter
        flag += 1
    end
    #If only one placement is corrent, add one to valid
    if flag == 1
        global valid += 1
    end
end

println("Total number of valid passwords: ", valid)
