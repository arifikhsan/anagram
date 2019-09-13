$main_word = 'mahru'
main_word = $main_word.dup
$similar = {
    a: 'e',
    u: 'n',
    m: 'w',
    n: 'u'
}
$letters = []

main_word.split('').each_with_index do |letter, index_letter|
    similiar_keys = $similar.keys.map(&:to_s)
    if similiar_keys.include? letter
        $letters << {
            index: index_letter, 
            letter_key: letter,
            letter_mask: $similar[letter.to_sym]
        }
    end
end

$data = []
possibilities = [true, false].repeated_permutation($letters.size).to_a

possibilities.each do |possibility|
    new_word = $main_word.dup
    possibility.zip($letters).each do |is_mask, letter|
        if is_mask
            new_word[letter[:index]] = letter[:letter_mask]
            $data << new_word
        end
    end
end

# puts $letters
puts $data
puts $data.size
