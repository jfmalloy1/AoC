input = readlines("07_input.txt")

rule_dict = Dict() #Dictionary for each bag

#Set up dictionary
for rule in input
    #Find big bag, and all small bags
    bbag, sbags = split(rule, " contain ")
    #If a bag holds other bags, create a list of all smaller bags (of type Dict, referencing the number of each they can hold)
    if sbags != "no other bags."
        sub_bag_list = Vector{Dict{String, Int}}()
        sub_bags = (split(sbags[1:end-1], ", "))
        for b in sub_bags
            #Remove "bag/bags" from dictionary
            push!(sub_bag_list, Dict(b[findfirst(" ", b)[1]+1:findlast(" ", b)[1]-1] => parse(Int, b[1:findfirst(" ", b)[1]])))
        end
        #set list of dicts to the larger dict structure
        rule_dict[bbag[1:findlast(" ", bbag)[1]-1]] = sub_bag_list
    end
    #NOTE: Any bag with no other bags inside it is not present

end

function search_bags(rule_dict, goal)
    goal_bags = Vector{String}() #All bags that hold the goal bag
    for (bbag, sbags) in rule_dict #Iterate through full data structure
        for sbag in sbags
            for (bag, num) in sbag
                occursin(goal, bag) && (push!(goal_bags, bbag)) #If the bag contains the goal, add it to the goal bags vector
            end
        end
    end
    return goal_bags
end


#Part 1
#Find all bags holding a shiny gold bag directly
all_holders = search_bags(rule_dict, "shiny gold")

#Find all bags holding a shiny gold bag direct holders via iteration
# all_holders = shiny_holders
let flag = 1
    while flag == 1
        start_size = length(unique(all_holders))
        for bag in all_holders
            append!(all_holders, search_bags(rule_dict, bag[1:end-1]))
        end
        length(unique(all_holders)) == start_size && (flag = 0)
    end
end
println("There are ", length(unique(all_holders)), " possible bags")

#Part 2 Attempt (I'll come back, maybe)
# function count_bags(rule_dict, bag)
#     if bag ∉ keys(rule_dict)
#         return []
#     end
#     for inner_bag in rule_dict[bag]
#         println(inner_bag)
#     end
# end
#
# count_bags(rule_dict, "dull gold")
#
# # let flag = 1
# #     while flag == 1
# #         for ib in inner_bags
# #             for
# #     end
# # end
