class Prop < ActiveRecord::Base
  USER_LIMIT = 9
  private_constant :USER_LIMIT

  has_many :users, through: :prop_receivers
  has_many :prop_receivers
  has_many :upvotes
  belongs_to :propser, class_name: 'User'

  validates :propser, :body, presence: true
  validate :prop_receivers?, :selfpropsing, :receivers_limit

  scope :with_includes, -> { includes(:users, :propser) }
  scope :ordered, -> { order('props.created_at DESC') }

  private

  def prop_receivers?
    return if prop_receivers.any?
    errors.add(:user_ids, I18n.t('props.errors.no_users'))
  end

  def selfpropsing
    return if prop_receivers.none? { |r| r.user_id == propser_id }
    errors.add(:user_ids, I18n.t('props.errors.selfpropsing'))
  end

  def receivers_limit
    return if prop_receivers.length <= USER_LIMIT
    errors.add(:user_ids, I18n.t('props.errors.user_limit'))
  end
end
