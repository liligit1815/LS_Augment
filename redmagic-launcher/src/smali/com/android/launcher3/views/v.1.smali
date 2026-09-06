.class public final Lcom/android/launcher3/views/v;
.super Landroid/graphics/drawable/Drawable;
.source "DoubleShadowIconDrawable.kt"


# instance fields
.field private final a:Lcom/android/launcher3/views/Q;

.field private final b:I

.field private final c:Landroid/graphics/drawable/InsetDrawable;

.field private final d:Landroid/graphics/RenderNode;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/views/Q;Landroid/graphics/drawable/Drawable;II)V
    .locals 1

    .line 1
    const-string v0, "shadowInfo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconDrawable"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 15
    .line 16
    iput p3, p0, Lcom/android/launcher3/views/v;->b:I

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/drawable/InsetDrawable;

    .line 19
    .line 20
    invoke-direct {p1, p2, p4}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-virtual {p1, p2, p2, p3, p3}, Landroid/graphics/drawable/InsetDrawable;->setBounds(IIII)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/views/v;->b()Landroid/graphics/RenderNode;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/android/launcher3/views/v;->d:Landroid/graphics/RenderNode;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a(FFFF)Landroid/graphics/RenderEffect;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/PorterDuffColorFilter;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p4, v0, v0, v0}, Landroid/graphics/Color;->argb(FFFF)I

    .line 5
    .line 6
    .line 7
    move-result p4

    .line 8
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 9
    .line 10
    invoke-direct {p0, p4, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 11
    .line 12
    .line 13
    sget-object p4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 14
    .line 15
    invoke-static {p1, p1, p4}, Landroid/graphics/RenderEffect;->createBlurEffect(FFLandroid/graphics/Shader$TileMode;)Landroid/graphics/RenderEffect;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p2, p3, p1}, Landroid/graphics/RenderEffect;->createOffsetEffect(FFLandroid/graphics/RenderEffect;)Landroid/graphics/RenderEffect;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Landroid/graphics/RenderEffect;->createColorFilterEffect(Landroid/graphics/ColorFilter;Landroid/graphics/RenderEffect;)Landroid/graphics/RenderEffect;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "createColorFilterEffect(...)"

    .line 28
    .line 29
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public final b()Landroid/graphics/RenderNode;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/RenderNode;

    .line 2
    .line 3
    const-string v1, "DoubleShadowNode"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/RenderNode;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iget v2, p0, Lcom/android/launcher3/views/v;->b:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, v1, v2, v2}, Landroid/graphics/RenderNode;->setPosition(IIII)Z

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/views/Q;->a()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->b()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {p0, v1, v3, v3, v2}, Lcom/android/launcher3/views/v;->a(FFFF)Landroid/graphics/RenderEffect;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/views/Q;->c()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object v3, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/android/launcher3/views/Q;->e()F

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    iget-object v4, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 49
    .line 50
    invoke-virtual {v4}, Lcom/android/launcher3/views/Q;->f()F

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    iget-object v5, p0, Lcom/android/launcher3/views/v;->a:Lcom/android/launcher3/views/Q;

    .line 55
    .line 56
    invoke-virtual {v5}, Lcom/android/launcher3/views/Q;->d()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    int-to-float v5, v5

    .line 65
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/android/launcher3/views/v;->a(FFFF)Landroid/graphics/RenderEffect;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object v2, Landroid/graphics/BlendMode;->DST_ATOP:Landroid/graphics/BlendMode;

    .line 70
    .line 71
    invoke-static {v1, p0, v2}, Landroid/graphics/RenderEffect;->createBlendModeEffect(Landroid/graphics/RenderEffect;Landroid/graphics/RenderEffect;Landroid/graphics/BlendMode;)Landroid/graphics/RenderEffect;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string v1, "createBlendModeEffect(...)"

    .line 76
    .line 77
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p0}, Landroid/graphics/RenderNode;->setRenderEffect(Landroid/graphics/RenderEffect;)Z

    .line 81
    .line 82
    .line 83
    return-object v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/views/v;->d:Landroid/graphics/RenderNode;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/RenderNode;->hasDisplayList()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/views/v;->d:Landroid/graphics/RenderNode;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/graphics/RenderNode;->beginRecording()Landroid/graphics/RecordingCanvas;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "beginRecording(...)"

    .line 29
    .line 30
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/InsetDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/views/v;->d:Landroid/graphics/RenderNode;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/graphics/RenderNode;->endRecording()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/v;->d:Landroid/graphics/RenderNode;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawRenderNode(Landroid/graphics/RenderNode;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/InsetDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/v;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/views/v;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/InsetDrawable;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/InsetDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTint(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/InsetDrawable;->setTint(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/v;->c:Landroid/graphics/drawable/InsetDrawable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/InsetDrawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
