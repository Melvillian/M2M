class Query < ActiveRecord::Base
  belongs_to :path
  belongs_to :share
  belongs_to :server

  @@stoplist = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from', 'has', 'he', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to', 'was', 'were', 'will', 'with', '1', '2', '3', '4', '5', '6', '7', '8', '9']

  def self.stoplist
    @@stoplist
  end


  def self.search(queryString)
  	tokQuery = queryString.split(' ')
  	results = []
  	tokQuery.each do |query|
        if not (stoplist.include? query) then
  	  	searchQuery = "select serv.hostname, sh.share_name, p.path_name, q.file_name FROM queries " +
  	  	"as q inner join servers as serv on q.server_id = serv.server_id inner join shares " +
  	  	"as sh on q.share_id = sh.share_id inner join paths as p on q.path_id = p.path_id " + 
  	  	"WHERE q.file_name LIKE ? OR p.path_name LIKE ? OR sh.share_name " + 
  	  	"LIKE ? OR serv.hostname LIKE ?;"

    		results << ActiveRecord::Base.connection.select_all(
    			ActiveRecord::Base.send(:sanitize_sql_array, 
     			[searchQuery, "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"]))
      end
    end
    return results
  end

end
