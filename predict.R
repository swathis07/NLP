load("SmallDict1.rda")
load("unigram.rda")

parse <- function(textIn){
  textIn = tolower(textIn)
  textIn <- gsub("'", "", textIn)
  textIn <- gsub("-", "", textIn)
  textIn <- gsub("[^[:alpha:][:space:]]", "", textIn)
  textIn <- gsub(" {2,}"," ",textIn)
  
  textSpl <- strsplit(textIn, " ")
  textSplLen <- length(textSpl[[1]])
  if(textSplLen > 4)
    ngram = textSpl[[1]][(textSplLen-3):textSplLen]
  else
    ngram = textSpl[[1]][1:textSplLen]
  
  match = c()
  for(i in 1:length(ngram)){
     match <- c(match, paste(ngram[i:length(ngram)], collapse=" "))
  }
  return(match)
}

topWords <- function(match, dict, unigram){
  selectedWords = dict[dict$key %in% match,]
  if(!nrow(selectedWords)>0){
    return(unigram$words[1:3])
  }
  selectedWords = selectedWords[with(selectedWords,order(-lev,-freq)),]
  result = unique(selectedWords$nextword)
  if (length(result)>3){
    return(result[1:3])
  }
  else 
    return(result[1:length(result)])
}

predict <- function(text){
  if(is.null(text)){
    pred = NULL
    return(pred)
  }
  else{
    match <- parse(text)
    pred <- topWords(match, smalldict , unigram)
    
    return(pred)
}
}