library(httr)
library(jsonlite)

auth_url <- "https://bhoonidhi-api.nrsc.gov.in/auth/token"

auth_body <- list(
  userId     = "khushi1340",
  password   = "khushi@134040",
  grant_type = "password"
)

auth_resp <- POST(
  url    = auth_url,
  body   = auth_body,
  encode = "json"
)

stop_for_status(auth_resp)

auth_content <- content(auth_resp, as = "text", encoding = "UTF-8")
auth_json <- fromJSON(auth_content)

access_token <- auth_json$access_token

headers <- add_headers(
  Authorization = paste("Bearer", access_token),
  "Content-Type" = "application/json"
)

cat("Authentication successful\n")
