.class Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->U(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;->g:I

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->H(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$g;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->a(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;)Lcom/android/launcher3/mfvUtil/customsnackbar/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    const/16 v0, 0xb4

    .line 9
    .line 10
    invoke-interface {p0, p1, v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/a;->b(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
