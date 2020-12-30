module UserRolesHelper
  def getUserAction(id)
    useraction = UserMenuAction.where(user_menu_id: id)
    return useraction
  end
end
