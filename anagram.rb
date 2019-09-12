class Anagram
  kata = 'mahru'
  similar = {
    a: 'e',
    u: 'n',
    m: 'w',
    n: 'u'
  }

  def self.make_word(i, key, kata, similar)
    kata[i] = similar[key.to_sym]
    p kata
  end

  similar_keys = similar.keys.map(&:to_s)
  kata.split('').each_with_index do |huruf, i|
    make_word i, huruf, kata, similar if similar_keys.include? huruf
  end
end
