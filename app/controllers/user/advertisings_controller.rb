class User::AdvertisingsController < ApplicationController
  include User::AdvertisingsHelper
  layout "presentation"


  def show
     @date = Time.now
     #@ads = Advertising.where(client: params[:id]) # FOR USE WITHOUT HASH
     hash = data_clima_tempo

    #                        @ads = Advertising.where(client_id = params[:id])
    #                         .where(start_date >= Time.now.strftime("%Y-%m-%d"))
    #                         .where (end_Date <= Date.now())
    #                         .where(category_id => Category.where(description = hash['currently'])) and teperatura BETWEEN hash["max"] AND hash["MIN"] )

     @ads = Advertising.find_by_sql("select * from advertisings
                                     where client_id = #{params[:id]}
                                     and category_id = (
                                     select id from categories where description like '%#{hash['currently']}%')")
  end



end

# @ads = Advertising.find_by_sql("select *
#                                 from (( advertisings
#                                 inner join categories on advertisings.category_id = 1 )
#                                 inner join weathers on advertisings.weather_id = 1 )
#                                 where advertisings.id = #{params[:id]}")


#                                 client_id = params[:id] and
#                                 start_date >= Date.now() and
#                                 finishDate <= Date.now() and
#                                 category_id = ( SELECT id
#                                                 FROM categories
#                                                 WHERE description = climatempo["currently"]) and
#                                 teperatura BETWEEN climatempo["max"] AND climatempo["MIN"]
