#' TODO
#'@param 
#'
#'@author Chariff Alkhassim
#'
#'@export 
#'
# 
clusTag <- function(labels, combinaisons, Annotate,minCard = 1)
{  
  unilabels <- as.numeric(names(which(table(labels)>=minCard))) 
  out <- c()
  for(label in unilabels)
  {
    ind <- labels==label
    ncell <- sum(ind) 
    comb_lab <- combinaisons[match(TRUE, ind),]
    out <- rbind(out, c(comb_lab, label, ncell))  
  }
  out <- out[sort(out[,c(ncol(out))], 
                  decreasing = TRUE, 
                  index.return = TRUE)$ix,]
  out <- cbind(out, round(out[,ncol(out)]/sum(out[,ncol(out)]), 4))
  colnames(out) <- c(colnames(combinaisons), "labels","ncells","prop")
  out
}



