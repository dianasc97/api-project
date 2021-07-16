Rails.application.routes.draw do
  get 'api/metrics', to: 'api/metrics#bogosort'
end
