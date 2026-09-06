.class public final Ls1/g;
.super Ljava/lang/Object;
.source "CacheableShortcutInfo.kt"

# interfaces
.implements Lt1/j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lt1/j<",
        "Ls1/h;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Ls1/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ls1/g;

    .line 2
    .line 3
    invoke-direct {v0}, Ls1/g;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls1/g;->a:Ls1/g;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final l(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    const-string p0, "Failed to get shortcut original icon"

    .line 2
    .line 3
    const-string v0, "CacheableShortcutCachingLogic"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-class v2, Landroid/content/pm/LauncherApps;

    .line 9
    .line 10
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 15
    .line 16
    invoke-virtual {p1, p2, p3}, Landroid/content/pm/LauncherApps;->getShortcutIconDrawableOriginalIcon(Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    move-exception p1

    .line 22
    goto :goto_0

    .line 23
    :catch_1
    move-exception p1

    .line 24
    goto :goto_1

    .line 25
    :goto_0
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :goto_1
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    return-object v1
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    check-cast p1, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ls1/g;->m(Ls1/h;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;
    .locals 0

    .line 1
    check-cast p1, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ls1/g;->k(Ls1/h;Ls1/T;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d(Landroid/content/Context;Lt1/f;Ljava/lang/Object;)Ls1/d;
    .locals 0

    .line 1
    check-cast p3, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ls1/g;->o(Landroid/content/Context;Lt1/f;Ls1/h;)Ls1/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic e(Landroid/content/Context;Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    check-cast p2, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ls1/g;->p(Landroid/content/Context;Ls1/h;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    check-cast p1, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ls1/g;->i(Ls1/h;)Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic g(Ljava/lang/Object;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    check-cast p1, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ls1/g;->n(Ls1/h;)Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    check-cast p1, Ls1/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ls1/g;->j(Ls1/h;)Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Ls1/h;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ls1/h;->b()Lcom/android/launcher3/util/k;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/util/k;->h()Landroid/content/pm/ApplicationInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public j(Ls1/h;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, LN1/e;->b(Landroid/content/pm/ShortcutInfo;)LN1/e;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 15
    .line 16
    const-string p1, "componentName"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public k(Ls1/h;Ls1/T;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "provider"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->isDeclaredInManifest()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p1}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->getLastChangedTimestamp()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_0
    invoke-virtual {p0, p1}, Ls1/g;->i(Ls1/h;)Landroid/content/pm/ApplicationInfo;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p2, p0}, Ls1/T;->m(Landroid/content/pm/ApplicationInfo;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p2, "-"

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public m(Ls1/h;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public n(Ls1/h;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "getUserHandle(...)"

    .line 15
    .line 16
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public o(Landroid/content/Context;Lt1/f;Ls1/h;)Ls1/d;
    .locals 12

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "cache"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "info"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Ls1/X;->B:Ls1/X$a;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ls1/X$a;->a(Landroid/content/Context;)Ls1/X;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :try_start_0
    sget-object v0, Ls1/h;->c:Ls1/h$a;

    .line 23
    .line 24
    invoke-virtual {p3}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 29
    .line 30
    invoke-virtual {v2, p1}, Lcom/android/launcher3/P2$a;->a(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iget v3, v3, Lcom/android/launcher3/F1;->O0:I

    .line 35
    .line 36
    invoke-virtual {v0, p1, v1, v3}, Ls1/h$a;->b(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    new-instance v3, Ls1/b$c;

    .line 44
    .line 45
    invoke-direct {v3}, Ls1/b$c;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->h(Landroid/content/Context;)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {v3, v4}, Ls1/b$c;->a(I)Ls1/b$c;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sget-object v4, Ls1/g;->a:Ls1/g;

    .line 57
    .line 58
    invoke-interface {v4, p3, p2}, Lt1/j;->b(Ljava/lang/Object;Lt1/f;)Ls1/n0;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    sget-object p2, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 63
    .line 64
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    check-cast p2, Lcom/android/launcher3/util/f;

    .line 69
    .line 70
    invoke-virtual {p3}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {p2, v6}, Lcom/android/launcher3/util/f;->k(Landroid/content/pm/ShortcutInfo;)Z

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    const/4 v10, 0x7

    .line 79
    const/4 v11, 0x0

    .line 80
    const/4 v6, 0x0

    .line 81
    const/4 v7, 0x0

    .line 82
    const/4 v8, 0x0

    .line 83
    invoke-static/range {v5 .. v11}, Ls1/n0;->b(Ls1/n0;Lcom/android/launcher3/util/E;Lt1/j;Ljava/lang/String;ZILjava/lang/Object;)Ls1/n0;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {v3, p2}, Ls1/b$c;->d(Ls1/n0;)Ls1/b$c;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p0, v0, p2}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const-string v0, "createBadgedIconBitmap(...)"

    .line 96
    .line 97
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    invoke-virtual {v2, p1}, Lcom/android/launcher3/P2$a;->a(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget v0, v0, Lcom/android/launcher3/F1;->O0:I

    .line 109
    .line 110
    invoke-direct {v4, p1, p3, v0}, Ls1/g;->l(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p2, p1}, Ls1/d;->q(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    .line 116
    .line 117
    invoke-static {p0, v1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    return-object p2

    .line 121
    :catchall_0
    move-exception v0

    .line 122
    move-object p1, v0

    .line 123
    goto :goto_0

    .line 124
    :cond_0
    :try_start_1
    sget-object p1, Ls1/d;->i:Ls1/d;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .line 126
    invoke-static {p0, v1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    return-object p1

    .line 130
    :goto_0
    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 131
    :catchall_1
    move-exception v0

    .line 132
    move-object p2, v0

    .line 133
    invoke-static {p0, p1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    throw p2
.end method

.method public p(Landroid/content/Context;Ls1/h;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "object"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ls1/h;->d()Landroid/content/pm/ShortcutInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/android/launcher3/P2$a;->a(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v0, v0, Lcom/android/launcher3/F1;->O0:I

    .line 22
    .line 23
    invoke-direct {p0, p1, p2, v0}, Ls1/g;->l(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
