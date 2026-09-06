.class Lcom/android/launcher3/folder/Folder$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Folder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/Folder;->H0(Ljava/util/List;I)V
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
    iput-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/T;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/widget/T;->A()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->setState(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/cloudfolder/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/cloudfolder/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/cloudfolder/a;->n()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->s0(Lcom/android/launcher3/folder/Folder;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->u0(Lcom/android/launcher3/folder/Folder;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v0, "TAPL_FOLDER_OPENED"

    .line 41
    .line 42
    invoke-static {p1, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendTestProtocolEventToTest(Landroid/content/Context;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->t0()V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/16 v0, 0x30

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->k0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/globalsearch/r$b;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 78
    .line 79
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->k0(Lcom/android/launcher3/folder/Folder;)Lcom/android/launcher3/globalsearch/r$b;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/r$b;->b()V

    .line 84
    .line 85
    .line 86
    :cond_1
    const-string p0, "Launcher.Folder"

    .line 87
    .line 88
    const-string p1, "animateOpen--End"

    .line 89
    .line 90
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "animateOpen--Start, folder: "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "Launcher.Folder"

    .line 25
    .line 26
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lx1/O;->q2()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder$e;->g:Lcom/android/launcher3/folder/Folder;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getRightCellLayout()Lcom/android/launcher3/CellLayout;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance p1, Lcom/android/launcher3/folder/y;

    .line 42
    .line 43
    invoke-direct {p1}, Lcom/android/launcher3/folder/y;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p0, p1}, Lcom/android/launcher3/Workspace;->h2(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/util/Y0$a;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
