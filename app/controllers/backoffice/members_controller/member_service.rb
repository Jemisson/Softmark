class Backoffice::MembersController::MemberService
  attr_accessor :member

  def self.create(params_member)
    @member = Member.new(params_member)

    if @member.valid?
      @member.save!
    end

    @member
  end
end
