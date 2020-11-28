## code to prepare `load_data` dataset goes here

# 패키지 호출
library(tidyverse)

# 현재 작업경로 확인
getwd()

# 데이터 불러오기
sales <- readRDS(file = './data-raw/results.RDS')

# tibble로 변환
sales <- as_tibble(x = sales)


## End of Document
