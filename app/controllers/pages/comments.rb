module Pages
  class Comments < Application
    # provides :xml, :yaml, :js
  
    def index
      @comments = Comment.all
      display @comments
    end
  
    def show(id)
      @comment = Comment.get(id)
      raise NotFound unless @comment
      display @comment
    end
  
    def new
      only_provides :html
      @comment = Comment.new
      display Comment
    end
  
    def edit(id)
      only_provides :html
      @comment = Comment.get(id)
      raise NotFound unless @comment
      display @comment
    end
  
    def create(comment)
      @comment = Comment.new(comment)
      if @comment.save
        redirect resource(@comment), :message => {:notice => "Comment was successfully created"}
      else
        render :new
      end
    end
  
    def update(comment)
      @comment = Comment.get(comment[:id] )
      raise NotFound unless @comment
      if @comment.update_attributes(comment)
         redirect resource(@comment)
      else
        display @comment, :edit
      end
    end
  
    def destroy(id)
      @comment = Comment.get(id)
      raise NotFound unless @comment
      if @comment.destroy
        redirect resource(:comments)
      else
        raise InternalServerError
      end
    end
  
  end # Comments
end # Pages
