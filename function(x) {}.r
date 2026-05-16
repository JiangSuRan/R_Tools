# function(x) {}

# --- 快速预览 ---
view_palette <- function(cols, title = "") {
  n <- length(cols)
  image(matrix(1:n, nrow = 1), col = cols, axes = FALSE, main = title)
  text(seq(0, 1, length.out = n), par("usr")[3] - 0.1,
       labels = cols, srt = 45, adj = 1, xpd = TRUE, cex = 0.7)
}
# view_palette(my36colors)

# 预览函数
view_palette <- function(cols, title = "") {
  n <- length(cols)
  image(matrix(1:n, nrow = 1), col = cols, axes = FALSE, main = title)
  text(seq(0, 1, length.out = n), par("usr")[3] - 0.1,
       labels = cols, srt = 45, adj = 1, xpd = TRUE, cex = 0.7)
}


