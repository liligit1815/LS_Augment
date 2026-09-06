.class Lcom/android/launcher3/folder/u0$l;
.super Ljava/lang/Object;
.source "PreviewBackground.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->n0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Ljava/lang/Runnable;)V
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

.field final synthetic k:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic l:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Landroid/graphics/Rect;IIFLcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$l;->l:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$l;->g:Landroid/graphics/Rect;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/folder/u0$l;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/folder/u0$l;->i:I

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/folder/u0$l;->j:F

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/folder/u0$l;->k:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
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
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$l;->l:Lcom/android/launcher3/folder/u0;

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
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$l;->l:Lcom/android/launcher3/folder/u0;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->u(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$l;->g:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget v2, p0, Lcom/android/launcher3/folder/u0$l;->h:I

    .line 22
    .line 23
    iget v3, p0, Lcom/android/launcher3/folder/u0$l;->i:I

    .line 24
    .line 25
    const/high16 v4, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iget v5, p0, Lcom/android/launcher3/folder/u0$l;->j:F

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
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$l;->l:Lcom/android/launcher3/folder/u0;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->y(Lcom/android/launcher3/folder/u0;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-float v1, v1

    .line 43
    mul-float/2addr v1, v0

    .line 44
    float-to-int v0, v1

    .line 45
    rsub-int/lit8 v0, v0, 0x0

    .line 46
    .line 47
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->G(Lcom/android/launcher3/folder/u0;I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$l;->k:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$l;->l:Lcom/android/launcher3/folder/u0;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$l;->l:Lcom/android/launcher3/folder/u0;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method
