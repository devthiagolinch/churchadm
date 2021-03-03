class AdminsBackoffice::ChurchmembersController < AdminsBackofficeController
    before_action :set_churchmember, only: [:edit, :update, :destroy]

    def index
        @churchmembers = Churchmember.all
    end

    def edit
        @churchmember = Churchmember.find(params[:id])
    end

    def update
        if @churchmember.update(params_churchmember)
            redirect_to admins_backoffice_welcome_index_path
        else
            render :index
        end
    end

    def new
        @churchmember = Churchmember.new
    end

    def create
        @churchmember = Churchmember.new(params_churchmember)
        if @churchmember.save()
            redirect_to admins_backoffice_welcome_index_path
        else
            render :new
        end
    end

    def destroy
        if @churchmember.destroy
            redirect_to admins_backoffice_churchmembers_path
        else
            render :index
        end
    end

    private

    def params_churchmember
        params.require(:churchmember).permit(:name, :email, :cellphone, :birthdate, :membershipdate, :street, :district)
    end

    def set_churchmember
        @churchmember = Churchmember.find(params[:id])
    end
end
