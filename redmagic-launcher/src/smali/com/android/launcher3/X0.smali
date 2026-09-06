.class public Lcom/android/launcher3/X0;
.super Ljava/lang/Object;
.source "IconAnimUtils.java"


# instance fields
.field a:Landroid/content/Context;

.field b:Lcom/android/launcher3/D3;

.field private c:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/X0;->b:Lcom/android/launcher3/D3;

    .line 19
    .line 20
    return-void
.end method

.method private A(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p2}, Lcom/android/launcher3/H5;->b0(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-static {p1, p0}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ls1/b$c;

    .line 36
    .line 37
    invoke-direct {v2}, Ls1/b$c;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2, v0}, Ls1/b$c;->b(Z)Ls1/b$c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, p0, v2}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 57
    .line 58
    invoke-virtual {v1}, Ls1/X;->n0()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->f0()Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-virtual {p0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    :cond_2
    :goto_0
    if-eqz p0, :cond_4

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_3

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    return-object p0

    .line 89
    :cond_4
    :goto_1
    invoke-static {p1, p2}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance p2, Ls1/b$c;

    .line 98
    .line 99
    invoke-direct {p2}, Ls1/b$c;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p2, v1}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p2, v0}, Ls1/b$c;->b(Z)Ls1/b$c;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p1, p0, p2}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 119
    .line 120
    invoke-virtual {p1}, Ls1/X;->n0()V

    .line 121
    .line 122
    .line 123
    return-object p0
.end method

