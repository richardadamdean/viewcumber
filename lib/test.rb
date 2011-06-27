

  features = Dir.glob("/Users/richard/viewcumber/features/**/*.feature")
  features.each {|file| file.sub! "/Users/richard/viewcumber/features/", ''}


  a = features.inject({}) do |acc, feature_path|
    tree = acc
    feature_path.split('/').each do |n|
      tree[n] ||= {} 
      tree = tree[n]
    end
   acc
  end
  p a

