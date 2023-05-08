(import http)
(import spork/json)

(def token (os/getenv "STC_TOKEN"))
(def api-base "https://api.spacetraders.io/v2")

(defn req [method endpoint &opt body]
  (json/decode
    ((http/request
       method
       (string api-base endpoint)
       {:headers {"Authorization" (string "Bearer " token)}
        :body body}) :body)))

(defn my-agent []
  (def data ((req :get "/my/agent") "data"))
  {:account_id (data "accountId")
   :symbol (data "symbol")
   :headquarters (data "headquarters")
   :credits (data "credits")})