.method private B()V
    .locals 4

    .line 1
    const-string v0, "IconAnimUtils"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "Launcher startDownLoad ztemarket:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/X0;->x()LK3/a;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v1}, LK3/a;->p0()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 v1, -0x1

    .line 22
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v3, "Launcher startDownloadApp uninstall zte market status:"

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    if-eqz v1, :cond_5

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    if-eq v1, v2, :cond_4

    .line 46
    .line 47
    const/4 v2, 0x2

    .line 48
    if-eq v1, v2, :cond_4

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    if-eq v1, v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    if-eq v1, v2, :cond_2

    .line 55
    .line 56
    const/4 v2, 0x5

    .line 57
    if-eq v1, v2, :cond_1

    .line 58
    .line 59
    const-string p0, "Launcher getztemarketinstall status"

    .line 60
    .line 61
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 66
    .line 67
    const v1, 0x7f140335

    .line 68
    .line 69
    .line 70
    invoke-static {p0, v1}, Ld1/c;->e(Landroid/content/Context;I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 75
    .line 76
    const v1, 0x7f140336

    .line 77
    .line 78
    .line 79
    invoke-static {p0, v1}, Ld1/c;->e(Landroid/content/Context;I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    const-string p0, "market install complete"

    .line 84
    .line 85
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 90
    .line 91
    const v1, 0x7f140334

    .line 92
    .line 93
    .line 94
    invoke-static {p0, v1}, Ld1/c;->e(Landroid/content/Context;I)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/X0;->q()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :goto_1
    const-string v1, "download market error"

    .line 103
    .line 104
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method private synthetic C(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    const-string p1, "IconAnimUtils"

    .line 2
    .line 3
    const-string p2, "Launcher create dialog cancel"

    .line 4
    .line 5
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/X0;->c:Landroid/app/Dialog;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic D(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    const-string p1, "IconAnimUtils"

    .line 2
    .line 3
    const-string p2, "Launcher create dialog ok"

    .line 4
    .line 5
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/X0;->M()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/X0;->c:Landroid/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic E(ZLjava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3, p4}, Lcom/android/launcher3/X0;->J(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {p5}, Ld1/c;->d(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {p5}, Ld1/c;->c(Landroid/content/Context;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    const p0, 0x7f14033e

    .line 20
    .line 21
    .line 22
    invoke-virtual {p5, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-static {p5, p0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-direct {p0, p2}, Lcom/android/launcher3/X0;->n(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic F(Lr1/l;Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-virtual {p1, p2}, Lr1/l;->u(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v0, "onclickDownLoadApp: hasDownloadTask: "

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ", packageName: "

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "IconAnimUtils"

    .line 31
    .line 32
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/W0;

    .line 38
    .line 39
    move-object v1, p0

    .line 40
    move-object v3, p2

    .line 41
    move-object v4, p3

    .line 42
    move-object v5, p4

    .line 43
    move-object v6, p5

    .line 44
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/W0;-><init>(Lcom/android/launcher3/X0;ZLjava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private synthetic G()V
    .locals 2

    .line 1
    const-string v0, "IconAnimUtils"

    .line 2
    .line 3
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/X0;->x()LK3/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string v1, "startDownloadAndIntallZteMarket start:"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, LK3/a;->q0()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    const-string v1, "download app failed"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic H(Ljava/lang/String;ILjava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Lcom/android/launcher3/q4;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string p0, "IconAnimUtils"

    .line 11
    .line 12
    const-string p1, "updateIconAnim--bgDataModel == null"

    .line 13
    .line 14
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    iget-object v1, v1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_6

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 44
    .line 45
    instance-of v2, v1, Lcom/android/launcher3/model/data/I;

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v3, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    iget v2, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 62
    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_1

    .line 82
    .line 83
    const-string p1, "IconAnimUtils"

    .line 84
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string v2, "updateIconAnim--title: "

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-object v2, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->W()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_2

    .line 112
    .line 113
    const/4 p1, 0x3

    .line 114
    if-ne p2, p1, :cond_2

    .line 115
    .line 116
    const-string p0, "IconAnimUtils"

    .line 117
    .line 118
    const-string p1, "updateIconAnim: current state is STATE_INSTALL_COMPLETE, and old state is STATE_NORMAL, return."

    .line 119
    .line 120
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_2
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, p2}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 128
    .line 129
    .line 130
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {v1, p1}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 138
    .line 139
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v2, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 148
    .line 149
    invoke-virtual {p1, v0, v2}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_3

    .line 154
    .line 155
    const/4 p1, 0x2

    .line 156
    iput p1, v1, Lcom/android/launcher3/model/data/I;->m:I

    .line 157
    .line 158
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->T()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-nez p1, :cond_4

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->T()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-nez p1, :cond_4

    .line 177
    .line 178
    invoke-virtual {v1, p5}, Lcom/android/launcher3/model/data/I;->e0(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_4
    const/4 p1, 0x1

    .line 182
    if-ne p2, p1, :cond_6

    .line 183
    .line 184
    if-nez p4, :cond_6

    .line 185
    .line 186
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_5

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_5
    invoke-static {p6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->S()I

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    sub-int p2, p1, p2

    .line 206
    .line 207
    const/4 p4, 0x5

    .line 208
    if-le p2, p4, :cond_6

    .line 209
    .line 210
    invoke-virtual {v1, p1}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, v1}, Lcom/android/launcher3/X0;->R(Lcom/android/launcher3/model/data/I;)V

    .line 214
    .line 215
    .line 216
    :cond_6
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-nez p0, :cond_7

    .line 221
    .line 222
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 223
    .line 224
    new-instance p1, Lcom/android/launcher3/N0;

    .line 225
    .line 226
    invoke-direct {p1, p3}, Lcom/android/launcher3/N0;-><init>(Ljava/util/ArrayList;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 230
    .line 231
    .line 232
    :cond_7
    :goto_0
    return-void

    .line 233
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 234
    throw p0
.end method

.method private L(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "click icon pause : "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "IconAnimUtils"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p3, v0}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p3, v0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, p3}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/X0;->K(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private N(Landroid/content/Context;Ld1/d;Landroid/graphics/Bitmap;Lcom/android/launcher3/model/data/I;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "IconAnimUtils"

    .line 8
    .line 9
    if-eqz v0, :cond_b

    .line 10
    .line 11
    if-eqz p2, :cond_b

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto/16 :goto_5

    .line 20
    .line 21
    :cond_0
    new-instance v2, Lcom/android/launcher3/X0;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p2, Ld1/d;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v4, v3, v5}, Lcom/android/launcher3/q4;->L(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/Collection;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    const/4 v6, 0x1

    .line 49
    if-eqz v5, :cond_6

    .line 50
    .line 51
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/X0;->A(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v2, p2, v4, p4}, Lcom/android/launcher3/X0;->z(Ld1/d;Landroid/graphics/Bitmap;Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/model/data/I;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const/4 v4, 0x0

    .line 60
    if-nez p3, :cond_1

    .line 61
    .line 62
    move v5, v6

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move v5, v4

    .line 65
    :goto_0
    iput-boolean v5, p2, Lcom/android/launcher3/model/data/I;->v:Z

    .line 66
    .line 67
    iput-object p3, p2, Lcom/android/launcher3/model/data/I;->u:Landroid/graphics/Bitmap;

    .line 68
    .line 69
    new-instance p3, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->M0()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    if-nez p4, :cond_2

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    new-instance p1, Lx1/O$b;

    .line 100
    .line 101
    invoke-direct {p1, p3}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    const/4 p0, 0x0

    .line 113
    invoke-static {p1, p0, p2}, Lcom/android/launcher3/resource/P;->c(Landroid/content/Context;Lz1/o3;Lcom/android/launcher3/model/data/I;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string p1, "do download anim--WorkspaceItemInfo: "

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {v1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    :goto_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-ge v4, p0, :cond_5

    .line 149
    .line 150
    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 155
    .line 156
    instance-of p1, p0, Lcom/android/launcher3/model/data/I;

    .line 157
    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 161
    .line 162
    invoke-virtual {p0, v6}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 163
    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_4
    const-string p0, "itemInfo not WorkspaceItemInfo!"

    .line 167
    .line 168
    invoke-static {v1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_5
    invoke-virtual {v2, v3, p2}, Lcom/android/launcher3/X0;->P(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .line 182
    .line 183
    const-string p3, "The item of packageName: "

    .line 184
    .line 185
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string p3, ",is exist:"

    .line 192
    .line 193
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-interface {v4}, Ljava/util/Collection;->size()I

    .line 197
    .line 198
    .line 199
    move-result p3

    .line 200
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    :cond_7
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 215
    .line 216
    .line 217
    move-result p3

    .line 218
    if-eqz p3, :cond_a

    .line 219
    .line 220
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p3

    .line 224
    check-cast p3, Lcom/android/launcher3/model/data/y;

    .line 225
    .line 226
    instance-of p4, p3, Lcom/android/launcher3/model/data/I;

    .line 227
    .line 228
    if-eqz p4, :cond_7

    .line 229
    .line 230
    check-cast p3, Lcom/android/launcher3/model/data/I;

    .line 231
    .line 232
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 233
    .line 234
    .line 235
    move-result p4

    .line 236
    const/4 v4, 0x2

    .line 237
    if-eqz p4, :cond_8

    .line 238
    .line 239
    iget p4, p3, Lcom/android/launcher3/model/data/I;->m:I

    .line 240
    .line 241
    if-ne p4, v6, :cond_8

    .line 242
    .line 243
    iput v4, p3, Lcom/android/launcher3/model/data/I;->m:I

    .line 244
    .line 245
    iget p4, p2, Ld1/d;->a:I

    .line 246
    .line 247
    invoke-virtual {p3, p4}, Lcom/android/launcher3/model/data/I;->c0(I)V

    .line 248
    .line 249
    .line 250
    iget p4, p2, Ld1/d;->d:I

    .line 251
    .line 252
    invoke-virtual {p3, p4}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p3, v6}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 256
    .line 257
    .line 258
    sget-object p4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 259
    .line 260
    invoke-virtual {p3, p4}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 261
    .line 262
    .line 263
    iget p4, p2, Ld1/d;->i:I

    .line 264
    .line 265
    invoke-virtual {p3, p4}, Lcom/android/launcher3/model/data/I;->h0(I)V

    .line 266
    .line 267
    .line 268
    iget-object p4, p2, Ld1/d;->j:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {p3, p4}, Lcom/android/launcher3/model/data/I;->e0(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 274
    .line 275
    .line 276
    move-result-object p4

    .line 277
    new-instance v5, Lcom/android/launcher3/M0;

    .line 278
    .line 279
    invoke-direct {v5, p3}, Lcom/android/launcher3/M0;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {p4, v5}, Lcom/android/launcher3/D3;->e1(Ljava/util/function/Supplier;)V

    .line 283
    .line 284
    .line 285
    const-string p4, "startIconAnim-updateIcon RESTORED_ICON with animation so we change it status"

    .line 286
    .line 287
    invoke-static {v1, p4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    :cond_8
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 291
    .line 292
    .line 293
    move-result-object p4

    .line 294
    invoke-static {p4, v3}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result p4

    .line 298
    new-instance v5, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .line 302
    .line 303
    const-string v7, "isPackageEnable: "

    .line 304
    .line 305
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    const-string v7, " packageName: "

    .line 312
    .line 313
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v5

    .line 323
    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    .line 325
    .line 326
    if-nez p4, :cond_9

    .line 327
    .line 328
    invoke-virtual {p3, v6}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v2, v3, p3}, Lcom/android/launcher3/X0;->P(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 332
    .line 333
    .line 334
    iget-object p4, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 335
    .line 336
    invoke-static {p4}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 337
    .line 338
    .line 339
    move-result-object p4

    .line 340
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 341
    .line 342
    .line 343
    move-result-object v5

    .line 344
    iget-object v7, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 345
    .line 346
    invoke-virtual {p4, v5, v7}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    .line 347
    .line 348
    .line 349
    move-result p4

    .line 350
    if-eqz p4, :cond_7

    .line 351
    .line 352
    iput v4, p3, Lcom/android/launcher3/model/data/I;->m:I

    .line 353
    .line 354
    goto/16 :goto_4

    .line 355
    .line 356
    :cond_9
    new-instance p3, Ljava/lang/StringBuilder;

    .line 357
    .line 358
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 359
    .line 360
    .line 361
    const-string p4, "the package: "

    .line 362
    .line 363
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    const-string p4, " is installed, we skip it!"

    .line 370
    .line 371
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object p3

    .line 378
    invoke-static {v1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    .line 380
    .line 381
    goto/16 :goto_4

    .line 382
    .line 383
    :cond_a
    return-void

    .line 384
    :cond_b
    :goto_5
    const-string p0, "startIconAnim launcher is not create!"

    .line 385
    .line 386
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    .line 388
    .line 389
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/X0;Lr1/l;Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/X0;->F(Lr1/l;Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/X0;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/X0;->D(Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/X0;ZLjava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/X0;->E(ZLjava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/q4;->B(Ljava/util/ArrayList;Landroid/os/UserHandle;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/X0;Ljava/lang/String;ILjava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/X0;->H(Ljava/lang/String;ILjava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Landroid/content/Context;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "deleteZteMarketIcon"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/lang/Throwable;

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v3, "packageName:"

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "IconAnimUtils"

    .line 45
    .line 46
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const-string v0, "IconAnimation"

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v0, "-1"

    .line 57
    .line 58
    invoke-interface {p1, p0, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_0

    .line 67
    .line 68
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1, p0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 73
    .line 74
    .line 75
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/X0;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/X0;->C(Landroid/content/DialogInterface;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/q4;->B(Ljava/util/ArrayList;Landroid/os/UserHandle;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic i(Ljava/util/ArrayList;Lcom/android/launcher3/C2;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-static {v0, p2}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lcom/android/launcher3/C2;->I(Ljava/util/function/Predicate;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k(Lcom/android/launcher3/X0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X0;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 4

    .line 1
    const-class v0, Lcom/android/launcher3/q4;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    iget-object v1, v1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 37
    .line 38
    instance-of v2, v1, Lcom/android/launcher3/model/data/I;

    .line 39
    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    iget v2, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 55
    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    const-string p0, "IconAnimUtils"

    .line 80
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v2, "deletePreAddedIcon--title: "

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    :cond_2
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 118
    .line 119
    new-instance v2, Lcom/android/launcher3/O0;

    .line 120
    .line 121
    invoke-direct {v2, p1, p0, v0}, Lcom/android/launcher3/O0;-><init>(Ljava/util/ArrayList;Lcom/android/launcher3/C2;Landroid/os/UserHandle;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 125
    .line 126
    .line 127
    if-eqz p0, :cond_3

    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_3

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    const-string v0, "IconAnimUtils--deletePreAddedIcon, delete pre added icon in download"

    .line 140
    .line 141
    invoke-virtual {p0, p1, v0}, Lz1/J3;->C(Ljava/util/Collection;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_3
    return-void

    .line 145
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    throw p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/X0;Landroid/content/Context;Ld1/d;Landroid/graphics/Bitmap;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/X0;->N(Landroid/content/Context;Ld1/d;Landroid/graphics/Bitmap;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "addDownLoadApp: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "IconAnimUtils"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "marketServiceManager is null"

    .line 30
    .line 31
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p0, p1}, Lr1/l;->l(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private p(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "click icon continue: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "IconAnimUtils"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p3, v0}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p3, v0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, p3}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/X0;->o(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/X0;->P(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 50
    .line 51
    const-string p2, "IconAnimation"

    .line 52
    .line 53
    const/4 p3, 0x0

    .line 54
    invoke-virtual {p0, p2, p3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p2, "-1"

    .line 59
    .line 60
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p2, "cloudFolder"

    .line 75
    .line 76
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 77
    .line 78
    .line 79
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method

.method private q()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/X0;->c:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/X0;->c:Landroid/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Lx1/e;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 19
    .line 20
    invoke-direct {v0, v1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Landroid/widget/LinearLayout;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 32
    .line 33
    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    const v4, 0x7f0e00c7

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v4, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const v2, 0x7f14032e

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lx1/e;->n(I)Lx1/e;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v1}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Lcom/android/launcher3/S0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Lcom/android/launcher3/S0;-><init>(Lcom/android/launcher3/X0;)V

    .line 58
    .line 59
    .line 60
    const v2, 0x7f14032f

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Lcom/android/launcher3/T0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Lcom/android/launcher3/T0;-><init>(Lcom/android/launcher3/X0;)V

    .line 70
    .line 71
    .line 72
    const v2, 0x7f140331

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v2, v1}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/android/launcher3/X0;->c:Landroid/app/Dialog;

    .line 84
    .line 85
    return-void
.end method

.method public static u(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "IconAnimUtils"

    .line 4
    .line 5
    const-string p1, "deleteZteMarketIcon context is null"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 12
    .line 13
    new-instance v1, Lcom/android/launcher3/P0;

    .line 14
    .line 15
    invoke-direct {v1, p1, p0}, Lcom/android/launcher3/P0;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private v(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V
    .locals 5

    .line 1
    if-eqz p2, :cond_a

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_a

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    check-cast p3, Lcom/android/launcher3/model/data/I;

    .line 22
    .line 23
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->W()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "Launcher packageName:"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, ",download status:"

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "IconAnimUtils"

    .line 53
    .line 54
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    const v3, 0x7f14033e

    .line 59
    .line 60
    .line 61
    if-eqz v0, :cond_6

    .line 62
    .line 63
    const/4 v4, 0x1

    .line 64
    if-eq v0, v4, :cond_2

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    if-eq v0, v1, :cond_1

    .line 68
    .line 69
    const-string p0, "Click recommend app no response"

    .line 70
    .line 71
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->p(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->U()Ljava/lang/Boolean;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_3

    .line 88
    .line 89
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->L(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 94
    .line 95
    invoke-static {v0}, Ld1/c;->d(Landroid/content/Context;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->p(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 106
    .line 107
    invoke-static {v0}, Ld1/c;->c(Landroid/content/Context;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->p(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 118
    .line 119
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 132
    .line 133
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0, p1}, Lcom/android/launcher3/r4;->x(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_9

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 144
    .line 145
    invoke-static {v0}, Ld1/c;->d(Landroid/content/Context;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-nez v0, :cond_8

    .line 150
    .line 151
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 152
    .line 153
    invoke-static {v0}, Ld1/c;->c(Landroid/content/Context;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_7

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 161
    .line 162
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_8
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->p(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_9
    const-string p0, "Click app no response!"

    .line 179
    .line 180
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_a
    :goto_1
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/X0;->s(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method private w(Landroid/content/Context;Ld1/d;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ld1/d;",
            ")",
            "Lrx/b<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget-object v0, p2, Ld1/d;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Lcom/android/launcher3/X0$b;

    .line 15
    .line 16
    invoke-direct {v0, p0, p2, p1}, Lcom/android/launcher3/X0$b;-><init>(Lcom/android/launcher3/X0;Ld1/d;Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Lrx/b;->a(Lrx/b$a;)Lrx/b;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, La5/a;->b()Lrx/e;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/b;->k(Lrx/e;)Lrx/b;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {}, LR4/a;->a()Lrx/e;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lrx/b;->e(Lrx/e;)Lrx/b;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    :goto_0
    const-string p0, "IconAnimUtils"

    .line 41
    .line 42
    const-string p1, "getIconOriginalBitmap input arguments are invalid !"

    .line 43
    .line 44
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0
.end method

.method private x()LK3/a;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lr1/l;->t()LK3/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private y()Lr1/l;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->s0()Lr1/l;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public I(Landroid/content/Context;Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    sget-object v7, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/R0;

    .line 10
    .line 11
    move-object v1, p0

    .line 12
    move-object v6, p1

    .line 13
    move-object v3, p2

    .line 14
    move-object v4, p3

    .line 15
    move-object v5, p4

    .line 16
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/R0;-><init>(Lcom/android/launcher3/X0;Lr1/l;Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v7, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "IconAnimUtils"

    .line 24
    .line 25
    const-string p1, "marketServiceManager is null"

    .line 26
    .line 27
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public J(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/S;->s(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "zte.com.market"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0, v1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/X0;->s(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const-string p0, "IconAnimUtils"

    .line 30
    .line 31
    const-string p1, "marketServiceManager is null"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-static {v0}, Lx1/S;->s(Landroid/content/Context;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 46
    .line 47
    invoke-static {v0, v1}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 54
    .line 55
    sget-object v1, Lr1/l;->i:Landroid/content/ComponentName;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v0, v1}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/android/launcher3/X0;->B()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->v(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/X0;->v(Ljava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public K(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "IconAnimUtils"

    .line 8
    .line 9
    const-string p1, "getMarketManager null error"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->P()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->T()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->X()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {p0, p1, v0, v1, p2}, Lr1/l;->y(Ljava/lang/String;ILjava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/V0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/V0;-><init>(Lcom/android/launcher3/X0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public O(Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "dlType = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p2, Ld1/d;->g:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "IconAnimUtils"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const-string v0, "IconAnimation"

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p1, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v2, p2, Ld1/d;->c:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v3, p2, Ld1/d;->b:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 41
    .line 42
    .line 43
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 44
    .line 45
    .line 46
    iget v0, p2, Ld1/d;->g:I

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    if-ne v0, v2, :cond_3

    .line 50
    .line 51
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-nez p0, :cond_0

    .line 56
    .line 57
    const-string p0, "download is cloud folder ,launcher is null error"

    .line 58
    .line 59
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    if-nez p0, :cond_1

    .line 68
    .line 69
    const-string p0, "download is cloud folder , folder is null error"

    .line 70
    .line 71
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-nez p0, :cond_2

    .line 80
    .line 81
    const-string p0, "download is cloud folder , but cloud folder is null error"

    .line 82
    .line 83
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    invoke-virtual {p0, p2}, Lcom/android/launcher3/cloudfolder/a;->b(Ld1/d;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/X0;->w(Landroid/content/Context;Ld1/d;)Lrx/b;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    const-string p0, "startIconAnim observable is null."

    .line 98
    .line 99
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    new-instance v1, Lcom/android/launcher3/X0$a;

    .line 104
    .line 105
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/launcher3/X0$a;-><init>(Lcom/android/launcher3/X0;Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Lrx/b;->i(Lrx/h;)Lrx/i;

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public P(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/X0;->Q(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateDownLoadIcon--packageName: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "IconAnimUtils"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    if-nez p2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/launcher3/X0;->R(Lcom/android/launcher3/model/data/I;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public R(Lcom/android/launcher3/model/data/I;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/Q0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/Q0;-><init>(Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public S(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "IconAnimUtils"

    .line 8
    .line 9
    const-string p1, "updateIconAnim--packageName is empty"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v8, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/U0;

    .line 23
    .line 24
    move-object v1, p0

    .line 25
    move-object v2, p1

    .line 26
    move v3, p2

    .line 27
    move v5, p3

    .line 28
    move-object v7, p4

    .line 29
    move-object v6, p5

    .line 30
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/U0;-><init>(Lcom/android/launcher3/X0;Ljava/lang/String;ILjava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v8, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public o(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "IconAnimUtils"

    .line 8
    .line 9
    const-string p1, "getMarketManager null error"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->P()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->T()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->X()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {p0, p1, v0, v1, p2}, Lr1/l;->C(Ljava/lang/String;ILjava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public r(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/X0;->y()Lr1/l;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->P()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->T()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->X()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p0, p1, v0, v1, p2}, Lr1/l;->n(Ljava/lang/String;ILjava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    const-string p0, "IconAnimUtils"

    .line 31
    .line 32
    const-string p1, "getMarketManager null or shortCut == null"

    .line 33
    .line 34
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public s(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "deleteDownloadIcon--packageName: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "IconAnimUtils"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string p0, "deleteDownloadIcon--packageName null"

    .line 30
    .line 31
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/X0;->a:Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v0, p1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v3, "isPackageEnable: "

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/X0;->r(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/android/launcher3/X0;->t(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string p2, "deleteDownloadIcon--We do not delete the icon: "

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "IconAnimUtils"

    .line 8
    .line 9
    const-string p1, "deletePreAddedIcon--bgDataModel == null"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 21
    .line 22
    new-instance v1, Lcom/android/launcher3/L0;

    .line 23
    .line 24
    invoke-direct {v1, p1, p0}, Lcom/android/launcher3/L0;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0, p1}, Lcom/android/launcher3/X0;->u(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public z(Ld1/d;Landroid/graphics/Bitmap;Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/model/data/I;
    .locals 6

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x2

    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    invoke-static {p2}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 11
    .line 12
    iget-object p2, p1, Ld1/d;->b:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p2, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 15
    .line 16
    iput v0, p3, Lcom/android/launcher3/model/data/I;->m:I

    .line 17
    .line 18
    iput v1, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 19
    .line 20
    iput-boolean v1, p3, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 21
    .line 22
    iget p2, p1, Ld1/d;->a:I

    .line 23
    .line 24
    invoke-virtual {p3, p2}, Lcom/android/launcher3/model/data/I;->c0(I)V

    .line 25
    .line 26
    .line 27
    iget p2, p1, Ld1/d;->d:I

    .line 28
    .line 29
    invoke-virtual {p3, p2}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 38
    .line 39
    .line 40
    iget p0, p1, Ld1/d;->i:I

    .line 41
    .line 42
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->h0(I)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Ld1/d;->j:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->e0(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object p3

    .line 51
    :cond_0
    new-instance p3, Lcom/android/launcher3/model/data/I;

    .line 52
    .line 53
    invoke-direct {p3}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v2, Landroid/content/Intent;

    .line 57
    .line 58
    const-string v3, "android.intent.action.MAIN"

    .line 59
    .line 60
    const/4 v4, 0x0

    .line 61
    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 62
    .line 63
    .line 64
    const-string v3, "android.intent.category.LAUNCHER"

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    const/high16 v3, 0x10200000

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    new-instance v3, Landroid/content/ComponentName;

    .line 75
    .line 76
    iget-object v4, p1, Ld1/d;->c:Ljava/lang/String;

    .line 77
    .line 78
    const-string v5, "null"

    .line 79
    .line 80
    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iput-object v3, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 91
    .line 92
    invoke-static {p2}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iput-object p2, p3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 97
    .line 98
    iget-object p2, p1, Ld1/d;->b:Ljava/lang/String;

    .line 99
    .line 100
    iput-object p2, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 101
    .line 102
    iput-object v2, p3, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 103
    .line 104
    iput v0, p3, Lcom/android/launcher3/model/data/I;->m:I

    .line 105
    .line 106
    iput v1, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 107
    .line 108
    iput-boolean v1, p3, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 109
    .line 110
    iget p2, p1, Ld1/d;->a:I

    .line 111
    .line 112
    invoke-virtual {p3, p2}, Lcom/android/launcher3/model/data/I;->c0(I)V

    .line 113
    .line 114
    .line 115
    iget p2, p1, Ld1/d;->d:I

    .line 116
    .line 117
    invoke-virtual {p3, p2}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 121
    .line 122
    .line 123
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 124
    .line 125
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 126
    .line 127
    .line 128
    iget p0, p1, Ld1/d;->i:I

    .line 129
    .line 130
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->h0(I)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p1, Ld1/d;->j:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {p3, p0}, Lcom/android/launcher3/model/data/I;->e0(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    new-instance p0, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string p1, "addPreloadShortcutInfo---info.itemType:"

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget p1, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p1, "IconAnimUtils"

    .line 158
    .line 159
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    return-object p3
.end method
