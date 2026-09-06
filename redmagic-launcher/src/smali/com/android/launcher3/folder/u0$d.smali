.class Lcom/android/launcher3/folder/u0$d;
.super Ljava/lang/Object;
.source "PreviewBackground.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->U(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Landroid/util/Pair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/graphics/Rect;

.field final synthetic h:I

.field final synthetic i:I

.field final synthetic j:F

.field final synthetic k:Landroid/graphics/Rect;

.field final synthetic l:I

.field final synthetic m:I

.field final synthetic n:Landroid/graphics/Rect;

.field final synthetic o:I

.field final synthetic p:I

.field final synthetic q:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Landroid/graphics/Rect;IIFLandroid/graphics/Rect;IILandroid/graphics/Rect;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$d;->g:Landroid/graphics/Rect;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/folder/u0$d;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/folder/u0$d;->i:I

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/folder/u0$d;->j:F

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/folder/u0$d;->k:Landroid/graphics/Rect;

    .line 12
    .line 13
    iput p7, p0, Lcom/android/launcher3/folder/u0$d;->l:I

    .line 14
    .line 15
    iput p8, p0, Lcom/android/launcher3/folder/u0$d;->m:I

    .line 16
    .line 17
    iput-object p9, p0, Lcom/android/launcher3/folder/u0$d;->n:Landroid/graphics/Rect;

    .line 18
    .line 19
    iput p10, p0, Lcom/android/launcher3/folder/u0$d;->o:I

    .line 20
    .line 21
    iput p11, p0, Lcom/android/launcher3/folder/u0$d;->p:I

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->u(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->u(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$d;->g:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget v2, p0, Lcom/android/launcher3/folder/u0$d;->h:I

    .line 22
    .line 23
    iget v3, p0, Lcom/android/launcher3/folder/u0$d;->i:I

    .line 24
    .line 25
    const/high16 v4, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iget v5, p0, Lcom/android/launcher3/folder/u0$d;->j:F

    .line 28
    .line 29
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->x0(FLandroid/graphics/Rect;IIFF)Landroid/graphics/Rect;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->w(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->w(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$d;->k:Landroid/graphics/Rect;

    .line 51
    .line 52
    iget v2, p0, Lcom/android/launcher3/folder/u0$d;->l:I

    .line 53
    .line 54
    iget v3, p0, Lcom/android/launcher3/folder/u0$d;->m:I

    .line 55
    .line 56
    const/high16 v4, 0x3f800000    # 1.0f

    .line 57
    .line 58
    iget v5, p0, Lcom/android/launcher3/folder/u0$d;->j:F

    .line 59
    .line 60
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->x0(FLandroid/graphics/Rect;IIFF)Landroid/graphics/Rect;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->x(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->x(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$d;->n:Landroid/graphics/Rect;

    .line 82
    .line 83
    iget v2, p0, Lcom/android/launcher3/folder/u0$d;->o:I

    .line 84
    .line 85
    iget v3, p0, Lcom/android/launcher3/folder/u0$d;->p:I

    .line 86
    .line 87
    const/high16 v4, 0x3f800000    # 1.0f

    .line 88
    .line 89
    iget v5, p0, Lcom/android/launcher3/folder/u0$d;->j:F

    .line 90
    .line 91
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->x0(FLandroid/graphics/Rect;IIFF)Landroid/graphics/Rect;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 99
    .line 100
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$d;->q:Lcom/android/launcher3/folder/u0;

    .line 107
    .line 108
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 113
    .line 114
    .line 115
    :cond_3
    return-void
.end method
