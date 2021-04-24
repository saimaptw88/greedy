class Api::V1::WantsUpdateController < Api::V1::BaseApiController
  # 引数は、更新後の全てのwant, id不要
  def update
    wants = current_user.wants.all
    binding.pry
    params["_json"].each do |w|
      want = wants.find(w[:id])
      want.update!(priority: w[:priority], category_id: w[:category_id])
    end
    wants = current_user.wants.order(priority: :asc)
    want1 = []
    want2 = []
    # wantをカテゴリごとに分類
    wants.each do |want|
      if want.category_id == 1
        want1.push(want)
      else
        want2.push(want)
      end
    end
    # 並び順をpriorityに設定
    # binding.pry
    want1 = want1.each_with_index {|want, index| want.priority = index }
    want2 = want2.each_with_index {|want, index| want.priority = index }

    # カテゴリ1とカテゴリ2のwantをフラットに結合
    @wants = want1.push(want2).flatten!
    render json: @wants, each_serializer: Api::V1::PreviewWantSerializer
  end
end
