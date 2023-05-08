# functions pulled from https://github.com/joy-framework/joy/blob/master/src/joy/env.janet

(defn parse-dotenv [dot-env-string]
  (when dot-env-string
    (->> (string/split "\n" dot-env-string)
         (mapcat |(string/split "=" $ 0 2))
         (filter |(not (empty? $)))
         (map string/trim)
         (apply table))))

(defn setenv []
  (when (os/stat ".env")
    (with [f (file/open ".env")]
      (as-> (file/read f :all) ?
            (parse-dotenv ?)
            (eachp [k v] ?
              (os/setenv k v))))))
