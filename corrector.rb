class Corrector
  def correctname(name)
    if name[0] == name[0].upcase
      check_length(name)
    else
      word_arr = name.chars
      first_letter = word_arr[0].upcase
      new_word_array = word_arr.drop(1)
      check_length(new_word_array.unshift(first_letter).join)
    end
  end

  def check_length(string)
    if string.size > 10
      diff = string.size - 10
      # delete just the elements that make word greater than 10
      string.slice!(-diff, diff)
    end
    string
  end
end
