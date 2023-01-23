library(lattice)

# trellis1.pdf
pdf("trellis1.pdf", bg="transparent")
plot <- barchart(yield ~ variety | site, data = barley,
                 groups = year, layout = c(1,6), stack = TRUE,
                 auto.key = list(space = "right"),
                 ylab = "Barley Yield (bushels/acre)",
                 scales = list(x = list(rot = 45)))
print(plot)
dev.off()

# trellis2.pdf
pdf("trellis2.pdf", bg="transparent")
plot <- xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
               data = iris, scales = "free", layout = c(2, 2),
               auto.key = list(x = .6, y = .7, corner = c(0, 0)))
print(plot)
dev.off()

# trellis3.pdf
pdf("trellis3.pdf", bg="transparent")
Depth <- equal.count(quakes$depth, number=8, overlap=.1)
plot <- xyplot(lat ~ long | Depth, data = quakes)
print(plot)
dev.off()
