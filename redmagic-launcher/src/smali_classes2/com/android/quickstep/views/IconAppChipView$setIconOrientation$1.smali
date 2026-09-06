.class public final Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;
.super Landroid/view/ViewOutlineProvider;
.source "IconAppChipView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/IconAppChipView;->setIconOrientation(Lcom/android/quickstep/util/RecentsOrientedState;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private final mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/android/quickstep/views/IconAppChipView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/IconAppChipView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->this$0:Lcom/android/quickstep/views/IconAppChipView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final getMRtlAppliedOutlineBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 2

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "outline"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->this$0:Lcom/android/quickstep/views/IconAppChipView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/quickstep/views/IconAppChipView;->access$getBackgroundRelativeLtrLocation$p(Lcom/android/quickstep/views/IconAppChipView;)Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->this$0:Lcom/android/quickstep/views/IconAppChipView;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->this$0:Lcom/android/quickstep/views/IconAppChipView;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object v0, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->this$0:Lcom/android/quickstep/views/IconAppChipView;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/android/quickstep/views/IconAppChipView;->access$getBackgroundRelativeLtrLocation$p(Lcom/android/quickstep/views/IconAppChipView;)Landroid/graphics/Rect;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    sub-int v1, p1, v1

    .line 47
    .line 48
    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->this$0:Lcom/android/quickstep/views/IconAppChipView;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/android/quickstep/views/IconAppChipView;->access$getBackgroundRelativeLtrLocation$p(Lcom/android/quickstep/views/IconAppChipView;)Landroid/graphics/Rect;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    sub-int/2addr p1, v1

    .line 61
    iput p1, v0, Landroid/graphics/Rect;->right:I

    .line 62
    .line 63
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;->mRtlAppliedOutlineBounds:Landroid/graphics/Rect;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    int-to-float p1, p1

    .line 70
    const/high16 v0, 0x40000000    # 2.0f

    .line 71
    .line 72
    div-float/2addr p1, v0

    .line 73
    invoke-virtual {p2, p0, p1}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
