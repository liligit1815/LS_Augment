.class public final synthetic LT0/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/Workspace;

.field public final synthetic h:Lcom/android/launcher3/C2;

.field public final synthetic i:Lcom/android/launcher3/Hotseat;

.field public final synthetic j:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

.field public final synthetic k:Lcom/android/launcher3/LongClickTextView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/C2;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LT0/c;->g:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iput-object p2, p0, LT0/c;->h:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    iput-object p3, p0, LT0/c;->i:Lcom/android/launcher3/Hotseat;

    .line 9
    .line 10
    iput-object p4, p0, LT0/c;->j:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 11
    .line 12
    iput-object p5, p0, LT0/c;->k:Lcom/android/launcher3/LongClickTextView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, LT0/c;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    iget-object v1, p0, LT0/c;->h:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iget-object v2, p0, LT0/c;->i:Lcom/android/launcher3/Hotseat;

    .line 6
    .line 7
    iget-object v3, p0, LT0/c;->j:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 8
    .line 9
    iget-object v4, p0, LT0/c;->k:Lcom/android/launcher3/LongClickTextView;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    invoke-static/range {v0 .. v5}, LT0/p;->p(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/C2;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
