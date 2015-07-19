name "linux-workstation"
description "Linux development workstation"
run_list "recipe[vim]"
override_attributes({
  "starter_name" => "Joseph Yennaco",
})
