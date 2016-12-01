# CISC642-FinalProject
Head Count Project

Possible Approaches:
  Easier Method:  
    1.Background subtraction 
    2.template matching   
    -could do in real time since easy  
    -could also do a multi-resolution version  
    -not sure how we can make this difficult enough for him to like it  
    3*. Possibly a nearest neighbor approach (not too hard) https://www.youtube.com/watch?v=3SFUjWtxyuk  
    
  Harder Method:  
    1.Using Maching learning.  
    -SVM: I am still struggling to understand this and it looks like a lot to implement if we don't use built in.  
        -He mentioned doing this specifically unfortunately  
        -If we use built it, it could be possible  
    -Boosting: More possible. Will need to take many images to train (starbuck in smith?). Basically works by combining   multiple weak classifiers that determine if a window is a head or not, assigns weights based off their error rate, and   then combines them. Still would take time  
