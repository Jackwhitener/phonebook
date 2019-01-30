def uuid
    arr = ['0','1','2','3','4','5','6','7','8','9']
    id = String.new
    16.times do
        id += arr.sample
    end
    return id.to_i
end