.class public Lcom/android/launcher3/anim/d0;
.super Lcom/android/launcher3/anim/c0;
.source "RoundedRectRevealOutlineProvider.java"


# instance fields
.field private final c:F

.field private final d:F

.field private final e:Landroid/graphics/Rect;

.field private final f:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/anim/c0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/anim/d0;->c:F

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/anim/d0;->d:F

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/anim/d0;->e:Landroid/graphics/Rect;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/anim/d0;->f:Landroid/graphics/Rect;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public f(F)V
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr v0, p1

    .line 4
    iget v1, p0, Lcom/android/launcher3/anim/d0;->c:F

    .line 5
    .line 6
    mul-float/2addr v1, v0

    .line 7
    iget v2, p0, Lcom/android/launcher3/anim/d0;->d:F

    .line 8
    .line 9
    mul-float/2addr v2, p1

    .line 10
    add-float/2addr v1, v2

    .line 11
    iput v1, p0, Lcom/android/launcher3/anim/c0;->b:F

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/anim/c0;->a:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/anim/d0;->e:Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    int-to-float v3, v3

    .line 20
    mul-float/2addr v3, v0

    .line 21
    iget-object p0, p0, Lcom/android/launcher3/anim/d0;->f:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget v4, p0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    int-to-float v4, v4

    .line 26
    mul-float/2addr v4, p1

    .line 27
    add-float/2addr v3, v4

    .line 28
    float-to-int v3, v3

    .line 29
    iput v3, v1, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    mul-float/2addr v3, v0

    .line 35
    iget v4, p0, Landroid/graphics/Rect;->top:I

    .line 36
    .line 37
    int-to-float v4, v4

    .line 38
    mul-float/2addr v4, p1

    .line 39
    add-float/2addr v3, v4

    .line 40
    float-to-int v3, v3

    .line 41
    iput v3, v1, Landroid/graphics/Rect;->top:I

    .line 42
    .line 43
    iget v3, v2, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    int-to-float v3, v3

    .line 46
    mul-float/2addr v3, v0

    .line 47
    iget v4, p0, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    int-to-float v4, v4

    .line 50
    mul-float/2addr v4, p1

    .line 51
    add-float/2addr v3, v4

    .line 52
    float-to-int v3, v3

    .line 53
    iput v3, v1, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 56
    .line 57
    int-to-float v2, v2

    .line 58
    mul-float/2addr v0, v2

    .line 59
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    mul-float/2addr p1, p0

    .line 63
    add-float/2addr v0, p1

    .line 64
    float-to-int p0, v0

    .line 65
    iput p0, v1, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
