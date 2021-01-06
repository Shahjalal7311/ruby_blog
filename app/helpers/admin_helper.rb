module AdminHelper

  def getUserRole
    user_roles_id = current_user.user_roles_id
    getRole = UserRole.where(id: user_roles_id).first()
    if(getRole !=nil && getRole.permission !=nil)
      return getRole.permission;
    else
      return false;
    end
  end

  def getMenusAll()
    usermenus = UserMenu.getMenus.where(parentMenu: '').order(orderBy: :asc)
    return usermenus
  end

  def getSubMenusAll(id)
    usersubmenus = UserMenu.getMenus.where(parentMenu: id.to_s).order(orderBy: :asc)
    return usersubmenus
  end

  def rolesDynamicChecked(array_val,menu_id)
    if(array_val !=nil)
      a = array_val.split(',')
      return (a.include?(menu_id.to_s)) ? true : false
    else
      errors.add(:base, "You don't have permission this")
      throw(:abort)
    end 
  end

  def action(id)
    user_roles_id = current_user.user_roles_id
    @userRoles = UserRole.where(id: user_roles_id).first()
    data_link = '';
    if(@userRoles !=nil && @userRoles.actionPermission !=nil)
      @rolePermission = @userRoles.actionPermission
      @routeName = controller.controller_name
      @userMenus = UserMenu.getMenus.where(menuLink: @routeName).first()
      if(@userMenus)
        usermenuActions = UserMenuAction.where(user_menu_id: @userMenus.id)
        usermenuActions.each do |usermenuAction|
          a = @rolePermission.split(',')
          roleId = usermenuAction.id
          menutype = usermenuAction.menuType
          checkHas = (a.include?(roleId.to_s)) ? true : false;
          if(checkHas)
            if(menutype ==3)
              data_link += '<a href="/admin/'+controller.controller_name+'/'+id.to_s+'/edit"><i class="fas fa-edit"></i></a>'
            end
            if(menutype ==6)
              data_link += '<a data-confirm="Are you sure you want to delete this item?" rel="nofollow" data-method="delete" href="/admin/'+controller.controller_name+'/'+id.to_s+'"><i class="fas fa-trash-alt"></i></a>'
            end
            if(menutype ==8)
              data_link += '<a href="/admin/'+controller.controller_name+'/'+id.to_s+'/pdf"><i class="fas fa-eyes"></i></a>'
            end
            if(menutype ==9)
              data_link += '<a href="/admin/'+controller.controller_name+'/'+id.to_s+'/permission"><i class="fas fa-lock"></i></a>'
            end
            if(menutype ==10)
              data_link += '<a href="/admin/'+controller.controller_name+'/'+id.to_s+'/change_password"><i class="fas fa-exchange-alt"></i></a>'
            end
            if(menutype ==7)
              data_link += '<a href="/admin/'+controller.controller_name+'/'+id.to_s+'/link"><i class="fas fa-eye"></i></a>'
            end
          end
        end
      end
      return data_link
    end
  end

  def addAction()
    user_roles_id = current_user.user_roles_id
    @userRoles = UserRole.where(id: user_roles_id).first()
    data_link = '';
    if(@userRoles !=nil && @userRoles.actionPermission !=nil)
      @rolePermission = @userRoles.actionPermission
      @routeName = controller.controller_name
      @userMenus = UserMenu.getMenus.where(menuLink: @routeName).first()
      if(@userMenus)
        usermenuActions = UserMenuAction.where(user_menu_id: @userMenus.id)
        usermenuActions.each do |usermenuAction|
          a = @rolePermission.split(',')
          roleId = usermenuAction.id
          menutype = usermenuAction.menuType
          checkHas = (a.include?(roleId.to_s)) ? true : false;
          if(checkHas)
            if(menutype ==2)
              data_link += '<a href="/admin/'+controller.controller_name+'/new"><i class="fas fa-plus"></i> Add New</a>'
            end
          end
        end
      end
      return data_link
    end
  end

  def status(id, status)
    user_roles_id = current_user.user_roles_id
    @userRoles = UserRole.where(id: user_roles_id).first()
    data_link = '';
    if(@userRoles !=nil && @userRoles.actionPermission !=nil)
      @rolePermission = @userRoles.actionPermission
      @routeName = controller.controller_name.to_s
      @userMenus = UserMenu.getMenus.where(menuLink: @routeName).first()
      if(@userMenus)
        usermenuActions = UserMenuAction.where(user_menu_id: @userMenus.id)
        usermenuActions.each do |usermenuAction|
          a = @rolePermission.split(',')
          roleId = usermenuAction.id
          menutype = usermenuAction.menuType
          checkHas = (a.include?(roleId.to_s)) ? true : false;
          if(checkHas)
            if(menutype ==3)
              if(status ==1)
                data_link +='<a style="cursor:pointer;" onclick="onUnpublish('+id.to_s+', '+"'"+controller.controller_name+"'"+')"><i class="fa fa-undo"></i> Published</a>'
              else
                data_link += '<a style="cursor:pointer;" onclick="onPublish('+id.to_s+', '+"'"+controller.controller_name+"'"+')"><i class="fa fa-bullhorn"> Draft</i></a>'
              end
            end
          end
        end
      end
      return data_link
    end
  end

  def checkContentPermission()
    user_roles_id = current_user.user_roles_id
    userRoles = UserRole.where(id: user_roles_id).first()
    if(userRoles !=nil && userRoles.permission !=nil)
      rolePermission = userRoles.permission
      routeName = controller.controller_name.to_s
      userMenus = UserMenu.getMenus.where(menuLink: routeName).first()
      if(userMenus)
        a = rolePermission.split(',')
        roleId = userMenus.id
        checkHas = (a.include?(roleId.to_s)) ? true : false;
        if(checkHas)
          return true
        else
          return false
        end
      end
    end
  end

  def checkContentPermissioninnerAction()
    user_roles_id = current_user.user_roles_id
    @userRoles = UserRole.where(id: user_roles_id).first()
    if(@userRoles !=nil && @userRoles.actionPermission !=nil)
      @rolePermission = @userRoles.actionPermission
      @routeName = controller.controller_name.to_s
      @userMenus = UserMenu.getMenus.where(menuLink: @routeName).first()
      if(@userMenus)
        usermenuActions = UserMenuAction.where(user_menu_id: @userMenus.id)
        usermenuActions.each do |usermenuAction|
          a = @rolePermission.split(',')
          roleId = usermenuAction.id
          menutype = usermenuAction.menuType
          checkHas = (a.include?(roleId.to_s)) ? true : false;
          if(checkHas)
            return true
          else
            return false
          end
        end
      end
    end
  end

end
