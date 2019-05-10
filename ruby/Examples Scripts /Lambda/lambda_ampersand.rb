def function_for_each(array, &block)
    array.each &block
end

function_for_each [1, 2, 3, 4, 5] { |number| puts number * 10 }
# o que acontece, é que ele vai passar o array, para ele poder interar
