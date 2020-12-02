using Combinatorics

#Read in input (in 01_input.txt) as ints
input = readlines("01_input.txt")
input = [parse(Int, x) for x in input]

#Find all combinations
combos = combinations(input, 3) #2 or 3, depending on problem
for c in combos
    if c[1] + c[2] + c[3] == 2020 #If 2 numbers, remove c[3]
        println(c[1] * c[2] * c[3])
    end
end
