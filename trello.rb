#! ruby -Ku
require 'trello'
require 'pry'
require 'kconv'

def puts_todos
    configure
    cards = get_cards
    
    puts '-------------------------'
    puts '【todo】'
    cards.each do |card|
        puts card.name
    end
    puts '-------------------------'
end

def configure
    Trello.configure do |config|
        config.developer_public_key = '2' # The "key" from step 1
        config.member_token = '' # The token from step 2.
        end
end

def get_cards
    member = Trello::Member.find('akky')
    boards = member.boards
    board = boards.find { |board| board.name =='todo' }
    lists = board.lists
    list = board.lists[0]
    cards = list.cards
end
puts_todos
