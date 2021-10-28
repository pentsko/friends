module ApplicationHelper

  def date_mdY(date)
    if date.nil?
      ""
    else
      date.strftime("%m-%d-%Y")
    end
  end

end
