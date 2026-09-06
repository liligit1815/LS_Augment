.class public Lz1/r3;
.super Ljava/lang/Object;
.source "ModelUtils.java"


# static fields
.field public static final a:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lz1/q3;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/q3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    if-ne p0, v0, :cond_0

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

.method public static b(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/P2;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/z0;",
            "Lcom/android/launcher3/P2;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/r3$a;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lz1/r3$a;-><init>(Lcom/android/launcher3/P2;Lcom/android/launcher3/util/z0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;Landroid/content/Intent;)Lcom/android/launcher3/model/data/I;
    .locals 8

    .line 1
    const-class v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.extra.shortcut.INTENT"

    .line 4
    .line 5
    invoke-static {p1, v1, v0}, Lcom/android/launcher3/N5;->G(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v2, "Invalid install shortcut intent"

    .line 10
    .line 11
    const-string v3, "ModelUtils"

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    if-eqz v0, :cond_8

    .line 15
    .line 16
    const-class v0, Landroid/content/Intent$ShortcutIconResource;

    .line 17
    .line 18
    const-string v5, "android.intent.extra.shortcut.ICON_RESOURCE"

    .line 19
    .line 20
    invoke-static {p1, v5, v0}, Lcom/android/launcher3/N5;->G(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_8

    .line 25
    .line 26
    const-class v0, Landroid/graphics/Bitmap;

    .line 27
    .line 28
    const-string v6, "android.intent.extra.shortcut.ICON"

    .line 29
    .line 30
    invoke-static {p1, v6, v0}, Lcom/android/launcher3/N5;->G(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    goto :goto_4

    .line 37
    :cond_0
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/content/Intent;

    .line 42
    .line 43
    const-string v1, "android.intent.extra.shortcut.NAME"

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v0, :cond_7

    .line 50
    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_1
    new-instance v2, Lcom/android/launcher3/model/data/I;

    .line 55
    .line 56
    invoke-direct {v2}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    iput-object v7, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 64
    .line 65
    invoke-static {p0}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    :try_start_0
    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    check-cast v6, Landroid/graphics/Bitmap;

    .line 74
    .line 75
    if-eqz v6, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0, v6}, Ls1/b;->v(Landroid/graphics/Bitmap;)Ls1/d;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception p1

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-virtual {p1, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Landroid/content/Intent$ShortcutIconResource;

    .line 89
    .line 90
    iput-object p1, v2, Lcom/android/launcher3/model/data/I;->q:Landroid/content/Intent$ShortcutIconResource;

    .line 91
    .line 92
    if-eqz p1, :cond_3

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ls1/b;->t(Landroid/content/Intent$ShortcutIconResource;)Ls1/d;

    .line 95
    .line 96
    .line 97
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    goto :goto_0

    .line 99
    :cond_3
    move-object p1, v4

    .line 100
    :goto_0
    if-eqz p0, :cond_4

    .line 101
    .line 102
    invoke-virtual {p0}, Ls1/X;->close()V

    .line 103
    .line 104
    .line 105
    :cond_4
    if-nez p1, :cond_5

    .line 106
    .line 107
    const-string p0, "Invalid icon by the app"

    .line 108
    .line 109
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    return-object v4

    .line 113
    :cond_5
    iput-object p1, v2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 114
    .line 115
    invoke-static {v1}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    iput-object p0, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 120
    .line 121
    iput-object p0, v2, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 122
    .line 123
    iput-object v0, v2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 124
    .line 125
    return-object v2

    .line 126
    :goto_1
    if-eqz p0, :cond_6

    .line 127
    .line 128
    :try_start_1
    invoke-virtual {p0}, Ls1/X;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :catchall_1
    move-exception p0

    .line 133
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    :cond_6
    :goto_2
    throw p1

    .line 137
    :cond_7
    :goto_3
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    return-object v4

    .line 141
    :cond_8
    :goto_4
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    return-object v4
.end method
