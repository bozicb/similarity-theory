require 'Daru'
require './knn.rb'

athletes = Daru::DataFrame.new(
  {
    :Speed => [2.5,3.75,2.25,3.25,2.75,4.5,3.5,3.0,4.0,4.25,2.0,5.0,8.25,5.75,4.75,5.5,5.25,7.0,7.5,7.25],
    :Agility => [6.0,8.0,5.5,8.25,7.5,5.0,5.25,3.25,4.0,3.75,2.0,2.5,8.5,8.75,6.25,6.75,9.5,4.25,8.0,5.75],
    :Draft => [false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true]
  },
  index: (1..20).to_a
)

prediction = knn(athletes,3,[6.75,3])
puts "Prediction: #{prediction}"

