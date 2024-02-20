Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username" , {controller: "users", action: "show"})
  post("/add_user", {controller: "users", action: "add_user"})
  get("/photos", {controller: "photos", action: "index"})
  get("/photos/:photo_id", {controller: "photos", action: "show"})
  get("/delete_photo/:photo_id", {controller: "photos", action: "delete"})
  get("/insert_photo", {controller: "photos", action: "create"})
  post("/update_photo/:modify_id", {controller: "photos", action: "update"})
  post("/add_comment/", {controller: "photos", action: "add_comment"})
  post("/update_user/:path_id", {controller: "users", action: "update_user"})
end
