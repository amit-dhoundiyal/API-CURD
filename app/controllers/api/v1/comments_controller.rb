class Api::V1::CommentsController < ApplicationController
	def index
    @comment = Comment.all

    render json: @comment
  end
 
 def create
    @comment =Comment.new(comments: params[:comments],post_id: params[:post_id])
    
    if @comment.save
    	
    	render json: @comment
      
    else
      render json: {error: 'process not completed'}
    end
  end
 
  def update
    @comment = Comment.find(params[:id])
 
    if @comment.update(comments: params[:comments],post_id: params[:post_id])
      render json: @comment
    else
      render json: {error: 'process not completed'}
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    
 
    if @comment.destroy
            render json: {status: 'successful'}
        else
            render json: {error: 'process not completed'}
        end
  end
end
