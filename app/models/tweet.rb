class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :parent, class_name: 'Tweet', optional: true

  def content
    read_attribute(:content) || parent.content
  end

  def retweet?
    parent_id.present?
  end

  def retweets
    self.class.where(parent_id: id)
  end
end
