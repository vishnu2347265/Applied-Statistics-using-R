library(ggplot2)
g1=ggplot(mtcars,aes(mpg,disp))
g1
g1+geom_text(aes(label=cyl),size=3)
ggplot(data=mtcars,aes(x=mpg,y=hp,col=factor(cyl),size=factor((gear)))+geom_point()+labs(size="gears",col="cyl")
       
myscarplot=ggplot(mtcars,aes(x=wt,y=mpg,col=factor(cyl),size=wt))+geom_point()       
       myscarplot+facet_grid()       
ggplot(data=mtcars,mapping = aes(x=mpg,fill=as.factor(cyl)))+geom_density(alpha=1)
       bar1=ggplot(data=mtcars,mapping = aes(x=cyl,fill=as.factor(am)))
       bar1+geom_bar()
       
       ggplot(data=mtcars,aes(x=as.factor(cyl),fill=as.factor(cyl)))+geom_bar()+scale_fill_brewer(palette = "Accent")+theme(legend.position = "top")
       bar1+geom_bar()
       
       box=ggplot(mtcars,aes(x=as.factor(am),y=wt,fill=as.factor(am)))+geom_boxplot()
       box
      
       box+geom_boxplot(outlier.colour="red",outlier.shape=8,
                        outlier.size=4)
       
       p=ggplot(mtcars,aes(x=factor(am),y=wt,fill=factor(cyl)))+geom_violin(trim=FALSE)
       
       
       
       
       