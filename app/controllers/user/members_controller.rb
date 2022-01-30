# frozen_string_literal: true

module User
  class MembersController < UserController
    def index
      @clients = Client.all
    end
  end
end

# @ads = Advertising.find_by_sql("select * from (( advertisings inner join categories on advertisings.category_id = 1 ) inner join weathers on advertisings.weather_id = 1 ) where advertisings.id = 1")
#
#
# @ads = Advertising.find_by_sql("select *
#                                 from (( advertisings
#                                 inner join categories on advertisings.category_id = 1 )
#                                 inner join weathers on advertisings.weather_id = 1 )
#                                 where advertisings.id = 1")

#
# @class_room_past = ClassRoom.joins(disciplines: [{ students: :disciplines }])
#                       .where(:status => false)
#                       .where('students.id = ?', @student.id)
#                       .order('level desc, name asc')
#                       .group('class_rooms.id')

# select * from Advertising where client_id = params[:id] and
#                                 start_date >= Date.now() and
#                                 finishDate <= Date.now() and
#                                 category_id = ( SELECT id
#                                                 FROM categories
#                                                 WHERE description = climatempo["currently"]) and
#                                 teperatura BETWEEN climatempo["max"] AND climatempo["MIN"]
