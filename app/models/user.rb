class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', inverse_of: :author
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: 'Please enter correct email'},
                    uniqueness: true


  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def completed_tests(level)
    tests.where(level: level)
  end
end
