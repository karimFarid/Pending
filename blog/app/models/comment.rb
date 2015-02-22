class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :nested_comments, dependent: :destroy
end
