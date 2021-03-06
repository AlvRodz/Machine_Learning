



test_insample <- Sigmoid((var.exp) %*% parameters)

cut_off <- cbind(0,0,0,0)
colnames(cut_off) <- c("cut_off","error_1","error_2","error_sum")

for (i in seq(0.1,0.99,0.01)) {
  
  predict <- ifelse(test_insample > i,1,0)
  
  matrix_confusion <- table(var.dep,predict)
  
  error_type_1 <- matrix_confusion[2,1]/nrow(predict)
  
  error_type_2 <- matrix_confusion[1,2]/nrow(predict)
  
  output <- cbind(i,error_type_1,error_type_2,sum(error_type_1,error_type_2))
  
  colnames(output) <- c("cut_off","error_1","error_2","error_sum")
  
  cut_off <- rbind(cut_off,output)
}

