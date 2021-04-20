class Api::V1::WantsUpdateController < Api::V1::BaseApiController
  # 引数は、更新後の全てのwant, id不要
  def update
    wants = current_user.wants.all
    # binding.pry
    params[:wants].each do |w|
      want = wants.find(w[:id])
      want.update!(priority: w[:priority], category_id: w[:category_id])
    end
  end
end
