.class public Ly1/f;
.super Ljava/lang/Object;
.source "MiBoardLauncherCallbacks.java"

# interfaces
.implements Lcom/android/launcher3/V2;
.implements Lz2/a;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Lcom/android/launcher3/C2;

.field private c:Ly1/b;

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MiBoardLauncherCallbacks"

    .line 5
    .line 6
    iput-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ly1/f;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "{@"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, "}Launcher{@"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, "}:"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 60
    .line 61
    const-string v1, "MiBoardLauncherCallbacks init "

    .line 62
    .line 63
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 67
    .line 68
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 69
    .line 70
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iput-boolean p1, p0, Ly1/f;->g:Z

    .line 75
    .line 76
    new-instance p1, Ly1/h;

    .line 77
    .line 78
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 79
    .line 80
    invoke-direct {p1, v0}, Ly1/h;-><init>(Lcom/android/launcher3/C2;)V

    .line 81
    .line 82
    .line 83
    new-instance v0, Ly1/b;

    .line 84
    .line 85
    iget-object v1, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 86
    .line 87
    const/4 v2, 0x1

    .line 88
    invoke-direct {v0, v1, p1, v2}, Ly1/b;-><init>(Landroid/app/Activity;Ly1/d;Z)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Ly1/f;->c:Ly1/b;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ly1/h;->j(Ly1/b;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 97
    .line 98
    iget-object v0, p0, Ly1/f;->c:Ly1/b;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Lcom/android/launcher3/C2;->y4(Ly1/b;)V

    .line 101
    .line 102
    .line 103
    iput-boolean v2, p0, Ly1/f;->d:Z

    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onActivityStopped"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ly1/f;->d:Z

    .line 10
    .line 11
    iget-boolean v1, p0, Ly1/f;->e:Z

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iput-boolean v0, p0, Ly1/f;->f:Z

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 26
    .line 27
    invoke-virtual {p0}, Ly1/b;->I()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 10
    .line 11
    invoke-virtual {p0}, Ly1/b;->y()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onActivityPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ly1/f;->e:Z

    .line 10
    .line 11
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 20
    .line 21
    invoke-virtual {p0}, Ly1/b;->F()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ly1/b;->o(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "hideOverlay animate= "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ly1/b;->o(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onActivityDestroyed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Ly1/b;->A()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onActivityStarted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ly1/f;->d:Z

    .line 10
    .line 11
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 12
    .line 13
    invoke-virtual {p0}, Ly1/b;->H()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public h(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string p1, "onCreate"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(IZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ly1/b;->z(IZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onHomeIntent internalStateHandled= "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, " mAlreadyOnHome= "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean v2, p0, Ly1/f;->f:Z

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " mStarted="

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-boolean v2, p0, Ly1/f;->d:Z

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, " isInMiBoard= "

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->R2()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    iget-boolean v0, p0, Ly1/f;->f:Z

    .line 58
    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    iget-boolean v0, p0, Ly1/f;->d:Z

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->s2(Z)V

    .line 93
    .line 94
    .line 95
    :cond_1
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ly1/b;->D(Z)V

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method

.method public k()V
    .locals 5

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onStateChanged MENU_OVERVIEW= "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    sget-object v3, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 16
    .line 17
    invoke-interface {v2, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, " NORMAL= "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 32
    .line 33
    invoke-interface {v2, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, " old= "

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-boolean v2, p0, Ly1/f;->g:Z

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    iget-boolean v0, p0, Ly1/f;->g:Z

    .line 58
    .line 59
    iget-object v1, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 60
    .line 61
    invoke-interface {v1, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput-boolean v1, p0, Ly1/f;->g:Z

    .line 66
    .line 67
    if-eq v1, v0, :cond_0

    .line 68
    .line 69
    invoke-virtual {p0}, Ly1/f;->p()V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public l(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "hideOverlay duration= "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ly1/b;->o(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onActivityResumed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ly1/f;->e:Z

    .line 10
    .line 11
    iget-boolean v1, p0, Ly1/f;->d:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iput-boolean v0, p0, Ly1/f;->f:Z

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 18
    .line 19
    invoke-virtual {p0}, Ly1/b;->G()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onAttachedToWindow"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Ly1/b;->x()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onDetachedFromWindow"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ly1/f;->c:Ly1/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Ly1/b;->B()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p()V
    .locals 5

    .line 1
    iget-object v0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->t:Z

    .line 12
    .line 13
    iget-object v1, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->s:Z

    .line 24
    .line 25
    iget-object v2, p0, Ly1/f;->a:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v4, "updateSwitchState changed circleSwitch= "

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v4, " customPageSwitch="

    .line 41
    .line 42
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v4, " mInMenuOverView= "

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-boolean v4, p0, Ly1/f;->g:Z

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    iget-boolean v1, p0, Ly1/f;->g:Z

    .line 70
    .line 71
    if-eqz v1, :cond_0

    .line 72
    .line 73
    iget-object p0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const/4 v0, 0x1

    .line 80
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setIsCircle(Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    iget-object p0, p0, Ly1/f;->b:Lcom/android/launcher3/C2;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->setIsCircle(Z)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method
