class Application_Controller < Sinatra::Base 

    set :views, Proc.new { File.join(root, "../views") }

    get '/' do 
    erb :index
    end

    get '/search' do 
    erb :search
    end

    get '/make_employee' do 
    erb :make_employee
    end

    get '/all' do 
        @all = Employees.all
    erb :all
    end

    post '/found_person' do 
    @found_person = Employees.where(name:params[:search_name])
    erb :found_person
    end

    post '/found_department' do 
    @found_department = Employees.all.select do |employee|
                        employee.department == params[:search_department]
    end
    
    erb :found_department
    end

    post '/found_title' do 
        @found_title = Employees.all.select do |employee|
        employee.title == params[:search_title]
        end
    erb :found_title
    end
    
    post '/new_joiner' do
    @new_joiner = Employees.create(name: params[:name], title: params[:title], department:params[:department], experience:params[:experience], useful: params[:useful], salary: params[:salary])
    erb :new_joiner
    end

end