main_word = 'mahru'
similar = {
  a: 'e',
  u: 'n',
  m: 'w',
  n: 'u'
}
letters = []

main_word.split('').each_with_index do |letter, index_letter|
  similiar_keys = similar.keys.map(&:to_s)
  next unless similiar_keys.include? letter

  letters << {
    index: index_letter,
    letter_key: letter,
    letter_mask: similar[letter.to_sym]
  }
end

data = []
possibilities = [true, false].repeated_permutation(letters.size).to_a

possibilities.each do |possibility|
  new_word = main_word.dup
  possibility.zip(letters).each do |is_mask, letter|
    new_word[letter[:index]] = letter[:letter_mask] if is_mask
  end
  data << new_word
end

# puts $letters
puts data
puts data.size

# [].repeated_permutation
# [].repeated_combination
