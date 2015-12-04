class Admin::SettingsController < Admin::AdminController

  # GET /settings
  def index
    @settings = Setting.all
  end

  def update_all
    update_attributes(params[:setting])
    flash[:notice] = t('flashes.admin.settings.successfully_updated')
    respond_to do |format|
      format.html { redirect_to admin_settings_path }
    end
  end

private
  def update_attributes(setting_params)
    setting_params.each do |setting|
      Setting.find_by(key: setting[0]).update_attributes(value: setting[1])
    end
  end
end