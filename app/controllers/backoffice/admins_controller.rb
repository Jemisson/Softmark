# frozen_string_literal: true

module Backoffice
  class AdminsController < BackofficeController

    before_action :set_admin, only: %i[edit update destroy]
    after_action :verify_authorized, only: :new
    after_action :verify_policy_scoped, only: :index

    def index
      @admins = policy_scope(Admin)
    end

    def new
      @admin = Admin.new
      authorize @admin
    end

    def create
      @admin = AdminService.create(params_admin)

      if @admin.errors.any?
        render :new
      else
        redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi salvo com sucesso"
      end
    end

    def edit; end

    def update
      passwd = params[:admin][:password]
      passwd_conf = params[:admin][:password_confirmation]

      if passwd.blank? && passwd_conf.blank?
        params[:admin].delete(:password)
        params[:admin].delete(:password_confirmation)
      end

      if @admin.update(params_admin)
        redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.name} foi atualizado com sucesso"
      else
        render :new
      end
    end

    def destroy
      admin_name = @admin.name

      if @admin.destroy
        redirect_to backoffice_admins_path, notice: "O administrador #{admin_name} foi excluído com sucesso"
      else
        render :index
      end
    end

    private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      if @admin.blank?
        params.require(:admin).permit(:name, :email, :password, :password_confirmation, :role)
      else
        params.require(:admin).permit(policy(@admin).permitted_attributes)
      end
    end

  end
end
