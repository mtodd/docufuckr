class Pages < Application
  # provides :xml, :yaml, :js
  
  def index
    @pages = Page.all
    display @pages
  end
  
  def show(id)
    @page = Page.get(id)
    raise NotFound unless @page
    display @page
  end
  
  def new
    only_provides :html
    @page = Page.new
    display Page
  end
  
  def edit(id)
    only_provides :html
    @page = Page.get(id)
    raise NotFound unless @page
    display @page
  end
  
  def create(page)
    @page = Page.new(page)
    if @page.save
      redirect resource(@page), :message => {:notice => "Page was successfully created"}
    else
      render :new
    end
  end
  
  def update(page)
    @page = Page.get(page[:id] )
    raise NotFound unless @page
    if @page.update_attributes(page)
       redirect resource(@page)
    else
      display @page, :edit
    end
  end
  
  def destroy(id)
    @page = Page.get(id)
    raise NotFound unless @page
    if @page.destroy
      redirect resource(:pages)
    else
      raise InternalServerError
    end
  end
  
end # Pages
