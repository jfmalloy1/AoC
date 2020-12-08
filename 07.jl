input = readlines("07_input.txt")

rule_dict = Dict()
for rule in input
    #Find big bag, and all small bags
    bbag, sbags = split(rule, " contain ")
    #If a bag holds nothing else, explictly say that
    if sbags == "no other bags."
        rule_dict[bbag] = 0
    end
end

println(rule_dict)
