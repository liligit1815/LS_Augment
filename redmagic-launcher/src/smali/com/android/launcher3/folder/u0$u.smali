.class Lcom/android/launcher3/folder/u0$u;
.super Ljava/lang/Object;
.source "PreviewBackground.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->m0(Lcom/android/launcher3/folder/FolderIcon;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
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

.field final synthetic k:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Landroid/graphics/Rect;IIF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$u;->k:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$u;->g:Landroid/graphics/Rect;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/folder/u0$u;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/folder/u0$u;->i:I

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/folder/u0$u;->j:F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
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
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$u;->k:Lcom/android/launcher3/folder/u0;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->u(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$u;->g:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget v2, p0, Lcom/android/launcher3/folder/u0$u;->h:I

    .line 14
    .line 15
    iget v3, p0, Lcom/android/launcher3/folder/u0$u;->i:I

    .line 16
    .line 17
    const/high16 v4, 0x3f800000    # 1.0f

    .line 18
    .line 19
    iget v5, p0, Lcom/android/launcher3/folder/u0$u;->j:F

    .line 20
    .line 21
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->x0(FLandroid/graphics/Rect;IIFF)Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$u;->k:Lcom/android/launcher3/folder/u0;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$u;->k:Lcom/android/launcher3/folder/u0;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method
