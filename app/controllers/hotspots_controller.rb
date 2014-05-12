class HotspotsController < ApplicationController
	
  def index
	session[:oauth] = Koala::Facebook::OAuth.new('1378120445799582', 'ddc95272ff8ca6799cc6648c33af5b31', 'http://localhost:3000' + '/hotspots/callback')
	@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream") 	
	puts session.to_s + "<<< session"

  	respond_to do |format|
			 format.html {  }
		 end
  end

  def callback
  	begin
	  session[:oauth] = Koala::Facebook::OAuth.new('1378120445799582', 'ddc95272ff8ca6799cc6648c33af5b31','http://localhost:3000' + '/hotspots/callback')
	  fb_cookie = session[:oauth].get_user_info_from_cookies(cookies)
	  session[:fb_cookie] = fb_cookie if fb_cookie.present?
	rescue Exception => exc
	    #raise FBConnectionException.new(exc)
	end
	fb_cookie = session[:fb_cookie] if fb_cookie.nil?
  # 	  	if params[:code]
  # 		# acknowledge code and get access token from FB
		#   session[:access_token] = session[:oauth].get_access_token(params[:code])
		# end		
		 
		@api = Koala::Facebook::API.new(session[:access_token])
		@pic = @api.get_picture("/me")
		profile = @api.get_object("/me")
		@name = @api.get_object("/me")

		n = User.new(name: @name['name'], fb_id: @name['id'])
			n.save

		# @user = User.find_by(fb_id: session[:user_id]).name /////////////////THIS IS WHAT IT DIDNT LIKE
		session[:user_id] = n.fb_id 
		gon.hotspots = Hotspot.all
		@array = []
		gon.hotspots.each do |hotspot|
			@array.push(hotspot.user.name)
		end
		@hotspots = Hotspot.all
		gon.users = @array
	
		friends = @api.get_object("/me/friends")
		@all_friends = friends

 		respond_to do |format|
		 format.html {   }		
		end

  end

  def create

  	@user = User.find_by(fb_id: session[:user_id])
  	# puts "\n\n\n\n\n\nPARAMS", params
  	@h = @user.hotspots.create(name: params[:hotspot_name], description: params[:hotspot_description], latitude: params[:latitude], longitude: params[:longitude])
  		@h.save
  	
  	@showspot = @h
  	puts @showspot

  	# @picture = Hotspot.create( pic_params )
  	# puts "\n\n\n\n\n\n\n\nPICTURE", @picture
  	# if @picture.save
	  # 	flash[:message] = 'success'
	  # else
	  # 	flash[:errors] = @picture.errors.full_messages
	  # end
  	# redirect_to '/hotspots/callback'

  	
  end

  private

  def pic_params
  	params.permit(:pic, :name, :description)
  end

end
