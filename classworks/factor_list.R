x1 <- c(1,9,5,4)
number_levels <- c(1,2,3,4,5,6,7,8,9,10,11)
#creating a factor
y1 <- factor(x1,levels = number_levels)
x1
y1

#sorting

sort(y1)

#list with an non element
x1 <- c(1,"hello",3,9)
y1<- factor(x1,levels = number_levels)
y1
#is a factor
is.factor(y1)

#list with an non element
x1 <- c(1,9,5,4)
y1<- factor(x1,levels = number_levels)
y1
as.ordered(y1)

#CHECKING ORDERED AND FACTOR
a = c(1,2,3,4)
b=as.factor(a)
c=as.ordered(a)

is.factor(a)
is.ordered(a)
is.factor(b)
is.factor(c)
is.ordered(b)
is.ordered(c)

#creating a list
list_info= list("blue","yellow","orange",c(12,13,14),TRUE,13.12,103.4)
list_info


list_name=list(c("mon","tue","wed"),c(1,1,1,1,1,1,1))
list_name
names(list_name) <- c("matrix","half_week")
print(names)



x1=c("one","two","three","four")
y1=c("one","two","three","four","five","six")
f=factor(x1,levels=y1)
f
x2=c("one","twentytwo","three","four")
f=factor(x2,levels=y1)
is.factor(f)
is.ordered(f)
as.factor(f)
addNA(x, ifany = FALSE)
sort(f)
as.ordered(f)
list_one=list("blue","yellow","red",c(12,3,4),matrix(c(1,2,3,4),nrow=2))
print(list_one)
names(list_one)=c("matrix","half week")
print(list_one)
a=c(1,2,3,4)
b=as.factor(a)
b
c=as.ordered(a)
c
is.ordered(c)

