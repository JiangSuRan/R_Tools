# ============================================================================
# colors.r — 配色收藏脚本
# source("colors.r") 加载所有色板
# ============================================================================

library(RColorBrewer)
library(viridis)


# === 离散色板 ===

# 36 色通用色盘
my36colors <- c('#E5D2DD', '#53A85F', '#F1BB72', '#F3B1A0', '#D6E7A3', '#57C3F3', '#476D87',
                '#E95C59', '#E59CC4', '#AB3282', '#23452F', '#BD956A', '#8C549C', '#585658',
                '#9FA3A8', '#E0D4CA', '#5F3D69', '#C5DEBA', '#58A4C3', '#E4C755', '#F7F398',
                '#AA9A59', '#E63863', '#E39A35', '#C1E6F3', '#6778AE', '#91D0BE', '#B53E2B',
                '#712820', '#DCC1DD', '#CCE0F5', '#CCC9E6', '#625D9E', '#68A180', '#3A6963',
                '#968175')

# 组织色盘
tissue_colors <- c("#4DAF4A", "#377EB8", "#984EA3", "#E41A1C")
names(tissue_colors) <- c("Tissue_A", "Tissue_B", "Tissue_C", "Tissue_D")

# RColorBrewer Set1 8 色
coul_discrete <- colorRampPalette(brewer.pal(8, "Set1"))(8)


# === 连续色板 ===

# RdBu 30 阶（负=蓝，正=红）
coul_heatmap <- rev(colorRampPalette(brewer.pal(9, "RdBu"))(30))

# viridis 感知均匀色阶
coul_viridis  <- viridis::viridis(30)   # 紫→蓝→蓝绿→绿→黄
coul_magma    <- viridis::magma(30)     # 黑紫→紫→玫红→橙→亮黄
coul_plasma   <- viridis::plasma(30)    # 深紫→紫红→橙红→橙黄→亮黄
coul_inferno  <- viridis::inferno(30)   # 黑→紫→橙红→橙→亮黄
coul_cividis  <- viridis::cividis(30)   # 蓝→黄（色盲友好）

# RColorBrewer 序列型 9 阶
coul_seq_orrd    <- brewer.pal(9, "OrRd")    # 橙红
coul_seq_bupu    <- brewer.pal(9, "BuPu")    # 蓝紫
coul_seq_purd    <- brewer.pal(9, "PuRd")    # 紫红
coul_seq_pubugn  <- brewer.pal(9, "PuBuGn")  # 紫蓝绿
coul_seq_ylorrd  <- brewer.pal(9, "YlOrRd")  # 黄橙红
coul_seq_gnbu    <- brewer.pal(9, "GnBu")    # 绿蓝
coul_seq_reds    <- brewer.pal(9, "Reds")    # 纯红
coul_seq_blues   <- brewer.pal(9, "Blues")   # 纯蓝
coul_seq_purples <- brewer.pal(9, "Purples") # 纯紫
coul_seq_greens  <- brewer.pal(9, "Greens")  # 纯绿
coul_seq_ylgn    <- brewer.pal(9, "YlGn")    # 黄绿
coul_seq_ylgnbu  <- brewer.pal(9, "YlGnBu")  # 黄绿蓝
coul_seq_ylorbr  <- brewer.pal(9, "YlOrBr")  # 黄橙棕

# RColorBrewer 发散型 11 阶
coul_div_rdbu    <- rev(brewer.pal(11, "RdBu"))   # 红-蓝
coul_div_rdylbu  <- rev(brewer.pal(11, "RdYlBu")) # 红黄蓝
coul_div_piyg    <- rev(brewer.pal(11, "PiYG"))   # 紫绿
coul_div_prgn    <- rev(brewer.pal(11, "PRGn"))   # 紫绿


# === 自定义插值色阶（colorRampPalette）===

cc_blue_white_red  <- colorRampPalette(c("#0000FF", "#FFFFFF", "#FF0000")) # 蓝→白→红
cc_navy_white_red  <- colorRampPalette(c("navy", "white", "firebrick3"))   # navy→白→firebrick

my_palette_hot <- colorRampPalette(c("#fef0d9", "#fc8d59", "#b30000"))(10)  # 细胞通讯 dotplot

# 多彩过渡
cc_white_orange_purple <- colorRampPalette(c("white", "#F47E5D", "#463873"))
cc_purple_yellow       <- colorRampPalette(c("#352a86", "#095cd8", "#46b896", "#e7ba4a", "#f8fa0d"))
cc_deeppurple_yellow   <- colorRampPalette(c("#000075", "#9c0ef0", "#fc58a6", "#ffa955", "#ffff60"))

cc_grey_pink <- colorRampPalette(c("grey90", "#fc58a6"))


# === ggplot2 发散标度（midpoint=0）===

cc_div_blue_white_red <- function(...) {
  scale_colour_gradient2(low = "#3B4CC0", mid = "white", high = "#B40426",
                         midpoint = 0, ...)
}
cc_div_purple_orange <- function(...) {
  scale_colour_gradient2(low = "#5E3C99", mid = "white", high = "#E66101",
                         midpoint = 0, ...)
}
cc_div_green_magenta <- function(...) {
  scale_colour_gradient2(low = "#1B7837", mid = "white", high = "#762A83",
                         midpoint = 0, ...)
}
cc_div_brown_teal <- function(...) {
  scale_colour_gradient2(low = "#A6611A", mid = "white", high = "#018571",
                         midpoint = 0, ...)
}


# === 辅助函数 ===

view_palette <- function(cols, title = "") {
  n <- length(cols)
  image(matrix(1:n, nrow = 1), col = cols, axes = FALSE, main = title)
  text(seq(0, 1, length.out = n), par("usr")[3] - 0.1,
       labels = cols, srt = 45, adj = 1, xpd = TRUE, cex = 0.7)
}
