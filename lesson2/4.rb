# frozen_string_literal: true

letters = ('a'..'z').to_a
vowels = %w[a e i o u y]

h = {}
vowels.each do |letter|
  h[letter] = letters.index(letter) + 1
end

puts h
