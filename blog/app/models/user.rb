class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :validate_user_count, on: :create

  after_create :print_created_data
  after_commit :print_committed_data, on: :create
  
  def print_created_data
    puts "User #{name} (#{email})"
  end
  
  def print_committed_data
    puts " Created"
  end
  
  private
  def validate_user_count
    if User.count >= 7
      errors.add(:base, "Maximum number of users exceeded")
    end
  end
end
