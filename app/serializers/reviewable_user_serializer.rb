class ReviewableUserSerializer < ReviewableSerializer

  attributes :link_admin, :user_fields

  payload_attributes(
    :username,
    :email,
    :name
  )

  def link_admin
    scope.is_staff? && object.target.present?
  end

  def user_fields
    object.target.user_fields
  end

  def include_user_fields?
    object.target.present? && object.target.user_fields.present?
  end

end
