StrongResources.configure do
  strong_resource :tweet do
    attribute :content, :string
  end

  strong_resource :user do
    attribute :name, :string
    attribute :email, :string
  end

  strong_resource :message do
    attribute :content
  end
end
