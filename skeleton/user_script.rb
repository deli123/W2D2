require_relative 'super_useful'

puts "'five' == #{convert_to_int('5')}"

feed_me_a_fruit

# sam = BestFriend.new('', 1, '')
# sam = BestFriend.new('Bob', 1, '')
# sam = BestFriend.new('Bob', 5, '')
sam = BestFriend.new('Bob', 5, 'Fishing')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
