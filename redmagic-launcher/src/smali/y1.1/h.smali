.class public Ly1/h;
.super Ljava/lang/Object;
.source "OverlayCallback.java"

# interfaces
.implements Lz2/a$a;
.implements Ly1/d;


# instance fields
.field private final a:Lcom/android/launcher3/C2;

.field private b:Ly1/b;

.field private c:Lz2/a$b;

.field private d:Z

.field protected e:Z

.field protected f:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ly1/h;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ly1/h;->a:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ly1/h;->c:Lz2/a$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lz2/a$b;->a(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(ZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onServiceStateChanged() called with: overlayAttached = ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "], hotwordActive = ["

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p2, "]"

    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string v0, "OverlayCallback"

    .line 32
    .line 33
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-boolean p2, p0, Ly1/h;->d:Z

    .line 37
    .line 38
    if-eq p1, p2, :cond_1

    .line 39
    .line 40
    iput-boolean p1, p0, Ly1/h;->d:Z

    .line 41
    .line 42
    iget-object p2, p0, Ly1/h;->b:Ly1/b;

    .line 43
    .line 44
    iget-boolean p2, p2, Ly1/b;->s:Z

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Ly1/h;->k(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Ly1/h;->a:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    :goto_0
    invoke-virtual {p2, p0}, Lcom/android/launcher3/C2;->z4(Lz2/a$c;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public c(FZ)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const v0, 0x3a83126f    # 0.001f

    .line 6
    .line 7
    .line 8
    cmpg-float p2, p2, v0

    .line 9
    .line 10
    if-gez p2, :cond_0

    .line 11
    .line 12
    new-instance p2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "onScrollChange progress="

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v0, "OverlayCallback"

    .line 30
    .line 31
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Ly1/h;->b:Ly1/b;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ly1/b;->N(F)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    const-string v0, "OverlayCallback"

    .line 2
    .line 3
    const-string v1, "onScrollInteractionEnd() called"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0, v0}, Ly1/h;->i(ZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e(Lz2/a$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly1/h;->c:Lz2/a$b;

    .line 2
    .line 3
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ly1/h;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()V
    .locals 2

    .line 1
    const-string v0, "OverlayCallback"

    .line 2
    .line 3
    const-string v1, "onScrollInteractionBegin() called"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ly1/h;->b:Ly1/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Ly1/b;->M()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ly1/h;->f:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ly1/h;->k(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ly1/h;->b:Ly1/b;

    .line 7
    .line 8
    iget-boolean p0, p0, Ly1/h;->e:Z

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ly1/b;->E(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i(ZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onScrollInteractionEnd() called with: isFling = ["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "], sameOrientation = ["

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "]"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "OverlayCallback"

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ly1/h;->b:Ly1/b;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Ly1/b;->q(ZZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public j(Ly1/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly1/h;->b:Ly1/b;

    .line 2
    .line 3
    return-void
.end method

.method protected k(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ly1/h;->f:Z

    .line 2
    .line 3
    iget-object v0, p0, Ly1/h;->a:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ly1/h;->a:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/r4;->B(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v1, 0x0

    .line 26
    :goto_0
    iput-boolean v1, p0, Ly1/h;->e:Z

    .line 27
    .line 28
    iget-object v1, p0, Ly1/h;->a:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->t1()V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v2, "setMiBoardSupportCircleScroll mCanCircleScroll= "

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-boolean p0, p0, Ly1/h;->e:Z

    .line 48
    .line 49
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p0, " miboardSupportCircleScroll= "

    .line 53
    .line 54
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string p0, " circleSwitchState="

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "OverlayCallback"

    .line 73
    .line 74
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return-void
.end method
