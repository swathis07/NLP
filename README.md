#Natural Language Processing
##Word Prediction

This app has been built as part of the Coursera Data Science Capstone Project.

The challenge was to build a text predictor that predicts the next word based on a text that the user types in. With mobile devices increasingly becoming the choice of device for email, social networking etc., helping users type better with a word prediction application has gained relevance. This project was offered in partnership with Swiftkey.

The training data that was used for the project can be found here Capstone Data. It contains text from news, blogs and twitter and is available in four languages - English, French, Russian and German. For this app, English was chosen.


## Approach

Steps for building the predictive model:

-The first step was to clean special characters, punctuations etc. out of the data.
-Then n-grams(1,2,3 and 4 grams) were generated.
-Of the various smoothing techniques available, I based my algorithm on Stupid Backoff to account for unseen words. For large datasets, it approaches the quality of state of the art smoothing techniques like Kneser Ney and is computationally less intensive.

The model checks with the highest order n-gram for prediction. If it is not present, it backs off to the next lower n-gram and so on. Stupid Backoff relies on relative frequences rather than probability discounting.


The three data files that were used to build the model were en_US.blogs, en_US.news, en_US.twitter with total file size of over 500MB. About 70% of the data was used to train the model. The final table used for prediction was under 10MB.

To limit the size of the lookup table, sparse terms were removed. As further improvement, the table was pruned of redundant prediction entries that would not be used by the app to display to the user.

Profanity was filtered out after building the final predictive model to avoid inconsistencies in language modelling.

The model can predict close to forty thousand unique words providing good coverage of the most commonly used words in English language.

The application can be found at hereandnow.shinyapps.io/predApp
