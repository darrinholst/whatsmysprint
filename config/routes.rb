WhatsMySprint::Application.routes.draw do
  root :to => 'root#index'
  get "current-sprint", :to => "sprint#current"
end
