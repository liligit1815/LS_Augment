.class public Lcom/android/launcher3/taskbar/K1;
.super Ljava/lang/Object;
.source "TaskbarAutohideSuspendController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Lcom/android/quickstep/SystemUiProxy;

.field private i:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/taskbar/K1;->g:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/android/quickstep/SystemUiProxy;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/taskbar/K1;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 18
    .line 19
    return-void
.end method

.method private static b(I)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "|"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_FULLSCREEN"

    .line 10
    .line 11
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_DRAGGING"

    .line 16
    .line 17
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_TOUCHING"

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v1, 0x8

    .line 27
    .line 28
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_EDU_OPEN"

    .line 29
    .line 30
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x10

    .line 34
    .line 35
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_IN_LAUNCHER"

    .line 36
    .line 37
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_TRANSIENT_TASKBAR"

    .line 43
    .line 44
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/16 v1, 0x80

    .line 48
    .line 49
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_MULTI_INSTANCE_MENU_OPEN"

    .line 50
    .line 51
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/16 v1, 0x100

    .line 55
    .line 56
    const-string v2, "FLAG_AUTOHIDE_SUSPEND_TASKBAR_OVERFLOW"

    .line 57
    .line 58
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method private c()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarAutohideSuspendController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, "\tmAutohideSuspendFlags="

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget p0, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 35
    .line 36
    invoke-static {p0}, Lcom/android/launcher3/taskbar/K1;->b(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x10

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, -0x21

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/K1;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SystemUiProxy;->notifyTaskbarAutohideSuspend(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(IZ)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    or-int/2addr p1, v0

    .line 6
    iput p1, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    not-int p1, p1

    .line 10
    and-int/2addr p1, v0

    .line 11
    iput p1, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 12
    .line 13
    :goto_0
    iget p1, p0, Lcom/android/launcher3/taskbar/K1;->i:I

    .line 14
    .line 15
    if-ne v0, p1, :cond_1

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/K1;->c()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object p2, p0, Lcom/android/launcher3/taskbar/K1;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Lcom/android/quickstep/SystemUiProxy;->notifyTaskbarAutohideSuspend(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/taskbar/K1;->g:Lcom/android/launcher3/taskbar/I1;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/K1;->e()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/I1;->b2(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
