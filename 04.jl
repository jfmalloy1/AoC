input = read("04_input.txt", String)
#Find each individual passport
passports = split(input, "\n\n")

#turn all newline characters into spaces
let flag = 0, count = 0
    for p in passports
        #Remove any trailing newlines
        p = chomp(p)
        #Necessary fields
        fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

        p = replace(p, "\n" => " ")
        #split on space then colon
        for field_data in split(p, " ")
            field, data = split(field_data, ":")

            #Validate all fields (bleh) - if field is validated, remove field from fields array
            if field == "byr"
                if 1920 <= parse(Int, data) <= 2002
                    filter!(e->e!=field, fields)
                end
            end
            if field == "iyr"
                if 2010 <= parse(Int, data) <= 2020
                    filter!(e->e!=field, fields)
                end
            end
            if field == "eyr"
                if 2020 <= parse(Int, data) <= 2030
                    filter!(e->e!=field, fields)
                end
            end
            if field == "hgt"
                #Find in/cm, filter accordingly
                if (occursin("cm", data)) && (150 <= parse(Int,data[1:end-2]) <= 193)
                    filter!(e->e!=field, fields)
                end
                if (occursin("in", data)) && (59 <= parse(Int,data[1:end-2]) <= 76)
                    filter!(e->e!=field, fields)
                end
            end
            if field == "hcl"
                #Satisfy '#' and length constraints
                if data[1] == '#' && length(data[2:end]) == 6
                    #Satisfy re constraints
                    regex_constraint = r"^[0-9a-f]*$"
                    if match(regex_constraint, data[2:end]) != nothing
                        filter!(e->e!=field, fields)
                    end
                end
            end
            if field == "ecl"
                if data in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
                    filter!(e->e!=field, fields)
                end
            end
            if field == "pid"
                if length(data) == 9 && match(r"^[0-9]*$",data) != nothing
                    filter!(e->e!=field, fields)
                end
            end
        end
        #Problem 1
        if length(fields) == 0
            count += 1
        end
    end
    println("Valid passports = ", count)
end
