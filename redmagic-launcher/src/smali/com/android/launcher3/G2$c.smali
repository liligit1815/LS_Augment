.class Lcom/android/launcher3/G2$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LauncherAnimUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/G2;->f(Ljava/lang/Runnable;Z)Landroid/animation/Animator$AnimatorListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:Z

.field final synthetic h:Z

.field final synthetic i:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/G2$c;->h:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/G2$c;->i:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/android/launcher3/G2$c;->g:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/G2$c;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/android/launcher3/G2$c;->h:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/android/launcher3/G2$c;->g:Z

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/G2$c;->i:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method
