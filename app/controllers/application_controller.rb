class ApplicationController < ActionController::Base
  include Clearance::Controller
  layout 'master'
  
  def hasMenuPermission()
    user_roles_id = current_user.user_roles_id
    userRoles = UserRole.where(id: user_roles_id).first()
    if(userRoles !=nil && userRoles.actionPermission !=nil)
      rolePermission = userRoles.actionPermission
      routeName = controller_name.to_s
      userMenus = UserMenu.getMenus.where(menuLink: routeName).first()
      if(userMenus)
        actionName = action_name.to_s
        userActionMenus = UserMenuAction.getActionMenus.where(actionLink: actionName, user_menu_id: userMenus.id).first()
        if(userActionMenus)
          a = rolePermission.split(',')
          roleId = userActionMenus.id
          checkHas = (a.include?(roleId.to_s)) ? true : false;
          if(checkHas)
            return true;
          else
            render 'admin/include/show_permission_error'
          end
        end
      end
    end
  end

  def hasMenuActionPermission()
    user_roles_id = current_user.user_roles_id
    userRoles = UserRole.where(id: user_roles_id).first()
    if(userRoles !=nil && userRoles.permission !=nil)
      rolePermission = userRoles.permission
      routeName = controller_name.to_s
      userMenus = UserMenu.getMenus.where(menuLink: routeName).first()
      if(userMenus)
        a = rolePermission.split(',')
        roleId = userMenus.id
        checkHas = (a.include?(roleId.to_s)) ? true : false;
        if(checkHas)
          return true
        else
          render 'admin/include/show_permission_error'
        end
      end
    end
  end

end
