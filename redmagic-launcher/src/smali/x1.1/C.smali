.class public Lx1/C;
.super Ljava/lang/Object;
.source "GridLoadingToast.java"


# static fields
.field private static i:Lx1/C;


# instance fields
.field private a:Lcom/zte/mifavor/widget/m;

.field private b:Landroid/os/Handler;

.field private c:Landroid/content/Context;

.field private d:Ljava/util/Timer;

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lx1/C;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lx1/C;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lx1/C;->g:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lx1/C;->h:Z

    .line 12
    .line 13
    iput-object p1, p0, Lx1/C;->c:Landroid/content/Context;

    .line 14
    .line 15
    new-instance p1, Lx1/C$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lx1/C$a;-><init>(Lx1/C;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lx1/C;->b:Landroid/os/Handler;

    .line 21
    .line 22
    return-void
.end method

.method static bridge synthetic a(Lx1/C;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/C;->b:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lx1/C;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/C;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lx1/C;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lx1/C;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(Lx1/C;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lx1/C;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(Landroid/content/Context;)Lx1/C;
    .locals 2

    .line 1
    const-class v0, Lx1/C;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lx1/C;->i:Lx1/C;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lx1/C;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lx1/C;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lx1/C;->i:Lx1/C;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p0, Lx1/C;->i:Lx1/C;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static g()Lx1/C;
    .locals 2

    .line 1
    const-class v0, Lx1/C;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lx1/C;->i:Lx1/C;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method private i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/m;->c()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lx1/C;->d:Ljava/util/Timer;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lx1/C;->d:Ljava/util/Timer;

    .line 19
    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lx1/C;->e:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lx1/C;->g:Z

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public e(Z)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lx1/C;->d:Ljava/util/Timer;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move p1, v0

    .line 15
    :goto_0
    iput-boolean p1, p0, Lx1/C;->g:Z

    .line 16
    .line 17
    :cond_1
    iget-boolean p1, p0, Lx1/C;->h:Z

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget-object p1, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 22
    .line 23
    if-eqz p1, :cond_6

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/m;->e()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_6

    .line 30
    .line 31
    iget-boolean p1, p0, Lx1/C;->e:Z

    .line 32
    .line 33
    if-eqz p1, :cond_6

    .line 34
    .line 35
    iget-boolean p1, p0, Lx1/C;->g:Z

    .line 36
    .line 37
    if-eqz p1, :cond_6

    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 40
    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/m;->c()V

    .line 44
    .line 45
    .line 46
    :cond_3
    iget-object p1, p0, Lx1/C;->d:Ljava/util/Timer;

    .line 47
    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/util/Timer;->cancel()V

    .line 51
    .line 52
    .line 53
    :cond_4
    new-instance p1, Landroid/content/Intent;

    .line 54
    .line 55
    const-string v1, "android.intent.action.MAIN"

    .line 56
    .line 57
    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lx1/C;->c:Landroid/content/Context;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    const/high16 v1, 0x14000000

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    const-string v1, "android.intent.category.HOME"

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    iget-boolean v1, p0, Lx1/C;->f:Z

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    :try_start_0
    iget-object v1, p0, Lx1/C;->c:Landroid/content/Context;

    .line 84
    .line 85
    invoke-virtual {v1, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :catchall_0
    move-exception p1

    .line 90
    const-string v1, "GridLoadingToast"

    .line 91
    .line 92
    new-instance v2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v3, "cancelProgressDialog erro "

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    :goto_1
    const-string p1, "GridLoadingToast"

    .line 113
    .line 114
    const-string v1, "cancelProgressDialog,start home "

    .line 115
    .line 116
    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    :cond_5
    iput-boolean v0, p0, Lx1/C;->e:Z

    .line 120
    .line 121
    iput-boolean v0, p0, Lx1/C;->g:Z

    .line 122
    .line 123
    const/4 p1, 0x0

    .line 124
    iput-object p1, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 125
    .line 126
    iput-object p1, p0, Lx1/C;->c:Landroid/content/Context;

    .line 127
    .line 128
    const-class v0, Lx1/C;

    .line 129
    .line 130
    monitor-enter v0

    .line 131
    :try_start_1
    sput-object p1, Lx1/C;->i:Lx1/C;

    .line 132
    .line 133
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 134
    iput-object p1, p0, Lx1/C;->d:Ljava/util/Timer;

    .line 135
    .line 136
    :cond_6
    return-void

    .line 137
    :catchall_1
    move-exception p0

    .line 138
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 139
    throw p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lx1/C;->g:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lx1/C;->k(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public k(Z)V
    .locals 7

    .line 1
    iput-boolean p1, p0, Lx1/C;->f:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lx1/C;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lx1/C;->c:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lx1/C;->c:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Lcom/android/launcher3/H5;->s(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x1

    .line 27
    if-ne p1, v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    :goto_0
    iput-boolean v0, p0, Lx1/C;->h:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string p1, "launcher is allowed alert"

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const-string p1, "launcher is not  allowed alert"

    .line 39
    .line 40
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "showProgressDialog,text="

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "GridLoadingToast"

    .line 58
    .line 59
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    new-instance v1, Ljava/util/Timer;

    .line 63
    .line 64
    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lx1/C;->d:Ljava/util/Timer;

    .line 68
    .line 69
    new-instance v2, Lx1/C$b;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Lx1/C$b;-><init>(Lx1/C;)V

    .line 72
    .line 73
    .line 74
    const-wide/16 v3, 0x5dc

    .line 75
    .line 76
    const-wide/16 v5, 0x2134

    .line 77
    .line 78
    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 79
    .line 80
    .line 81
    iget-boolean p1, p0, Lx1/C;->h:Z

    .line 82
    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    iget-object p1, p0, Lx1/C;->c:Landroid/content/Context;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const v0, 0x7f140378

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object v0, p0, Lx1/C;->c:Landroid/content/Context;

    .line 99
    .line 100
    const/16 v1, 0x2710

    .line 101
    .line 102
    invoke-static {v0, p1, v1}, Lcom/zte/mifavor/widget/m;->i(Landroid/content/Context;Ljava/lang/CharSequence;I)Lcom/zte/mifavor/widget/m;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lx1/C;->a:Lcom/zte/mifavor/widget/m;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/m;->k()V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method
