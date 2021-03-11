def knn(data_frame, k, query, distance_metric=:euclidian)
  distances = []
  data_frame.each :row do |x|
    distances << euclidian(x.to_a[0...-1], query)
  end
  data_frame[:Distance] = distances
  data_frame.sort!([:Distance])
  return data_frame.first(k)[-2].mode
end

def euclidian(a, b)
  return Math.sqrt([a,b].transpose.map {|x| (x.reduce :-)**2}.sum)
end



