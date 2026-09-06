.class public Lcom/android/launcher3/model/data/q;
.super Ljava/lang/Object;
.source "IconRequestInfo.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/launcher3/model/data/z;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Lcom/android/launcher3/model/data/z;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final b:Landroid/content/pm/LauncherActivityInfo;

.field public final c:[B

.field public final d:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/pm/LauncherActivityInfo;",
            "Z)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/android/launcher3/model/data/q;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;[BZ)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;[BZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/pm/LauncherActivityInfo;",
            "[BZ)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 4
    iput-object p2, p0, Lcom/android/launcher3/model/data/q;->b:Landroid/content/pm/LauncherActivityInfo;

    .line 5
    iput-object p3, p0, Lcom/android/launcher3/model/data/q;->c:[B

    .line 6
    iput-boolean p4, p0, Lcom/android/launcher3/model/data/q;->d:Z

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Z
    .locals 5

    .line 1
    const-string v0, "IconRequestInfo"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    instance-of v2, v1, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    if-nez v2, :cond_1

    .line 8
    .line 9
    instance-of v1, v1, Lcom/android/launcher3/model/data/d;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "loadIconFromDb should only be used for either WorkspaceItemInfo or AppInfo: "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p1

    .line 39
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 40
    :try_start_0
    invoke-static {p1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 41
    .line 42
    .line 43
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :try_start_1
    iget-object v2, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/launcher3/model/data/q;->c:[B

    .line 47
    .line 48
    if-nez v3, :cond_3

    .line 49
    .line 50
    new-instance v3, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v4, "loadIconFromDb: icon blob null, returning. Component="

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    :try_start_2
    invoke-virtual {p1}, Ls1/X;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 77
    .line 78
    .line 79
    return v1

    .line 80
    :catch_0
    move-exception p1

    .line 81
    goto :goto_3

    .line 82
    :cond_2
    return v1

    .line 83
    :catchall_0
    move-exception v2

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    :try_start_3
    array-length v4, v3

    .line 86
    invoke-static {v3, v1, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {p1, v3}, Ls1/b;->v(Landroid/graphics/Bitmap;)Ls1/d;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iput-object v3, v2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    .line 96
    const/4 v2, 0x1

    .line 97
    :try_start_4
    invoke-virtual {p1}, Ls1/X;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 98
    .line 99
    .line 100
    return v2

    .line 101
    :goto_1
    if-eqz p1, :cond_4

    .line 102
    .line 103
    :try_start_5
    invoke-virtual {p1}, Ls1/X;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catchall_1
    move-exception p1

    .line 108
    :try_start_6
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 109
    .line 110
    .line 111
    :cond_4
    :goto_2
    throw v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 112
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v3, "Failed to decode byte array for info "

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/android/launcher3/model/data/q;->a:Lcom/android/launcher3/model/data/z;

    .line 123
    .line 124
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 132
    .line 133
    .line 134
    return v1
.end method
