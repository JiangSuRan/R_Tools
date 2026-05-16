# --- 36 色调色盘（通用）---
my36colors <- c('#E5D2DD', '#53A85F', '#F1BB72', '#F3B1A0', '#D6E7A3', '#57C3F3', '#476D87',
                '#E95C59', '#E59CC4', '#AB3282', '#23452F', '#BD956A', '#8C549C', '#585658',
                '#9FA3A8', '#E0D4CA', '#5F3D69', '#C5DEBA', '#58A4C3', '#E4C755', '#F7F398',
                '#AA9A59', '#E63863', '#E39A35', '#C1E6F3', '#6778AE', '#91D0BE', '#B53E2B',
                '#712820', '#DCC1DD', '#CCE0F5', '#CCC9E6', '#625D9E', '#68A180', '#3A6963',
                '#968175')
# 使用: DimPlot(obj, cols = my36colors)
#        scale_fill_manual(values = my36colors[1:n])

# --- 4 色组织色盘 ---
tissue_colors <- c("#4DAF4A", "#377EB8", "#984EA3", "#E41A1C")
names(tissue_colors) <- c("Tissue_A", "Tissue_B", "Tissue_C", "Tissue_D")

# --- 离散 8 色（RColorBrewer::Set1）---
library(RColorBrewer)
coul_discrete <- colorRampPalette(brewer.pal(8, "Set1"))(8)
# 红 #E41A1C / 蓝 #377EB8 / 绿 #4DAF4A / 紫 #984EA3
# 橙 #FF7F00 / 黄 #FFFF33 / 棕 #A65628 / 粉 #F781BF

# --- 热图发散色阶 RdBu 30 阶（0 值=白，负=蓝，正=红）---
coul_heatmap <- rev(colorRampPalette(brewer.pal(9, "RdBu"))(30))
# 使用: pheatmap::pheatmap(mat, color = coul_heatmap)

# --- 感知均匀色阶 viridis ---
library(viridis)
# pheatmap: pheatmap::pheatmap(expr_mat, color = viridis::magma(20))
# ggplot2:  viridis::scale_color_viridis(option = "viridis")
# viridis  → 紫→蓝→蓝绿→绿→黄
# magma    → 黑紫→紫→玫红→橙→亮黄
# plasma   → 深紫→紫红→橙红→橙黄→亮黄
# inferno  → 黑→紫→橙红→橙→亮黄

# --- ArchR 直方图色阶 ---
# plotFragmentSizes(..., color = paletteContinuous("whiteBlue"))
# 其他内置: "solarExtra", "greenBlue", "blueWhite", "greySeq"

# --- 自定义插值 colorRampPalette 集锦 ---
# 浅橙→深红（细胞通讯 dotplot 用）
my_palette_hot <- colorRampPalette(c("#fef0d9", "#fc8d59", "#b30000"))(10)
# 白→橙→深紫（拟序列车）
cc_white_orange_purple <- colorRampPalette(c("white", "#F47E5D", "#463873"))
# 蓝→白→红（连续表达图）
cc_blue_white_red <- colorRampPalette(c("#0000FF", "#FFFFFF", "#FF0000"))(100)
# 深紫→蓝→绿→金黄→亮黄
cc_purple_yellow <- colorRampPalette(c("#352a86", "#095cd8", "#46b896", "#e7ba4a", "#f8fa0d"))
# navy→白→firebrick
cc_navy_white_red <- colorRampPalette(c("navy", "white", "firebrick3"))(40)
# 深紫→紫红→粉→橙→黄
cc_deeppurple_yellow <- colorRampPalette(c("#000075", "#9c0ef0", "#fc58a6", "#ffa955", "#ffff60"))
# 灰→粉
cc_grey_pink <- colorRampPalette(c("grey90", "#fc58a6"))
# 分段插值: 3 色拆两段，确保中间色严格在中点
# c(colorRampPalette(c("#ff59ff","#080704"))(20),
#   colorRampPalette(c("#080704","#fffb06"))(20))

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