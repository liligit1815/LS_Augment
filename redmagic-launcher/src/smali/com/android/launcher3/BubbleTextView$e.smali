.class Lcom/android/launcher3/BubbleTextView$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BubbleTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/BubbleTextView;->s([F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:[F

.field final synthetic h:Lcom/android/launcher3/BubbleTextView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/BubbleTextView;[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/BubbleTextView$e;->g:[F

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView$e;->g:[F

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    :goto_0
    if-ge v2, v0, :cond_0

    .line 7
    .line 8
    aget v1, p1, v2

    .line 9
    .line 10
    add-int/lit8 v2, v2, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 16
    .line 17
    iput v1, p0, Ls1/m$a;->d:F

    .line 18
    .line 19
    new-instance p0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string p1, "onAnimationCancel: dot scale: "

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "BubbleTextView"

    .line 37
    .line 38
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/android/launcher3/BubbleTextView;->p(Lcom/android/launcher3/BubbleTextView;Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
