class AdminsBackoffice::DeaconsController < AdminsBackofficeController
  before_action :set_deacons, only: [:edit, :destroy, :update]

  def index
    @deacons = Deacon.all
  end

  def edit
    @deacon = Deacon.find(params[:id])
  end

  def new
    @deacon = Deacon.new
  end

  def create
    @deacon = Deacon.new(params_deacon)
    if @deacon.save()
      redirect_to admins_backoffice_deacons_index_path
    else
      render:new
    end

  end

  def update
    if @deacon.update(params_deacon)
      redirect_to admins_backoffice_deacons_index_path
    else
      render :edit
    end
  end

  def destroy
    if @deacon.destroy
      redirect_to admins_backoffice_deacons_index_path
    else
      render :index
    end
  end

  private

  def params_deacon
    params.require(:deacon).permit(:name, :email, :cellphone, :beginningterm, :endterm)
  end

  def set_deacons
    @deacon = Deacon.find(params[:id])
  end
end
