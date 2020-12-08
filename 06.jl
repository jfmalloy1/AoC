#import Pkg; Pkg.add("StatsBase")
using StatsBase

input = read("06_input.txt", String)
#Find each individual passport
groups = split(input, "\n\n")

let p1_sum = 0, p2_sum = 0
    for g in groups
        #Store each answer
        answers = Vector{Char}()
        num_people = 1 #Default number of people is 1
        for a in chomp(g)
            if a != '\n' #store all answers if they are not newline characters
                push!(answers, a)
            else  #(p2)Otherwise, there is \n people in the group
                num_people+=1
            end
        end
        #Problem 2
        occurence_dict = countmap(answers)
        for (k, v) in occurence_dict
            v == num_people && (p2_sum += 1) #Add to sum if a char occurs as many times as the number of people
        end
        #Problem 1
        p1_sum += length(unique(answers)) #(p1)find the number of unique answers
    end
    println("Total questions answered yes: ", p1_sum)
    println("Total questions everyone answered yes: ", p2_sum)
end
