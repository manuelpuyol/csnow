class Friendship < ApplicationRecord
  belongs_to :requester
  belongs_to :receiver
end
