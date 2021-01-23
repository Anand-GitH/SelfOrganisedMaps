# SelfOrganisedMaps
SOM - High dimensional data viewing in 2D to understand the grouping and visualization and use it for prediction

Observation:
When you re-run the data of hierarchical clustering will remain same but the SOM clustering will
change as the training data will be picked random again and the code vectors are reformed as data is really small
and few variables so change in code vectors distance vectors will differ to greater extent so there by results in
different clustering.

Advantages of Hierarchical clustering over SOM
1. Hierarchical clustering depends on the distance matrix of all variables scaled by which actual distance between
objects can be defined and clustering gives actual results where as in SOM it purely depends on the code vectors and
the learning rate (training data) used to derive code vectors which if not appropriate may lead to wrong SOM fit

2. It’s easy to cut a tree by height or by k for further analysis and visually perfect using dendrogram but it’s not that
great as it does not include values of the clusters as its possible to view the range of values in SOM

3. If goal is clustering than its good to use Hierarchical clustering over SOM


High dimensional data viewing in 2D to understand the grouping and visualization and use it for prediction
so SOM offers so much more than hierarchical clustering and SOM behave badly for smaller datasets as learning
rate and to build code vectors will not be perfect. It is much suitable for high dimensional data.

