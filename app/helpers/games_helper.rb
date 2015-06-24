module GamesHelper

	def sort_me(column, title = nil)
		title ||= column.capitalize
		css_class = column == sort_by ? "selected #{direction_of}" : nil
		direction = direction_of == 'asc' ? "desc" : "asc"
		link_to title, {:sort => column, :direction => direction, :search => params[:search]}, {:class => css_class}
	end

end
