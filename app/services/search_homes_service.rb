class SearchHomesService
  def self.search(search)
    if search != ""
      if search.start_with?("@")
        search = "#{search}%"
        Home.find_by_sql(["SELECT * FROM users WHERE address LIKE ?", search])
      else
        search = "%#{search}%"
        Home.find_by_sql(["SELECT * FROM homes WHERE name LIKE ? ", search])
      end
    end
  end
end