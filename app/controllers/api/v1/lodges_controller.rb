class Api::V1::LodgesController < ApiController
  def index
    pages = (Lodge.count / Lodge.default_per_page).ceil
    current_page = Integer(params[:page] || 1)
    current_page = 1 unless current_page > 0
    current_page = pages unless current_page <= pages

    page_links = {
        :first => current_page == 1 ? nil : "#{api_v1_lodges_url}?page=1",
        :last => current_page == pages ? nil : "#{api_v1_lodges_url}?page=#{pages}",
        :next => current_page + 1 > pages ? nil : "#{api_v1_lodges_url}?page=#{current_page + 1}",
        :prev => current_page - 1 < 1 ? nil : "#{api_v1_lodges_url}?page=#{current_page - 1}"
    }


    response.headers['Link'] = page_links.keep_if {|k, v| !v.nil?}.map {|k, v| "<#{v}>; rel=\"#{k}\""}.join(', ')
    @lodges = Lodge.page current_page
  end

  def show
    @lodge = Lodge.find(params[:id])
  end
end