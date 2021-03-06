class TodosController < ApplicationController

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.create(todo_params)
  	if @todo.save
  		flash[:notice] = "Todo was created successfully"
    	redirect_to todo_path(@todo)
  	else
    	render 'new'
  	end
  end

  def show
  	@todo = Todo.find(params[:id])
  end

  def edit
  	@todo = Todo.find(params[:id])
  end

  def update
  	@todo = Todo.create(todo_params)
  	if @todo.update(todo_params)
  		flash[:notice] = "Todo was updated  successfully"
    	redirect_to todo_path(@todo)
  	else
    	render 'new'
  	end
  end

  def index
  	@todos = Todo.all
  end

  def destroy
  @todo = Todo.find(params[:id])
  @todo.destroy
  flash[:notice] = "Todo was deleted successfully"
  redirect_to todos_path
  end

   

  private

	def todo_params
 	 params.require(:todo).permit(:name, :description)
	end

end