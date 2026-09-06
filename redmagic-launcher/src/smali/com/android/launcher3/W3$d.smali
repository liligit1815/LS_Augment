.class Lcom/android/launcher3/W3$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MFVAnimationSets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/W3;->w(Lcom/android/launcher3/C2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;

.field final synthetic h:Lcom/android/launcher3/W3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/W3;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/W3$d;->h:Lcom/android/launcher3/W3;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/W3$d;->g:Lcom/android/launcher3/C2;

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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "MFVAnimationSets"

    .line 5
    .line 6
    const-string v0, "launcherIconAnimation: simplePhoneUnlockAnimator end!!!"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/W3$d;->h:Lcom/android/launcher3/W3;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/W3$d;->g:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/android/launcher3/W3;->d(Lcom/android/launcher3/W3;Lcom/android/launcher3/C2;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/W3$d;->h:Lcom/android/launcher3/W3;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/W3$d;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-static {p1, p0}, Lcom/android/launcher3/W3;->a(Lcom/android/launcher3/W3;Lcom/android/launcher3/C2;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "MFVAnimationSets"

    .line 5
    .line 6
    const-string v0, "launcherIconAnimation: simplePhoneUnlockAnimator start!!!"

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    sput-boolean p1, Lcom/android/launcher3/W3;->A:Z

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/W3$d;->h:Lcom/android/launcher3/W3;

    .line 15
    .line 16
    sget-object p1, Lcom/android/launcher3/W3$e;->m:Lcom/android/launcher3/W3$e;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/W3;->B(Lcom/android/launcher3/W3$e;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
