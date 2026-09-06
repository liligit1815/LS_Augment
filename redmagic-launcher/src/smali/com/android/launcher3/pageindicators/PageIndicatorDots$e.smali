.class Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;
.super Landroid/view/ViewOutlineProvider;
.source "PageIndicatorDots.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/pageindicators/PageIndicatorDots;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "e"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/pageindicators/PageIndicatorDots;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;->a:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;Lcom/android/launcher3/pageindicators/f;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;-><init>(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;->a:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->h(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)[F

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->G()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->r()Landroid/graphics/RectF;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;->a:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->p(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)Landroid/graphics/RectF;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_0
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 27
    .line 28
    float-to-int v2, v0

    .line 29
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 30
    .line 31
    float-to-int v3, v0

    .line 32
    iget v0, p1, Landroid/graphics/RectF;->right:F

    .line 33
    .line 34
    float-to-int v4, v0

    .line 35
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 36
    .line 37
    float-to-int v5, p1

    .line 38
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots$e;->a:Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->g(Lcom/android/launcher3/pageindicators/PageIndicatorDots;)F

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    move-object v1, p2

    .line 45
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method
