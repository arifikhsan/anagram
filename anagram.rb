# class Anagram
  $kata = 'mahru'
  $similar = {
    a: 'e',
    u: 'n',
    m: 'w',
    n: 'u'
  }
  $generated_words = []
  $generated_words << $kata
  $generated_letters = []
  $current_index = 0
  
  def make_word(_kata)
    similar_keys = $similar.keys.map(&:to_s)
    _kata.split('').each_with_index do |huruf, index|
      if similar_keys.include? huruf # && !$generated_letters.include?(huruf)
        if index > $current_index || $current_index == 0
          kata_baru = $kata.dup
          kata_baru[index] = $similar[huruf.to_sym]
          # p [index, huruf]
          p kata_baru
          # p [kata_baru, huruf]
          $generated_words << kata_baru
          $current_index = index
          $generated_letters << huruf
          # p $kata
          make_word(kata_baru)
        end
      end
      # p $generated_letters
      p $current_index
    end
  end
  
  make_word($kata)
  p $generated_words

  # def self.make_word(index, key, kata, similar)
  #   kata[index] = similar[key.to_sym]
  #   p kata
  # end

  # similar_keys = similar.keys.map(&:to_s)
  # kata.split('').each_with_index do |huruf, i|
  #   make_word i, huruf, kata, similar if similar_keys.include? huruf
  # end
# end
