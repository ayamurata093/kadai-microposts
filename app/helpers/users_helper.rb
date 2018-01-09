module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "http://secure.gravator.com/avatar/#{gravatar_id}?s=#{size}"
  end
end
