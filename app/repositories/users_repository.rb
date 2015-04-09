class UsersRepository
  def all
    User.all.order(:name)
  end

  def active
    all.where('archived_at IS NULL')
  end

  def find_by_id(id)
    active.find(id)
  end

  def find_by_email(email)
    active.find_by_email(email)
  end

  def user_from_auth(auth)
    active.where(
      provider: auth['provider'],
      uid: auth['uid'].to_s,
    ).first || User.create_with_omniauth(auth)
  end
end
