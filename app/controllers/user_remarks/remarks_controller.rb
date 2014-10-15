require_dependency "user_remarks/application_controller"

module UserRemarks
  class RemarksController < ApplicationController
    before_action :set_remark, only: [:show, :edit, :update, :destroy]
    layout (UserRemarks.layout || 'application')

    def index
      @remarks = Remark.all
    end

    def show
    end

    def new
      @remark = Remark.new
      @remark.link = request.original_url if request.present?
      # html = render_to_string(:template => 'user_remarks/remarks/new',
      #                         :formats=>['html'], :layout=>false,
      #                         :locals => @remark)
      respond_to do |format|
        format.html {render :new, layout: false }
      end
    end

    def edit
    end

    def create
      @remark = Remark.new(remark_params)
      @remark.user_id = send("current_#{UserRemarks.user_class.to_s.downcase}").id if send("current_#{UserRemarks.user_class.to_s.downcase}").present?
      respond_to do |format|
        if @remark.save
          format.html {render :text => I18n.t('user_remarks.remarks.thank_you')}
          format.json {render :text => I18n.t('user_remarks.remarks.thank_you')}
        else
          format.html {render :new}
        end
      end
    end

    def update
      if @remark.update(remark_params)
        redirect_to @remark, notice: 'Remark was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @remark.destroy
      redirect_to remarks_url, notice: 'Remark was successfully destroyed.'
    end

    private
      def set_remark
        @remark = Remark.find(params[:id])
      end

      def remark_params
        params.require(:remark).permit(:title, :text, :link)
      end
  end
end
