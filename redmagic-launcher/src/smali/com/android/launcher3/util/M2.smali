.class public Lcom/android/launcher3/util/M2;
.super Lcom/android/launcher3/util/i0;
.source "TranslateEdgeEffect.java"


# instance fields
.field private final a:Landroid/graphics/RenderNode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/i0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/RenderNode;

    .line 5
    .line 6
    const-string v0, "TranslateEdgeEffect"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Landroid/graphics/RenderNode;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/util/M2;->a:Landroid/graphics/RenderNode;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public d([F)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/M2;->a:Landroid/graphics/RenderNode;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1, v1}, Landroid/graphics/RenderNode;->beginRecording(II)Landroid/graphics/RecordingCanvas;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-super {p0, v0}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/util/M2;->a:Landroid/graphics/RenderNode;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/graphics/RenderNode;->endRecording()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0}, Landroid/widget/EdgeEffect;->getDistance()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    aput p0, p1, v1

    .line 23
    .line 24
    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
