# @param [Array] arr
def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word }
end

# @param [Array] array
def no_valid_url?(array)
  allowed_domain = %w[com net io org]
  array.none? do |site|
    website = site.split('.')
    allowed_domain.include?(website[1])
  end
end

# @param [Array] students
def any_passing_students?(students)
  students.any? do |student|
    student[:grades].inject { |total, ele| total + ele }.to_f / student[:grades].size > 75
  end
end
