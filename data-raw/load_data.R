## code to prepare `load_data` dataset goes here

# 패키지 호출
library(tidyverse)

# 현재 작업경로 확인
getwd()

# 데이터 불러오기
sales <- readRDS(file = './data-raw/results.RDS')

# tibble로 변환
sales <- as_tibble(x = sales)

# csv 파일로 저장
write.csv(x = sales, file = './data-raw/sales.csv', row.names = FALSE)


## End of Document
