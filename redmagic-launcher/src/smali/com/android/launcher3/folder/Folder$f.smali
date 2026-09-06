.class Lcom/android/launcher3/folder/Folder$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Folder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/Folder;->G0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/Folder;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/Folder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

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
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->m0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/anim/M;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->m0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/anim/M;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setWindowInsetsAnimationCallback(Landroid/view/WindowInsetsAnimation$Callback;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/Folder;->r0(Lcom/android/launcher3/folder/Folder;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->v0(Lcom/android/launcher3/folder/Folder;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/Folder;->p0(Lcom/android/launcher3/folder/Folder;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/16 v0, 0x20

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->k0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/globalsearch/r$b;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->k0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/globalsearch/r$b;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/r$b;->b()V

    .line 67
    .line 68
    .line 69
    :cond_1
    const-string p0, "Launcher.Folder"

    .line 70
    .line 71
    const-string p1, "animateClose--End"

    .line 72
    .line 73
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setWindowInsetsAnimationCallback(Landroid/view/WindowInsetsAnimation$Callback;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/Folder;->p0(Lcom/android/launcher3/folder/Folder;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "Launcher.Folder"

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const-string p0, "Folder close onAnimationStart OverViewPanelMFV is null"

    .line 30
    .line 31
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/q4;->a0()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v1, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/E2;->d(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v1, "animateClose--Start, folder: "

    .line 82
    .line 83
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$f;->g:Lcom/android/launcher3/folder/Folder;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-void
.end method
