
#loading the dataset
data("iris")
#exploring the data
View(iris)
#creating vector plots
x <- iris$Sepal.Length
y <- iris$Petal.Length
z <- iris$Sepal.Width
#installing the packages
install.packages("plot3D")
library("plot3D")
#** exercise 1. 
scatter3D(x,y,z, clab=c("Sepal","Width(cm)"))
#for restarting the rstudio
#.rs.restartR()
#removing the color bar
scatter3D(x,y,z,colkey = FALSE)
#changing the style
scatter3D(x,y,z, colvar = NULL,col="blue",pch=19,cex=0.9)
#trying different values and observe the result
#full box
scatter3D(x,y,z,bty = "f",colkey=FALSE, main="bty=f")
#grey background with white grid lines and tick numbers
scatter3D(x,y,z, bty="g",colkey = FALSE,main="bty=g",ticktype="detailed")
#user defined
scatter3D(x,y,z,pch=18, bty = "u",colkey = FALSE,main="bty=u",col.panel="royalblue",expand=0.4,col.grid="linen")
##3D plots with threejs
install.packages("threejs")
library(rlang)
library(threejs)
#exercise_2
#lets try to generate the same scatter plot with the iris dataset, this time using the threejs 
scatterplot3js(x,y,z,color = rainbow(length(z)))
#changing the style of data point
scatterplot3js(x,y,z,color = heat.colors(length(z)))
#OR WE CAN specify a color for each type of iris
N=length(levels(iris$Species))
scatterplot3js(x,y,z,size=0.6, color = rainbow(N)[iris$Species])
#changing the style of data point
scatterplot3js(x,y,z, pch="o", color=rainbow(length(z)))
#example of network visualization
data(ego)
upgrade_graph(ego)
graphjs(ego,bg="black")
View(ego)
## using globejs()
install.packages("maps")
data(world.cities,package = "maps")
cities <- world.cities[order(world.cities$pop, decreasing=TRUE)[1:500],]
value <- 100*cities$pop/max(cities$pop)
#plotting using globejs plot
globejs(bg="white",
        lat=cities$lat,
        long = cities$long,
        value = value,
        rotationlat=-0.34,
        rotationlong=-0.38,
        fov=30)
#3D plots with rgl
install.packages("rgl")
library("rgl")
#exercise 3. lets try to generate the same scatterplot with the iris dataset this time using 
#rgl package. 
#generate a scatterplot
plot3d(x,y,z)
#adding color to the data points and increase size
plot3d(x,y,z,
       size = 7,
       col=as.numeric(iris$Species))
#change the style of data points
plot3d(x,y,z,type = "s",
       size=2,
       col=as.numeric(iris$Species))
##adding lables
plot3d(x,y,z,type='s',
       size=2,col=as.numeric(iris$Species),
       xlab = "Sepal Length",ylab="Sepal Width")
##create an animated 3d scatterplot chart
#static chart
plot3d(x,y,z,col=as.numeric(iris$Species),type="s",radius = .2)
#we can indicate the azis and the rotational veloctiy
install.packages("magick")
library("magick")
play3d(spin3d(axis=c(0,1,0),rpm = 20),duration=10)
movie3d(movie="3dAnimatedscatterplot",
        spin3d(axis=c(0,0,1),rpm=7),
        duration = 5,
        dir=getwd(),
        type="gif",
        clean = TRUE)
