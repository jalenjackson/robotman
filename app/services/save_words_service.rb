class SaveWordsService
  require 'rubygems'
  require 'decisiontree'
  require 'csv'

  #info we want to add to

  def are_you_sick?(data)
    attributes = ['Temp']
    sick_training_data = [
        [90, 'With this body temperature you should either be dead or barely alive'],
        [94, 'You have a cold'],
        [98.7, 'You are not sick'],
        [99.1, 'You are not sick'],
        [99.5, 'You have a fever'],
        [100.5, 'You have a fever'],
        [102.5, 'you need to get checked out immediately or you may die.'],
        [107.5, 'At this temperature you would not be here right now'],
    ]

    test = [data.to_i]

    decision_tree(attributes, sick_training_data, test )
  end

  def decision_tree(attributes, training, data)
    dec_tree = DecisionTree::ID3Tree.new(attributes, training, 'sick', :continuous)
    dec_tree.train
    decision = dec_tree.predict(data)
  end
end