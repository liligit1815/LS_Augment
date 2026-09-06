.class public final Lcom/android/launcher3/taskbar/c;
.super Landroid/graphics/drawable/DrawableWrapper;
.source "BlurredBitmapDrawable.kt"


# instance fields
.field private final g:Landroid/graphics/RenderNode;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;F)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p2}, Lcom/android/launcher3/taskbar/c;-><init>(Landroid/graphics/Bitmap;FF)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;FF)V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-direct {p0, v0}, Landroid/graphics/drawable/DrawableWrapper;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 2
    new-instance p1, Landroid/graphics/RenderNode;

    const-string v0, "BlurredConstraintLayoutBlurNode"

    invoke-direct {p1, v0}, Landroid/graphics/RenderNode;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/c;->g:Landroid/graphics/RenderNode;

    .line 3
    sget-object p0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-static {p2, p3, p0}, Landroid/graphics/RenderEffect;->createBlurEffect(FFLandroid/graphics/Shader$TileMode;)Landroid/graphics/RenderEffect;

    move-result-object p0

    .line 4
    invoke-virtual {p1, p0}, Landroid/graphics/RenderNode;->setRenderEffect(Landroid/graphics/RenderEffect;)Z

    return-void
.end method


# virtual methods
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
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-super {p0, p1}, Landroid/graphics/drawable/DrawableWrapper;->draw(Landroid/graphics/Canvas;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c;->g:Landroid/graphics/RenderNode;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/DrawableWrapper;->getBounds()Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/RenderNode;->setPosition(Landroid/graphics/Rect;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c;->g:Landroid/graphics/RenderNode;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/graphics/RenderNode;->hasDisplayList()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c;->g:Landroid/graphics/RenderNode;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/graphics/RenderNode;->beginRecording()Landroid/graphics/RecordingCanvas;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "beginRecording(...)"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-super {p0, v0}, Landroid/graphics/drawable/DrawableWrapper;->draw(Landroid/graphics/Canvas;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c;->g:Landroid/graphics/RenderNode;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/graphics/RenderNode;->endRecording()V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c;->g:Landroid/graphics/RenderNode;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawRenderNode(Landroid/graphics/RenderNode;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method
