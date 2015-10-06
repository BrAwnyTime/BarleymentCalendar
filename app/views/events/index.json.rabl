collection @events, :object_root => false
# base columns
attributes :id, :title, :description
# aliased columns
attributes start_datetime: :start, end_datetime: :end, all_day: :allDay
# url nod
node :url do |u|
  event_path(u)
end
