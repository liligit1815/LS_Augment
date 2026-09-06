.class Lcom/android/launcher3/folder/u0$q;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->X(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$q;->g:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$q;->g:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/android/launcher3/folder/u0;->w:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$q;->g:Lcom/android/launcher3/folder/u0;

    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/android/launcher3/folder/u0;->x:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/folder/u0;->y:Z

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/android/launcher3/folder/u0;->v:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$q;->g:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/android/launcher3/folder/u0;->x:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/android/launcher3/folder/u0;->y:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method
