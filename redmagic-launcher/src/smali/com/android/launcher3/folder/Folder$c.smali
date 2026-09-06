.class Lcom/android/launcher3/folder/Folder$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Folder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/Folder;->x0(Landroid/animation/AnimatorSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/animation/AnimatorSet;

.field final synthetic h:Lcom/android/launcher3/folder/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/Folder$c;->g:Landroid/animation/AnimatorSet;

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
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/Folder;->o0(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->t0(Landroid/animation/AnimatorSet;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->w4(Landroid/animation/AnimatorSet;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->setState(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder$c;->g:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/Folder;->o0(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->g:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->t0(Landroid/animation/AnimatorSet;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$c;->h:Lcom/android/launcher3/folder/Folder;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->j0(Lcom/android/launcher3/folder/Folder;)Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lcom/android/launcher3/C2;->w4(Landroid/animation/AnimatorSet;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
