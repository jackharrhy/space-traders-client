(declare-project
  :name "space-traders-client"
  :description ```client for https://spacetraders.io/```
  :version "0.0.0"
  :dependencies ["https://github.com/joy-framework/http"])

(declare-source
  :prefix "space-traders-client"
  :source ["src/init.janet"])
