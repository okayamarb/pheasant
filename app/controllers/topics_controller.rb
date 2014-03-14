class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @q = Topic.search(params[:q])
    params[:page] ||= 1
    @topics = @q.result.page params[:page]

    render json: @topics, each_serializer: TopicSerializer
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    render json: @topic
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    if @topic.update(params[:topic])
      head :no_content
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy

    head :no_content
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end
end
