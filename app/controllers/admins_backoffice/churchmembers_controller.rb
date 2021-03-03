class AdminsBackoffice::ChurchmembersController < AdminsBackofficeController
    def index
    end

    def edit
    end

    def create
    end

    def new
    end

    def destroy
        if @churchmember.destroy
            notice "Excluído"
        else
            render :edit
        end
    end
end
