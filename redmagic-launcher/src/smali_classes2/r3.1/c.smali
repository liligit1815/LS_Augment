.class public final synthetic Lr3/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/google/android/material/sidesheet/SideSheetBehavior;

.field public final synthetic h:Landroid/view/ViewGroup$MarginLayoutParams;

.field public final synthetic i:I

.field public final synthetic j:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;Landroid/view/ViewGroup$MarginLayoutParams;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lr3/c;->g:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    .line 5
    .line 6
    iput-object p2, p0, Lr3/c;->h:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 7
    .line 8
    iput p3, p0, Lr3/c;->i:I

    .line 9
    .line 10
    iput-object p4, p0, Lr3/c;->j:Landroid/view/View;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lr3/c;->g:Lcom/google/android/material/sidesheet/SideSheetBehavior;

    .line 2
    .line 3
    iget-object v1, p0, Lr3/c;->h:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 4
    .line 5
    iget v2, p0, Lr3/c;->i:I

    .line 6
    .line 7
    iget-object p0, p0, Lr3/c;->j:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->K(Lcom/google/android/material/sidesheet/SideSheetBehavior;Landroid/view/ViewGroup$MarginLayoutParams;ILandroid/view/View;Landroid/animation/ValueAnimator;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
