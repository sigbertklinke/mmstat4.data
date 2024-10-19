from plotnine import ggplot, aes, geom_point, labs
df = r["MASS::Boston"]
p = ggplot(df, aes(x='lstat', y='medv')) + geom_point(color='blue')+\
               labs(x='Lstat', y='Medv', title='Boston Housing data')
p.save("ggplot.pdf")
