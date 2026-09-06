.class public Lcom/android/launcher3/folder/y0;
.super Ljava/lang/Object;
.source "PreviewItemDrawingParams.java"


# instance fields
.field public a:F

.field b:F

.field c:F

.field public d:F

.field public e:Lcom/android/launcher3/folder/e0;

.field public f:Z

.field public g:Landroid/graphics/drawable/Drawable;

.field public h:Lcom/android/launcher3/model/data/y;


# direct methods
.method constructor <init>(FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/folder/y0;->b:F

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/folder/y0;->c:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/folder/y0;->d:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(FFF)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, v0, Lcom/android/launcher3/folder/e0;->d:[F

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    aget v2, v1, v2

    .line 9
    .line 10
    cmpl-float v2, v2, p1

    .line 11
    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    aget v2, v1, v2

    .line 16
    .line 17
    cmpl-float v2, v2, p2

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    aget v1, v1, v2

    .line 23
    .line 24
    cmpl-float v1, v1, p3

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/folder/e0;->d()V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    return-void

    .line 34
    :cond_2
    :goto_1
    iput p1, p0, Lcom/android/launcher3/folder/y0;->b:F

    .line 35
    .line 36
    iput p2, p0, Lcom/android/launcher3/folder/y0;->c:F

    .line 37
    .line 38
    iput p3, p0, Lcom/android/launcher3/folder/y0;->d:F

    .line 39
    .line 40
    return-void
.end method
