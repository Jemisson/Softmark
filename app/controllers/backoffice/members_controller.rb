# frozen_string_literal: true

module Backoffice
  class MembersController < BackofficeController

    before_action :set_member, only: %i[edit update destroy]

    def index
      @members = Member.all
    end

    def new
      @member = Member.new
    end

    def create
      @member = MemberService.create(params_member)

      if @member.errors.any?
        render :new
      else
        redirect_to backoffice_members_path, notice: "O Membro #{@member.name} foi salvo com sucesso"
      end
    end

    def edit; end

    def update
      passwd = params[:member][:password]
      passwd_conf = params[:member][:password_confirmation]

      if passwd.blank? && passwd_conf.blank?
        params[:member].delete(:password)
        params[:member].delete(:password_confirmation)
      end

      if @member.update(params_member)
        redirect_to backoffice_members_path, notice: "O Membro #{@member.name} foi atualizado com sucesso"
      else
        render :new
      end
    end

    def destroy
      member_name = @member.name

      if @member.destroy
        redirect_to backoffice_members_path, notice: "O Membro #{member_name} foi excluído com sucesso"
      else
        render :index
      end
    end

    private
    def set_member
      @member = Member.find(params[:id])
    end

    def params_member
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
    end

  end
end
