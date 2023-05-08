(use ./env)
(setenv)
(use ./api)

(defn main
  [& args]
  (var agent (my-agent))
  (print (agent :account_id)))
