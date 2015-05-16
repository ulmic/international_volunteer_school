class Web::Admin::PagesController < Web::Admin::ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page_form = PageForm.new_with_model
  end

  def create
    @page_form = PageForm.new_with_model
    @page_form.submit params[:page]
    if @page_form.save
      redirect_to admin_pages_path
    else
      render action: :new
    end
  end

  def edit
    @page_form = PageForm.find_with_model params[:id]
  end

  def update
    @page_form = PageForm.find_with_model params[:id]
    @page_form.submit params[:page]
    if @page_form.save
      redirect_to admin_pages_path
    else
      render action: :edit
    end
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to admin_pages_path
  end
end
