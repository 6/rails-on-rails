class Admin::SettingsController < Admin::ResourcesController
  def toggle_maintenance_mode
    Setting.maintenance_mode = Setting.maintenance_mode ? false : true
    redirect_to admin_dashboard_index_path
  end
end
