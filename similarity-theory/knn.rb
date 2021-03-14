class KNN
  def self.knn(data_frame, k, query, distance_metric: :euclidean, weighted: false)
    distances = []
    data_frame[0..-2].each_column_with_index do |x,i|
      data_frame[i] = normalise(x)
    end
    data_frame.each :row do |x|
      distances << send(distance_metric, x.to_a[0...-1], query)
    end
    data_frame[:Distance] = distances
    data_frame.sort!([:Distance])
    if weighted
      levels = data_frame[-2].to_a.uniq
      w = levels.zip(Array.new levels.size, 0).to_h
      levels.each do |l|
        data_frame.first(k).each :row do |x|
          l == x[-2] ? w[l] += 1/x[:Distance]**2 : w[l] += 0
        end
      end
      return w.max_by{|k,v| v}[0]
    else
      return data_frame.first(k)[-2].mode
    end
  end

  def self.normalise(a)
    norm = []
    a.each do |x|
      norm << (x - a.min) / (a.max - a.min)
    end
    return norm
  end

  def self.euclidean(a, b)
    return Math.sqrt([a,b].transpose.map {|x| (x.reduce :-)**2}.sum)
  end

  def cosine(a, b)
    return 1
  end
end
