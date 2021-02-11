class Gossip < ApplicationRecord
    belongs_to :user
    has_many :TableJoinGossipTags
    has_many :tags, through: :TableJoinGossipTags
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :title,
    presence: true,
    length: {minimum: 3, maximun: 13}

    validates :content,
    presence:true

end
