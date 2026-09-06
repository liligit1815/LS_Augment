.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;
.super Ljava/lang/Object;
.source "TransformFolderIcon.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->P0()V
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

.field final synthetic k:F

.field final synthetic l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;


# direct methods
.method constructor <init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Landroid/graphics/Rect;IIFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->g:Landroid/graphics/Rect;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->i:I

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->j:F

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->k:F

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
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->C0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->g:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget v2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->h:I

    .line 20
    .line 21
    iget v3, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->i:I

    .line 22
    .line 23
    iget v4, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->j:F

    .line 24
    .line 25
    iget v5, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->k:F

    .line 26
    .line 27
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->x0(FLandroid/graphics/Rect;IIFF)Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$a;->l:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
